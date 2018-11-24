package com.digitalcity.Repository;

/**
 * Created by dushang on 17/6/19.
 */

import com.digitalcity.Model.Music;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


import java.util.List;

public interface MusicRepository extends JpaRepository<Music,String>,JpaSpecificationExecutor<Music> {

    @Query("select o from Music o where lower(o.id)=lower(:id) ")
    public Music findMusicById(@Param("id") Integer id);

    @Query("select o from Music o where o.status=1 order by o.name asc")
    public List<Music> findAllShowMusic();

    @Modifying
    @Query("update Music o set o.status=:status where lower(o.id) =lower(:id) ")
    public Music setMusicStatus(@Param("status") Integer status, @Param("id") Integer id);

    @Modifying
    @Query("delete from Music where lower(id) = lower(:id) ")
    public void deleteMusic(@Param("id") Integer id);
    // 查询案例总数提供给分页函数
    @Query("select count(o) from Music o where o.status=1")
    public int getMusicNum();
}
