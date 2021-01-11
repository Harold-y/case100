package org.yye.util;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.yye.service.ProcessedCaseDataService;

import java.util.LinkedHashMap;

@RunWith(SpringRunner.class)
@SpringBootTest
public class Test1 {

    @Autowired
    ProcessedCaseDataService service;

    @Test
    public void testStatistics()
    {
        LinkedHashMap map =  service.doStatistics();
        System.out.println(map);
        service.deleteStatistics();
        service.insertIntoStatistics(map);
    }


    public static void main(String[] args)
    {
        Test1 t1 = new Test1();
        System.out.println();
    }
}
