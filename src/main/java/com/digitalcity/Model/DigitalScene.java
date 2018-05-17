package com.digitalcity.Model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "dc_digitalScene")
public class DigitalScene {
    @Id
    @GeneratedValue
    private Integer id;
    private String name;
    private String play2vr;
    private String url;

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

    public String getPlay2vr() {
        return play2vr;
    }

    public void setPlay2vr(String play2vr) {
        this.play2vr = play2vr;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
