package org.yye.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.yye.entity.ExamSub;
import org.yye.service.ExamSubService;

import java.util.List;

@Controller
@RequestMapping("examsub")
public class ExamSubController {
    @Autowired
    ExamSubService examSubService;

    @RequestMapping("selectAll")
    @ResponseBody
    public List<ExamSub> selectAll()
    {
        return examSubService.selectExamSubAll();
    }
}
