package com.ocpap.rest.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

    @RequestMapping("login")
    public String login(){
        return "login";
    }
    @RequestMapping("index")
    public String index(){

        return "index";
    }
    @RequestMapping("logout")
    public String logout(){

        return "login";
    }
}
