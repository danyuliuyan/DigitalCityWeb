package com.digitalcity.Controller.Admin;

import com.digitalcity.Model.Museum;
import com.digitalcity.Service.MuseumService;
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
 * Created by dushang on 17/2/27.
 */

@Controller
@RequestMapping("/Museum")
public class MuseumController {

    private ExecuteResult executeResult=new ExecuteResult();

    @Autowired
    private MuseumService museumService;



    @RequestMapping("/museumList")
    public String museumList(Model model, Integer pageSize, Integer pageCurrent, String name, Integer status){
        Page<Museum> museumList = null;
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
            museumList = museumService.findAllMuseum(name,status,pageRequest);
        }catch (Exception e){
            e.printStackTrace();
        }

        model.addAttribute("museumList",museumList);
        return "backPage/Museum/museumList";
    }

    @RequestMapping(value = "/add",method = RequestMethod.GET)
    public String museumAdd(String id,Model model){
        if (id!=null){
            /*编辑逻辑*/
            Museum museum=null;
            try {
                museum=museumService.findMuseumById(Integer.parseInt(id));
            } catch (Exception e) {
                e.printStackTrace();
            }
            model.addAttribute("museum",museum);
        }

        return "backPage/Museum/add";
    }

    @ResponseBody
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public Object museumAdd(Museum museum){
        try{
            if(museum.getId()!=null){
                /*编辑*/
                museumService.updateMuseum(museum);
                return executeResult.jsonReturn(200);
            }else{
                /*添加*/
                museumService.saveMuseum(museum);
                return executeResult.jsonReturn(200);
            }

        }catch (Exception e){
            return executeResult.jsonReturn(300,e.getMessage());
        }
    }

    @ResponseBody
    @RequestMapping("/delete")
    public Object deleteMuseum(Integer id){
        try {
            museumService.deleteMuseum(id);
            return executeResult.jsonReturn(200,false);
        } catch (Exception e) {
            return executeResult.jsonReturn(300,e.getMessage(),false);
        }
    }
}
