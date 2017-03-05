package com.digitalcity.Service;

import com.digitalcity.Model.Admin;
import com.digitalcity.Repository.AdminRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by dushang on 16/11/17.
 */

@Service
public class AdminService {

    @Autowired
    private AdminRepository adminRepository;

    public Admin findAdminByUsername(String username){
        return adminRepository.findAdminByUsername(username);
    }

    public Admin findAdminById(String id){
        return adminRepository.findOne(id);
    }

    public String findUsernameById(Integer id){
        return adminRepository.findUsernameById(id);
    }

    public String findPasswordById(Integer id){
        return adminRepository.findPasswordById(id);
    }

    public String checkUsername(String username){
        return adminRepository.checkUsername(username);
    }

    public void saveAdmin(Admin admin){
        adminRepository.save(admin);
    }

    public void updateAdmin(Admin admin){
        adminRepository.saveAndFlush(admin);
    }

    @Transactional
    public void updateUsernameById(String id,String username){
        adminRepository.updateUsernameById(id,username);
    }
    @Transactional
    public void updatePasswordById(String id,String password){
        adminRepository.updatePasswordById(id,password);
    }
}
