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
            <li><a href="/ListDeveloper">Developer</a></li>
            <li><a href="/ListGeneration">Generation</a></li>
            <li><a href="/ListProduct">Product</a></li>
            <li class="active"><a href="/ListColor">Color</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="/Login"><span class="glyphicon glyphicon-user"></span> Logout</a></li>
            <%--<li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>--%>
        </ul>
    </div>
</nav>

<div class="container" >
    <c:choose>
        <c:when test="${mode == 'Color_view'}">
            <h2>All Color</h2>
            <button type="button" onclick="location.href='/CreateColor'" class="btn btn-primary" >
                <a href="/CreateColor"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>Create Color
            </button>
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>Color ID</th>
                    <th>Color Name</th>
                    <th> <a><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>Edit</th>
                    <th> <a><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>Delete</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="colr" items="${colorlist}">
                    <tr>
                        <td>${colr.colorid}</td>
                        <td>${colr.colorname}</td>

                        <td>
                            <button type="button" onclick="location.href='/EditColor?id=${colr.colorid}'" class="btn btn-primary" >
                                <a href="/EditColor?id=${colr.colorid}"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>Edit
                            </button>
                        </td>
                            <%--<td><a href="/DeleteEmployee?id=${emp.empID}"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a></td>--%>
                        <td>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#${colr.colorid}" data-whatever="${colr.colorid}">
                                <a href="#"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>Delete
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="${colr.colorid}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Delete Color</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            Are you sure?
                                        </div>
                                        <div class="modal-footer">
                                                <%--<a type="button" class="btn btn-primary" href="/DeleteEmployee?id=${emp.empID}" target="_blank">Agree</a>--%>
                                            <a type="button" class="btn btn-primary" href="/DeleteColor?id=${colr.colorid}" >Agree</a>
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
        <c:when test="${mode == 'Color_Edit'}">

            <center>
                <h2>Edit Color</h2>
            </center>
            <div class="row">
                <div class="center-block col-md-6" style="float: none; background-color: cornsilk">
                    <form action="/SaveEditColor" method="post">
                        <div class="form-group">
                            <label>Color ID</label>
                            <input type="text" class="form-control" value="${color.colorid}" id="ColorID"  name ="ColorID" readonly="readonly" >
                        </div>
                        <div class="form-group">
                            <label>Color Name</label>
                            <input type="text" class="form-control" value="${color.colorname}" id="ColorName" name ="ColorName" >
                        </div>

                        <button type="submit" class="btn btn-primary">Save</button>
                    </form>
                </div>
            </div>
        </c:when>
        <c:when test="${mode == 'Color_Create'}">
            <center>
                <h2>Create Color</h2>
            </center>
            <div class="row">
                <div class="center-block col-md-6" style="float: none; background-color: cornsilk">
                    <form action="/SaveNewColor" method="post">
                        <div class="form-group">
                            <label>Color ID</label>
                            <input type="text" class="form-control"  id="ColorID1"  name ="ColorID" >
                        </div>
                        <div class="form-group">
                            <label>Color Name</label>
                            <input type="text" class="form-control" id="ColorName1" name ="ColorName" >
                        </div>

                        <button type="submit" class="btn btn-primary">Save</button>
                    </form>
                </div>
            </div>
        </c:when>
    </c:choose>

</div>

</body>
</html>