package com.digitalcity.Model;

import javax.persistence.*;

/**
 * Created by dushang on 17/6/26.
 */
@Entity
@Table(name = "dc_organization")
public class Organization {
    @Id
    @GeneratedValue
    private Integer id;

    private String name;            //组织名称
    private String website;         //官网地址

    @Column(columnDefinition = "text")
    private String description;     //描述信息

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

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
