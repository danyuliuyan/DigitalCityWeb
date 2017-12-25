package com.digitalcity.Service;

import com.digitalcity.Model.Picture;
import com.digitalcity.Repository.PictureRepository;
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
public class PictureService {

    @Autowired
    private PictureRepository pictureRepository;

    private Specification<Picture> getSpecification(final String name, final Integer type, final Integer parentId){

        Specification<Picture> pictureSpecification=new Specification<Picture>() {
            @Override
            public Predicate toPredicate(Root<Picture> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {

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

        return pictureSpecification;
    }

    public Page<Picture> findAllPicture(String name, Integer type, Integer parentId, PageRequest pageRequest)throws Exception{

        Specification<Picture> pictureSpecification=getSpecification(name,type,parentId);

        Sort sort = new Sort(Sort.Direction.ASC,"id");

        Pageable pageable=new PageRequest(pageRequest.getPageNumber(),pageRequest.getPageSize(),sort);

        Page<Picture> picturePage=null;

        try{
            picturePage=pictureRepository.findAll(pictureSpecification,pageable);
        }catch (Exception e){
            e.printStackTrace();
        }

        return picturePage.getTotalElements()>0?picturePage:null;
    }

    public Picture findPictureById(Integer id){
        return pictureRepository.findPictureById(id);
    }

    public List<Picture> findOneTypePicture(Integer type, Integer parentId){ return pictureRepository.findOneTypePicture(type, parentId); }

    /*按类别查找图片*/
    public  List<Picture> findPictureByPictureType(Integer pictureType){return pictureRepository.findPictureByPictureType(pictureType);}
    /*保存图片信息*/
    public void savePicture(Picture picture){
        pictureRepository.save(picture);
    }

    /*更新图片信息*/
    public void updatePicture(Picture picture){
        pictureRepository.saveAndFlush(picture);
    }

    /*通过id删除图片*/
    @Transactional
    public void deletePicture(Integer id){
        pictureRepository.deletePicture(id);
    }
}
