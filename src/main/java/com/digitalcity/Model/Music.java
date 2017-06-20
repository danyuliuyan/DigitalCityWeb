package com.digitalcity.Model;

import javax.persistence.*;
/**
 * Created by dushang on 17/6/19.
 */
@Entity
@Table(name = "dc_music")
public class Music {

    @Id
    @GeneratedValue
    private Integer id;

    private String name;            //歌曲名称
    private String singer;            //歌手名

    private String source;          //歌曲地址
    private Integer status;        //是否显示，0表示否，1表示是

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSinger() {
        return singer;
    }

    public void setSinger(String singer) {
        this.singer = singer;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
