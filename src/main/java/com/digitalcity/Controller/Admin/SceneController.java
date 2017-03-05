package com.digitalcity.Controller.Admin;

import com.digitalcity.Model.Scene;
import com.digitalcity.Model.University;
import com.digitalcity.Service.SceneService;
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
 * Created by dushang on 17/2/27.
 */
@Controller
@RequestMapping("/Scene")
public class SceneController {

    private ExecuteResult executeResult=new ExecuteResult();

    @Autowired
    private SceneService sceneService;

    @RequestMapping("/sceneList")
    public String sceneList(Model model,Integer pageSize, Integer pageCurrent, String name,Integer type, Integer parentId){
        Page<Scene> sceneList = null;
        model.addAttribute("type",type);
        model.addAttribute("parentId",parentId);
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
            sceneList = sceneService.findAllScene(name,type,parentId,pageRequest);
        }catch (Exception e){
            e.printStackTrace();
        }

        model.addAttribute("sceneList",sceneList);

        return "backPage/Scene/sceneList";
    }

    @RequestMapping(value = "/add",method = RequestMethod.GET)
    public String sceneAdd(String id,Integer type,Integer parentId, Model model){

        model.addAttribute("type",type);
        model.addAttribute("parentId",parentId);

        if (id!=null){
            /*编辑逻辑*/
            Scene scene=null;
            try {
                scene=sceneService.findSceneById(Integer.parseInt(id));
            } catch (Exception e) {
                e.printStackTrace();
            }
            model.addAttribute("scene",scene);
        }

        return "backPage/Scene/add";
    }

    @ResponseBody
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public Object sceneAdd(Scene scene){
        try{
            if(scene.getId()!=null){
                /*编辑*/
                sceneService.updateScene(scene);
                return executeResult.jsonReturnAndRefreshDialogId(200,"sceneDialog1");

            }else{
                /*添加*/
                sceneService.saveScene(scene);
                return executeResult.jsonReturnAndRefreshDialogId(200,"sceneDialog1");
            }

        }catch (Exception e){
            return executeResult.jsonReturn(300,e.getMessage());
        }
    }

    @ResponseBody
    @RequestMapping("/delete")
    public Object deleteScene(Integer id){
        try {
            sceneService.deleteScene(id);
            return executeResult.jsonReturn(200,false);
        } catch (Exception e) {
            return executeResult.jsonReturn(300,e.getMessage(),false);
        }
    }

}
