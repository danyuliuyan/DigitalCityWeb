package com.digitalcity.Controller.Admin;

import com.digitalcity.Model.Instrument;
import com.digitalcity.Service.InstrumentService;
import com.digitalcity.Utils.ExecuteResult;
import com.digitalcity.Utils.FileDelete;
import com.digitalcity.Utils.FileZip;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.UUID;

/**
 * Created by dushang on 17/2/27.
 */

@Controller
@RequestMapping("/Art")
public class ArtController {

    private ExecuteResult executeResult=new ExecuteResult();
    @Autowired
    private InstrumentService instrumentService;


    @RequestMapping("/instrumentList")
    public String artPage(Model model, Integer pageSize, Integer pageCurrent, String name, Integer status){

        Page<Instrument> instrumentList = null;
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
            instrumentList = instrumentService.findAllInstrument(name,status,pageRequest);
        }catch (Exception e){
            e.printStackTrace();
        }

        model.addAttribute("instrumentList",instrumentList);

        return "backPage/Art/instrumentList";
    }

    @RequestMapping(value = "/addInstrument",method = RequestMethod.GET)
    public String addInstrument(String id, Model model){

        if (id!=null){
            /*编辑逻辑*/
            Instrument instrument=null;
            try {
                instrument=instrumentService.findInstrumentById(Integer.parseInt(id));
            } catch (Exception e) {
                e.printStackTrace();
            }
            model.addAttribute("instrument",instrument);
        }

        return "backPage/Art/addInstrument";
    }

    @ResponseBody
    @RequestMapping(value = "/addInstrument", method = RequestMethod.POST)
    public Object addInstrument(HttpServletRequest request,Instrument instrument,String zipFilePath){

        instrument.setPageSource("fileUpload/art/instrument/"+instrument.getDirectoryName()+"/index.html");

        try{
            if(instrument.getId()!=null){
                /*编辑*/
                String basePath=request.getSession().getServletContext().getRealPath("/");

                    /*上传文件，先删除原有的目录下的所有文件，然后判断是否目录名重复*/
                Instrument instrument1 = instrumentService.findInstrumentById(instrument.getId());
                String oldDirectoryName = instrument1.getDirectoryName();

                if (zipFilePath!=null&&!zipFilePath.equals("")){
                    //上传文件
                    File file=null;
                    if (!oldDirectoryName.equals(instrument.getDirectoryName())){
                        //改变原来的名字

                        //获取新的目录名，看是否重复

                        file=new File(basePath+zipFilePath);
                        File newNameFile=new File(basePath+"fileUpload\\/art\\/instrument\\/"+instrument.getDirectoryName());
                        if (newNameFile.exists()){
                            //命名失败，删除已上传文件，重新上传
                            FileDelete.deleteCatalogAndFiles(basePath+"fileUpload\\/art\\/instrument\\/"+file.getParentFile().getName());
                            return executeResult.jsonReturn(300,"目录名已存在，请重新命名并重新上传文件！");
                        }
                        file.getParentFile().renameTo(newNameFile);

                        //删除原有目录下的所有文件
                        FileDelete.deleteCatalogAndFiles(basePath+"fileUpload\\/art\\/instrument\\/"+oldDirectoryName);
                    }else {
                        //原来的名字

                        //删除原有目录下的所有文件
                        FileDelete.deleteCatalogAndFiles(basePath+"fileUpload\\/art\\/instrument\\/"+oldDirectoryName);

                        //把新上传并解压的文件夹重命名
                        file=new File(basePath+zipFilePath);
                        File newNameFile=new File(basePath+"fileUpload\\/art\\/instrument\\/"+instrument.getDirectoryName());

                        file.getParentFile().renameTo(newNameFile);

                    }
                    file.deleteOnExit();

                }else {
                    //不上传文件
                    if (!oldDirectoryName.equals(instrument.getDirectoryName())){
                        //改变原来的名字
                        File oldNameFile=new File(basePath+"fileUpload\\/art\\/instrument\\/"+oldDirectoryName);
                        File newNameFile=new File(basePath+"fileUpload\\/art\\/instrument\\/"+instrument.getDirectoryName());
                        if (newNameFile.exists()){
                            return executeResult.jsonReturn(300,"目录名已存在，请重新命名！");
                        }
                        oldNameFile.renameTo(newNameFile);
                    }
                }
                instrumentService.updateInstrument(instrument);
                return executeResult.jsonReturnAndRefreshDialogId(200,"pictureDialog1");

            }else{
                /*添加*/
                if (zipFilePath!=null&&!zipFilePath.equals("")){
                    String basePath=request.getSession().getServletContext().getRealPath("/");
                    File file=new File(basePath+zipFilePath);
                    File newNameFile=new File(basePath+"fileUpload\\/art\\/instrument\\/"+instrument.getDirectoryName());
                    if (newNameFile.exists()){
                        //命名失败，删除已上传文件，重新上传
                        FileDelete.deleteCatalogAndFiles(basePath+zipFilePath);
                        return executeResult.jsonReturn(300,"目录名已存在，请重新命名！");
                    }
                    file.getParentFile().renameTo(newNameFile);
                }
                instrumentService.saveInstrument(instrument);
                return executeResult.jsonReturnAndRefreshDialogId(200,"pictureDialog1");
            }

        }catch (Exception e){
            return executeResult.jsonReturn(300,e.getMessage());
        }
    }

    @ResponseBody
    @RequestMapping("/upload")
    public Object uploadPhoto(HttpServletRequest request, HttpServletResponse response, String type) throws Exception{

        String basePath=request.getSession().getServletContext().getRealPath("/");
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHH");
        String ymd = "";
        if(type.equals("thumb")){
            ymd="fileUpload\\/instrument\\/thumb"+"\\/"+sdf.format(new Date());
        }else if(type.equals("detail")){
            ymd="fileUpload\\/instrument\\/detailPicture"+"\\/"+sdf.format(new Date());
        }else{
            ymd="fileUpload\\/instrument\\/others"+"\\/"+sdf.format(new Date());
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

                        path=parentPath+newFileName;
                        readFilePath=ymd+"\\/"+newFileName;
                        File localFile=new File(path);
                        if (!localFile.getParentFile().exists()){
                            localFile.getParentFile().mkdirs();
                        }
                        file.transferTo(localFile);
                        System.out.println(readFilePath);

                    }
                }
            }
            return executeResult.jsonReturnFile(200,fileName,readFilePath);
        } catch (Exception e) {
            return executeResult.jsonReturn(300,e.getMessage(),false);
        }
    }

    @ResponseBody
    @RequestMapping("/uploadZip")
    public Object uploadZip(HttpServletRequest request, HttpServletResponse response) throws Exception{

        String basePath=request.getSession().getServletContext().getRealPath("/");
        String ymd = "";


        ymd="fileUpload\\/art\\/instrument\\/"+new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

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

                        path=parentPath+newFileName;
                        readFilePath=ymd+"\\/"+newFileName;
                        File localFile=new File(path);
                        if (!localFile.getParentFile().exists()){
                            localFile.getParentFile().mkdirs();
                        }
                        file.transferTo(localFile);
                        System.out.println(readFilePath);

                        FileZip.unZipFiles(localFile.getAbsolutePath(),parentPath);
                    }
                }
            }
            return executeResult.jsonReturnFile(200,fileName,readFilePath);
        } catch (Exception e) {
            return executeResult.jsonReturn(300,e.getMessage(),false);
        }
    }
}
