package com.nnq.quanlydienthoai.Services;
import java.util.ArrayList;
import  java.util.List;
import  java.util.Collection;
import com.nnq.quanlydienthoai.DAO.LoginRepository;

import com.nnq.quanlydienthoai.Model.LoginBean;
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
    public long isValidUser(String username,String password)
    {
        LoginBean a= loginRepository.findById(username).get();
        if(a!=null && a.getPassword().equals(password)&& a.getAccounttype().equals("Admin"))
            return 1;
        return 0;

    }


}
