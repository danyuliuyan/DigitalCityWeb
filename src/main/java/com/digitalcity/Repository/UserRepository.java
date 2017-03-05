package com.digitalcity.Repository;

import com.digitalcity.Model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
/**
 * Created by dushang on 16/11/17.
 */
public interface UserRepository extends JpaRepository<User,String>,JpaSpecificationExecutor<User>{

    @Query("select o.username from User o where lower(o.username)=lower(:username) ")
    public String checkUsername(@Param("username") String username);

    @Query("select distinct (o.email) from User o where lower(o.email)=lower(:email) ")
    public String checkEmail(@Param("email") String email);

    @Query("select o from User o where lower(o.email)=lower(:email) ")
    public User findUserByEmail(@Param("email") String email);

    @Query("select o from User o where lower(o.id)=lower(:id) ")
    public User findUserById(@Param("id") Integer id);

    @Query("select o.password from User o where lower(o.email)=lower(:email) ")
    public String findPasswordByEmail(@Param("email") String email);

    @Query("select o.password from User o where lower(o.id) =lower(:id) ")
    public String findPasswordById(@Param("id") Integer id);



    @Modifying
    @Query("update User o set o.password=:password where lower(o.email)=lower(:email) ")
    public void updatePasswordByEmail(@Param("email") String email, @Param("password") String password);

    @Modifying
    @Query("update User o set o.username=:username where lower(o.id)=lower(:id) ")
    public void updateUsernameById( @Param("id") Integer id,@Param("username") String username);

    @Modifying
    @Query("update User o set o.email=:email where lower(o.id)=lower(:id) ")
    public void updateEmailById(@Param("id") Integer id,@Param("email") String email);

    @Modifying
    @Query("update User o set o.password=:password where lower(o.id)=lower(:id) ")
    public void updatePasswordById(@Param("id") Integer id,@Param("password") String password);


    @Modifying
    @Query("update User o set o.avatarSrc=:avatarSrc where lower(o.id)=lower(:id) ")
    public void updateAvatarById(@Param("id") Integer id,@Param("avatarSrc") String avatarSrc);


    @Modifying
    @Query("update User o set o.province=:province where lower(o.id)=lower(:id) ")
    public void updateProvinceById(@Param("id") Integer id,@Param("province") String province);

    @Modifying
    @Query("update User o set o.city=:city where lower(o.id)=lower(:id) ")
    public void updateCityById(@Param("id") Integer id,@Param("city") String city);

    @Modifying
    @Query("update User o set o.area=:area where lower(o.id)=lower(:id) ")
    public void updateAreaById(@Param("id") Integer id,@Param("area") String area);


    @Modifying
    @Query("update User o set o.sex=:sex where lower(o.id)=lower(:id) ")
    public void updateSexById(@Param("id") Integer id,@Param("sex") Integer sex);

    @Modifying
    @Query("update User o set o.birthday=:birthday where lower(o.id)=lower(:id) ")
    public void updateBirthdayById(@Param("id") Integer id,@Param("birthday") String birthday);

    @Modifying
    @Query("update User o set o.phone=:phone where lower(o.id)=lower(:id) ")
    public void updatePhoneById(@Param("id") Integer id,@Param("phone") String phone);

    @Modifying
    @Query("update User o set o.qq=:qq where lower(o.id)=lower(:id) ")
    public void updateQqById(@Param("id") Integer id,@Param("qq") String qq);

    @Modifying
    @Query("update User o set o.selfDesc=:selfDesc where lower(o.id)=lower(:id) ")
    public void updateSelfDescById(@Param("id") Integer id,@Param("selfDesc") String selfDesc);

    @Modifying
    @Query("update User o set o.status=1 where lower(o.id)=lower(:id) ")
    public void lockUser(@Param("id") Integer id);

    @Modifying
    @Query("update User o set o.status=0 where lower(o.id)=lower(:id) ")
    public void unLockUser(@Param("id") Integer id);

    @Modifying
    @Query("update User o set o.status=-1 where lower(o.id)=lower(:id) ")
    public void deleteUser(@Param("id") Integer id);
}
