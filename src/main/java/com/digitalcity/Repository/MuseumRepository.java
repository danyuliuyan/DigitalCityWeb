package com.digitalcity.Repository;

import com.digitalcity.Model.Museum;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * Created by dushang on 17/2/27.
 */
public interface MuseumRepository extends JpaRepository<Museum,String>,JpaSpecificationExecutor<Museum>{

    @Query("select o from Museum o where lower(o.id)=lower(:id) ")
    public Museum findMuseumById(@Param("id") Integer id);

    @Query("select o from Museum o where o.status=0 order by o.name asc ")
    public List<Museum> findAllMuseumSortedByName();

    @Modifying
    @Query("update Museum o set o.status=-1 where lower(o.id)=lower(:id) ")
    public void deleteMuseum(@Param("id") Integer id);
}
