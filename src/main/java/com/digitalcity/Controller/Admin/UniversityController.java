package com.digitalcity.Controller.Admin;

import com.digitalcity.Model.University;
import com.digitalcity.Service.UniversityService;
import com.digitalcity.Utils.ExecuteResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by dushang on 17/2/22.
 */

@Controller
@RequestMapping("/University")
public class UniversityController {

    private ExecuteResult executeResult=new ExecuteResult();

    @Autowired
    private UniversityService universityService;



    @RequestMapping("/universityList")
    public String universityList(Model model, Integer pageSize, Integer pageCurrent, String name, Integer status){
        Page<University> universityList = null;
        try{
            if(name!=null&&!name.equals("")){
                model.addAttribute("name",name);
            }

            if (pageCurrent==null||pageCurrent.equals("")){
                pageCurrent=0;
            }else {
                pageCurrent=pageCurrent-1;
            }

            if(pageSize==null||pageSize.equals("")){
                pageSize=20;
            }

            PageRequest pageRequest=new PageRequest(pageCurrent,pageSize);
            universityList = universityService.findAllUniversity(name,status,pageRequest);
        }catch (Exception e){
            e.printStackTrace();
        }

        model.addAttribute("universityList",universityList);
        return "backPage/University/universityList";
    }

    @RequestMapping(value = "/add",method = RequestMethod.GET)
    public String universityAdd(String id,Model model){
        if (id!=null){
            /*编辑逻辑*/
            University university=null;
            try {
                university=universityService.findUniversityById(Integer.parseInt(id));
            } catch (Exception e) {
                e.printStackTrace();
            }
            model.addAttribute("university",university);
        }

        return "backPage/University/add";
    }

    @ResponseBody
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public Object universityAdd(University university){
        try{
            if(university.getId()!=null){
                /*编辑*/
                universityService.updateUniversity(university);
                return executeResult.jsonReturn(200);
            }else{
                /*添加*/
                universityService.saveUniversity(university);
                return executeResult.jsonReturn(200);
            }

        }catch (Exception e){
            return executeResult.jsonReturn(300,e.getMessage());
        }
    }

    @ResponseBody
    @RequestMapping("/delete")
    public Object deleteUniversity(Integer id){
        try {
            universityService.deleteUniversity(id);
            return executeResult.jsonReturn(200,false);
        } catch (Exception e) {
            return executeResult.jsonReturn(300,e.getMessage(),false);
        }
    }
}
