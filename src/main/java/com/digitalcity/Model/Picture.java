package com.digitalcity.Model;

import javax.persistence.*;

/**
 * Created by dushang on 17/2/20.
 */
@Entity
@Table(name = "dc_picture")
public class Picture {

    @Id
    @GeneratedValue
    private Integer id;

    private Integer type;           //图片类型      1:大学，2：博物馆
    private String name;            //图片名称

    @Column(columnDefinition = "text")
    private String description;     //图片描述

    private String source;          //图片地址
    private String parentId;        //父亲id

    public int getPictureType() {
        return pictureType;
    }

    public void setPictureType(int pictureType) {
        this.pictureType = pictureType;
    }

    private int pictureType;          //场景类别    1.数字校史馆  2.数字图书馆  3.数字实验室  4. 数字校园

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }
}
