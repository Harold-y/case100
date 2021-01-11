package org.yye.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.yye.dao.mapper.ExamGenreMapper;

import java.util.List;

@Service
public class ExamGenreService {
    @Autowired
    ExamGenreMapper examGenreMapper;
    public List<org.yye.entity.ExamGenre> selectExamGenreAll()
    {
        return examGenreMapper.selectExamGenreAll();
    }
}
