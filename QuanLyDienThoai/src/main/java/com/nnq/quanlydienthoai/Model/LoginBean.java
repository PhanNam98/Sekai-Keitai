package com.nnq.quanlydienthoai.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name="account")
public class LoginBean

{
    @Id
    @Column(name = "Username")
private String username;
    @Column(name = "Password")
    private String password;
    @Column(name = "Accounttype")
    private String accounttype;
    public String getPassword()
    {
        return this.password;
    }
    public String getAccounttype() {
        return accounttype;
    }

    public void setAccounttype(String accounttype) {
        this.accounttype = accounttype;
    }

    public String getUsername()
    {
        return this.username;
    }

    public void setUsername(String username)
    {
        this.username = username;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }


}