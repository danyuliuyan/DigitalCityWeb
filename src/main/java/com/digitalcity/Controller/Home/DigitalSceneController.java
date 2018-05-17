package com.digitalcity.Controller.Home;

import com.digitalcity.Model.DigitalScene;
import com.digitalcity.Repository.DigitalSceneRepository;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.persistence.criteria.CriteriaBuilder;

@Controller
public class DigitalSceneController {
    @Autowired
    DigitalSceneRepository digitalSceneRepository;
    @RequestMapping(value = "/getDigitalScene")
    public String getDigitalScene(Model model,String id){
        String temp = id;
        try{
            int dcId = Integer.parseInt(temp);
            DigitalScene digitalScene = digitalSceneRepository.getDigitalSceneById(dcId);
            if(digitalScene!=null){
                model.addAttribute("message",0);
            }else{
                model.addAttribute("message",-1);
            }
            model.addAttribute("digitalScence",digitalScene);
        }catch (Exception e){
            model.addAttribute("message",-1);
        }
        return "frontPage/digitalSceneTemplate";
    }
}
