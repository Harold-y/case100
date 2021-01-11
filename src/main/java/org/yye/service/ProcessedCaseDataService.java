package org.yye.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.yye.dao.mapper.ProcessedCaseDataMapper;
import org.yye.entity.ProcessedCaseData;

import javax.annotation.Resource;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.LinkedHashMap;

@Service
public class ProcessedCaseDataService {
    @Resource
    ProcessedCaseDataMapper mapper;

    protected ArrayList<ProcessedCaseData> selectAll() {
        return mapper.selectAll();
    }

    public LinkedHashMap doStatistics() {
        LinkedHashMap map = new LinkedHashMap();
        ArrayList<ProcessedCaseData> answerList = this.selectAll();
        ArrayList<String> satData = new ArrayList<>();
        ArrayList<String> actData = new ArrayList<>();
        ArrayList<String> ieltsData = new ArrayList<>();
        ArrayList<Double> toeflData = new ArrayList<>();
        ArrayList<String> gpaData = new ArrayList<>();
        for (ProcessedCaseData data : answerList) {
            try {
                if (data == null)
                    continue;
                if (data.getSat() != null && !data.getSat().equals("0.0") && !data.getSat().equals(" 0.0")
                        && !data.getSat().equals("FALSE")) {
                    Double SAT = Double.parseDouble(data.getSat());
                    if(SAT.compareTo(1150.0) >= 0 && SAT.compareTo(1600.0) <=0)
                    {
                        satData.add(data.getSat());
                    }
                }
                if (data.getAct() != null && !data.getAct().equals("0.0") && !data.getAct().equals(" 0.0")
                        && !data.getAct().equals("FALSE")) {
                    Double ACT = Double.parseDouble(data.getAct());
                    if(ACT.compareTo(20.0) >= 0)
                    {
                        actData.add(data.getAct());
                    }
                }
                if (data.getIelts() != null && !data.getIelts().equals("0.0")
                        && !data.getIelts().equals("FALSE")) {
                    Double IELTS = Double.parseDouble(data.getIelts());
                    if(IELTS.compareTo(3.0) > 0 )
                    {
                        ieltsData.add(data.getIelts());
                    }
                }
                if (data.getToefl() != null && !data.getToefl().equals("0.0")
                        && !data.getToefl().equals("FALSE")) {
                    Double TOEFL = Double.parseDouble(data.getToefl());
                    if(TOEFL.compareTo(50.0) >= 0 && TOEFL.compareTo(120.0) <= 0)
                    {
                        toeflData.add(TOEFL);
                    }
                }
                if (data.getGpa() != null && !data.getGpa().equals("0.0") && !data.getGpa().equals("FALSE")
                        && data.getGpa().compareTo("2.0") >= 0 && data.getGpa().compareTo("4.0") <= 0) {
                    gpaData.add(data.getGpa());
                }
            } catch (Exception e) {
                System.out.println(e);
            }
        }

        satData.sort(String::compareTo);
        actData.sort(String::compareTo);
        toeflData.sort(Double::compareTo);
        ieltsData.sort(String::compareTo);
        gpaData.sort(String::compareTo);
        double satTotal = 0;
        for(String sat : satData)
        {
            double satInt = Double.parseDouble(sat);
            satTotal+=satInt;
        }

        double actTotal = 0;
        for(String act : actData)
        {
            double actInt = Double.parseDouble(act);
            actTotal+=actInt;
        }

        double toeflTotal = 0;
        for(Double toefl : toeflData)
        {
            toeflTotal+=toefl;
        }

        double ieltsTotal = 0;
        for(String ielts : ieltsData)
        {
            double ieltsInt = Double.parseDouble(ielts);
            ieltsTotal+=ieltsInt;
        }

        double gpaTotal = 0;
        for(String gpa : gpaData)
        {
            double gpaInt = Double.parseDouble(gpa);
            gpaTotal+=gpaInt;
        }

        map.put("satMax",satData.get(satData.size()-1));
        map.put("satMin",satData.get(0));
        map.put("satMedian",satData.get(satData.size()/2));
        map.put("satMean",String.valueOf(satTotal/satData.size()));

        map.put("actMax",actData.get(actData.size()-1));
        map.put("actMin",actData.get(0));
        map.put("actMedian",actData.get(actData.size()/2));
        map.put("actMean",String.valueOf(actTotal/actData.size()));

        map.put("toeflMax",toeflData.get(toeflData.size()-1));
        map.put("toeflMin",toeflData.get(0));
        map.put("toeflMedian",toeflData.get(toeflData.size()/2));
        map.put("toeflMean",String.valueOf(toeflTotal/toeflData.size()));

        map.put("ieltsMax",ieltsData.get(ieltsData.size()-1));
        map.put("ieltsMin",ieltsData.get(0));
        map.put("ieltsMedian",ieltsData.get(ieltsData.size()/2));
        map.put("ieltsMean",String.valueOf(ieltsTotal/ieltsData.size()));

        map.put("gpaMax",gpaData.get(gpaData.size()-1));
        map.put("gpaMin",gpaData.get(0));
        map.put("gpaMedian",gpaData.get(gpaData.size()/2));
        map.put("gpaMean",String.valueOf(gpaTotal/gpaData.size()));

        return map;
    }
    public int insertIntoStatistics(LinkedHashMap map)
    {
        return mapper.insertIntoStatistics(map);
    }
    public int deleteStatistics()
    {
        return mapper.deleteStatistics();
    }

    public ArrayList<ArrayList> presentTOEFLSAT(){
        ArrayList<ArrayList> returnList = new ArrayList<>();
        ArrayList<ProcessedCaseData> answerList = this.selectAll();

        for (ProcessedCaseData data : answerList) {
            try {
                if (data == null)
                    continue;
                if (data.getSat() != null && !data.getSat().equals("0.0") && !data.getSat().equals("FALSE") && data.getSat().compareTo("1150") > 0 &&
                        data.getSat().compareTo("1600") <= 0 && data.getToefl() != null && !data.getToefl().equals("0.0")
                        && !data.getToefl().equals("FALSE"))  {

                    Double TOEFL = Double.parseDouble(data.getToefl());
                    if(TOEFL.compareTo(50.0) >= 0 && TOEFL.compareTo(120.0) <= 0)
                    {
                        ArrayList dataList = new ArrayList();
                        dataList.add(data.getSat());
                        dataList.add(data.getToefl());
                        returnList.add(dataList);
                    }
                }
            } catch (Exception e)
            {
                System.out.println(e);
            }
        }
        return returnList;
    }

    public ArrayList<ArrayList> presentTOEFLACT(){
        ArrayList<ArrayList> returnList = new ArrayList<>();
        ArrayList<ProcessedCaseData> answerList = this.selectAll();

        for (ProcessedCaseData data : answerList) {
            try {
                if (data == null)
                    continue;
                if (data.getAct() != null && !data.getAct().equals("0.0")
                        && !data.getAct().equals("FALSE") && data.getAct().compareTo("20") > 0 && data.getToefl() != null && !data.getToefl().equals("0.0")
                        && !data.getToefl().equals("FALSE")) {
                    Double TOEFL = Double.parseDouble(data.getToefl());
                    if(TOEFL.compareTo(50.0) >= 0 && TOEFL.compareTo(120.0) <= 0)
                    {
                        ArrayList dataList = new ArrayList();
                        dataList.add(data.getAct());
                        dataList.add(data.getToefl());
                        returnList.add(dataList);
                    }
                }
            } catch (Exception e)
            {
                System.out.println(e);
            }
        }
        return returnList;
    }

    public ArrayList<ArrayList> presentIELTSSAT(){
        ArrayList<ArrayList> returnList = new ArrayList<>();
        ArrayList<ProcessedCaseData> answerList = this.selectAll();

        for (ProcessedCaseData data : answerList) {
            try {
                if (data == null)
                    continue;
                if (data.getSat() != null && !data.getSat().equals("0.0") && !data.getSat().equals("FALSE") && data.getSat().compareTo("1150") > 0 &&
                        data.getSat().compareTo("1600") <= 0 && data.getIelts() != null && !data.getIelts().equals("0.0") && !data.getIelts().equals(" 0.0")
                        && !data.getIelts().equals("FALSE") && data.getIelts().compareTo("3.0") > 0 ) {
                    ArrayList dataList = new ArrayList();
                    dataList.add(data.getSat());
                    dataList.add(data.getIelts());
                    returnList.add(dataList);
                }
            } catch (Exception e)
            {
                System.out.println(e);
            }
        }
        return returnList;
    }

    public ArrayList<ArrayList> presentIELTSACT(){
        ArrayList<ArrayList> returnList = new ArrayList<>();
        ArrayList<ProcessedCaseData> answerList = this.selectAll();

        for (ProcessedCaseData data : answerList) {
            try {
                if (data == null)
                    continue;
                if (data.getAct() != null && !data.getAct().equals("0.0") && !data.getAct().equals(" 0.0")
                        && !data.getAct().equals("FALSE") && data.getAct().compareTo("20") > 0 && data.getIelts() != null && !data.getIelts().equals("0.0") && !data.getIelts().equals(" 0.0")
                        && !data.getIelts().equals("FALSE") && data.getIelts().compareTo("3.0") > 0 ) {
                    ArrayList dataList = new ArrayList();
                    dataList.add(data.getAct());
                    dataList.add(data.getIelts());
                    returnList.add(dataList);
                }
            } catch (Exception e)
            {
                System.out.println(e);
            }
        }
        return returnList;
    }
}
