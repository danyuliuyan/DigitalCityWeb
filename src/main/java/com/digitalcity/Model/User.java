package com.digitalcity.Model;


import javax.persistence.*;

/**
 * Created by dushang on 16/11/15.
 */
@Entity
@Table(name = "dc_user")
public class User {

    @Id
    @GeneratedValue
    private Integer id;
    private String username;        //用户名称，8到16个字符
    private String email;           //用户邮箱，用于登录
    private String password;        //用户密码

    private String province;        //用户地址：省
    private String city;            //用户地址：市
    private String area;        //用户地址：区/县
    private Integer sex;            //用户性别：0表示男，1表示女
    private String birthday;        //用户生日
    private String phone;           //用户手机
    private String qq;              //用户QQ号
    private String selfDesc;        //用户个人描述



    private String avatarSrc;       //用户头像地址

    private Integer status;          //用户状态：0正常，1锁定，-1删除

    public User(){}

    public User(String username,String email,String password,String province,String city,String area,Integer sex,
                String birthday,String phone,String qq,String selfDesc,Integer status){
        this.username=username;
        this.email=email;
        this.password=password;
        this.province=province;
        this.city=city;
        this.area=area;
        this.sex=sex;
        this.birthday=birthday;
        this.phone=phone;
        this.qq=qq;
        this.selfDesc=selfDesc;
        this.status=status;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    @Column(columnDefinition = "text")
    public String getSelfDesc() {
        return selfDesc;
    }

    public void setSelfDesc(String selfDesc) {
        this.selfDesc = selfDesc;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getAvatarSrc() {
        return avatarSrc;
    }

    public void setAvatarSrc(String avatarSrc) {
        this.avatarSrc = avatarSrc;
    }
}
