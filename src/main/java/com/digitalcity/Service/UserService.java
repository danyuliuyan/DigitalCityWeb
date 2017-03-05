package com.digitalcity.Service;

import com.digitalcity.Model.User;
import com.digitalcity.Repository.UserRepository;
import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.*;
import java.util.List;

/**
 * Created by dushang on 16/11/17.
 */

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    private Specification<User> getSpecification(final String username, final String email, final String phone, final String qq, final Integer sex, final Integer status){

        Specification<User> userSpecification=new Specification<User>() {
            @Override
            public Predicate toPredicate(Root<User> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {

                List<Predicate> predicateList= Lists.newArrayList();

                Predicate predicate=null;
//                Predicate predicate1=null;
//
//                predicate=criteriaBuilder.equal(root.get("status"),0);
//
//                predicate1=criteriaBuilder.equal(root.get("status"),1);
//
//                predicateList.add(criteriaBuilder.or(predicate,predicate1));

                if(username!=null&&!username.equals("")){
                    Path<String> stringPath=root.get("username");
                    predicate=criteriaBuilder.like(stringPath,"%"+username+"%");

                    predicateList.add(criteriaBuilder.and(predicate));
                }

                if(email!=null&&!email.equals("")){
                    Path<String> stringPath=root.get("email");
                    predicate=criteriaBuilder.like(stringPath,"%"+email+"%");

                    predicateList.add(criteriaBuilder.and(predicate));
                }

                if(phone!=null&&!phone.equals("")){
                    Path<String> stringPath=root.get("phone");
                    predicate=criteriaBuilder.like(stringPath,"%"+phone+"%");

                    predicateList.add(criteriaBuilder.and(predicate));
                }

                if(qq!=null&&!qq.equals("")){
                    Path<String> stringPath=root.get("qq");
                    predicate=criteriaBuilder.like(stringPath,"%"+qq+"%");

                    predicateList.add(criteriaBuilder.and(predicate));
                }

                if(sex!=null&&!sex.equals("")){
                    predicate=criteriaBuilder.equal(root.get("sex"),sex);

                    predicateList.add(criteriaBuilder.and(predicate));
                }

                if(status!=null&&!status.equals("")){
                    predicate=criteriaBuilder.equal(root.get("status"),status);

                    predicateList.add(criteriaBuilder.and(predicate));
                }

                criteriaQuery.where(predicateList.toArray(new Predicate[predicateList.size()]));
                return null;
            }
        };

        return userSpecification;
    }

    /*查找所有用户*/
    public Page<User> findAllUser(String username, String email, String phone, String qq, Integer sex, Integer status, PageRequest pageRequest)throws Exception{

        Specification<User> userSpecification=getSpecification(username,email,phone,qq,sex,status);

        Sort sort = new Sort(Sort.Direction.ASC,"id");

        Pageable pageable=new PageRequest(pageRequest.getPageNumber(),pageRequest.getPageSize(),sort);

        Page<User> userPage=null;

        try{
            userPage=userRepository.findAll(userSpecification,pageable);
        }catch (Exception e){
            e.printStackTrace();
        }

        return userPage.getTotalElements()>0?userPage:null;
    }

    /*确定所有用户的数量*/
    public Integer countAllUser(String username, String email, String phone, String qq, Integer sex, Integer status)throws Exception{

        Specification<User> userSpecification=getSpecification(username,email,phone,qq,sex,status);

        long count=0;
        try {
            count=userRepository.count(userSpecification);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return new Long(count).intValue();
    }

    /*检查邮箱是否重复*/
    public String checkEmail(String email){
        return userRepository.checkEmail(email);
    }

    /*通过用户id获取到User对象*/
    public User findUserById(Integer id){
        return userRepository.findUserById(id);
    }

    /*保存用户信息*/
    public void saveUser(User user){
        userRepository.save(user);
    }

    /*更新用户信息*/
    public void updateUser(User user){
        userRepository.saveAndFlush(user);
    }

    /*通过邮箱获取到User对象*/
    public User findUserByEmail(String email){
        return userRepository.findUserByEmail(email);
    }

    /*通过用户id获取到用户密码*/
    public String findPasswordById(Integer id){
        return userRepository.findPasswordById(id);
    }

    /*通过邮箱获取到用户密码*/
    public String findPasswordByEmail(String email){
        return userRepository.findPasswordByEmail(email);
    }

    /*通过邮箱更新用户密码*/
    @Transactional
    public void updatePasswordByEmail(String email,String password){
        userRepository.updatePasswordByEmail(email,password);
    }

    /*通过用户id更新用户名*/
    @Transactional
    public void updateUsernameById(Integer id,String username){
        userRepository.updateUsernameById(id,username);
    }

    /*通过用户id更新邮箱*/
    @Transactional
    public void updateEmailById(Integer id,String email){
        userRepository.updateEmailById(id,email);
    }

    /*通过用户id更新用户头像*/
    @Transactional
    public void updateAvatarById(Integer id,String avatarSrc){
        userRepository.updateAvatarById(id,avatarSrc);
    }

    /*通过用户id更新用户密码*/
    @Transactional
    public void updatePasswordById(Integer id,String password){
        userRepository.updatePasswordById(id,password);
    }

    /*通过用户id更新省*/
    @Transactional
    public void updateProvinceById(Integer id,String province){
        userRepository.updateProvinceById(id,province);
    }

    /*通过用户id更新市*/
    @Transactional
    public void updateCityById(Integer id,String city){
        userRepository.updateCityById(id,city);
    }

    /*通过用户id更新区*/
    @Transactional
    public void updateAreaById(Integer id,String area){
        userRepository.updateAreaById(id,area);
    }

    /*通过用户id更新性别*/
    @Transactional
    public void updateSexById(Integer id,Integer sex){
        userRepository.updateSexById(id,sex);
    }

    /*通过用户id更新生日*/
    @Transactional
    public void updateBirthdayById(Integer id,String birthday){
        userRepository.updateBirthdayById(id,birthday);
    }

    /*通过用户id更新手机号*/
    @Transactional
    public void updatePhoneById(Integer id,String phone){
        userRepository.updatePhoneById(id,phone);
    }

    /*通过用户id更新QQ*/
    @Transactional
    public void updateQqById(Integer id,String qq){
        userRepository.updateQqById(id,qq);
    }

    /*通过用户id更新用户个人描述*/
    @Transactional
    public void updateSelfDescById(Integer id,String selfDesc){
        userRepository.updateSelfDescById(id,selfDesc);
    }

    /*通过用户id锁定用户*/
    @Transactional
    public void lockUser(Integer id){
        userRepository.lockUser(id);
    }

    /*通过用户id解锁用户*/
    @Transactional
    public void unLockUser(Integer id){
        userRepository.unLockUser(id);
    }

    /*通过用户id删除用户*/
    @Transactional
    public void deleteUser(Integer id){
        userRepository.deleteUser(id);
    }
}
