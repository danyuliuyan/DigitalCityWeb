package com.digitalcity.Model;

import javax.persistence.*;

/**
 * Created by dushang on 17/2/20.
 */
@Entity
@Table(name = "dc_scene")
public class Scene {

    @Id
    @GeneratedValue
    private Integer id;

    private Integer type;           //场景类型      1:大学，2：博物馆
    private String name;            //场景名称

    @Column(columnDefinition = "text")
    private String description;     //场景描述
    private String source;          //场景地址
    private String parentId;        //父亲id
    private int sceneType;          //场景类别    1.数字校史馆  2.数字图书馆  3.数字实验室  4. 数字校园

    public int getSceneType() {
        return sceneType;
    }

    public void setSceneType(int sceneType) {
        this.sceneType = sceneType;
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
}
