package com.digitalcity.Service;

import com.digitalcity.Model.Organization;
import com.digitalcity.Repository.OrganizationRepository;
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
 * Created by dushang on 17/6/26.
 */

@Service
public class OrganizationService {
    
    @Autowired
    private OrganizationRepository organizationRepository;

    private Specification<Organization> getSpecification(final String name){

        Specification<Organization> organizationSpecification=new Specification<Organization>() {
            @Override
            public Predicate toPredicate(Root<Organization> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {

                List<Predicate> predicateList= Lists.newArrayList();

                Predicate predicate=null;

                if(name!=null&&!name.equals("")){
                    Path<String> stringPath=root.get("name");
                    predicate=criteriaBuilder.like(stringPath,"%"+name+"%");

                    predicateList.add(criteriaBuilder.and(predicate));
                }

                criteriaQuery.where(predicateList.toArray(new Predicate[predicateList.size()]));
                return null;
            }
        };

        return organizationSpecification;
    }
    public Page<Organization> findAllOrganization(String name, PageRequest pageRequest)throws Exception{

        Specification<Organization> organizationSpecification=getSpecification(name);

        Sort sort = new Sort(Sort.Direction.ASC,"id");

        Pageable pageable=new PageRequest(pageRequest.getPageNumber(),pageRequest.getPageSize(),sort);

        Page<Organization> organizationPage=null;

        try{
            organizationPage=organizationRepository.findAll(organizationSpecification,pageable);
        }catch (Exception e){
            e.printStackTrace();
        }

        return organizationPage.getTotalElements()>0?organizationPage:null;
    }

    public List<Organization> findAllOrganization(){
        return organizationRepository.findAllOrganization();
    }

    public Organization findOrganizationById(Integer id){
        return organizationRepository.findOrganizationById(id);
    }

    /*保存单位信息*/
    public void saveOrganization(Organization organization){
        organizationRepository.save(organization);
    }

    /*更新单位信息*/
    public void updateOrganization(Organization organization){
        organizationRepository.saveAndFlush(organization);
    }

    @Transactional
    public void deleteOrganization(Integer id){
        organizationRepository.deleteOrganization(id);
    }
}
