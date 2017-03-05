package com.digitalcity.Service;

import com.digitalcity.Model.Museum;
import com.digitalcity.Repository.MuseumRepository;
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
public class MuseumService
{

    @Autowired
    private MuseumRepository museumRepository;

    private Specification<Museum> getSpecification(final String name, final Integer status){

        Specification<Museum> museumSpecification=new Specification<Museum>() {
            @Override
            public Predicate toPredicate(Root<Museum> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {

                List<Predicate> predicateList= Lists.newArrayList();

                Predicate predicate=null;
//                Predicate predicate1=null;
//
//                predicate=criteriaBuilder.equal(root.get("status"),0);
//
//                predicate1=criteriaBuilder.equal(root.get("status"),1);
//
//                predicateList.add(criteriaBuilder.or(predicate,predicate1));

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

        return museumSpecification;
    }

    /*查找所有大学,按id排序*/
    public Page<Museum> findAllMuseum(String name, Integer status, PageRequest pageRequest)throws Exception{

        Specification<Museum> museumSpecification=getSpecification(name,status);

        Sort sort = new Sort(Sort.Direction.ASC,"id");

        Pageable pageable=new PageRequest(pageRequest.getPageNumber(),pageRequest.getPageSize(),sort);

        Page<Museum> museumPage=null;

        try{
            museumPage=museumRepository.findAll(museumSpecification,pageable);
        }catch (Exception e){
            e.printStackTrace();
        }

        return museumPage.getTotalElements()>0?museumPage:null;
    }


    /*通过id获取到Museum对象*/
    public Museum findMuseumById(Integer id){
        return museumRepository.findMuseumById(id);
    }

    /*获取按照名称排序的大学列表*/
    public List<Museum> findMuseumSortedByName(){return museumRepository.findAllMuseumSortedByName();}

    /*保存大学信息*/
    public void saveMuseum(Museum museum){
        museumRepository.save(museum);
    }

    /*更新用户信息*/
    public void updateMuseum(Museum museum){
        museumRepository.saveAndFlush(museum);
    }


    /*通过用户id删除用户*/
    @Transactional
    public void deleteMuseum(Integer id){
        museumRepository.deleteMuseum(id);
    }
}
