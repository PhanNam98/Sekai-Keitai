package com.nnq.quanlydienthoai.Services;
import java.util.ArrayList;
import  java.util.List;
import  java.util.Collection;
import com.nnq.quanlydienthoai.DAO.LoginRepository;
import com.nnq.quanlydienthoai.DAO.AccountTypeRepository;

import com.nnq.quanlydienthoai.Model.LoginBean;
import com.nnq.quanlydienthoai.Model.AccountType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.swing.*;
import java.awt.*;
import javax.servlet.http.HttpServletRequest;
import java.util.Collection;

@Service
public class LoginService {
    @Autowired
    private LoginRepository loginRepository;
    @Autowired
    private  AccountTypeRepository accountTypeRepository;

    public Collection<AccountType> GetAllAccountType()
    {
        List<AccountType> at= new ArrayList<AccountType>();
        for(AccountType e: accountTypeRepository.findAll())
        {
            if (e.getAccType().equals("Admin"))
            {}
            else
            at.add(e);
        }
        return at;
    }
    public void SaveAccount(LoginBean c)
    {
        loginRepository.save(c);

    }
    public long isValidUser(String username,String password)
    {
//        LoginBean a= loginRepository.findById(username).get();
//        if(a!=null && a.getPassword().equals(password)&& a.getAccounttype().equals("Admin"))
//            return 1;
//        return 0;
        return loginRepository.findAll().stream().filter(p->p.getUsername().equals(username) && p.getPassword().equals(password)).count();

    }


}
