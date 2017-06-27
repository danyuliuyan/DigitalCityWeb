package com.digitalcity.Repository;

/**
 * Created by dushang on 17/6/19.
 */

import com.digitalcity.Model.Organization;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


import java.util.List;

public interface OrganizationRepository extends JpaRepository<Organization,String>,JpaSpecificationExecutor<Organization> {

    @Query("select o from Organization o where lower(o.id)=lower(:id) ")
    public Organization findOrganizationById(@Param("id") Integer id);

    @Query("select o from Organization o order by o.name asc")
    public List<Organization> findAllOrganization();

    @Modifying
    @Query("delete from Organization where lower(id) = lower(:id) ")
    public void deleteOrganization(@Param("id") Integer id);
}
