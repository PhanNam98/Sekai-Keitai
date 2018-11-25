package com.nnq.quanlydienthoai.Services;
import java.util.ArrayList;
import  java.util.List;
import  java.util.Collection;
import com.nnq.quanlydienthoai.DAO.EmpRepository;
import com.nnq.quanlydienthoai.Model.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.swing.*;
import java.awt.*;
import javax.servlet.http.HttpServletRequest;
import java.util.Collection;


@Service
public class EmpService {
    @Autowired
    private EmpRepository empRepository;
    public Collection<Employee> GetAllEmp()
    {
        List<Employee> emps= new ArrayList<Employee>();
        for(Employee e: empRepository.findAll())
        {
            emps.add(e);
        }
        return emps;
    }
    public Employee GetOneEmp(long id)
    {
        return empRepository.findById(id).get();
    }
    public void SaveEditEmp(Employee emp)
    {
            empRepository.save(emp);

    }
    public void DeleteEmp(long id)
    {
        empRepository.deleteById(id);
    }

}
