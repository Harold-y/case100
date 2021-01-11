package org.yye.util;

import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedHashMap;

/**
 * 多个方法的封装类，用于数据的整形
 * #使用方法s
 *
 *
 * @author garyzhang
 * @version 1.3
 *
 * 1.1 轻微bug修复，性能优化，增加噪声辨识度
 * 1.2 轻微bug修复，增加分数抽取算法的准确性 #1.2在第一次数据入库中使用
 * 1.3 加入对学校名称的过滤算法，用UMich做第一版本实验 (我有时间把那个substring 的轮子也装好调好）
 * 1.4 实现类实体化
 */
public class FilterUtil3 {

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
                    FilterUtil3 filterUtil3 = new FilterUtil3();
                    filterUtil3.setTarget(set.getString("answer"));
                    filterUtil3.runFullUtil();
                    dataMap.put("answerId",set.getString("answerId"));
                    dataMap.put("original_answer",set.getString("answer"));
                    dataMap.put("Det_SAT",set.getString("SAT"));
                    dataMap.put("Det_TOEFL",set.getString("TOEFL"));
                    dataMap.put("Det_IELTS",set.getString("ACT"));
                    dataMap.put("Det_ACT",set.getString("ACT"));
                    answerList.add(dataMap);

                    System.out.println("It is at "+i+"th answer undering processing...");

                    String satScore = String.valueOf(filterUtil3.getSAT());
                    String actScore = String.valueOf(filterUtil3.getACT());
                    String toeflScore = String.valueOf(filterUtil3.getTOEFL());
                    String ieltsScore = String.valueOf(filterUtil3.getIELTS());
                    String gpaScore = String.valueOf(filterUtil3.getGPA());
                    String ED = filterUtil3.getED();
                    String EA = filterUtil3.getEA();
                    String RD = filterUtil3.getRD();
                    String UC = filterUtil3.getUC();
                    // System.out.println(filterUtil3.getAdmittedUmich());
                    if(filterUtil3.getAdmittedUmich())
                    {
                        dataMap.put("collegeId", "62");
                    }else
                    {
                        dataMap.put("collegeId", "");
                    }

                    dataMap.put("SAT",satScore);
                    //dataMap.put("SAT","FALSE");
                    dataMap.put("ACT",actScore);
                    //dataMap.put("ACT","FALSE");
                    dataMap.put("TOEFL",toeflScore);
                    //dataMap.put("TOEFL","FALSE");
                    dataMap.put("IELTS",ieltsScore);
                    //dataMap.put("IELTS","FALSE");
                    dataMap.put("GPA",gpaScore);
                    dataMap.put("EA",EA);
                    dataMap.put("ED",ED);
                    dataMap.put("RD",RD);
                    dataMap.put("UC",UC);
                }
            } catch (Exception e)
            {
                System.out.println(e.getMessage());
            }
        }

        for(LinkedHashMap map: answerList)
        {
            String  sqlString = "insert into processedcasedata_copy1 (id,answerId,original_answer,processed_answer,sat,act,toefl,ielts,gpa,note,ED,EA,RD,UC,collegeId)" +
                    " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
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

            preparedStatement.setString(11,(String)map.get("ED"));
            preparedStatement.setString(12,(String)map.get("EA"));
            preparedStatement.setString(13,(String)map.get("RD"));
            preparedStatement.setString(14,(String)map.get("UC"));
            if((map.get("collegeId")).equals("62"))
            {
                preparedStatement.setString(15,(String)map.get("collegeId"));
            }else
            {
                preparedStatement.setString(15,"");
            }

            int result = preparedStatement.executeUpdate();
            System.out.println("Data processing, please hold on. Update result: "+result);
            System.out.println(map);
        }
    }

    private String target;
    private String ED;
    private String EA;
    private String RD;
    private String UC;
    private Double SAT;
    private Double ACT;
    private Double TOEFL;
    private Double IELTS;
    private Double GPA;

    //避免重复启动
    private Boolean isApplied;

    //学校
    private Boolean appliedUmich;
    private Boolean admittedUmich;

    public FilterUtil3() {
        this.target = null;
        isApplied = false;
    }

    public FilterUtil3(String target) {
        this.target = target;
        isApplied = false;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    public void removeTarget() {
        this.target = null;
    }

    public String getED() {
        return ED;
    }

    public String getEA() {
        return EA;
    }

    public String getRD() {
        return RD;
    }

    public String getUC() {
        return UC;
    }

    public Double getSAT() {
        return SAT;
    }

    public Double getACT() {
        return ACT;
    }

    public Double getTOEFL() {
        return TOEFL;
    }

    public Double getIELTS() {
        return IELTS;
    }

    public Double getGPA() {
        return GPA;
    }

    public void setED(String ED) {
        this.ED = ED;
    }

    public void setEA(String EA) {
        this.EA = EA;
    }

    public void setRD(String RD) {
        this.RD = RD;
    }

    public void setUC(String UC) {
        this.UC = UC;
    }

    public void setSAT(Double SAT) {
        this.SAT = SAT;
    }

    public void setACT(Double ACT) {
        this.ACT = ACT;
    }

    public void setTOEFL(Double TOEFL) {
        this.TOEFL = TOEFL;
    }

    public void setIELTS(Double IELTS) {
        this.IELTS = IELTS;
    }

    public void setGPA(Double GPA) {
        this.GPA = GPA;
    }

    public Boolean getAppliedUmich() {
        return appliedUmich;
    }

    public Boolean getAdmittedUmich() {
        return admittedUmich;
    }

    public void runStuInfo() {
        this.extractApplicationOverlook();
        this.extractStandardizeTestings();
    }

    public void runSchInfo() {
        this.isAdmitted();
    }

    public void runFullUtil() {
        if (!isApplied) {
            if (target == null) {
                // 避免null pointer
                throw new IllegalArgumentException("Target Remains Unset.");
            }
            isApplied = true;
            this.extractApplicationOverlook();
            this.extractStandardizeTestings();
            this.isAdmitted();
        }
    }

    /**
     * 该方法提取了申请者的院校信息
     *
     */
    private void extractApplicationOverlook() {

        String copy = this.target;

        // 移除噪声
        copy = noiseRemover(copy);

        int ed = indexOf(copy, "ED");
        int ea = indexOf(copy, "EA");
        int rd = indexOf(copy, "RD");
        int uc = indexOf(copy, "UC");

        int inLength = moderateLength(copy);

        // ed
        if (ed > -1) {
            if (ea - ed > 0 && ea - ed < inLength - 1) {
                this.ED = subString(copy, ed + 2, ea);
            } else if (rd - ed > 0 && rd - ed < inLength - 1) {
                this.ED = subString(copy, ed + 2, rd);
            } else if (uc - ed > 0 && uc - ed < inLength - 1) {
                this.ED = subString(copy, ed + 2, uc);
            } else if (ed + inLength > copy.length() - 1) {
                this.ED = subString(copy, ed + 2, copy.length() - 1);
            } else {
                this.ED = subString(copy, ed + 2, ed + inLength);
            }
        } else {
            this.ED = null;
        }

        // ea
        if (ea > -1) {
            if (ed - ea > 0 && ed - ea < inLength - 1) {
                this.EA = subString(copy, ea + 2, ed);
            } else if (rd - ea > 0 && rd - ea < inLength - 1) {
                this.EA = subString(copy, ea + 2, rd);
            } else if (uc - ea > 0 && uc - ea < inLength - 1) {
                this.EA = subString(copy, ea + 2, uc);
            } else if (ea + inLength > copy.length()) {
                this.EA = subString(copy, ea + 2, copy.length() - 1);
            } else {
                this.EA = subString(copy, ea + 2, ea + inLength);
            }
        } else {
            this.EA = null;
        }

        // rd
        if (rd > -1) {
            if (ed - rd > 0 && ed - rd < inLength - 1) {
                this.RD = subString(copy, rd + 2, ed);
            } else if (ea - rd > 0 && ea - rd < inLength - 1) {
                this.RD = subString(copy, rd + 2, ea);
            } else if (uc - rd > 0 && uc - rd < inLength - 1) {
                this.RD = subString(copy, rd + 2, uc);
            } else if (rd + inLength > copy.length() - 1) {
                this.RD = subString(copy, rd + 2, copy.length() - 1);
            } else {
                this.RD = subString(copy, rd + 2, rd + inLength);
            }
        } else {
            this.RD = null;
        }

        // uc
        if (uc > -1) {
            if (ed - uc > 0 && ed - uc < inLength - 1) {
                this.UC = subString(copy, uc, ed);
            } else if (ea - uc > 0 && ea - uc < inLength - 1) {
                this.UC = subString(copy, uc, ea);
            } else if (rd - uc > 0 && rd - uc < inLength - 1) {
                this.UC = subString(copy, uc, rd);
            } else if (uc + inLength > copy.length() - 1) {
                this.UC = subString(copy, uc, copy.length() - 1);
            } else {
                this.UC = subString(copy, uc, uc + inLength);
            }
        } else {
            this.UC = null;
        }
    }

    /**
     * 该方法提取了申请者的标化成绩
     *
     */
    private void extractStandardizeTestings() {

        String copy = this.target;
        double[] SearchResult = new double[5];
        double temp = 0;
        int i = 0;

        outer:
        while (i < copy.length() - 1) {
            char c = copy.charAt(i);
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
                    if (temp >= 9 || temp == 0 || copy.charAt(i + 1) < '0' || copy.charAt(i + 1) > '9') {
                        // 后面的全部位数作废
                        int counter = i + 1;
                        while (copy.charAt(counter) >= '0' && copy.charAt(counter) <= '9') {
                            counter++;
                        }
                        i += counter;
                        temp = 0;
                        continue outer;
                    }

                    // 如果小数点前为5或以上
                    // >>IELTS
                    else if (temp >= 5) {
                        if (copy.charAt(i + 2) < '0' || copy.charAt(i + 2) > '9') {
                            if (copy.charAt(i + 1) == '5') {
                                temp = temp + 0.5;
                                break inner;
                            } else if (copy.charAt(i + 1) == '0') {
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
                            while (copy.charAt(counter) >= '0' && copy.charAt(counter) <= '9') {
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
                        char ch = copy.charAt(i + counter);
                        while (ch >= '0' && ch <= '9') {
                            // 设定小数点后的位数
                            temp += ((double) ch - 48)/(Math.pow(10,counter));
                            counter++;
                            ch = copy.charAt(i + counter);
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
                        while (copy.charAt(counter) >= '0' && copy.charAt(counter) <= '9') {
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
                c = copy.charAt(i);
            }

            // 当数字不再出现，放入结果前先进行合法性检测
            int j = isType(copy,temp);
            // 检查，合法且不重复则填入
            if (j > -1 && SearchResult[j] == 0.0) {
                SearchResult[j] = temp;
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
        this.SAT = SearchResult[0];
        this.ACT = SearchResult[1];
        this.TOEFL = SearchResult[2];
        this.IELTS = SearchResult[3];
        this.GPA = SearchResult[4];
    }

    /**
     * 噪声移除
     * 找时间改一下换用switch方法
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

        // northeastern
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

    /**
     * 间距自适应
     * 调整输入第一个方法所使用的的间距
     * 简化一下主方法逻辑
     */
    public static int moderateLength(String orig) {

        int[]sorted = popSort(new int[]{
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

        int[]result = popSort(lengs);

        if (result[3] == -1) {
            // 没找到的情况
            return 20;
        } else if (result[3] != maxLen) {
            // 返回最大间隙
            return result[3];

            // >>或者获得更短一点的输出？
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

            // >>或者获得更短一点的输出？
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

    // 选用冒泡，因为一般情况下都是一次扫过
    public static int[] popSort(int[] input) {
        int temp;

        for (int i = 0; i < input.length; i++) {
            for (int j = input.length - 1; j > i; j--) {
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
     * subString 方法，但不会有边界溢出的的情况
     */
    public static String subString(String input, int beginIndex, int endIndex) {
        input += "结束";
        if (beginIndex > -1 && endIndex < input.length()) {
            return input.substring(beginIndex,endIndex);
        } else if (beginIndex > -1 ){
            return input.substring(beginIndex, input.length() - 1);
        } else if (endIndex < input.length()){
            return input.substring(0,endIndex);
        } else {
            return input;
        }
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
     * 从字符串中提取学校并且判断录取情况
     * >>先用UMich试试吧
     *
     *  0:0  /  1:0  /  1:1
     * (没填)/(没录取)/(被录取)
     */
    private void isAdmitted() {

        String copy = this.target;

        // 稍微分一下，还没有想出来除了hardcode更好地算法
        // 把数列初始化的长度设为可调的
        int count = 3;

        String[] pos = new String[count];
        int[] indexs = new int[count];
        pos[0] = "umich";
        pos[1] = "michigan";
        pos[2] = "密西根";

        for (int i = 0; i < count; i ++) {
            indexs[i] = indexOf(copy, pos[i]);
        }

        popSort(indexs);

        outer:
        if (indexs[count - 1] != -1) {
            for (int i = 0; i < count; i ++) {
                if (indexs[i] >= 0) {
                    this.appliedUmich = true;
                    int j = statsHelper(subString(copy,indexs[i] - 10, indexs[i] + 16));
                    if (j <= 1) {
                        // 简单的被录取或拒绝
                        this.admittedUmich = j != 0;
                        break outer;
                    } else {
                        // 如果被录取或拒绝被共同发现
                        // 形如 xxx录取AAA拒绝，判断AAA的录取情况看校名后面出现的信息
                        // 如果都录取和没录取都出现了就看在校名后面的
                        int k = statsHelper(subString(copy,indexs[i], indexs[i] + 16));
                        if (k <= 1) {
                            this.admittedUmich = k != 0;
                        } else {
                            // 垃圾人 hzwz
                            this.admittedUmich = false;
                        }
                        break outer;
                    }
                }
            }
        } else {
            // 没找到结果
            this.appliedUmich = false;
            this.admittedUmich = false;
        }
    }

    /**
     * return 2 if both appears, 1 if is admitted, 0 if is rejected/ deferred
     * @param input
     * @return
     */
    public static int statsHelper(String input) {
        double result = 0;
        String a = "admit";
        String b = "录";
        String c = "鹿";
        String d = "拒";
        String e = "菊";
        String f = "rej";
        String g = "def";

        if (indexOf(input,a) > -1 || indexOf(input,b) > -1 || indexOf(input,c) > -1) {
            // is admitted
            result += 1.5;
        }
        if (indexOf(input,d) > -1 || indexOf(input,e) > -1 || indexOf(input,f) > -1 || indexOf(input,g) > -1) {
            // is rejected
            result += 0.5;
        }
        // 这样的算法的好处就在于如果这有一个结果，返回值会分别为1和0。
        return (int)result;
    }
}
