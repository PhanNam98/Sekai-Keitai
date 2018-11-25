<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <title>Sekai Keitai</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/">Sekai Keitai Shop</a>
        </div>
        <ul class="nav navbar-nav">
            <li class="active"><a href="/">Employee</a></li>
            <li><a href="/CreateEmployee">New Employee</a></li>

        </ul>
    </div>
</nav>

<div class="container">
    <c:choose>
        <c:when test="${mode == 'Employee_view'}">
            <h2>All Employees</h2>

            <table class="table table-hover">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Full Name</th>
                    <th>SocIdentity</th>
                    <th>Address</th>
                    <th>Sex</th>
                    <th>Phone Number</th>
                    <th>Salary</th>
                    <th>Employee Type</th>
                    <th> <a><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>EditEdit</th>
                    <th> <a><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>Delete</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="emp" items="${employeelist}">
                    <tr>
                        <td>${emp.empID}</td>
                        <td>${emp.empName}</td>
                        <td>${emp.socIdentity}</td>
                        <td>${emp.address}</td>
                        <td>${emp.sex}</td>
                        <td>${emp.phoneNum}</td>
                        <td>${emp.salary}</td>
                        <td>${emp.empType}</td>
                        <td>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#${emp.empID}" data-whatever="${emp.empID}">
                            <a href="/EditEmployee?id=${emp.empID}"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>Edit
                        </button>
                        </td>
                        <%--<td><a href="/DeleteEmployee?id=${emp.empID}"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a></td>--%>
                        <td>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#${emp.empID}" data-whatever="${emp.empID}">
                                <a href="/DeleteEmployee?id=${emp.empID}"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>Delete
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="${emp.empID}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Delete Employee</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        Are you sure?
                                    </div>
                                    <div class="modal-footer">
                                        <%--<a type="button" class="btn btn-primary" href="/DeleteEmployee?id=${emp.empID}" target="_blank">Agree</a>--%>
                                            <a type="button" class="btn btn-primary" href="/DeleteEmployee?id=${emp.empID}" >Agree</a>
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>

                                    </div>
                                </div>
                            </div>
                        </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:when test="${mode == 'Employee_Edit'}">
            <h2>Edit Employees</h2>
            <form action="/SaveEditEmp" method="post">
                <div class="form-group">
                    <input type="hidden" class="form-control" value="${employe.empID}" id="EmployeeID"  name ="EmployeeID" >
                </div>
                <div class="form-group">
                    <label>Name</label>
                    <input type="text" class="form-control" value="${employe.empName}" id="EmployeeName" name ="EmployeeName" >
                </div>
                <div class="form-group">
                    <label>SocIdentity</label>
                    <input type="text" class="form-control" value="${employe.socIdentity}" id="EmployeeSocIdentity" name ="EmployeeSocIdentity" >
                </div>
                <div class="form-group">
                    <label>Address</label>
                    <input type="text" class="form-control" value="${employe.address}" id="EmployeeAddress" name ="EmployeeAddress" >
                </div>
                <div class="form-group">
                    <label>Sex</label>
                    <input type="text" class="form-control" value="${employe.sex}" id="EmployeeSex" name ="EmployeeSex" >
                </div>
                <div class="form-group">
                    <label>Phone Number</label>
                    <input type="text" class="form-control" value="${employe.phoneNum}" id="EmployeeNumber" name ="EmployeeNumber" >
                </div>
                <div class="form-group">
                    <label>Salary</label>
                    <input type="text" class="form-control" value="${employe.salary}" id="EmployeeSalary" name ="EmployeeSalary" >
                </div>
                <div class="form-group">
                    <label>EmployeeType</label>
                    <input type="text" class="form-control" value="${employe.empType}" id="EmployeeEmpType" name ="EmployeeEmpType" >
                </div>

                <button type="submit" class="btn btn-primary">Save</button>
            </form>
        </c:when>
        <c:when test="${mode == 'Employee_Create'}">
            <h2>Create Employees</h2>
            <form action="/SaveNewEmp" method="post">
                <div class="form-group">
                    <input type="hidden" class="form-control"  id="EmployeeID1"  name ="EmployeeID" >
                </div>
                <div class="form-group">
                    <label>Name</label>
                    <input type="text" class="form-control" id="EmployeeName1" name ="EmployeeName" >
                </div>
                <div class="form-group">
                    <label>SocIdentity</label>
                    <input type="text" class="form-control" id="EmployeeSocIdentity1" name ="EmployeeSocIdentity" >
                </div>
                <div class="form-group">
                    <label>Address</label>
                    <input type="text" class="form-control"  id="EmployeeAddress1" name ="EmployeeAddress" >
                </div>
                <div class="form-group">
                    <label>Sex</label>
                    <input type="text" class="form-control" id="EmployeeSex1" name ="EmployeeSex" >
                </div>
                <div class="form-group">
                    <label>Phone Number</label>
                    <input type="text" class="form-control"  id="EmployeeNumber1" name ="EmployeeNumber" >
                </div>
                <div class="form-group">
                    <label>Salary</label>
                    <input type="text" class="form-control"  id="EmployeeSalary1" name ="EmployeeSalary" >
                </div>
                <div class="form-group">
                    <label>EmployeeType</label>
                    <input type="text" class="form-control"  id="EmployeeEmpType1" name ="EmployeeEmpType" >
                </div>

                <button type="submit" class="btn btn-primary">Save</button>
            </form>
        </c:when>
    </c:choose>

</div>

</body>
</html>