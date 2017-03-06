package com.digitalcity.Repository;

import com.digitalcity.Model.University;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * Created by dushang on 17/2/21.
 */
public interface UniversityRepository extends JpaRepository<University,String>,JpaSpecificationExecutor<University>{

    @Query("select o from University o where lower(o.id)=lower(:id) ")
    public University findUniversityById(@Param("id") Integer id);

    @Query("select o from University o where o.status=0 order by o.name asc ")
    public List<University> findAllUniversitySortedByName();

    @Modifying
    @Query("update University o set o.status=-1 where lower(o.id)=lower(:id) ")
    public void deleteUniversity(@Param("id") Integer id);
}
