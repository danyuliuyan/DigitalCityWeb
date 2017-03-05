package com.digitalcity.Model;

import javax.persistence.*;

/**
 * Created by dushang on 17/2/20.
 */

@Entity
@Table(name = "dc_museum")
public class Museum {

    @Id
    @GeneratedValue
    private Integer id;

    private String name;        //名称
    private String longitude;    //坐标经度
    private String latitude ;    //坐标纬度

    @Column(columnDefinition = "longtext")
    private String introduction;    //基本介绍

    private Integer status;         //状态  0：正常，-1：删除



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

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
