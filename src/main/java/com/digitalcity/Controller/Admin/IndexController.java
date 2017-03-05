package com.digitalcity.Controller.Admin;

/**
 * Created by dushang on 16/11/17.
 */
import com.digitalcity.Model.Admin;
import com.digitalcity.Repository.AdminRepository;
import com.digitalcity.Utils.MD5;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import sun.misc.BASE64Encoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Calendar;


@Controller
@RequestMapping("/admin")
public class IndexController {

    @Autowired
    private AdminRepository adminRepository;


    @RequestMapping("")
    public String toIndex(){
        return "redirect:/admin/index";
    }

    @RequestMapping("/index")
    public String Index(HttpSession session, Model model){
        try{
            Admin admin=(Admin)session.getAttribute("admin");

            if(admin!=null&&!admin.equals("")){
                model.addAttribute(model);
                return "backPage/backIndex";
            }else{
                return "backPage/login";
            }

        }catch (Exception e){
            e.printStackTrace();
            return "backPage/login";
        }
    }

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(@RequestParam(value = "username")String username,
                        @RequestParam(value = "password")String password,
                        @RequestParam(value = "authCode")String authCode,
                        HttpSession session, Model model){
        try{
            String validateCode=(String) session.getAttribute("validateCode");

            Admin admin=new Admin();

            if(!authCode.equals(validateCode)){
                model.addAttribute("message","验证码错误");
                return "backPage/fail";
            }else{
                admin=adminRepository.findAdminByUsername(username);
                if(admin!=null){
                    String encoder= MD5.getMD5(password.trim());
                    if(encoder.equals(admin.getPassword().trim())){
                        session.setAttribute("admin",admin);
                        return "redirect:/admin/index";
                    }else{
                        model.addAttribute("message","密码错误");
                        return "backPage/fail";
                    }

                }else{
                    model.addAttribute("message","该用户名不存在");
                    return "backPage/fail";
                }
            }

        }catch (Exception e){
            e.printStackTrace();
        }

        return null;
    }


    @RequestMapping("/validatecode")
    public String validatecode(){
        return "backPage/validatecode";
    }


    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    public String logout(HttpSession session){
        session.removeAttribute("admin");
        return "backPage/login";
    }

}
