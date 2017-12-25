package com.digitalcity.Repository;

import com.digitalcity.Model.Article;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;


/**
 * Created by dushang on 17/6/26.
 */
public interface ArticleRepository extends JpaRepository<Article,String>,JpaSpecificationExecutor<Article> {

    @Query("select o from Article o where lower(o.id)=lower(:id) ")
    public Article findArticleById(@Param("id") Integer id);

    @Query("select o from Article o where o.status=1 order by o.name asc")
    public List<Article> findAllShowArticle();

    @Modifying
    @Query("delete from Article where lower(id) = lower(:id) ")
    public void deleteArticle(@Param("id") Integer id);

    @Query("select o from Article o where lower(o.organizationId)=lower(:id)")
    public List<Article> findArticleByOrganization(@Param("id")int id);

}
