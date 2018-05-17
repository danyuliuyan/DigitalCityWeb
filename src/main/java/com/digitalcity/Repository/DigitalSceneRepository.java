package com.digitalcity.Repository;

import com.digitalcity.Model.DigitalScene;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface DigitalSceneRepository extends JpaRepository<DigitalScene,String>,JpaSpecificationExecutor<DigitalScene> {
    @Query("select o from DigitalScene o where lower(o.id) = lower(:id) ")
     DigitalScene getDigitalSceneById(@Param("id") Integer id);
}
