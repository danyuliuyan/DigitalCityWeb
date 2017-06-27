package com.digitalcity.Controller.Home;

import com.digitalcity.Model.*;
import com.digitalcity.Service.*;
import com.digitalcity.Utils.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Pattern;

/**
 * Created by dushang on 16/12/13.
 */

@Controller
public class HomeIndexController {

    @Autowired
    private UserService userService;

    @Autowired
    private UniversityService universityService;

    @Autowired
    private MuseumService museumService;

    @Autowired
    private InstrumentService instrumentService;

    @Autowired
    private MusicService musicService;


    @Autowired
    private ArticleService articleService;


    @Autowired
    private OrganizationService organizationService;

    @Autowired
    private PictureService pictureService;

    @Autowired
    private SceneService sceneService;

    @RequestMapping("")
    public String toIndex(){
        return "redirect:/index";
    }

    @RequestMapping("/index")
    public String index(Model model, HttpSession session){

        User user = (User)session.getAttribute("user");
        if(user!=null){
            model.addAttribute("user",user);
        }

        return "/frontPage/homepage";
    }


    @RequestMapping("/login")
    public String login(){
        return "/frontPage/login";
    }


    @RequestMapping("/register")
    public String register(){
        return "/frontPage/register";
    }

    @RequestMapping("/university")
    public String university(Model model, HttpSession session){
        User user = (User)session.getAttribute("user");
        if(user!=null){
            model.addAttribute("user",user);
        }

        List<University> universityList = universityService.findUniversitySortedByName();

        model.addAttribute("universityList",universityList);

        return "/frontPage/university";
    }

    @RequestMapping("/universityDetail")
    public String universityDetail(Model model, HttpSession session,String id){
        User user = (User)session.getAttribute("user");
        if(user!=null){
            model.addAttribute("user",user);
        }
        University university = universityService.findUniversityById(Integer.parseInt(id));
        List<Picture> pictureList = pictureService.findOneTypePicture(1,Integer.parseInt(id));
        List<Scene> sceneList = sceneService.findOneTypeScene(1,Integer.parseInt(id));
        model.addAttribute("pictureList",pictureList);
        model.addAttribute("sceneList",sceneList);
        model.addAttribute("university",university);

        return "/frontPage/university-detail";
    }

    @RequestMapping("/museum")
    public String museum(Model model, HttpSession session){
        User user = (User)session.getAttribute("user");
        if(user!=null){
            model.addAttribute("user",user);
        }

        List<Museum> museumList = museumService.findMuseumSortedByName();

        model.addAttribute("museumList",museumList);

        return "/frontPage/museum";
    }

    @RequestMapping("/museumDetail")
    public String museumDetail(Model model, HttpSession session,String id){
        User user = (User)session.getAttribute("user");
        if(user!=null){
            model.addAttribute("user",user);
        }
        if(id==null||id.equals("")){
            return "redirect:/university";
        }
        Museum museum = museumService.findMuseumById(Integer.parseInt(id));
        List<Picture> pictureList = pictureService.findOneTypePicture(2,Integer.parseInt(id));
        List<Scene> sceneList = sceneService.findOneTypeScene(2,Integer.parseInt(id));
        model.addAttribute("pictureList",pictureList);
        model.addAttribute("sceneList",sceneList);
        model.addAttribute("museum",museum);

        return "/frontPage/museum-detail";
    }

    @RequestMapping("/art")
    public String art(Model model, HttpSession session){
        User user = (User)session.getAttribute("user");
        if(user!=null){
            model.addAttribute("user",user);
        }

        List<Instrument> instrumentList = instrumentService.findAllInstrumentNormal();
        List<Music> musicList = musicService.findAllShowMusic();

        model.addAttribute("musicList",musicList);
        model.addAttribute("instrumentList",instrumentList);

        return "/frontPage/art";
    }

    @RequestMapping("/artDetail")
    public String artDetail(Model model, HttpSession session, String id){
        User user = (User)session.getAttribute("user");
        if(user!=null){
            model.addAttribute("user",user);
        }
        if(id==null||id.equals("")){
            return "redirect:/art";
        }
        Instrument instrument = instrumentService.findInstrumentById(Integer.parseInt(id));
        model.addAttribute("instrument",instrument);

        return "/frontPage/art-detail";
    }

    @RequestMapping("/originality")
    public String innovate(Model model, HttpSession session){
        User user = (User)session.getAttribute("user");
        if(user!=null){
            model.addAttribute("user",user);
        }

        List<Article> articleList = articleService.findAllShowArticle();
        List<Organization> organizationList = organizationService.findAllOrganization();

        model.addAttribute("articleList",articleList);
        model.addAttribute("organizationList",organizationList);
        return "/frontPage/innovate";
    }

    @ResponseBody
    @RequestMapping(value="/originality/getOrganization", method = RequestMethod.POST)
    public Map<String, Organization> innovate(@RequestParam("organizationId")String organizationId){
        Map<String,Organization> map = new HashMap<>();

        try{
            map.put("organization",organizationService.findOrganizationById(Integer.parseInt(organizationId)));
        }catch (Exception e){
            map.put("organization",null);
        }
        return map;
    }

    /*登录*/
    @ResponseBody
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public Map<String,String> login(@RequestParam("email")String email, @RequestParam("password")String password, HttpSession session){
        Map<String,String> map = new HashMap<>();

        try{
            String regEmail = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
            if(!Pattern.matches(regEmail,email)){
                map.put("message","账户格式有误，请重新输入！");
            }else{
                User user = userService.findUserByEmail(email);
                String encoderPassword = MD5.getMD5(password.trim());

                if(user == null){
                    map.put("message","该用户不存在，请先注册！");
                }else if(!encoderPassword.equals(user.getPassword().trim())){
                    map.put("message","用户名或密码错误！");
                }else if(user.getStatus()==1){
                    map.put("message","当前用户已被锁定，请联系管理员解锁！");
                }else if(user.getStatus()==-1) {
                    map.put("message","当前用户已被删除，请注册新账号！");
                }else{
                    //登录成功
                    session.setMaxInactiveInterval(60*60);
                    session.setAttribute("user",user);

                    map.put("message","success");
                }
            }

        }catch (Exception e){
            map.put("message","登录失败，请稍后再试！");
        }

        return map;
    }

    /*注册*/
    @ResponseBody
    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public Map<String,String> login(@RequestParam("username")String username,@RequestParam("email")String email, @RequestParam("password")String password, HttpSession session){
        Map<String,String> map = new HashMap<>();

        try{
            String regUsername = "^[\\w\\u4e00-\\u9fa5]{2,16}$";
            String regEmail = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
            String regPassword= "^[A-Za-z0-9\\x21-\\x7e]{6,16}$";       /*反斜杠\转义*/

            if(!Pattern.matches(regUsername,username)){
                map.put("message","用户名格式有误，请重新输入！");
            }else if(!Pattern.matches(regEmail,email)){
                map.put("message","邮箱格式有误，请重新输入！");
            }else if(!Pattern.matches(regPassword,password)){
                map.put("message","密码格式有误，请重新输入！");
            }else{
                User user = userService.findUserByEmail(email);
                String encoderPassword = MD5.getMD5(password.trim());

                if(user != null){
                    map.put("message","该邮箱已经注册，请直接登录！");
                }else {
                    user = new User();
                    user.setUsername(username);
                    user.setEmail(email);
                    user.setPassword(encoderPassword);
                    user.setStatus(0);

                    userService.saveUser(user);

                    map.put("message","success");
                }
            }

        }catch (Exception e){
            map.put("message","注册失败，请稍后再试！");
        }

        return map;
    }


    @RequestMapping("/userCenter")
    public String userCenter(Model model, HttpSession session){
        User user = (User)session.getAttribute("user");
        if(user!=null){
            model.addAttribute("user",user);
        }else{
            return "redirect:/index";
        }

        return "/frontPage/user-center";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.removeAttribute("user");

        return "redirect:/index";
    }

    @ResponseBody
    @RequestMapping(value = "/updateSelfdesc",method = RequestMethod.POST)
    public Map<String,String> updateSelfdesc(@RequestParam("id")String id,@RequestParam("selfDesc")String selfDesc, HttpSession session){
        Map<String,String> map = new HashMap<>();

        try{
            userService.updateSelfDescById(Integer.parseInt(id),selfDesc);
            User user = userService.findUserById(Integer.parseInt(id));
            /*更新session存储的内容*/
            session.setAttribute("user",user);
            map.put("message","success");
        }catch (Exception e){
            map.put("message","修改失败，请稍后再试！");
        }

        return map;
    }

    @ResponseBody
    @RequestMapping(value = "/editAvatar",method = RequestMethod.POST)
    public Map<String,String> editAvatar(@RequestParam("userid")String userid, @RequestParam("imgContent")String imgContent, HttpSession session, HttpServletRequest request, HttpServletResponse response){
        Map<String,String> map = new HashMap<>();

        String[] image=imgContent.split(",");

        String imgType="";
        switch (image[0]){
            case "data:image/gif;base64" :
                imgType=".gif";
                break;
            case "data:image/png;base64":
                imgType=".png";
                break;
            case "data:image/jpeg;base64":
                imgType=".jpeg";
                break;
            case "data:image/x-icon;base64":
                imgType=".ico";
                break;
            default :
                break;
        }

        try{
            BASE64Decoder decoder=new BASE64Decoder();

            byte[] b=decoder.decodeBuffer(image[1]);
//            System.out.println(Arrays.toString(b)+"+++++++++++++++++++++++++++++");
            for (int i=0;i<b.length;++i){
                if (b[i]<0){
                    b[i]+=256;
                }
            }

            String uuid= UUID.randomUUID().toString().replace("-","");//返回一个随机UUID
            String newFileName =  uuid + imgType;// 构成新文件名。

            String basePath=request.getSession().getServletContext().getRealPath("/");

            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHH");
            String ymd ="fileUpload\\/avatar"+"\\/"+sdf.format(new Date());

            String parentPath =basePath+ ymd + "/";
            //创建文件夹
            File file = new File(parentPath);
            if (!file.exists()) {
                file.mkdirs();
            }
            File uploadFile = new File(parentPath + newFileName);
            if (!uploadFile.exists()){
                uploadFile.createNewFile();
            }
            //生成图片
            OutputStream outputStream=new FileOutputStream(uploadFile);
            outputStream.write(b);
            outputStream.flush();
            outputStream.close();
            String imageSrc=ymd+"/"+ newFileName;

            userService.updateAvatarById(Integer.parseInt(userid),imageSrc);
            User user = userService.findUserById(Integer.parseInt(userid));
            session.setAttribute("user",user);

            map.put("message","success");
            map.put("avatarSrc",imageSrc);

        }catch (Exception e){
            map.put("message","修改失败，请稍后再试");
        }

        return map;
    }

    @RequestMapping("/editData")
    public String editData(Model model, HttpSession session){
        User user = (User)session.getAttribute("user");
        if(user!=null){
            model.addAttribute("user",user);
        }else{
            return "redirect:/index";
        }

        return "/frontPage/edit-data";
    }

    @RequestMapping("/editPassword")
    public String editPassword(Model model, HttpSession session){
        User user = (User)session.getAttribute("user");
        if(user!=null){
            model.addAttribute("user",user);
        }else{
            return "redirect:/index";
        }

        return "/frontPage/edit-password";
    }

    @ResponseBody
    @RequestMapping(value = "/editData",method = RequestMethod.POST)
    public Map<String,String> editData(@RequestParam("id")String id,
                                       @RequestParam("email")String email,
                                       @RequestParam("username")String username,
                                       @RequestParam("phone")String phone,
                                       @RequestParam("qq")String qq,
                                       @RequestParam("sex")String sex,
                                       @RequestParam("birthday")String birthday,
                                       @RequestParam("province")String province,
                                       @RequestParam("city")String city,
                                       @RequestParam("area")String area,
                                       @RequestParam("selfDesc")String selfDesc,
                                       HttpSession session){
        Map<String,String> map = new HashMap<>();

        try{
            String regUsername = "^[\\w\\u4e00-\\u9fa5]{2,16}$";
            String regEmail = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
            String regPhone= "^1[34578]\\d{9}$";
            String regQq= "^[1-9][0-9]{4,14}$";

            User user = userService.findUserById(Integer.parseInt(id));

            if(!Pattern.matches(regEmail,email)){
                map.put("message","邮箱格式有误，请重新输入！");
                return map;
            }else if(!Pattern.matches(regUsername,username)){
                map.put("message","用户名格式有误，请重新输入！");
                return map;
            }
            if(!phone.equals("")&&!Pattern.matches(regPhone,phone)){
                map.put("message","手机号格式有误，请重新输入！");
                return map;
            }else{
                user.setPhone(phone);
            }
            if(!qq.equals("")&&!Pattern.matches(regQq,qq)){
                map.put("message","QQ号格式有误，请重新输入！");
                return map;
            }else{
                user.setQq(qq);
            }


            user.setEmail(email);
            user.setUsername(username);
            if(!sex.equals("")){
                user.setSex(Integer.parseInt(sex));
            }
            if(!birthday.equals("")){
                user.setBirthday(birthday);
            }

            user.setProvince(province);
            user.setCity(city);
            user.setArea(area);
            if(!selfDesc.equals("")){
                user.setSelfDesc(selfDesc);
            }

            userService.saveUser(user);

            session.setAttribute("user",user);
            map.put("message","success");

        }catch (Exception e){
            map.put("message","信息修改失败，请稍后再试！");
        }

        return map;
    }

    @ResponseBody
    @RequestMapping(value = "/editPassword",method = RequestMethod.POST)
    public Map<String,String> editData(@RequestParam("id")String id,
                                       @RequestParam("passwordOld")String passwordOld,
                                       @RequestParam("passwordNew")String passwordNew,
                                       HttpSession session){
        Map<String,String> map = new HashMap<>();

        try{
            String regPassword= "^[A-Za-z0-9\\x21-\\x7e]{6,16}$";       /*反斜杠\转义*/
            User user = userService.findUserById(Integer.parseInt(id));

            if(!(MD5.getMD5(passwordOld.trim())).equals(user.getPassword().trim())){
                map.put("message","原密码输入错误，请重新输入！");
            }else if(!Pattern.matches(regPassword,passwordNew)){
                map.put("message","新密码格式错误，请重新输入！");
            }else{
                user.setPassword(MD5.getMD5(passwordNew.trim()));

                userService.saveUser(user);

                map.put("message","success");

            }
        }catch (Exception e){
            map.put("message","密码修改失败，请稍后再试！");
        }

        return map;
    }
}
