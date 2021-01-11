package org.yye.util;

import java.sql.*;
import java.util.ArrayList;

/**
 * 多个方法的封装类，用于数据的整形
 * #使用方法
 * 外接applyFilterUtil 驱动方法
 * 返回一个特定格式，整形之后的字符串
 * 具体格式请参照 applyFilterUtil() 方法的javadoc
 *
 * @author garyzhang
 * @version 1.0
 */
public class FilterUtil {

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        String sql = "com.mysql.cj.jdbc.Driver";
        String url = "jdbc:mysql://127.0.0.1:3306/case100?serverTimezone=Asia/Shanghai";
        Class.forName(sql);
        Connection conn = DriverManager.getConnection(url,"root","root");

        Statement statement = conn.createStatement();
        ArrayList<String> answerList = new ArrayList();
        ArrayList<String> processedList = new ArrayList<>();
        for(int i=1;i<1002;i++)
        {
            try {
                String  sqlString = "select answer from casedata where answerId = "+i;
                ResultSet set = statement.executeQuery(sqlString);
                while (set.next())
                    answerList.add(set.getString("answer"));
            } catch (Exception e)
            {
                System.out.println(e.getMessage());
            }
        }

        System.out.println("It is at "+26+"th answer undering processing...");
        String resultString2 = applyFilterUtil(answerList.get(26));
        System.out.println(resultString2);

        for(int g=0;g<answerList.size();g++)
        {
            try {
                    System.out.println("It is at "+g+"th answer undering processing...");
                    String resultString = applyFilterUtil(answerList.get(g));
                    processedList.add(resultString);
            } catch (Exception e)
            {
                System.out.println(e.getMessage());
            }
        }
        for(int i=0;i<processedList.size();i++)
        {
            System.out.println(i+"th result is: ");
            System.out.println(processedList.get(i));
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

        String result = "";

        // 移除噪声
        input = noiseRemover(input);

        int ed = indexOf(input, "ED");
        int ea = indexOf(input, "EA");
        int rd = indexOf(input, "RD");
        int uc = indexOf(input, "UC");

        // ed
        if (ed > -1) {
            if (ea - ed > 0 && ea - ed < inLength) {
                result += input.substring(ed + 2, ea);
            } else if (rd - ed > 0 && rd - ed < inLength) {
                result += input.substring(ed + 2, rd);
            } else if (uc - ed > 0 && uc - ed < inLength) {
                result += input.substring(ed + 2, uc);
            } else if (ed + inLength > input.length()) {
                result += input.substring(ed + 2);
            } else {
                result += input.substring(ed + 2, ed + inLength);
            }
        }

        result += "@@";

        // ea
        if (ea > -1) {
            if (ed - ea > 0 && ed - ea < inLength) {
                result += input.substring(ea + 2, ed);
            } else if (rd - ea > 0 && rd - ea < inLength) {
                result += input.substring(ea + 2, rd);
            } else if (uc - ea > 0 && uc - ea < inLength) {
                result += input.substring(ea + 2, uc);
            } else if (ed + inLength > input.length()) {
                result += input.substring(ea + 2);
            } else {
                result += input.substring(ea + 2, ea + inLength);
            }
        }

        result += "@@";

        // rd
        if (rd > -1) {
            if (ed - rd > 0 && ed - rd < inLength) {
                result += input.substring(rd + 2, ed);
            } else if (ea - rd > 0 && ea - rd < inLength) {
                result += input.substring(rd + 2, ea);
            } else if (uc - rd > 0 && uc - rd < inLength) {
                result += input.substring(rd + 2, uc);
            } else if (rd + inLength > input.length()) {
                result += input.substring(rd + 2);
            } else {
                result += input.substring(rd + 2, rd + inLength);
            }
        }

        result += "@@";

        // uc
        if (uc > -1) {
            if (ed - uc > 0 && ed - uc < inLength) {
                result += input.substring(uc + 2, ed);
            } else if (ea - uc > 0 && ea - uc < inLength) {
                result += input.substring(uc + 2, ea);
            } else if (rd - uc > 0 && rd - uc < inLength) {
                result += input.substring(uc + 2, rd);
            } else if (uc + inLength > input.length()) {
                result += input.substring(uc + 2);
            } else {
                result += input.substring(uc + 2, uc + inLength);
            }
        }

        return result;
    }

    /**
     * 该方法提取了申请者的标化成绩
     *
     * @param input 输入的原始字符串
     *
     * @return 成品字符串
     */
    public static String extractStandardizeTesting(String input) {

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
                    if (temp >= 9 || temp == 0) {
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
                    else if (temp > 1) {
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
                    }
                } else {
                    // 余下情况，如果不是小数点
                    temp = temp * 10 + ((int) c - 48);
                    i++;
                }
                c = input.charAt(i);
            }

            // 当数字不再出现，放入结果前先请求滤镜响应
            int here = isType(temp);
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
    public static int isType(double in) {
        if (in == 0.0 || in > 2400) {
            // 为空或超格式
            return - 1;
        }
        if (in <= 2400 && in > 1600 && in % 10 == 0) {
            // >>旧版sat
            return 0;
        }
        if (in <= 1600 && in > 1000 && in % 10 == 0) {
            // >>新版sat
            return 0;
        }
        if (in <= 35 && in > 9) {
            // >>ACT
            return 1;
        }
        if (in <= 120 && in > 35) {
            // >>TOEFL
            return 2;
        }
        if (in <= 9 && in > 5) {
            // >>IELTS
            return 3;
        }
        if (in < 5 && in > 2) {
            // >>GPA
            return 4;
        }
        return -1;
    }

    /**
     * 噪声移除
     */
    public static String noiseRemover(String orig) {
        // #欢迎增加测试中额外发现的噪声
        // noise1: early action/ decision 不会被过滤到的问题
        // noise2/3: 有人打中文的提前批/第一批 etc
        // noise4: xxxUclass of 2024 把U和class连在一起然后被识别成UC
        // noise5 rolling decision 不会被过滤到的问题
        // noise6: university of chicago uchi 混淆 uc

        StringBuilder result = new StringBuilder();
        result.append(orig);

        int caseOne = indexOf(orig,"early");
        int caseFive = indexOf(orig,"rolling");
        int caseTwo = indexOf(orig,"提前批");
        int caseThree = indexOf(orig,"第一批");
        int caseFour = indexOf(orig,"class");
        int caseSix = indexOf(orig,"uchi");

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
            newString.append("芝大");
            newString.append(orig, caseSix + 3, orig.length());
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
        int[]sum = new int[4];

        sum[0] = indexOf(orig,"ea");
        sum[1] = indexOf(orig,"ed");
        sum[2] = indexOf(orig,"rd");
        sum[3] = indexOf(orig,"uc");

        int[]sorted = sort(sum);
        int[]lengs = new int[4];

        lengs[0] = sorted[1] - sorted[0];
        lengs[1] = sorted[2] - sorted[1];
        lengs[2] = sorted[3] - sorted[2];
        lengs[3] = orig.length() - sorted[3];

        int[]result = sort(lengs);

        if (result[3] == -1) {
            // 啥都没找到，但是还是给点东西吧
            return 20;
        } else if (result[3] != lengs[3]) {
            // 返回最大间隙
            return result[3];
        } else {
            // 返回前三个的最大间隙
            lengs[3] = -1;
            return sort(lengs)[3];
        }
    }
}
