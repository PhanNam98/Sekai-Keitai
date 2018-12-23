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



    <script type="text/javascript">
        function showacc(s1) {
            var select=document.getElementById("SelectEmpType");
            if(select.value=="Emp")
            {
                document.getElementById("User1").disabled=true;
                document.getElementById("password1").disabled=true;
                document.getElementById("password2").disabled=true;
                document.getElementById("SelectAccType").disabled=true;

            }
            else
            {
                document.getElementById("User1").disabled=false;
                document.getElementById("password1").disabled=false;
                document.getElementById("password2").disabled=false;
                document.getElementById("SelectAccType").disabled=false;
                // document.getElementById("usernameacc").style.visibility='visible';
            }


        };
    </script>
</head>
<body  onload="check(),a(),s(),soc(),n()" >

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/Dashboard">Sekai Keitai Shop</a>
        </div>
        <ul class="nav navbar-nav">
            <li class="active"><a href="/ListEmployee">Employee</a></li>
            <%--<li><a href="/CreateEmployee">New Employee</a></li>--%>
            <li ><a href="/ListDeveloper">Developer</a></li>
            <li><a href="/ListGeneration">Generation</a></li>
            <li><a href="/ListProduct">Product</a></li>
            <li><a href="/ListColor">Color</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="/Login"><span class="glyphicon glyphicon-user"></span> Logout</a></li>
            <%--<li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>--%>
        </ul>
    </div>
</nav>

<div class="container" >
    <c:choose>
        <c:when test="${mode == 'Employee_view'}">
            <h2>All Employees</h2>
            <button type="button" onclick="location.href='/CreateEmployee'" class="btn btn-primary" >
                <a href="/CreateEmployee"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>Create Employee
            </button>
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
                    <th> <a><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>EditEdit</th>
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
                        <button type="button" onclick="location.href='/EditEmployee?id=${emp.empID}'" class="btn btn-primary" >
                            <a href="/EditEmployee?id=${emp.empID}"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>Edit
                        </button>
                        </td>
                        <%--<td><a href="/DeleteEmployee?id=${emp.empID}"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a></td>--%>
                        <td>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#${emp.empID}" data-whatever="${emp.empID}">
                                <a href="#"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>Delete
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

            <center>
                <h2>Edit Employees</h2>
            </center>
        <div class="row">
            <div class="center-block col-md-6" style="float: none; background-color: cornsilk">
            <form action="/SaveEditEmp" method="post">
                <div class="form-group">
                    <input type="hidden" class="form-control" value="${employe.empID}" id="EmployeeID"  name ="EmployeeID" >
                </div>
                <div class="form-group">
                    <label>Name</label>
                    <input type="text" class="form-control" value="${employe.empName}" id="EmployeeName" name ="EmployeeName" >
                    <div class="row">
                        <div class="col-sm-6">
                            <span id="name1" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span> Not Empty<br>

                        </div>

                    </div>
                </div>
                <div class="form-group">
                    <label>SocIdentity</label>
                    <input type="text" class="form-control" value="${employe.socIdentity}" id="EmployeeSocIdentity" name ="EmployeeSocIdentity" >
                    <div class="row">
                        <div class="col-sm-6">
                            <span id="soc1" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span> 9 Characters Long<br>

                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Address</label>
                    <input type="text" class="form-control" value="${employe.address}" id="EmployeeAddress" name ="EmployeeAddress" >
                </div>


                <div class="form-group">
                    <label>Sex</label>
                <div>

                    <input type="radio" id="EmployeeSexMale"  value="Male"  name="EmployeeSex" onclick="if(this.checked){getvalueSex1()}">Male
                    <input type="radio" id="EmployeeSexFemale"  value="Female" name="EmployeeSex" onclick="if(this.checked){getvalueSex()}">Female
                </div>



                <script>
                    function check() {
                            if(document.getElementById("EmployeeSex").value.toLowerCase()==="male")
                            {
                                document.getElementById("EmployeeSexMale").checked = true;
                            }
                            else
                                document.getElementById("EmployeeSexFemale").checked = true;
                            document.readyState

                    }

                </script>
                <script>
                    function getvalueSex() {

                        document.getElementById("EmployeeSex").value = "Female";

                    }
                    function getvalueSex1() {

                        document.getElementById("EmployeeSex").value = "Male";

                    }
                </script>
                </div>

                <div class="form-group">

                    <input type="hidden" class="form-control" value="${employe.sex}" id="EmployeeSex" name ="EmployeeSex" >
                </div>
                <div class="form-group">
                    <label>Phone Number</label>
                    <input type="text" class="form-control" value="${employe.phoneNum}" id="EmployeeNumber" name ="EmployeeNumber" >
                    <div class="row">
                        <div class="col-sm-6">
                            <span id="num1" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span> 10 Characters Long<br>

                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Salary</label>
                    <input type="text" class="form-control" value="${employe.salary}" id="EmployeeSalary" name ="EmployeeSalary" >
                    <div class="row">
                        <div class="col-sm-6">
                            <span id="sa1" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span> 2 Characters Long<br>

                        </div>

                    </div>
                </div>


                <script>
                    function SelEmpType() {
                        var x = document.getElementById("SelectEmpType").value;

                    }
                    function GetEmpType() {
                        var x=document.getElementById("EmployeeEmpType").value;

                        document.getElementById("SelectEmpType").value = x;
                        document.getElementById("demo").innerHTML = x;
                        // document.getElementById("SelectEmpType").value = "banana";
                    }
                </script>


                <div class="form-group">
                    <label>EmployeeType</label>
                    <input type="text" class="form-control" value="${employe.empType}" id="EmployeeEmpType" name ="EmployeeEmpType" readonly="readonly" >
                </div>

                <button type="submit" class="btn btn-primary" id="btnSubmitEdit">Save</button>
                <a type="button" class="btn btn-default" href="/ListEmployee" >Cancel</a>
            </form>
            </div>
        </div>
        </c:when>
        <c:when test="${mode == 'Employee_Create'}">
        <center>
            <h2>Create Employees</h2>
        </center>
        <div class="row">
            <div class="center-block col-md-6" style="float: none; background-color: cornsilk">
            <form action="/SaveNewEmp" method="post">
                <div class="form-group">
                    <input type="hidden" class="form-control"  id="EmployeeID1"  name ="EmployeeID" >
                </div>
                <div class="form-group">
                    <label>Name</label>
                    <input type="text" class="form-control" id="EmployeeName1" name ="EmployeeName" placeholder="Name">
                    <div class="row">
                        <div class="col-sm-6">
                            <span id="name" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span> Not Empty<br>

                        </div>

                    </div>
                </div>
                <div class="form-group">
                    <label>SocIdentity</label>
                    <input type="text" class="form-control" id="EmployeeSocIdentity1" name ="EmployeeSocIdentity"  placeholder="SocIdentity">
                    <div class="row">
                        <div class="col-sm-6">
                            <span id="soc" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span> 9 Characters Long<br>

                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Address</label>
                    <input type="text" class="form-control"  id="EmployeeAddress1" name ="EmployeeAddress" placeholder="Address">
                </div>
                <div class="form-group">
                    <label>Sex</label><br>
                    <label class="radio-inline">
                        <input type="radio" value="Male" name="EmployeeSex" checked>Male
                    </label>
                    <label class="radio-inline">
                        <input type="radio" value="FeMale" name="EmployeeSex">Female
                    </label>
                </div>
                <%--<div class="form-group">--%>
                    <%--<label>Sex</label>--%>
                    <%--<input type="text" class="form-control" id="EmployeeSex1" name ="EmployeeSex" >--%>
                <%--</div>--%>
                <div class="form-group">
                    <label>Phone Number</label>
                    <input type="text" class="form-control"  id="EmployeeNumber1" name ="EmployeeNumber" placeholder="Phone Number">
                    <div class="row">
                        <div class="col-sm-6">
                            <span id="num" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span> 10 Characters Long<br>

                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Salary</label>
                    <input type="text" class="form-control"  id="EmployeeSalary1" name ="EmployeeSalary" placeholder="Salary">
                    <div class="row">
                        <div class="col-sm-6">
                            <span id="sa" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span> 2 Characters Long<br>

                        </div>

                    </div>
                </div>
                <div class="form-group">
                    <label>EmployeeType</label>
                    <%--<input type="text" class="form-control"  id="EmployeeEmpType1" name ="EmployeeEmpType" >--%>
                    <select id="SelectEmpType" name="SelectEmpType" onchange="showacc('SelectEmpType')">
                        <c:forEach var="emptype" items="${employeeType}">
                            <option value="${emptype.empType}">${emptype.empTypeName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group"  >
                    <label>Username</label>
                    <input type="text" class="form-control"  id="User1" name ="Username" placeholder="User Name" disabled>
                </div>
                <div class="form-group">
                    <label>Password</label>
                        <input type="password" class="input-md form-control" name="password1" id="password1" placeholder="New Password" autocomplete="off" disabled>
                        <div class="row">
                            <div class="col-sm-6">
                                <span id="8char" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span> 4 Characters Long<br>
                            </div>
                        </div>

                    </div><!--/row-->

                    <div class="form-group">
                        <label>RePassword</label>

                            <input type="password" class="input-md form-control" name="password2" id="password2" placeholder="Confirm Password" autocomplete="off" disabled>
                            <div class="row">
                                <div class="col-md-10">
                                    <span id="pwmatch" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span> Passwords Match
                                </div>
                            </div>



                        </div><!--/row-->


                        <div class="form-group">
                    <label>Account Type</label>
                        <%--<input type="text" class="form-control"  id="EmployeeEmpType1" name ="EmployeeEmpType" >--%>
                    <select id="SelectAccType" name="SelectAccType" disabled="disabled">
                        <c:forEach var="acctype" items="${accountType}">
                            <option value="${acctype.accType}">${acctype.accTypeName}</option>
                        </c:forEach>
                    </select>
                </div>


                <button type="submit" class="btn btn-primary" id="btnSubmit">Save</button>
                <a type="button" class="btn btn-default" href="/ListEmployee" >Cancel</a>
            </form>
            </div>
        </div>
        </c:when>
    </c:choose>

</div>


<%--<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>--%>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>


<script>
    $("input[type=password]").keyup(function () {
        var ucase = new RegExp("[A-Z]+");
        var lcase = new RegExp("[a-z]+");
        var num = new RegExp("[0-9]+");

        if($("#password1").val().length >= 4){
            $("#8char").removeClass("glyphicon-remove");
            $("#8char").addClass("glyphicon-ok");
            $("#8char").css("color","#00A41E");
        }else{
            $("#8char").removeClass("glyphicon-ok");
            $("#8char").addClass("glyphicon-remove");
            $("#8char").css("color","#FF0004");
        }



        if ($("#password1").val() == $("#password2").val()) {
            $("#pwmatch").removeClass("glyphicon-remove");
            $("#pwmatch").addClass("glyphicon-ok");
            $("#pwmatch").css("color", "#00A41E");
        } else {
            $("#pwmatch").removeClass("glyphicon-ok");
            $("#pwmatch").addClass("glyphicon-remove");
            $("#pwmatch").css("color", "#FF0004");
        }

    });</script>
<script>
    $("#EmployeeNumber1").keyup(function () {
        var ucase = new RegExp("[A-Z]+");
        var lcase = new RegExp("[a-z]+");
        var num = new RegExp("[0-9]+");

        if($("#EmployeeNumber1").val().length >= 10){
            $("#num").removeClass("glyphicon-remove");
            $("#num").addClass("glyphicon-ok");
            $("#num").css("color","#00A41E");
        }else{
            $("#num").removeClass("glyphicon-ok");
            $("#num").addClass("glyphicon-remove");
            $("#num").css("color","#FF0004");
        }

        if(!/^[0-9]+$/.test($("#EmployeeNumber1").val())){
            alert("Please only enter numeric characters only for your Phone Number! (Allowed input:0-9)")

        }

    });


    $("#EmployeeNumber").keyup(function () {
        var ucase = new RegExp("[A-Z]+");
        var lcase = new RegExp("[a-z]+");
        var num = new RegExp("[0-9]+");

        if($("#EmployeeNumber").val().length >= 10){
            $("#num1").removeClass("glyphicon-remove");
            $("#num1").addClass("glyphicon-ok");
            $("#num1").css("color","#00A41E");
        }else{
            $("#num1").removeClass("glyphicon-ok");
            $("#num1").addClass("glyphicon-remove");
            $("#num1").css("color","#FF0004");
        }

        if(!/^[0-9]+$/.test($("#EmployeeNumber").val())){
            alert("Please only enter numeric characters only for your Phone Number! (Allowed input:0-9)")

        }

    });


    function a() {
        var ucase = new RegExp("[A-Z]+");
        var lcase = new RegExp("[a-z]+");
        var num = new RegExp("[0-9]+");

        if($("#EmployeeNumber").val().length >= 10){
            $("#num1").removeClass("glyphicon-remove");
            $("#num1").addClass("glyphicon-ok");
            $("#num1").css("color","#00A41E");
        }else{
            $("#num1").removeClass("glyphicon-ok");
            $("#num1").addClass("glyphicon-remove");
            $("#num1").css("color","#FF0004");
        }

        if(!/^[0-9]+$/.test($("#EmployeeNumber").val())){
            alert("Please only enter numeric characters only for your Phone Number! (Allowed input:0-9)")

        }}

</script>
<script>
$("#EmployeeSalary1").keyup(function () {
var ucase = new RegExp("[A-Z]+");
var lcase = new RegExp("[a-z]+");
var num = new RegExp("[0-9]+");

if($("#EmployeeSalary1").val().length >= 2){
    $("#sa").removeClass("glyphicon-remove");
    $("#sa").addClass("glyphicon-ok");
    $("#sa").css("color","#00A41E");
}else{
    $("#sa").removeClass("glyphicon-ok");
    $("#sa").addClass("glyphicon-remove");
    $("#sa").css("color","#FF0004");
}


if(!/^[0-9]+$/.test($("#EmployeeSalary1").val())){
alert("Please only enter numeric characters only for your Salary! (Allowed input:0-9)")

}

});

$("#EmployeeSalary").keyup(function () {
    var ucase = new RegExp("[A-Z]+");
    var lcase = new RegExp("[a-z]+");
    var num = new RegExp("[0-9]+");

    if($("#EmployeeSalary").val().length >= 2){
        $("#sa1").removeClass("glyphicon-remove");
        $("#sa1").addClass("glyphicon-ok");
        $("#sa1").css("color","#00A41E");
    }else{
        $("#sa1").removeClass("glyphicon-ok");
        $("#sa1").addClass("glyphicon-remove");
        $("#sa1").css("color","#FF0004");
    }

});
function s() {
    var ucase = new RegExp("[A-Z]+");
    var lcase = new RegExp("[a-z]+");
    var num = new RegExp("[0-9]+");

    if($("#EmployeeSalary").val().length >= 2){
        $("#sa1").removeClass("glyphicon-remove");
        $("#sa1").addClass("glyphicon-ok");
        $("#sa1").css("color","#00A41E");
    }else{
        $("#sa1").removeClass("glyphicon-ok");
        $("#sa1").addClass("glyphicon-remove");
        $("#sa1").css("color","#FF0004");
    }

};
</script>
<script>
    $("#EmployeeSocIdentity1").keyup(function () {
        var ucase = new RegExp("[A-Z]+");
        var lcase = new RegExp("[a-z]+");
        var num = new RegExp("[0-9]+");

        if($("#EmployeeSocIdentity1").val().length >= 9){
            $("#soc").removeClass("glyphicon-remove");
            $("#soc").addClass("glyphicon-ok");
            $("#soc").css("color","#00A41E");
        }else{
            $("#soc").removeClass("glyphicon-ok");
            $("#soc").addClass("glyphicon-remove");
            $("#soc").css("color","#FF0004");
        }


        if(!/^[0-9]+$/.test($("#EmployeeSocIdentity1").val())){
            alert("Please only enter numeric characters only for your SocIdentity! (Allowed input:0-9)")

        }

    });
    $("#EmployeeSocIdentity").keyup(function () {
        var ucase = new RegExp("[A-Z]+");
        var lcase = new RegExp("[a-z]+");
        var num = new RegExp("[0-9]+");

        if($("#EmployeeSocIdentity").val().length >= 9){
            $("#soc1").removeClass("glyphicon-remove");
            $("#soc1").addClass("glyphicon-ok");
            $("#soc1").css("color","#00A41E");
        }else{
            $("#soc1").removeClass("glyphicon-ok");
            $("#soc1").addClass("glyphicon-remove");
            $("#soc1").css("color","#FF0004");
        }


        if(!/^[0-9]+$/.test($("#EmployeeSocIdentity").val())){
            alert("Please only enter numeric characters only for your SocIdentity! (Allowed input:0-9)")

        }

    });
    function soc() {
        var ucase = new RegExp("[A-Z]+");
        var lcase = new RegExp("[a-z]+");
        var num = new RegExp("[0-9]+");

        if($("#EmployeeSocIdentity").val().length >= 9){
            $("#soc1").removeClass("glyphicon-remove");
            $("#soc1").addClass("glyphicon-ok");
            $("#soc1").css("color","#00A41E");
        }else{
            $("#soc1").removeClass("glyphicon-ok");
            $("#soc1").addClass("glyphicon-remove");
            $("#soc1").css("color","#FF0004");
        }


        if(!/^[0-9]+$/.test($("#EmployeeSocIdentity").val())){
            alert("Please only enter numeric characters only for your SocIdentity! (Allowed input:0-9)")

        }

    };
    $("#EmployeeName1").keyup(function () {
        var ucase = new RegExp("[A-Z]+");
        var lcase = new RegExp("[a-z]+");
        var num = new RegExp("[0-9]+");

        if($("#EmployeeName1").val().length > 0){
            $("#name").removeClass("glyphicon-remove");
            $("#name").addClass("glyphicon-ok");
            $("#name").css("color","#00A41E");
        }else{
            $("#name").removeClass("glyphicon-ok");
            $("#name").addClass("glyphicon-remove");
            $("#name").css("color","#FF0004");
        }



    });
    $("#EmployeeName").keyup(function () {
        var ucase = new RegExp("[A-Z]+");
        var lcase = new RegExp("[a-z]+");
        var num = new RegExp("[0-9]+");

        if($("#EmployeeName").val().length > 0){
            $("#name1").removeClass("glyphicon-remove");
            $("#name1").addClass("glyphicon-ok");
            $("#name1").css("color","#00A41E");
        }else{
            $("#name1").removeClass("glyphicon-ok");
            $("#name1").addClass("glyphicon-remove");
            $("#name1").css("color","#FF0004");
        }



    });
    function n() {
        var ucase = new RegExp("[A-Z]+");
        var lcase = new RegExp("[a-z]+");
        var num = new RegExp("[0-9]+");

        if($("#EmployeeName").val().length > 0){
            $("#name1").removeClass("glyphicon-remove");
            $("#name1").addClass("glyphicon-ok");
            $("#name1").css("color","#00A41E");
        }else{
            $("#name1").removeClass("glyphicon-ok");
            $("#name1").addClass("glyphicon-remove");
            $("#name1").css("color","#FF0004");
        }



    };



</script>
<script type="text/javascript">
    $(function () {
        $("#btnSubmit").click(function () {
            if($("#EmployeeNumber1").val().length < 10){
                alert("Please enter  for your Phone Number!")
               return false;}

            if ($("#password1").val() != $("#password2").val()) {
                    return false;
            }
            if(!/^[0-9]+$/.test($("#EmployeeNumber1").val())){
                alert("Please only enter numeric characters only for your Phone Number! (Allowed input:0-9)")
                return false;
            }
            if($("#EmployeeSocIdentity1").val().length < 9) {
                alert("Not longer than 10")
                return false;
            }
            if(!/^[0-9]+$/.test($("#EmployeeSocIdentity1").val())){
                alert("Please only enter numeric characters only for your SocIdentity! (Allowed input:0-9)")
                return false;
            }
                if($("#EmployeeName1").val()== 0){
                    alert("Please enter  for Name!")
                    return false;}
                if($("#EmployeeSalary1").val().length < 2){
                    alert("Please enter  for Salary!")
                    return false;
                }

                return true;
        });
    });
    $(function () {
        $("#btnSubmitEdit").click(function () {
            if($("#EmployeeNumber").val().length < 10){
                alert("Please enter  for your Phone Number!")
                return false;
                ;
            }


            if(!/^[0-9]+$/.test($("#EmployeeNumber").val())){
                alert("Please only enter numeric characters only for your Phone Number! (Allowed input:0-9)")
                return false;
            }
            if($("#EmployeeSocIdentity").val().length < 9) {
                alert("Not longer than 10")
                return false;
            }
            if(!/^[0-9]+$/.test($("#EmployeeSocIdentity").val())){
                alert("Please only enter numeric characters only for your SocIdentity! (Allowed input:0-9)")
                return false;
            }
            if($("#EmployeeName").val().length ==0 ||$("#EmployeeName").val()==null ){
                alert("Please enter  for Name!")
                return false;}
            if($("#EmployeeSalary").val().length < 2){
                alert("Please enter  for Salary!")
                return false;
            }

            return true;
        });
    });
</script>

</body>
</html>