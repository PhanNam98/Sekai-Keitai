package com.nnq.quanlydienthoai.Controller;

import com.nnq.quanlydienthoai.Model.Employee;
import com.nnq.quanlydienthoai.Model.LoginBean;
import com.nnq.quanlydienthoai.Model.Developer;
import com.nnq.quanlydienthoai.Services.EmpService;
import com.nnq.quanlydienthoai.Services.LoginService;
import com.nnq.quanlydienthoai.Services.DeveloperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Collection;
import org.springframework.web.servlet.ModelAndView;
@Controller

public class MainController {
    @Autowired
    private EmpService empService;
    @Autowired
    private LoginService loginService;
    @Autowired
    private DeveloperService developerService;


    @RequestMapping(value="/Login",method=RequestMethod.POST)
    public ModelAndView executeLogin(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("loginBean")LoginBean loginBean) throws IOException
    {
        ModelAndView model= null;
        try
        {
//            long isValidUser = loginService.isValidUser(loginBean.getUsername(), loginBean.getPassword());
            long isValidUser = loginService.isValidUser(request.getParameter("UserName"), request.getParameter("Password"));
            if(isValidUser>0)
            {
                System.out.println("User Login Successful");
                request.setAttribute("loggedInUser", request.getParameter("UserName"));

                model = new ModelAndView("index");
                response.sendRedirect("/ListEmployee");
            }
            else
            {


                model = new ModelAndView("Login");
                model.addObject("loginBean", loginBean);
                request.setAttribute("message", "Invalid credentials!!");
            }

        }
        catch(Exception e)
        {
            System.out.println("SQLException occured: " + e.getMessage());
            e.printStackTrace();
            model = new ModelAndView("Login");
            model.addObject("loginBean", loginBean);
            request.setAttribute("message", "Invalid credentials!!");

        }

        return model;
    }

    @GetMapping("/Login")
    public ModelAndView login(HttpServletRequest req)
    {
        ModelAndView model = new ModelAndView("Login");

        LoginBean loginBean = new LoginBean();

        model.addObject("loginBean", loginBean);

        return model;

    }
    @GetMapping("/")
    public ModelAndView welcome(HttpServletRequest req,HttpServletResponse response) throws IOException
    {
//        ModelAndView model = new ModelAndView("Login");
//
//        LoginBean loginBean = new LoginBean();
//
//        model.addObject("loginBean", loginBean);
//
//        return model;
        ModelAndView model = new ModelAndView("Welcome");
        return model;
    }
    @GetMapping("/Dashboard")
    public ModelAndView Dashboard(HttpServletRequest req,HttpServletResponse response) throws IOException
    {
        ModelAndView model = new ModelAndView("Dashboard");
        return model;
    }
    @GetMapping("/ListEmployee")
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
        req.setAttribute("employeeType",empService.GetAllEmpType());
        return "index";
    }
    @GetMapping("/DeleteEmployee")
    public String DeleteEmp(HttpServletRequest req,@RequestParam long id, HttpServletResponse resp) throws IOException
    {
        empService.DeleteEmp(id);
        req.setAttribute("employeelist", empService.GetAllEmp());
        req.setAttribute("mode", "Employee_view");
        resp.sendRedirect("/ListEmployee");
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
        resp.sendRedirect("/ListEmployee");
        return "index";
    }
    @RequestMapping(value = "/SaveNewEmp", method = RequestMethod.POST)

    public String SaveNewEmp( HttpServletRequest req, HttpServletResponse resp) throws IOException
    {
        Employee e = new Employee();
        e.setEmpName(req.getParameter("EmployeeName"));
        //e.setEmpID( Integer.parseInt(req.getParameter("EmployeeID")));
        e.setAddress(req.getParameter("EmployeeAddress"));
//        e.setEmpType(req.getParameter("EmployeeEmpType"));
        e.setSocIdentity(req.getParameter("EmployeeSocIdentity"));
        e.setPhoneNum(req.getParameter("EmployeeNumber"));
        e.setSalary(Float.parseFloat(req.getParameter("EmployeeSalary")));
        e.setSex(req.getParameter("EmployeeSex"));
        e.setEmpType(req.getParameter("SelectEmpType"));
        empService.SaveEditEmp(e);
        if(req.getParameter("Username")!=null &&req.getParameter("Username")!="" ) {
            LoginBean a = new LoginBean();
            a.setUsername(req.getParameter("Username"));
            a.setPassword(req.getParameter("password1"));
            a.setAccounttype(req.getParameter("SelectAccType"));

            loginService.SaveAccount(a);
        }


        req.setAttribute("employeelist", empService.GetAllEmp());
        req.setAttribute("mode", "Employee_view");
        resp.sendRedirect("/ListEmployee");
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
        req.setAttribute("employeeType",empService.GetAllEmpType());
        req.setAttribute("accountType",loginService.GetAllAccountType());
        return "index";

    }
//Developer
    @GetMapping("/ListDeveloper")
    public String listDev(HttpServletRequest req)
    {
        req.setAttribute("devlist",developerService.GetAllDevloper());
        req.setAttribute("mode","Dev_view");
        return "Dev";
    }
    @GetMapping("/EditDeveloper")
    public String EditDev(HttpServletRequest req,@RequestParam String id)
    {
        req.setAttribute("dev",developerService.GetOneDev(id));
        req.setAttribute("mode","Dev_Edit");
        return "Dev";
    }
    @GetMapping("/DeleteDeveloper")
    public String DeleteDev(HttpServletRequest req,@RequestParam String id, HttpServletResponse resp) throws IOException
    {
        developerService.DeleteDev(id);
        req.setAttribute("devlist", developerService.GetAllDevloper());
        req.setAttribute("mode", "Dev_view");
        resp.sendRedirect("/ListDeveloper");
        return "Dev";
    }
    @RequestMapping(value = "/SaveEditDev", method = RequestMethod.POST)

    public String SaveEditDev(@ModelAttribute(value = "dev") Developer dev, HttpServletRequest req, HttpServletResponse resp) throws IOException
    {
        dev.setDevid(req.getParameter("DevID"));
        dev.setDevname( req.getParameter("DevName"));

        developerService.SaveEditDev(dev);

        req.setAttribute("devlist", developerService.GetAllDevloper());
        req.setAttribute("mode", "Dev_view");
        resp.sendRedirect("/ListDeveloper");
        return "Dev";
    }
    @RequestMapping(value = "/SaveNewDev", method = RequestMethod.POST)

    public String SaveNewDev( HttpServletRequest req, HttpServletResponse resp) throws IOException
    {
        Developer d = new Developer();
        d.setDevid(req.getParameter("DevID"));
        d.setDevname(req.getParameter("DevName"));

        developerService.SaveEditDev(d);

        req.setAttribute("devlist", developerService.GetAllDevloper());
        req.setAttribute("mode", "Dev_view");
        resp.sendRedirect("/ListDeveloper");
        return "Dev";
    }
    @GetMapping("/CreateDeveloper")
    public String CreateDeveloper(HttpServletRequest req)
    {
        req.setAttribute("mode","Dev_Create");
        return "Dev";

    }

}
