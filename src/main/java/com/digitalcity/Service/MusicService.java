package com.digitalcity.Service;

import com.digitalcity.Model.Music;
import com.digitalcity.Repository.MusicRepository;
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
 * Created by dushang on 17/6/19.
 */

@Service
public class MusicService {

    @Autowired
    private MusicRepository musicRepository;

    private Specification<Music> getSpecification(final String name, final String singer, final Integer status){

        Specification<Music> musicSpecification=new Specification<Music>() {
            @Override
            public Predicate toPredicate(Root<Music> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {

                List<Predicate> predicateList= Lists.newArrayList();

                Predicate predicate=null;

                if(name!=null&&!name.equals("")){
                    Path<String> stringPath=root.get("name");
                    predicate=criteriaBuilder.like(stringPath,"%"+name+"%");

                    predicateList.add(criteriaBuilder.and(predicate));
                }

                if(singer!=null&&!singer.equals("")){
                    Path<String> stringPath=root.get("singer");
                    predicate=criteriaBuilder.like(stringPath,"%"+singer+"%");

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

        return musicSpecification;
    }
    public Page<Music> findAllMusic(String name, String singer, Integer status, PageRequest pageRequest)throws Exception{

        Specification<Music> musicSpecification=getSpecification(name,singer,status);

        Sort sort = new Sort(Sort.Direction.ASC,"id");

        Pageable pageable=new PageRequest(pageRequest.getPageNumber(),pageRequest.getPageSize(),sort);

        Page<Music> musicPage=null;

        try{
            musicPage=musicRepository.findAll(musicSpecification,pageable);
        }catch (Exception e){
            e.printStackTrace();
        }

        return musicPage.getTotalElements()>0?musicPage:null;
    }

    public Music findMusicById(Integer id){
        return musicRepository.findMusicById(id);
    }

    public List<Music> findAllShowMusic() { return musicRepository.findAllShowMusic(); }

    /*保存音乐信息*/
    public void saveMusic(Music music){
        musicRepository.save(music);
    }

    /*更新音乐信息*/
    public void updateMusic(Music music){
        musicRepository.saveAndFlush(music);
    }

    @Transactional
    public void deleteMusic(Integer id){
        musicRepository.deleteMusic(id);
    }
    // 获取音乐案例总数
    public int getMusicNum(){
        return musicRepository.getMusicNum();
    }
}
