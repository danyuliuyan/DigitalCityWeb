package com.digitalcity.Service;

import com.digitalcity.Model.University;
import com.digitalcity.Repository.UniversityRepository;
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
 * Created by dushang on 17/2/21.
 */

@Service
public class UniversityService {

    @Autowired
    private UniversityRepository universityRepository;

    private Specification<University> getSpecification(final String name, final Integer status){

        Specification<University> universitySpecification=new Specification<University>() {
            @Override
            public Predicate toPredicate(Root<University> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {

                List<Predicate> predicateList= Lists.newArrayList();

                Predicate predicate=null;

                if(name!=null&&!name.equals("")){
                    Path<String> stringPath=root.get("name");
                    predicate=criteriaBuilder.like(stringPath,"%"+name+"%");

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

        return universitySpecification;
    }

    /*查找所有大学,按id排序*/
    public Page<University> findAllUniversity(String name, Integer status, PageRequest pageRequest)throws Exception{

        Specification<University> universitySpecification=getSpecification(name,status);

        Sort sort = new Sort(Sort.Direction.ASC,"id");

        Pageable pageable=new PageRequest(pageRequest.getPageNumber(),pageRequest.getPageSize(),sort);

        Page<University> universityPage=null;

        try{
            universityPage=universityRepository.findAll(universitySpecification,pageable);
        }catch (Exception e){
            e.printStackTrace();
        }

        return universityPage.getTotalElements()>0?universityPage:null;
    }


    /*通过id获取到University对象*/
    public University findUniversityById(Integer id){
        return universityRepository.findUniversityById(id);
    }

    /*获取按照名称排序的大学列表*/
    public List<University> findUniversitySortedByName(){return universityRepository.findAllUniversitySortedByName();}

    /*保存大学信息*/
    public void saveUniversity(University university){
        universityRepository.save(university);
    }

    /*更新用户信息*/
    public void updateUniversity(University university){
        universityRepository.saveAndFlush(university);
    }


    /*通过用户id删除用户*/
    @Transactional
    public void deleteUniversity(Integer id){
        universityRepository.deleteUniversity(id);
    }
}
