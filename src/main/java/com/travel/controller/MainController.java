package com.travel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Tanya on 08.02.2017.
 */
@Controller
@RequestMapping("/")
public class MainController {

    @RequestMapping
    public String getIndexPage() {
        return "main";
    }

    @RequestMapping("login")
    public String getLoginPage() {
        return "login";
    }
}
