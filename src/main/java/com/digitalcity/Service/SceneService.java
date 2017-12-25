package com.digitalcity.Service;

import com.digitalcity.Model.Scene;
import com.digitalcity.Repository.SceneRepository;
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
 * Created by dushang on 17/2/22.
 */

@Service
public class SceneService {

    @Autowired
    private SceneRepository sceneRepository;

    private Specification<Scene> getSpecification(final String name, final Integer type, final Integer parentId){

        Specification<Scene> sceneSpecification=new Specification<Scene>() {
            @Override
            public Predicate toPredicate(Root<Scene> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {

                List<Predicate> predicateList= Lists.newArrayList();

                Predicate predicate=null;

                if(name!=null&&!name.equals("")){
                    Path<String> stringPath=root.get("name");
                    predicate=criteriaBuilder.like(stringPath,"%"+name+"%");

                    predicateList.add(criteriaBuilder.and(predicate));
                }

                predicate=criteriaBuilder.equal(root.get("type"),type);
                predicateList.add(criteriaBuilder.and(predicate));

                predicate=criteriaBuilder.equal(root.get("parentId"),parentId);
                predicateList.add(criteriaBuilder.and(predicate));

                criteriaQuery.where(predicateList.toArray(new Predicate[predicateList.size()]));
                return null;
            }
        };

        return sceneSpecification;
    }

    public Page<Scene> findAllScene(String name, Integer type, Integer parentId, PageRequest pageRequest)throws Exception{

        Specification<Scene> sceneSpecification=getSpecification(name,type,parentId);

        Sort sort = new Sort(Sort.Direction.ASC,"id");

        Pageable pageable=new PageRequest(pageRequest.getPageNumber(),pageRequest.getPageSize(),sort);

        Page<Scene> scenePage=null;

        try{
            scenePage=sceneRepository.findAll(sceneSpecification,pageable);
        }catch (Exception e){
            e.printStackTrace();
        }

        return scenePage.getTotalElements()>0?scenePage:null;
    }

    public Scene findSceneById(Integer id){
        return sceneRepository.findSceneById(id);
    }

    public List<Scene> findOneTypeScene(Integer type, Integer parentId){ return sceneRepository.findOneTypeScene(type,parentId); }

    /*保存图片信息*/
    public void saveScene(Scene scene){
        sceneRepository.save(scene);
    }

    /*更新图片信息*/
    public void updateScene(Scene scene){
        sceneRepository.saveAndFlush(scene);
    }

    /*通过id删除图片*/
    @Transactional
    public void deleteScene(Integer id){
        sceneRepository.deleteScene(id);
    }

    /*按场景类别查询场景*/
    public List<Scene> findSceneByType(int type){return  sceneRepository.findSceneByType(type);}
}
