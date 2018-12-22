package com.nnq.quanlydienthoai.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name="color")
public class Color

{

    @Id
    @Column(name = "Colorid")
    private String colorid;
    @Column(name = "Colorname")
    private String colorname;

    public String getColorid() {
        return colorid;
    }

    public void setColorid(String colorid) {
        this.colorid = colorid;
    }

    public String getColorname() {
        return colorname;
    }

    public void setColorname(String colorname) {
        this.colorname = colorname;
    }
}