package com.digitalcity.Model;

import javax.persistence.*;

/**
 * Created by dushang on 17/3/2.
 */

@Entity
@Table(name = "dc_instrument")
public class Instrument {

    @Id
    @GeneratedValue
    private Integer id;
    private String name;            //乐器名
    private String thumb;           //乐器缩略图地址
    private String detailPicture;   //详情图片

    @Column(columnDefinition = "text")
    private String description;     //乐器描述
    private String directoryName;    //目录名
    private String pageSource;      //inframe主页面地址

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

    public String getThumb() {
        return thumb;
    }

    public void setThumb(String thumb) {
        this.thumb = thumb;
    }

    public String getDetailPicture() {
        return detailPicture;
    }

    public void setDetailPicture(String detailPicture) {
        this.detailPicture = detailPicture;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDirectoryName() {
        return directoryName;
    }

    public void setDirectoryName(String dirctoryName) {
        this.directoryName = dirctoryName;
    }

    public String getPageSource() {
        return pageSource;
    }

    public void setPageSource(String pageSource) {
        this.pageSource = pageSource;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
