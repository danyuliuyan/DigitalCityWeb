package com.digitalcity.Repository;

import com.digitalcity.Model.Instrument;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * Created by dushang on 17/3/2.
 */
public interface InstrumentRepository extends JpaRepository<Instrument,String>,JpaSpecificationExecutor<Instrument> {

    @Query("select o from Instrument o where lower(o.id) =lower(:id) ")
    public Instrument findInstrumentById(@Param("id") Integer id);

    @Query("select o from Instrument o where o.status = 0")
    public List<Instrument> findAllInstrumentNormatl();

    @Modifying
    @Query("update Instrument o set o.status=-1 where lower(o.id)=lower(:id) ")
    public void deleteInstrument(@Param("id") Integer id);
}
