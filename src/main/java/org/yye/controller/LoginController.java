package org.yye.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("login")
public class LoginController {


    @RequestMapping("Authentication")
    public String authentication(String username, String password)
    {
        if(username.equals("Harold") && password.equals("Dashwood"))
        {
            System.out.println("red");
            return "encryption/adminServer/backstage";
        }
        System.out.println("failed");
        return "dashwood";
    }
}
