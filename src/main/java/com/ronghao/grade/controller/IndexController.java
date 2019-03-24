package com.ronghao.grade.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
    @RequestMapping(value = "/")
    public String index(){
        return "index";
    }

    @RequestMapping(value = "/grade")
    public String grade(){
        return "grade";
    }

    @RequestMapping(value = "/selfIntro")
    public String selfIntro(){
        return "selfIntro";
    }

}
