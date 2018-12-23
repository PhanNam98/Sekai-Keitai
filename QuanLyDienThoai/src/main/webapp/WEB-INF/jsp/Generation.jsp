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
    <%--<script type="text/javascript">--%>
    <%--function populate(s1,s2)--%>
    <%--var a1=document.getElementById(s1);--%>
    <%--var a2=document.getElementById(s2);--%>
    <%--a2.innerHTML="";--%>
    <%--for(var a in request.getAttribute("devlist") )--%>
    <%--{--%>
    <%--var op= document.createElement("option");--%>
    <%--op.value=${a.devid};--%>
    <%--op.innerHTML=${a.devid};--%>

    <%--a2.options.add(op);--%>
    <%--}--%>


    <%--}--%>
    <%--</script>--%>
</head>
<body  onload="check()" >

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/Dashboard">Sekai Keitai Shop</a>
        </div>
        <ul class="nav navbar-nav">
            <li ><a href="/ListEmployee">Employee</a></li>
            <%--<li><a href="/CreateEmployee">New Employee</a></li>--%>
            <li ><a href="/ListDeveloper">Developer</a></li>
            <li class="active"><a href="/ListGeneration">Generation</a></li>
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
        <c:when test="${mode == 'Gen_view'}">
            <div class="row">
                <div class="center-block col-md-6">
                    <h2>All Generation</h2>
                    <form  action="/SeachGeneration" method="post">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Search" name="searchgen">
                        </div>

                    </form>
                </div>
            </div>
            <button type="button" onclick="location.href='/CreateGeneration'" class="btn btn-primary" >
                <a href="/CreateGeneration"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>Create Generation
            </button>
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>Generation ID</th>
                    <th>Generation Name</th>
                    <th>Developer ID</th>
                    <th> <a><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>Edit</th>
                    <th> <a><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>Delete</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="gen" items="${genlist}">
                    <tr>
                        <td>${gen.genid}</td>
                        <td>${gen.genname}</td>
                        <td>${gen.devid}</td>
                        <td>
                            <button type="button" onclick="location.href='/EditGeneration?id=${gen.genid}'" class="btn btn-primary" >
                                <a href="/EditGeneration?id=${gen.genid}"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>Edit
                            </button>
                        </td>

                                <%--<a href="/DeleteEmployee?id=${emp.empID}"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a></td>--%>
                        <td>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#${gen.genid}" data-whatever="${gen.genid}">
                                <a><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>Delete
                                <%--href="/DeleteGeneration?id=${gen.genid}"--%>
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="${gen.genid}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Delete Generation</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            Are you sure?
                                        </div>
                                        <div class="modal-footer">
                                            <a type="button" class="btn btn-primary" href="/DeleteGeneration?id=${gen.genid}" >Agree</a>
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
        <c:when test="${mode == 'Gen_Edit'}">

            <center>
                <h2>Edit Generation</h2>
            </center>
            <div class="row">
                <div class="center-block col-md-6" style="float: none; background-color: cornsilk">
                    <form action="/SaveEditGen" method="post">
                        <div class="form-group">
                            <label>Generation ID</label>
                            <input type="text" class="form-control" value="${gen.genid}" id="GenID"  name ="GenID" readonly="readonly" >
                        </div>
                        <div class="form-group">
                            <label>Generation Name</label>
                            <input type="text" class="form-control" value="${gen.genname}" id="GenName"  name ="GenName"  >
                        </div>
                        <div class="form-group">
                            <label>Developer ID</label>
                            <input type="text" class="form-control" value="${gen.devid}" id="DevID" name ="DevID" readonly="readonly">
                        </div>

                        <button type="submit" class="btn btn-primary" id="btnSubmitEdit">Save</button>
                        <a type="button" class="btn btn-default" href="/ListGeneration" >Cancel</a>
                    </form>
                </div>
            </div>
        </c:when>
        <c:when test="${mode == 'Gen_Create'}">
            <center>
                <h2>Create Generation</h2>
            </center>
            <div class="row">
                <div class="center-block col-md-6" style="float: none; background-color: cornsilk">
                    <form action="/SaveNewGen" method="post">
                        <div class="form-group">
                            <label>Generation ID</label>
                            <input type="text" class="form-control" value="${gen.genid}" id="GenID1"  name ="GenID" >
                        </div>
                        <div class="form-group">
                            <label>Generation Name</label>
                            <input type="text" class="form-control" value="${gen.genname}" id="GenName1"  name ="GenName"  >
                        </div>
                        <div class="form-group">
                            <label>Developer ID</label>
                        <div class="dropdown">

                        <select id="SelectDevID" name="SelectDevID" onchange="populate('SelectDevID','SelectDevID1')">
                            <c:forEach var="devl" items="${devlist}">
                                <option value="${devl.devid}">${devl.devname}</option>
                            </c:forEach>
                        <%--</select>--%>
                            <%--<select id="SelectDevID1" name="SelectDevID1" >--%>

                            </select>
                        </div>
                        </div>


                        <button type="submit" class="btn btn-primary" id="btnSubmit">Save</button>
                        <a type="button" class="btn btn-default" href="/ListGeneration" >Cancel</a>
                    </form>
                </div>
            </div>
        </c:when>
    </c:choose>

</div>
<script type="text/javascript">
    $(function () {
        $("#btnSubmit").click(function () {
            if($("#GenID1").val().length ==0){
                alert("Please enter  for Generation ID!")
                return false;}



            if($("#GenName1").val().length ==0) {
                alert("Please enter  for Generation Name!")
                return false;
            }


            return true;
        });
    });
    $(function () {
        $("#btnSubmitEdit").click(function () {

            if($("#GenName").val().length == 0) {
                alert("Please enter  for Generation Name!")
                return false;
            }

            return true;
        });
    });
</script>
</body>
</html>