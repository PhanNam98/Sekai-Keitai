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
<body  onload="check()" >

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/Dashboard">Sekai Keitai Shop</a>
        </div>
        <ul class="nav navbar-nav">
            <li ><a href="/ListEmployee">Employee</a></li>
            <%--<li><a href="/CreateEmployee">New Employee</a></li>--%>
            <li class="active"><a href="/ListDeveloper">Developer</a></li>
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
        <c:when test="${mode == 'Dev_view'}">
            <h2>All Developers</h2>
            <button type="button" onclick="location.href='/CreateDeveloper'" class="btn btn-primary" >
                <a href="/CreateDeveloper"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>Create Developer
            </button>
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th> <a><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>Edit</th>
                    <th> <a><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>Delete</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="dev" items="${devlist}">
                    <tr>
                        <td>${dev.devid}</td>
                        <td>${dev.devname}</td>

                        <td>
                            <button type="button" onclick="location.href='/EditDeveloper?id=${dev.devid}'" class="btn btn-primary" >
                                <a href="/EditDeveloper?id=${dev.devid}"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>Edit
                            </button>
                        </td>
                            <%--<td><a href="/DeleteEmployee?id=${emp.empID}"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a></td>--%>
                        <td>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#${dev.devid}" data-whatever="${dev.devid}">
                                <a href="#"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>Delete
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="${dev.devid}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Delete Developer</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            Are you sure?
                                        </div>
                                        <div class="modal-footer">
                                                <%--<a type="button" class="btn btn-primary" href="/DeleteEmployee?id=${emp.empID}" target="_blank">Agree</a>--%>
                                            <a type="button" class="btn btn-primary" href="/DeleteDeveloper?id=${dev.devid}" >Agree</a>
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
        <c:when test="${mode == 'Dev_Edit'}">

            <center>
                <h2>Edit Developer</h2>
            </center>
            <div class="row">
                <div class="center-block col-md-6" style="float: none; background-color: cornsilk">
                    <form action="/SaveEditDev" method="post">
                        <div class="form-group">
                            <label>ID</label>
                            <input type="text" class="form-control" value="${dev.devid}" id="DevID"  name ="DevID" readonly="readonly" >
                        </div>
                        <div class="form-group">
                            <label>Name</label>
                            <input type="text" class="form-control" value="${dev.devname}" id="DevName" name ="DevName" >
                        </div>

                        <button type="submit" class="btn btn-primary" id="btnSubmitEdit">Save</button>
                        <a type="button" class="btn btn-default" href="/ListDeveloper" >Cancel</a>
                    </form>
                </div>
            </div>
        </c:when>
        <c:when test="${mode == 'Dev_Create'}">
            <center>
                <h2>Create Developer</h2>
            </center>
            <div class="row">
                <div class="center-block col-md-6" style="float: none; background-color: cornsilk">
                    <form action="/SaveNewDev" method="post">
                        <div class="form-group">
                            <label>ID</label>
                            <input type="text" class="form-control"  id="DevID1"  name ="DevID" >
                        </div>
                        <div class="form-group">
                            <label>Name</label>
                            <input type="text" class="form-control" id="DevName1" name ="DevName" >
                        </div>

                        <button type="submit" class="btn btn-primary" id="btnSubmit">Save</button>
                        <a type="button" class="btn btn-default" href="/ListDeveloper" >Cancel</a>
                    </form>
                </div>
            </div>
        </c:when>
    </c:choose>

</div>
<script type="text/javascript">
    $(function () {
        $("#btnSubmit").click(function () {
            if($("#DevID1").val().length ==0){
                alert("Please enter  for Developers ID!")
                return false;}



            if($("#DevName1").val().length ==0) {
                alert("Please enter  for Developers Name!")
                return false;
            }


            return true;
        });
    });
    $(function () {
        $("#btnSubmitEdit").click(function () {

            if($("#DevName").val().length == 0) {
                alert("Please enter  for Developers Name!")
                return false;
            }

            return true;
        });
    });
</script>
</body>
</html>