package com.digitalcity.Service;

import com.digitalcity.Model.Article;
import com.digitalcity.Repository.ArticleRepository;
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
public class ArticleService {

    @Autowired
    private ArticleRepository articleRepository;

    private Specification<Article> getSpecification(final String name, final Integer status, final Integer organizationId){

        Specification<Article> articleSpecification=new Specification<Article>() {
            @Override
            public Predicate toPredicate(Root<Article> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {

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

                if(organizationId!=null&&!organizationId.equals("")){
                    predicate=criteriaBuilder.equal(root.get("organizationId"),organizationId);

                    predicateList.add(criteriaBuilder.and(predicate));
                }

                criteriaQuery.where(predicateList.toArray(new Predicate[predicateList.size()]));
                return null;
            }
        };

        return articleSpecification;
    }

    public Page<Article> findAllArticle(String name, Integer status, Integer organizationId, PageRequest pageRequest)throws Exception{

        Specification<Article> articleSpecification=getSpecification(name,status,organizationId);

        Sort sort = new Sort(Sort.Direction.ASC,"id");

        Pageable pageable=new PageRequest(pageRequest.getPageNumber(),pageRequest.getPageSize(),sort);

        Page<Article> articlePage=null;

        try{
            articlePage=articleRepository.findAll(articleSpecification,pageable);
        }catch (Exception e){
            e.printStackTrace();
        }

        return articlePage.getTotalElements()>0?articlePage:null;
    }

    public Article findArticleById(Integer id){
        return articleRepository.findArticleById(id);
    }

    public List<Article> findAllShowArticle(){ return articleRepository.findAllShowArticle(); }

    /*保存文章信息*/
    public void saveArticle(Article article){
        articleRepository.save(article);
    }

    /*更新文章信息*/
    public void updateArticle(Article article){
        articleRepository.saveAndFlush(article);
    }

    /*通过id删除文章*/
    @Transactional
    public void deleteArticle(Integer id){
        articleRepository.deleteArticle(id);
    }

    /*通过公司名称查找文章*/
    public List<Article> findArticleByOrganization(String team){return articleRepository.findArticleByOrganization(team);}
}
