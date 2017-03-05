package com.digitalcity.Controller.Admin;

import com.digitalcity.Model.Picture;
import com.digitalcity.Service.PictureService;
import com.digitalcity.Utils.ExecuteResult;
import com.digitalcity.Utils.ScaleImageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import sun.misc.BASE64Encoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.UUID;

/**
 * Created by dushang on 17/2/24.
 */

@Controller
@RequestMapping("/Picture")
public class PictureController {


    private ExecuteResult executeResult=new ExecuteResult();

    @Autowired
    private PictureService pictureService;

    @RequestMapping("/pictureList")
    public String pictureList(Model model,Integer pageSize, Integer pageCurrent, String name,Integer type, Integer parentId){
        Page<Picture> pictureList = null;
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
            pictureList = pictureService.findAllPicture(name,type,parentId,pageRequest);
        }catch (Exception e){
            e.printStackTrace();
        }

        model.addAttribute("pictureList",pictureList);

        return "backPage/Picture/pictureList";
    }

    @RequestMapping(value = "/add",method = RequestMethod.GET)
    public String pictureAdd(String id,Integer type,Integer parentId, Model model){

        model.addAttribute("type",type);
        model.addAttribute("parentId",parentId);

        if (id!=null){
            /*编辑逻辑*/
            Picture picture=null;
            try {
                picture=pictureService.findPictureById(Integer.parseInt(id));
            } catch (Exception e) {
                e.printStackTrace();
            }
            model.addAttribute("picture",picture);
        }

        return "backPage/Picture/add";
    }

    @ResponseBody
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public Object pictureAdd(Picture picture){
        try{
            if(picture.getId()!=null){
                /*编辑*/
                pictureService.updatePicture(picture);
                return executeResult.jsonReturnAndRefreshDialogId(200,"pictureDialog1");

            }else{
                /*添加*/
                pictureService.savePicture(picture);
                return executeResult.jsonReturnAndRefreshDialogId(200,"pictureDialog1");
            }

        }catch (Exception e){
            return executeResult.jsonReturn(300,e.getMessage());
        }
    }

    @ResponseBody
    @RequestMapping("/upload")
    public Object uploadPhoto(HttpServletRequest request, HttpServletResponse response,Integer type) throws Exception{

        String basePath=request.getSession().getServletContext().getRealPath("/");
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHH");
        String ymd = "";
        if(type.equals(1)){
            ymd="fileUpload\\/university"+"\\/"+sdf.format(new Date());
        }else if(type.equals(2)){
            ymd="fileUpload\\/museum"+"\\/"+sdf.format(new Date());
        }else{
            ymd="fileUpload\\/others"+"\\/"+sdf.format(new Date());
        }
        String parentPath=basePath+ymd+"\\/";

        String readFilePath=null;

        String path=null;
        try {
            //解析器解析request的上下文
            CommonsMultipartResolver multipartResolver=new CommonsMultipartResolver(request.getSession().getServletContext());

            String fileName=null;
            //先判断request中是否包含multipart类型的数据，
            if (multipartResolver.isMultipart(request)){
                //再将request中的数据转化成multipart类型的数据
                MultipartHttpServletRequest multiRequest=(MultipartHttpServletRequest) request;
                Iterator iterator=multiRequest.getFileNames();
                while (iterator.hasNext()){
                    MultipartFile file=multiRequest.getFile((String)iterator.next());
                    if (file!=null){
                        fileName=file.getOriginalFilename();

                        String imageType=fileName.substring(fileName.lastIndexOf(".")).trim().toLowerCase();
                        String uuid= UUID.randomUUID().toString().replace("\\-","");//返回一个随机UUID
                        String newFileName=uuid+imageType;

                        String newFileThumbName = uuid+".thumb"+imageType;

                        path=parentPath+newFileName;
                        readFilePath=ymd+"\\/"+newFileName;
                        File localFile=new File(path);
                        if (!localFile.getParentFile().exists()){
                            localFile.getParentFile().mkdirs();
                        }
                        file.transferTo(localFile);
                        System.out.println(readFilePath);


                        /*生成缩略图，高度为60*/
                        System.out.println(ScaleImageUtils.resizeByHeight(60,parentPath+newFileThumbName,localFile));
                    }
                }
            }
            return executeResult.jsonReturnFile(200,fileName,readFilePath);
        } catch (Exception e) {
            return executeResult.jsonReturn(300,e.getMessage(),false);
        }
    }

    /*删除图片*/
    @ResponseBody
    @RequestMapping("/delete")
    public Object deletePicture(Integer id){
        try {
            pictureService.deletePicture(id);
            return executeResult.jsonReturn(200,false);
        } catch (Exception e) {
            return executeResult.jsonReturn(300,e.getMessage(),false);
        }
    }
}
