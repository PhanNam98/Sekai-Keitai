package com.nnq.quanlydienthoai.Controller;

import com.nnq.quanlydienthoai.Model.Employee;
import com.nnq.quanlydienthoai.Services.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Collection;

@Controller

public class MainController {
    @Autowired
    private EmpService empService;

    Employee emp;
    @GetMapping("/")
    public String init(HttpServletRequest req)
    {
        req.setAttribute("employeelist",empService.GetAllEmp());
        req.setAttribute("mode","Employee_view");
       return "index";
    }
    @GetMapping("/EditEmployee")
    public String EditEmp(HttpServletRequest req,@RequestParam long id)
    {
        req.setAttribute("employe",empService.GetOneEmp(id));
        req.setAttribute("mode","Employee_Edit");
        return "index";
    }
    @GetMapping("/DeleteEmployee")
    public String DeleteEmp(HttpServletRequest req,@RequestParam long id, HttpServletResponse resp) throws IOException
    {
        empService.DeleteEmp(id);
        req.setAttribute("employeelist", empService.GetAllEmp());
        req.setAttribute("mode", "Employee_view");
        resp.sendRedirect("/");
        return "index";
    }


    @RequestMapping(value = "/SaveEditEmp", method = RequestMethod.POST)

    public String SaveEditEmp(@ModelAttribute(value = "employe") Employee emp, HttpServletRequest req, HttpServletResponse resp) throws IOException
    {
        emp.setEmpName(req.getParameter("EmployeeName"));
        emp.setEmpID( Integer.parseInt(req.getParameter("EmployeeID")));
        emp.setAddress(req.getParameter("EmployeeAddress"));
        emp.setEmpType(req.getParameter("EmployeeEmpType"));
        emp.setSocIdentity(req.getParameter("EmployeeSocIdentity"));
        emp.setPhoneNum(req.getParameter("EmployeeNumber"));
        emp.setSalary(Float.parseFloat(req.getParameter("EmployeeSalary")));
        emp.setSex(req.getParameter("EmployeeSex"));
        empService.SaveEditEmp(emp);

        req.setAttribute("employeelist", empService.GetAllEmp());
        req.setAttribute("mode", "Employee_view");
        resp.sendRedirect("/");
        return "index";
    }
    @RequestMapping(value = "/SaveNewEmp", method = RequestMethod.POST)

    public String SaveNewEmp( HttpServletRequest req, HttpServletResponse resp) throws IOException
    {
        Employee e = new Employee();
        e.setEmpName(req.getParameter("EmployeeName"));
        //e.setEmpID( Integer.parseInt(req.getParameter("EmployeeID")));
        e.setAddress(req.getParameter("EmployeeAddress"));
        e.setEmpType(req.getParameter("EmployeeEmpType"));
        e.setSocIdentity(req.getParameter("EmployeeSocIdentity"));
        e.setPhoneNum(req.getParameter("EmployeeNumber"));
        e.setSalary(Float.parseFloat(req.getParameter("EmployeeSalary")));
        e.setSex(req.getParameter("EmployeeSex"));
        empService.SaveEditEmp(e);

        req.setAttribute("employeelist", empService.GetAllEmp());
        req.setAttribute("mode", "Employee_view");
        resp.sendRedirect("/");
        return "index";
    }

    @GetMapping("/GetAllEmps")
    public Collection<Employee> getAllEmployees()
    {
       return empService.GetAllEmp();
    }
    @GetMapping("/DeleteEmp")
    public void DeleteEmp(@RequestParam long id)
    {
        empService.DeleteEmp(id);
    }
    @GetMapping("/CreateEmployee")
    public String CrateEmployee(HttpServletRequest req)
    {
        req.setAttribute("mode","Employee_Create");
        return "index";

    }
}
