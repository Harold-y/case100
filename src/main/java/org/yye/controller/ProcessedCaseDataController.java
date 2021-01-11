package org.yye.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.yye.service.ProcessedCaseDataService;

import java.util.ArrayList;
import java.util.LinkedHashMap;

@Controller
@RequestMapping("processedData")
public class ProcessedCaseDataController {
    @Autowired
    ProcessedCaseDataService service;

    @RequestMapping("statistics")
    @ResponseBody
    public void doStatistics()
    {
        LinkedHashMap map =  service.doStatistics();
        service.deleteStatistics();
        service.insertIntoStatistics(map);
    }

    @ResponseBody
    @RequestMapping("presentTOEFLSAT")
    public ArrayList<ArrayList> presentTOEFLSAT()
    {
        return service.presentTOEFLSAT();
    }

    @ResponseBody
    @RequestMapping("presentTOEFLACT")
    public ArrayList<ArrayList> presentTOEFLACT()
    {
        return service.presentTOEFLACT();
    }

    @ResponseBody
    @RequestMapping("presentIELTSSAT")
    public ArrayList<ArrayList> presentIELTSSAT()
    {
        return service.presentIELTSSAT();
    }

    @ResponseBody
    @RequestMapping("presentIELTSACT")
    public ArrayList<ArrayList> presentIELTSACT()
    {
        return service.presentIELTSACT();
    }
}
