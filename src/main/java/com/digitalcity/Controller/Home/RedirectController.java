package com.digitalcity.Controller.Home;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/yun")
public class RedirectController {
    /*
     * 根据前端的链接做一次跳转，直接跳转到720云上
     * */
    @RequestMapping(value = "",method = RequestMethod.GET)
    public String redirectTo720Yun(String url){
        String data=url;
        return "redirect:http://720yun.com"+url;
    }
}
