package org.yye.util;

import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedHashMap;

/**
 * 多个方法的封装类，用于数据的整形
 * #使用方法
 * 外接applyFilterUtil 驱动方法
 * 返回一个特定格式，整形之后的字符串
 * 具体格式请参照 applyFilterUtil() 方法的javadoc
 *
 * @author garyzhang
 * @version 1.2
 *
 * 1.1 轻微bug修复，性能优化，增加噪声辨识度
 * 1.2 轻微bug修复，增加分数抽取算法的准确性
 *
 */
public class FilterUtil2 {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        String sql = "com.mysql.cj.jdbc.Driver";
        String url = "jdbc:mysql://127.0.0.1:3306/case100?serverTimezone=Asia/Shanghai";
        Class.forName(sql);
        Connection conn = DriverManager.getConnection(url,"root","root");

        Statement statement = conn.createStatement();
        ArrayList<LinkedHashMap> answerList = new ArrayList();
        // ArrayList<LinkedHashMap> processedList = new ArrayList<>();
        for(int i=1;i<3957;i++)
        {
            try {
                String  sqlString = "select answerId, answer, SAT, TOEFL, IELTS, ACT from casedata where answerId = "+i;
                ResultSet set = statement.executeQuery(sqlString);
                LinkedHashMap dataMap = new LinkedHashMap();
                while (set.next())
                {
                    dataMap.put("answerId",set.getString("answerId"));
                    dataMap.put("original_answer",set.getString("answer"));
                    dataMap.put("Det_SAT",set.getString("SAT"));
                    dataMap.put("Det_TOEFL",set.getString("TOEFL"));
                    dataMap.put("Det_IELTS",set.getString("ACT"));
                    dataMap.put("Det_ACT",set.getString("ACT"));
                    answerList.add(dataMap);

                    System.out.println("It is at "+i+"th answer undering processing...");
                    String resultString = applyFilterUtil(set.getString("answer"));
                    dataMap.put("processed_answer",resultString);

                    String score = resultString.substring(resultString.indexOf("%%")+2);
                    String satScore = score.split("@@")[0];
                    String actScore = score.split("@@")[1];
                    String toeflScore = score.split("@@")[2];
                    String ieltsScore = score.split("@@")[3];
                    String gpaScore = score.split("@@")[4];

                    if(set.getString("SAT").equals("TRUE"))
                    {
                        dataMap.put("SAT",satScore);
                    }else
                    {
                        dataMap.put("SAT","FALSE");
                    }
                    if(set.getString("ACT").equals("TRUE"))
                    {
                        dataMap.put("ACT",actScore);
                    }
                    else
                    {
                        dataMap.put("ACT","FALSE");
                    }
                    if(set.getString("TOEFL").equals("TRUE"))
                    {
                        dataMap.put("TOEFL",toeflScore);
                    }else
                    {
                        dataMap.put("TOEFL","FALSE");
                    }
                    if(set.getString("IELTS").equals("TRUE"))
                    {
                        dataMap.put("IELTS",ieltsScore);
                    }else
                    {
                        dataMap.put("IELTS","FALSE");
                    }
                    dataMap.put("GPA",gpaScore);
                }
            } catch (Exception e)
            {
                System.out.println(e.getMessage());
            }
        }

        for(LinkedHashMap map: answerList)
        {
            String  sqlString = "insert into processedcasedata (id,answerId,original_answer,processed_answer,sat,act,toefl,ielts,gpa,note) values (?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement preparedStatement = conn.prepareStatement(sqlString);

            preparedStatement.setString(1,null);
            preparedStatement.setString(2,(String)map.get("answerId"));
            preparedStatement.setString(3,(String)map.get("original_answer"));
            preparedStatement.setString(4,(String)map.get("processed_answer"));
            preparedStatement.setString(5,(String)map.get("SAT"));
            preparedStatement.setString(6,(String)map.get("ACT"));
            preparedStatement.setString(7,(String)map.get("TOEFL"));
            preparedStatement.setString(8,(String)map.get("IELTS"));
            preparedStatement.setString(9,(String)map.get("GPA"));
            preparedStatement.setString(10,null);

            int result = preparedStatement.executeUpdate();
            System.out.println("Data processing, please hold on. Update result: "+result);
            System.out.println(map);
        }
    }
    /**
     * applyFilterUtil 驱动方法
     *
     * 输出格式：
     * 申请院校 + %% + 裱花考试
     * 申请院校格式：
     * ED+@@+EA+@@+RD+@@+UC
     * 裱花考试格式
     * SAT+@@+ACT+@@+TOEFL+@@+IELTS+@@+GPA+@@
     * 某一项如果为空，即用户没有提供该信息
     *
     * @param input 输入的原始字符串
     *              *非空
     * @return 处理之后的响应格式
     */
    public static String applyFilterUtil(String input) {
        if (input == null) {
            throw new IllegalArgumentException("null String");
        }
        return extractApplicationOverlook(input, len(input)) +
                "%%" +
                extractStandardizeTesting(input);
    }

    /**
     * 该方法提取了申请者的院校信息
     *
     * @param input 输入的原始字符串
     * @param inLength 一个设计提取精度的变量，通过 @len() 方法给出
     *
     * @return 成品字符串
     */
    public static String extractApplicationOverlook(String input, int inLength) {

        StringBuilder result = new StringBuilder();

        // 移除噪声
        input = noiseRemover(input);

        int ed = indexOf(input, "ED");
        int ea = indexOf(input, "EA");
        int rd = indexOf(input, "RD");
        int uc = indexOf(input, "UC");

        // ed
        if (ed > -1) {
            if (ea - ed > 0 && ea - ed < inLength - 1) {
                result.append(input,ed + 2, ea);
            } else if (rd - ed > 0 && rd - ed < inLength - 1) {
                result.append(input,ed + 2, rd);
            } else if (uc - ed > 0 && uc - ed < inLength - 1) {
                result.append(input,ed + 2, uc);
            } else if (ed + inLength > input.length() - 1) {
                result.append(input,ed + 2,input.length() - 1);
            } else {
                result.append(input,ed + 2, ed + inLength);
            }
        }

        result.append("@@");

        // ea
        if (ea > -1) {
            if (ed - ea > 0 && ed - ea < inLength - 1) {
                result.append(input,ea + 2, ed);
            } else if (rd - ea > 0 && rd - ea < inLength - 1) {
                result.append(input,ea + 2, rd);
            } else if (uc - ea > 0 && uc - ea < inLength - 1) {
                result.append(input,ea + 2, uc);
            } else if (ea + inLength > input.length()) {
                result.append(input,ea + 2, input.length() - 1);
            } else {
                result.append(input,ea + 2, ea + inLength);
            }
        }

        result.append("@@");

        // rd
        if (rd > -1) {
            if (ed - rd > 0 && ed - rd < inLength - 1) {
                result.append(input,rd + 2, ed);
            } else if (ea - rd > 0 && ea - rd < inLength - 1) {
                result.append(input,rd + 2, ea);
            } else if (uc - rd > 0 && uc - rd < inLength - 1) {
                result.append(input,rd + 2, uc);
            } else if (rd + inLength > input.length() - 1) {
                result.append(input,rd + 2,input.length() - 1);
            } else {
                result.append(input,rd + 2, rd + inLength);
            }
        }

        result.append("@@");

        // uc
        if (uc > -1) {
            if (ed - uc > 0 && ed - uc < inLength - 1) {
                result.append(input,uc, ed);
            } else if (ea - uc > 0 && ea - uc < inLength - 1) {
                result.append(input,uc, ea);
            } else if (rd - uc > 0 && rd - uc < inLength - 1) {
                result.append(input,uc, rd);
            } else if (uc + inLength > input.length() - 1) {
                result.append(input,uc,input.length() - 1);
            } else {
                result.append(input,uc, uc + inLength);
            }
        }

        return result.toString();
    }

    /**
     * 该方法提取了申请者的标化成绩
     *
     * @param input 输入的原始字符串
     *
     * @return 成品字符串
     */
    public static String extractStandardizeTesting(String input) {

        input += "停止";
        StringBuilder out = new StringBuilder();
        double[] SearchResult = new double[5];
        double temp = 0;
        int i = 0;

        outer:
        while (i < input.length() - 1) {
            char c = input.charAt(i);
            // when c >= '0', enter while loop
            // 直到出现非数字字符，停止搜索

            if ((c < '0' || c > '9') &&  c != '.') {
                i ++;
                continue outer;
            }

            inner:
            while (c == '.' || (c >= '0' && c <= '9')) {
                if (c == '.') {
                    // 如果检查到小数点

                    // 小数点前面的位数为空或大于10都不成立
                    // 且小数点后一位必须是数字
                    if (temp >= 9 || temp == 0 || input.charAt(i + 1) < '0' || input.charAt(i + 1) > '9') {
                        // 后面的全部位数作废
                        int counter = i + 1;
                        while (input.charAt(counter) >= '0' && input.charAt(counter) <= '9') {
                            counter++;
                        }
                        i += counter;
                        temp = 0;
                        continue outer;
                    }


                    // 如果小数点前为5或以上
                    // >>IELTS
                    else if (temp >= 5) {
                        if (input.charAt(i + 2) < '0' || input.charAt(i + 2) > '9') {
                            if (input.charAt(i + 1) == '5') {
                                temp = temp + 0.5;
                                break inner;
                            } else if (input.charAt(i + 1) == '0') {
                                // temp = temp
                                break inner;
                            } else {
                                i += 2;
                                temp = 0;
                                continue outer;
                            }
                        } else {
                            // 后面的全部位数作废
                            int counter = i + 1;
                            while (input.charAt(counter) >= '0' && input.charAt(counter) <= '9') {
                                counter++;
                            }
                            i = counter;
                            temp = 0;
                            continue outer;
                        }
                    }

                    // 如果小数点前为2或以上
                    // >>GPA
                    else if (temp > 2) {
                        int counter = 1;
                        char ch = input.charAt(i + counter);
                        while (ch >= '0' && ch <= '9') {
                            // 设定小数点后的位数
                            temp += ((double) ch - 48)/(Math.pow(10,counter));
                            counter++;
                            ch = input.charAt(i + counter);
                        }
                        // 超过两位小数点视为非法
                        if (counter > 3) {
                            i += counter;
                            temp = 0;
                            continue outer;
                        } else {
                            break inner;
                        }
                    } else {
                        // 啥都不是
                        // 后面位数作废
                        int counter = i + 1;
                        while (input.charAt(counter) >= '0' && input.charAt(counter) <= '9') {
                            counter++;
                        }
                        i = counter;
                        temp = 0;
                        continue outer;
                    }
                } else {
                    // 余下情况，如果不是小数点
                    temp = temp * 10 + ((int) c - 48);
                    i++;
                }
                c = input.charAt(i);
            }

            // 当数字不再出现，放入结果前先请求滤镜响应
            int here = isType(input,temp);
            // 检查，合法且不重复则填入
            if (here > -1 && SearchResult[here] == 0.0) {
                SearchResult[here] = temp;
            }

            // 越过余下字符
            if (temp % 1 == 0) {
                i += String.valueOf(temp).length();
            } else {
                i += String.valueOf(temp).length() - 2;
            }

            // 更新变量，重复使用
            temp = 0;
        }

        //最后数据处理
        for (double j : SearchResult) {
            out.append(j);
            out.append("@@");
        }
        return out.toString();
    }

    // helper methods //

    /**
     * 返回String中indexOf的值，但是忽略大小写
     */
    public static int indexOf(String orig, String str) {
        for (int i = 0; i < orig.length() - str.length(); i++) {
            if (orig.substring(i, i + str.length()).equalsIgnoreCase(str)) {
                return i;
            }
        }
        return -1;
    }

    // 选用冒泡，因为一般情况下都是一次扫过
    public static int[] sort(int[] input) {
            int temp;

            for (int i = 0; i < 3; i++) {
                for (int j = 3; j > i; j--) {
                    if (input[j - 1] > input[j]) {
                        temp = input[j - 1];
                        input[j - 1] = input[j];
                        input[j] = temp;
                    }
                }
            }
            return input;
    }

    /**
     * 判断输入数据的格式
     */
    public static int isType(String str, double in) {
        if (in == 0.0 || in > 2400) {
            // 为空或超格式
            return - 1;
        } else if (in <= 2400 && in > 1600 && in % 10 == 0) {
            // >>旧版sat
            return 0;
        } else if (in <= 1600 && in > 1000 && in % 10 == 0) {
            // >>新版sat
            return 0;
        } else if (in <= 35 && in >= 20 && (indexOf(str,"act") != -1)) {
            // >>ACT
            return 1;
        } else if (in <= 120 && in >= 60 && (indexOf(str,"toefl") != -1 || indexOf(str,"托福") != -1)) {
            // >>TOEFL
            return 2;
        } else if (in <= 9 && in >= 5 && (indexOf(str,"ielts") != -1 || indexOf(str,"雅思") != -1)) {
            // >>IELTS
            return 3;
        } else if (in <= 5 && in >= 2) {
            // >>GPA
            return 4;
        }
        return -1;
    }

    /**
     * 噪声移除
     */
    public static String noiseRemover(String orig) {
        // #欢迎在测试中增加额外发现的噪声
        // noise1: early action/ decision 不会被过滤到的问题
        // noise2/3: 有人打中文的提前批/第一批 etc
        // noise4: xxxUclass of 2024 把U和class连在一起然后被识别成UC
        // noise5 rolling decision 不会被过滤到的问题
        // noise6: university of chicago uchi 混淆 uc
        // noise7: harvard -- rd
        // noise8: stanford -- rd
        // noise9: northeastern -- ea

        StringBuilder result = new StringBuilder();
        result.append(orig);

        int caseOne   = indexOf(orig,"early");
        int caseFive  = indexOf(orig,"rolling");
        int caseTwo   = indexOf(orig,"提前批");
        int caseThree = indexOf(orig,"第一批");
        int caseFour  = indexOf(orig,"class");
        int caseSix   = indexOf(orig,"uchi");
        int caseSeven = indexOf(orig,"harvard");
        int caseEight = indexOf(orig,"stanford");
        int caseNine  = indexOf(orig,"northeastern");

        // early
        if (caseOne > -1) {
            StringBuilder newString = new StringBuilder();
            // 避免early action 和 early decision 被忽略的情况
            if (Math.abs(indexOf(orig, "action") - caseOne) < 8) {
                newString.append(orig, 0, caseOne);
                newString.append("EA");
                newString.append(orig, caseOne + 5, orig.length());
            } else if (Math.abs(indexOf(orig,"decision") - caseOne) < 11) {
                newString.append(orig, 0, caseOne);
                newString.append("ED");
                newString.append(orig, caseOne + 5, orig.length());
            } else {
                newString.append(orig, 0, caseOne);
                newString.append(orig, caseOne + 5, orig.length());
            }
            result = newString;
        }

        // 提前批
        if (caseTwo > -1) {
            StringBuilder newString = new StringBuilder();
            newString.append(orig, 0, caseTwo);
            newString.append("ED");
            newString.append(orig, caseTwo + 2, orig.length());
            result = newString;
        }

        // 第一批
        if (caseThree > -1) {
            StringBuilder newString = new StringBuilder();
            newString.append(orig, 0, caseThree);
            newString.append("EA");
            newString.append(orig, caseThree + 2, orig.length());
            result = newString;
        }

        // class
        if (caseFour > -1) {
            StringBuilder newString = new StringBuilder();
            newString.append(orig, 0 , caseFour);
            newString.append(orig, caseFour + 4, orig.length());
            result = newString;
        }

        // rolling
        if (caseFive > -1) {
            StringBuilder newString = new StringBuilder();
            // 避免rolling decision 被忽略的情况
            if (Math.abs(indexOf(orig,"decision") - caseFive) < 11) {
                newString.append(orig, 0, caseFive);
                newString.append("RD");
                newString.append(orig,caseFive + 6, orig.length());
            }
            result = newString;
        }

        // uchi
        if (caseSix > -1) {
            StringBuilder newString = new StringBuilder();
            newString.append(orig, 0, caseSix);
            newString.append("芝加哥大学");
            newString.append(orig, caseSix + 3, orig.length());
            result = newString;
        }

        // harvard
        if (caseSeven > -1) {
            StringBuilder newString = new StringBuilder();
            newString.append(orig, 0, caseSeven);
            newString.append("哈佛大学");
            newString.append(orig, caseSeven + 7, orig.length());
            result = newString;
        }

        // stanford
        if (caseEight > -1) {
            StringBuilder newString = new StringBuilder();
            newString.append(orig, 0, caseEight);
            newString.append("斯坦福大学");
            newString.append(orig, caseEight + 8, orig.length());
            result = newString;
        }

        // northestern
        if (caseNine > -1) {
            StringBuilder newString = new StringBuilder();
            newString.append(orig, 0, caseNine);
            newString.append("东北大学");
            newString.append(orig, caseNine + 3, orig.length());
            result = newString;
        }

        return result.toString();
    }

    /**
     * 间距自适应
     * 调整输入第一个方法所使用的的间距
     * 简化大算法
     */
    public static int len(String orig) {

        int[]sorted = sort(new int[]{
                indexOf(orig,"ea"),
                indexOf(orig,"ed"),
                indexOf(orig,"rd"),
                indexOf(orig,"uc")});

        int[]lengs = new int[4];

        lengs[0] = sorted[1] - sorted[0];
        lengs[1] = sorted[2] - sorted[1];
        lengs[2] = sorted[3] - sorted[2];
        lengs[3] = orig.length() - sorted[3];

        int maxLen = lengs[3];

        int[]result = sort(lengs);

        if (result[3] == -1) {
            // 啥都没找到，但是还是给点东西吧
            return 20;
        } else if (result[3] != maxLen) {
            // 返回最大间隙
            return result[3];

            // >>或者更短一点的输出
            // 解除注释以使用更短的字符串结果（精度会丢失）
            // 需要同时解除上下两处

//            if (result[3] < 80) {
//                return result[3];
//            } else if (result[2] < 80) {
//                return result[2];
//            } else if (result[1] < 80) {
//                return result[1];
//            } else if (result[0] < 80){
//                return result[0];
//            } else {
//                return 20;
//            }
        } else {
            // 返回第二大
            return result[2];

            // >>或者更短一点的输出
            // 解除注释以使用更短的字符串结果（精度会丢失）
            // 需要同时解除上下两处

//            if (result[2] < 80) {
//                return result[2];
//            }
//            else if (result[1] < 80) {
//                return result[1];
//            } else if (result[0] < 80){
//                return result[0];
//            } else {
//                return 20;
//            }
        }
    }
}
