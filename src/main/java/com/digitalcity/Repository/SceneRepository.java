package com.digitalcity.Repository;

import com.digitalcity.Model.Scene;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;


/**
 * Created by dushang on 17/2/22.
 */
public interface SceneRepository extends JpaRepository<Scene,String>,JpaSpecificationExecutor<Scene> {

    @Query("select o from Scene o where lower(o.id)=lower(:id) ")
    public Scene findSceneById(@Param("id") Integer id);

    @Query("select o from Scene  o where lower(o.type) =lower(:type) and lower(o.parentId) =lower(:parentId) ")
    public List<Scene> findOneTypeScene(@Param("type") Integer type, @Param("parentId") Integer parentId);

    @Modifying
    @Query("delete from Scene where lower(id) = lower(:id) ")
    public void deleteScene(@Param("id") Integer id);
}
