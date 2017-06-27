package com.digitalcity.Model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by dushang on 17/6/26.
 */
@Entity
@Table(name = "dc_article")
public class Article {
    @Id
    @GeneratedValue
    private Integer id;

    private String name;    //文章名
    private String link;    //文章链接

    private Integer organizationId;       //所属单位id
    private Integer status;     //是否显示，0表示否，1表示是



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

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public Integer getOrganizationId() {
        return organizationId;
    }

    public void setOrganizationId(Integer organizationId) {
        this.organizationId = organizationId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
