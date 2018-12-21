package com.nnq.quanlydienthoai.Model;
import javax.persistence.Entity;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.io.Serializable;

@Entity(name="generation")
public class Generation implements Serializable {
    @Id
    @Column(name = "Genid")
    private String genid;

    public String getGenid() {
        return genid;
    }

    public void setGenid(String genid) {
        this.genid = genid;
    }

    public String getGenname() {
        return genname;
    }

    public void setGenname(String genname) {
        this.genname = genname;
    }

    public String getDevid() {
        return devid;
    }

    public void setDevid(String devid) {
        this.devid = devid;
    }

    @Column(name = "Genname")
    private String genname;

    @Column(name="Devid")
    private  String devid;



}
