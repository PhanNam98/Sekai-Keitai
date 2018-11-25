package com.nnq.quanlydienthoai.Model;
import javax.persistence.Entity;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.io.Serializable;

@Entity(name="employee")
public class Employee implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long empID;

    @Column(name = "Empname")
    private String empName;

    @Column(name="sex")
    private  String sex;
    @Column(name="address")
    private  String address;
    @Column (name="socidentity")
    private String socIdentity;
    @Column(name = "phonenum")
    private String phoneNum;
    @Column (name="Salary")
    private float salary;
    @Column (name = "Emptype")
    private String empType;

    public long getEmpID() {
        return empID;
    }

    public void setEmpID(long empID) {
        this.empID = empID;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getSocIdentity() {
        return socIdentity;
    }

    public void setSocIdentity(String socIdentity) {
        this.socIdentity = socIdentity;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public float getSalary() {
        return salary;
    }

    public void setSalary(float salary) {
        this.salary = salary;
    }

    public String getEmpType() {
        return empType;
    }

    public void setEmpType(String empType) {
        this.empType = empType;
    }
}
