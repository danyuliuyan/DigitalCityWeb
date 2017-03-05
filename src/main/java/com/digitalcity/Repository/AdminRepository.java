package com.digitalcity.Repository;


import com.digitalcity.Model.Admin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
/**
 * Created by dushang on 16/11/17.
 */
public interface AdminRepository extends JpaRepository<Admin,String>,JpaSpecificationExecutor<Admin>{


    @Query("select o.username from Admin o where lower(o.username)=lower(:username) ")
    public String checkUsername(@Param("username") String username);

    @Query("select o.username from Admin o where lower(o.id) =lower(:id) ")
    public String findUsernameById(@Param("id") Integer id);


    @Query("select o from Admin o where lower(o.username)=lower(:username) ")
    public Admin findAdminByUsername(@Param("username") String username);


    @Query("select o.password from Admin o where lower(o.id)=lower(:id) ")
    public String findPasswordById(@Param("id") Integer id);

    @Modifying
    @Query("update Admin o set o.username=:username where lower(o.id)=lower(:id) ")
    public void updateUsernameById(@Param("id")String id,@Param("username")String username);

    @Modifying
    @Query("update Admin o set o.password=:password where lower(o.id)=lower(:id) ")
    public void updatePasswordById(@Param("id")String id,@Param("password")String password);
}
