package com.digitalcity.Repository;

import com.digitalcity.Model.Picture;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;


/**
 * Created by dushang on 17/2/22.
 */
public interface PictureRepository extends JpaRepository<Picture,String>,JpaSpecificationExecutor<Picture> {

    @Query("select o from Picture o where lower(o.id)=lower(:id) ")
    public Picture findPictureById(@Param("id") Integer id);

    @Query("select o from Picture  o where lower(o.type) =lower(:type) and lower(o.parentId) =lower(:parentId) ")
    public List<Picture> findOneTypePicture(@Param("type") Integer type,@Param("parentId") Integer parentId);

    @Modifying
    @Query("delete from Picture where lower(id) = lower(:id) ")
    public void deletePicture(@Param("id") Integer id);
}
