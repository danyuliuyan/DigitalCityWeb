package com.digitalcity.Controller.Admin;

import com.digitalcity.Model.Admin;
import com.digitalcity.Model.User;
import com.digitalcity.Service.AdminService;
import com.digitalcity.Service.UserService;
import com.digitalcity.Utils.ExecuteResult;
import com.digitalcity.Utils.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by dushang on 16/11/17.
 */

@Controller
@RequestMapping("/admin")
public class AdminController {

    private ExecuteResult executeResult=new ExecuteResult();

    @Autowired
    private AdminService adminService;
    @Autowired
    private UserService userService;


    @RequestMapping(value = "/Admin/editUsername",method = RequestMethod.GET)
    public String editUsername(String id,Model model){
        Admin admin=null;
        try{
            admin=adminService.findAdminById(id);
        }catch (Exception e){
            e.printStackTrace();
        }
        model.addAttribute("admin",admin);
        return "backPage/Admin/editUsername";
    }

    @ResponseBody
    @RequestMapping(value = "/Admin/editUsername",method = RequestMethod.POST)
    public Object editUsername(@Param("id") String id,
                               @Param("username") String username,
                               HttpSession session){
        try{
            if(adminService.findUsernameById(Integer.parseInt(id)).equals(username)){

            }else{
                adminService.updateUsernameById(id,username);
                Admin admin = (Admin)session.getAttribute("admin");
                admin.setUsername(username);
                session.setAttribute("admin",admin);
            }
            return executeResult.jsonReturn(200);
        }catch (Exception e){
            return executeResult.jsonReturn(300,e.getMessage());
        }

    }

    @RequestMapping(value = "/Admin/editPassword",method = RequestMethod.GET)
    public String editPassword(String id,Model model){
        Admin admin=null;
        try{
            admin=adminService.findAdminById(id);
        }catch (Exception e){
            e.printStackTrace();
        }
        model.addAttribute("admin",admin);
        return "backPage/Admin/editPassword";
    }

    @ResponseBody
    @RequestMapping(value = "/Admin/editPassword",method = RequestMethod.POST)
    public Object editPassword(@Param("id") String id,
                               @Param("passwordOld") String passwordOld,
                               @Param("passwordNew") String passwordNew,
                               HttpSession session){
        try{
            if(adminService.findPasswordById(Integer.parseInt(id)).equals(MD5.getMD5(passwordOld))){
                //md5加密
                adminService.updatePasswordById(id,MD5.getMD5(passwordNew));
            }else{
                return executeResult.jsonReturn(300,"原密码输入错误，请重新输入！");
            }
            return executeResult.jsonReturn(200);
        }catch (Exception e){
            return executeResult.jsonReturn(300,e.getMessage());
        }

    }


    @RequestMapping("/User/userList")
    public String userList(Model model, Integer pageSize, Integer pageCurrent, String username, String email, String phone, String qq, Integer sex, Integer status){
        Page<User> userList = null;
        try{
            if(username!=null&&!username.equals("")){
                model.addAttribute("username",username);
            }

            if(phone!=null&&!phone.equals("")){
                model.addAttribute("phone",phone);
            }

            if(qq!=null&&!qq.equals("")){
                model.addAttribute("qq",qq);
            }

            if(email!=null&&!email.equals("")){
                model.addAttribute("email",email);
            }

            if(sex!=null&&!sex.equals("")){
                model.addAttribute("sex",sex);
            }

            if(status!=null&&!status.equals("")){
                model.addAttribute("status",status);
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
            userList = userService.findAllUser(username,email,phone,qq,sex,status,pageRequest);
        }catch (Exception e){
            e.printStackTrace();
        }

        model.addAttribute("userList",userList);
        return "backPage/User/userList";
    }

    @RequestMapping(value = "/User/add",method = RequestMethod.GET)
    public String userAdd(String id,Model model){
        if (id!=null){
            /*编辑逻辑*/
            User user=null;
            try {
                user=userService.findUserById(Integer.parseInt(id));
            } catch (Exception e) {
                e.printStackTrace();
            }
            model.addAttribute("user",user);
        }

        return "backPage/User/add";
    }

    @ResponseBody
    @RequestMapping(value = "/User/add", method = RequestMethod.POST)
    public Object userAdd(User user){
        try{
            if(user.getId()!=null){
                    /*编辑*/
                String email1 = userService.checkEmail(user.getEmail());
                User user1 = userService.findUserByEmail(email1);
                if(email1!=null&&!user.getId().equals(user1.getId())){
                    return executeResult.jsonReturn(300,"该邮箱已被注册",false);
                }else{
                    /*将密码以md5编码后存储到数据库*/
//                    user.setPassword(new BASE64Encoder().encodeBuffer(user.getPassword().getBytes("utf-8")));
                    if(user.getPassword().trim().length()==32){
                        /*密码已经加密*/
                        /*不做更改*/
                    }else{
                        /*密码未加密*/
                        user.setPassword(MD5.getMD5(user.getPassword().trim()));
                    }

                    /*表单传递数据时将地址的编号和名称以逗号分割传送过来，这里只保存名称，截取字符串后半部分*/
                    user.setProvince(user.getProvince().split(",")[1]);
                    user.setCity(user.getCity().split(",")[1]);
                    if(user.getArea()!=null&&!user.getArea().equals("")){
                        user.setArea(user.getArea().split(",")[1]);
                    }
                    userService.updateUser(user);
                    return executeResult.jsonReturn(200);
                }

            }else{
                    /*添加*/
                String email1 = userService.checkEmail(user.getEmail());
                if(email1==null){
                    /*将密码以base64编码后存储到数据库*/
//                    user.setPassword(new BASE64Encoder().encodeBuffer(user.getPassword().getBytes("utf-8")));
                    /*将密码以md5编码后存储到数据库*/
                    user.setPassword(MD5.getMD5(user.getPassword().trim()));
                    /*表单传递数据时将地址的编号和名称以逗号分割传送过来，这里只保存名称，截取字符串后半部分*/
                    user.setProvince(user.getProvince().split(",")[1]);
                    user.setCity(user.getCity().split(",")[1]);
                    if(user.getArea()!=null&&!user.getArea().equals("")){
                        user.setArea(user.getArea().split(",")[1]);
                    }
                    userService.saveUser(user);
                    return executeResult.jsonReturn(200);
                }else{
                    return executeResult.jsonReturn(300,"该邮箱已被注册",false);
                }

            }

        }catch (Exception e){
            return executeResult.jsonReturn(300,e.getMessage());
        }
    }

    @RequestMapping(value = "/User/setPassword",method = RequestMethod.GET)
    public String userSetPassword(String id,Model model){
        if (id!=null){
            User user=null;
            try {
                user=userService.findUserById(Integer.parseInt(id));
            } catch (Exception e) {
                e.printStackTrace();
            }
            model.addAttribute("user",user);
        }

        return "backPage/User/setPassword";
    }

    @ResponseBody
    @RequestMapping(value = "/User/setPassword",method = RequestMethod.POST)
    public Object userSetPassword(@Param("id") String id,
                               @Param("password") String password,
                               HttpSession session){
        try{
            userService.updatePasswordById(Integer.parseInt(id),MD5.getMD5(password));
            return executeResult.jsonReturn(200);
        }catch (Exception e){
            return executeResult.jsonReturn(300,e.getMessage());
        }

    }


    /**
     * 图片上传
     */
    @ResponseBody
    @RequestMapping("/User/upload")
    public Object uploadPhoto(HttpServletRequest request, HttpServletResponse response) throws Exception{

        String basePath=request.getSession().getServletContext().getRealPath("/");
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHH");
        String ymd="fileUpload\\/avatar"+"\\/"+sdf.format(new Date());
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

    /*管理员添加用户时检查邮箱是否可用*/
    @ResponseBody
    @RequestMapping("/User/checkEmail")
    public Object checkUsername(String email,Integer id){
        try {
            String email1=userService.checkEmail(email);
            if (email1==null){
                return executeResult.jsonReturn(200,"该邮箱可以使用",false);
            }else {
                User user1 = userService.findUserById(id);
                if(user1.getEmail().equals(email)){
                    return executeResult.jsonReturn(200,"该邮箱可以使用",false);
                }else{
                    return executeResult.jsonReturn(300,"该邮箱已被注册",false);
                }
            }
        } catch (Exception e) {
            return executeResult.jsonReturn(300,e.getMessage(),false);
        }
    }
    /*删除用户*/
    @ResponseBody
    @RequestMapping("/User/delete")
    public Object deleteUser(Integer id){
        try {
            userService.deleteUser(id);
            return executeResult.jsonReturn(200,false);
        } catch (Exception e) {
            return executeResult.jsonReturn(300,e.getMessage(),false);
        }
    }


}
