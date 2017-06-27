package com.digitalcity.Controller.Admin;

import com.digitalcity.Model.Article;
import com.digitalcity.Model.Organization;
import com.digitalcity.Service.ArticleService;
import com.digitalcity.Service.OrganizationService;
import com.digitalcity.Utils.ExecuteResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by dushang on 17/2/27.
 */

@Controller
@RequestMapping("/Innovate")
public class InnovateController {
    private ExecuteResult executeResult=new ExecuteResult();

    @Autowired
    private OrganizationService organizationService;

    @Autowired
    private ArticleService articleService;

    @RequestMapping("/organizationList")
    public String innovateList(Model model, Integer pageSize, Integer pageCurrent, String name){

        Page<Organization> organizationList = null;
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
                pageSize=30;
            }

            PageRequest pageRequest=new PageRequest(pageCurrent,pageSize);
            organizationList = organizationService.findAllOrganization(name,pageRequest);
        }catch (Exception e){
            e.printStackTrace();
        }

        model.addAttribute("organizationList",organizationList);
        return "backPage/Innovate/organizationList";
    }

    @RequestMapping("/articleList")
    public String articleList(Model model, Integer pageSize, Integer pageCurrent, String name, Integer status, Integer organizationId){

        Page<Article> articleList = null;
        try{
            if(name!=null&&!name.equals("")){
                model.addAttribute("name",name);
            }

            if(status!=null&&!status.equals("")){
                model.addAttribute("status",status);
            }

            if(organizationId!=null&&!organizationId.equals("")){
                model.addAttribute("organizationId",organizationId);
            }

            if (pageCurrent==null||pageCurrent.equals("")){
                pageCurrent=0;
            }else {
                pageCurrent=pageCurrent-1;
            }

            if(pageSize==null||pageSize.equals("")){
                pageSize=30;
            }

            PageRequest pageRequest=new PageRequest(pageCurrent,pageSize);
            articleList = articleService.findAllArticle(name,status,organizationId,pageRequest);
        }catch (Exception e){
            e.printStackTrace();
        }

        List<Organization> organizationList = organizationService.findAllOrganization();
        model.addAttribute("articleList",articleList);
        model.addAttribute("organizationList",organizationList);
        return "backPage/Innovate/articleList";
    }

    @RequestMapping(value = "/addOrganization",method = RequestMethod.GET)
    public String addOrganization(String id, Model model){

        if (id!=null){
            /*编辑逻辑*/
            Organization organization=null;
            try {
                organization=organizationService.findOrganizationById(Integer.parseInt(id));
            } catch (Exception e) {
                e.printStackTrace();
            }
            model.addAttribute("organization",organization);
        }

        return "backPage/Innovate/addOrganization";
    }

    @RequestMapping(value = "/addArticle",method = RequestMethod.GET)
    public String addArticle(String id, Model model){

        if (id!=null){
            /*编辑逻辑*/
            Article article=null;
            try {
                article=articleService.findArticleById(Integer.parseInt(id));
            } catch (Exception e) {
                e.printStackTrace();
            }
            model.addAttribute("article",article);
        }
        List<Organization> organizationList = organizationService.findAllOrganization();
        model.addAttribute("organizationList",organizationList);
        return "backPage/Innovate/addArticle";
    }
    @ResponseBody
    @RequestMapping(value = "/addArticle", method = RequestMethod.POST)
    public Object addArticle(Article article){
        try{
            if(article.getId()!=null){
                /*编辑*/
                articleService.updateArticle(article);
                return executeResult.jsonReturnAndRefreshDialogId(200,"articleDialog");

            }else{
                /*添加*/
                articleService.saveArticle(article);
                return executeResult.jsonReturnAndRefreshDialogId(200,"articleDialog");
            }

        }catch (Exception e){
            return executeResult.jsonReturn(300,e.getMessage());
        }
    }

    @ResponseBody
    @RequestMapping(value = "/addOrganization", method = RequestMethod.POST)
    public Object addOrganization(Organization organization){
        try{
            if(organization.getId()!=null){
                /*编辑*/
                organizationService.updateOrganization(organization);
                return executeResult.jsonReturnAndRefreshDialogId(200,"organizationDialog");

            }else{
                /*添加*/
                organizationService.saveOrganization(organization);
                return executeResult.jsonReturnAndRefreshDialogId(200,"organizationDialog");
            }

        }catch (Exception e){
            return executeResult.jsonReturn(300,e.getMessage());
        }
    }

    @ResponseBody
    @RequestMapping("/deleteOrganization")
    public Object deleteOrganization(Integer id){
        try {
            organizationService.deleteOrganization(id);
            return executeResult.jsonReturn(200,false);
        } catch (Exception e) {
            return executeResult.jsonReturn(300,e.getMessage(),false);
        }
    }

    @ResponseBody
    @RequestMapping("/deleteArticle")
    public Object deleteArticle(Integer id){
        try {
            articleService.deleteArticle(id);
            return executeResult.jsonReturn(200,false);
        } catch (Exception e) {
            return executeResult.jsonReturn(300,e.getMessage(),false);
        }
    }
}
