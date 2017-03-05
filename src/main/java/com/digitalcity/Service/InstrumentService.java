package com.digitalcity.Service;

import com.digitalcity.Model.Instrument;
import com.digitalcity.Repository.InstrumentRepository;
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
 * Created by dushang on 17/3/2.
 */

@Service
public class InstrumentService {
    

    @Autowired
    private InstrumentRepository instrumentRepository;

    private Specification<Instrument> getSpecification(final String name, final Integer status){

        Specification<Instrument> instrumentSpecification=new Specification<Instrument>() {
            @Override
            public Predicate toPredicate(Root<Instrument> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {

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

        return instrumentSpecification;
    }

    public Page<Instrument> findAllInstrument(String name, Integer status,  PageRequest pageRequest)throws Exception{

        Specification<Instrument> instrumentSpecification=getSpecification(name,status);

        Sort sort = new Sort(Sort.Direction.ASC,"id");

        Pageable pageable=new PageRequest(pageRequest.getPageNumber(),pageRequest.getPageSize(),sort);

        Page<Instrument> instrumentPage=null;

        try{
            instrumentPage=instrumentRepository.findAll(instrumentSpecification,pageable);
        }catch (Exception e){
            e.printStackTrace();
        }

        return instrumentPage.getTotalElements()>0?instrumentPage:null;
    }

    public Instrument findInstrumentById(Integer id){
        return instrumentRepository.findInstrumentById(id);
    }

    /*返回所有正常状态的乐器*/
    public List<Instrument> findAllInstrumentNormal(){
        return instrumentRepository.findAllInstrumentNormatl();
    }
    /*保存乐器信息*/
    public void saveInstrument(Instrument instrument){
        instrumentRepository.save(instrument);
    }

    /*更新乐器信息*/
    public void updateInstrument(Instrument instrument){
        instrumentRepository.saveAndFlush(instrument);
    }

    /*通过id删除乐器*/
    @Transactional
    public void deleteInstrument(Integer id){
        instrumentRepository.deleteInstrument(id);
    }
}
