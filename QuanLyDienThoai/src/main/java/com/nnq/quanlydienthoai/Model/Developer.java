package com.nnq.quanlydienthoai.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name="developer")
public class Developer

{
    public String getDevid() {
        return devid;
    }

    public void setDevid(String devid) {
        this.devid = devid;
    }

    public String getDevname() {
        return devname;
    }

    public void setDevname(String devname) {
        this.devname = devname;
    }

    @Id
    @Column(name = "Devid")
    private String devid;
    @Column(name = "Devname")
    private String devname;



}