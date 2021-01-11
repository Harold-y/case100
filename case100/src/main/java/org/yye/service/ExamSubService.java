package org.yye.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.yye.dao.mapper.ExamSubMapper;
import org.yye.entity.ExamSub;

import java.util.List;

@Service
public class ExamSubService {
    @Autowired
    ExamSubMapper examSubMapper;
    public List<ExamSub> selectExamSubAll()
    {
        return examSubMapper.selectExamSubAll();
    }
}
