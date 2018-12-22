package com.nnq.quanlydienthoai.Model;
import javax.persistence.Entity;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.io.Serializable;
@Entity(name="accounttype")
public class AccountType implements Serializable{
    @Id
    @Column(name = "Accounttype")
    private String accType;

    @Column(name = "Accountname")
    private String accTypeName;

    public String getAccType() {
        return accType;
    }

    public void setAccType(String accType) {
        this.accType = accType;
    }

    public String getAccTypeName() {
        return accTypeName;
    }

    public void setAccTypeName(String accTypeName) {
        this.accTypeName = accTypeName;
    }
}

