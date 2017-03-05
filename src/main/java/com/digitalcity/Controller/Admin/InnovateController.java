package com.digitalcity.Controller.Admin;

import com.digitalcity.Utils.ExecuteResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by dushang on 17/2/27.
 */

@Controller
@RequestMapping("/Innovate")
public class InnovateController {
    private ExecuteResult executeResult=new ExecuteResult();

    @RequestMapping("/innovatePage")
    public String innovatePage(Model model, Integer pageSize, Integer pageCurrent, String name, Integer status){

        return "backPage/Innovate/innovatePage";
    }

}
