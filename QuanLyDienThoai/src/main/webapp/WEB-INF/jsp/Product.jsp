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
            <li ><a href="/ListDeveloper">Developer</a></li>
            <li><a href="/ListGeneration">Generation</a></li>
            <li class="active"><a href="/ListProduct">Product</a></li>
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
        <c:when test="${mode == 'Prod_view'}">
        <div class="row">
            <div class="center-block col-md-6">
            <h2>All Product</h2>
                <form  action="/SeachProduct" method="post">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Search" name="searchprod">
            </div>
                    <%--<div class="form-group">--%>
            <%--<button type="submit" class="btn btn-default">Search</button>    </div>--%>
        </form>
            </div>
        </div>
            <button type="button" onclick="location.href='/CreateProduct'" class="btn btn-primary" >
                <a href="/CreateProduct"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>Create Product
            </button>

            <table class="table table-hover">

                <thead>
                <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Cpu</th>
                    <th>Ram</th>
                    <th>Storage</th>
                    <th>Screen</th>
                    <th>Battery</th>
                    <th>Generation</th>
                    <th> <a><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>Edit</th>
                    <th> <a><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>Delete</th>
                    <th> <a><span class="glyphicon glyphicon-list" aria-hidden="true"></span></a>Product Detail</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="prod" items="${prodlist}">
                    <tr>
                        <td>${prod.productid}</td>
                        <td>${prod.productname}</td>
                        <td>${prod.cpu}</td>
                        <td>${prod.ram}</td>
                        <td>${prod.storage}</td>
                        <td>${prod.screen}</td>
                        <td>${prod.battery}</td>
                        <td>${prod.genid}</td>

                        <td>
                            <button type="button" onclick="location.href='/EditProduct?id=${prod.productid}'" class="btn btn-primary" >
                                <a href="/EditProduct?id=${prod.productid}"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>Edit
                            </button>
                        </td>
                            <%--<td><a href="/DeleteEmployee?id=${emp.empID}"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a></td>--%>
                        <td>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#${prod.productid}" data-whatever="${dev.devid}">
                                <a href="#"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>Delete
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="${prod.productid}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Delete Product</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            Are you sure?
                                        </div>
                                        <div class="modal-footer">
                                                <%--<a type="button" class="btn btn-primary" href="/DeleteEmployee?id=${emp.empID}" target="_blank">Agree</a>--%>
                                            <a type="button" class="btn btn-primary" href="/DeleteProduct?id=${prod.productid}" >Agree</a>
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td>
                            <button type="button" onclick="location.href='/ListProductDetailBy?id=${prod.productid}'" class="btn btn-primary" >
                                <a href="/ListProductDetailBy?id=${prod.productid}"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>List Product
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:when test="${mode == 'Prod_Edit'}">

            <center>
                <h2>Edit Product</h2>
            </center>

            <div class="row">
                <div class="center-block col-md-6" style="float: none; background-color: cornsilk">
                    <form action="/SaveEditProduct" method="post">
                        <div class="form-group">
                            <label>Product ID</label>
                            <input type="text" class="form-control" value="${prod.productid}" id="ProdID"  name ="ProdID" readonly="readonly" >
                        </div>
                        <div class="form-group">
                            <label>Product Name</label>
                            <input type="text" class="form-control" value="${prod.productname}" id="ProdName" name ="ProdName" >
                        </div>
                        <div class="form-group">
                            <label>Cpu</label>
                            <input type="text" class="form-control" value="${prod.cpu}" id="ProdCpu" name ="ProdCpu" >
                        </div>
                        <div class="form-group">
                            <label>Ram</label>
                            <input type="text" class="form-control" value="${prod.ram}" id="ProdRam" name ="ProdRam" >
                        </div>
                        <div class="form-group">
                            <label>Storage</label>
                            <input type="text" class="form-control" value="${prod.storage}" id="ProdStorage" name ="ProdStorage" >
                        </div>
                        <div class="form-group">
                            <label>Screen</label>
                            <input type="text" class="form-control" value="${prod.screen}" id="ProdScreen" name ="ProdScreen" >
                        </div>
                        <div class="form-group">
                            <label>Battery</label>
                            <input type="text" class="form-control" value="${prod.battery}" id="ProdBattery" name ="ProdBattery" >
                        </div>
                        <div class="form-group">
                            <label>Generation ID</label>
                            <input type="text" class="form-control" value="${prod.genid}" id="GenId" name ="GenId"readonly="readonly"  >
                        </div>


                        <button type="submit" class="btn btn-primary" id="btnSubmitEdit">Save</button>
                        <a type="button" class="btn btn-default" href="/ListProduct" >Cancel</a>
                    </form>
                </div>
            </div>
        </c:when>
        <c:when test="${mode == 'Product_Create'}">
            <center>
                <h2>Create Product</h2>
            </center>
            <div class="row">
                <div class="center-block col-md-6" style="float: none; background-color: cornsilk">
                    <form action="/ChoiceDevloper" method="post">
                        <div class="form-group">
                            <label>Choice  Devloper</label>
                            <select id="SelectDev" name="SelectDev" >
                                <c:forEach var="dev" items="${devlist}">
                                    <option value="${dev.devid}"
                                     <c:if test="${dev.devid eq devselect}">selected="selected"</c:if>>${dev.devname}</option>
                                </c:forEach>
                            </select>
                            <button type="submit" class="btn btn-primary">Choice</button>
                        </div>
                    </form>
                    <form action="/SaveNewProduct" method="post">
                        <div class="form-group">
                            <label>Generation</label>
                            <select id="SelectGen" name="SelectGen" >
                                <c:forEach var="gen" items="${genlist}">
                                    <option value="${gen.genid}">${gen.genname}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="form-group">
                            <label>Product ID</label>
                            <input type="text" class="form-control" value="${prod.productid}" id="ProdID1"  name ="ProdID" >
                        </div>
                        <div class="form-group">
                            <label>Product Name</label>
                            <input type="text" class="form-control" value="${prod.productname}" id="ProdName1" name ="ProdName" >
                        </div>
                        <div class="form-group">
                            <label>Cpu</label>
                            <input type="text" class="form-control" value="${prod.cpu}" id="ProdCpu1" name ="ProdCpu" >
                        </div>
                        <div class="form-group">
                            <label>Ram</label>
                            <input type="text" class="form-control" value="${prod.ram}" id="ProdRam1" name ="ProdRam" >
                        </div>
                        <div class="form-group">
                            <label>Storage</label>
                            <input type="text" class="form-control" value="${prod.storage}" id="ProdStorage1" name ="ProdStorage" >
                        </div>
                        <div class="form-group">
                            <label>Screen</label>
                            <input type="text" class="form-control" value="${prod.screen}" id="ProdScreen1" name ="ProdScreen" >
                        </div>
                        <div class="form-group">
                            <label>Battery</label>
                            <input type="text" class="form-control" value="${prod.battery}" id="ProdBattery1" name ="ProdBattery" >
                        </div>
                        <%--<div class="form-group">--%>
                            <%--<label>Generation ID</label>--%>
                            <%--<input type="text" class="form-control" value="${prod.genid}" id="GenId1" name ="GenId" >--%>
                        <%--</div>--%>

                        <button type="submit" class="btn btn-primary" id="btnSubmit">Save</button>
                        <a type="button" class="btn btn-default" href="/ListProduct" >Cancel</a>
                    </form>
                </div>
            </div>
        </c:when>
    </c:choose>

</div>
<script type="text/javascript">
    $(function () {
        $("#btnSubmit").click(function () {
            if($("#ProdID1").val().length ==0){
                alert("Please enter  for Product ID!")
                return false;}

            if($("#ProdName1").val().length ==0) {
                alert("Please enter  for Product Name!")
                return false;
            }
            if($("#ProdCpu1").val().length ==0) {
                alert("Please enter  for Product Name!")
                return false;
            }
            if($("#ProdRam1").val().length ==0) {
                alert("Please enter  for Product Name!")
                return false;
            }
            if($("#ProdStorage1").val().length ==0) {
                alert("Please enter  for Product Name!")
                return false;
            }
            if($("#ProdScreen1").val().length ==0) {
                alert("Please enter  for Product Name!")
                return false;
            }
            if($("#ProdBattery1").val().length ==0) {
                alert("Please enter  for Product Name!")
                return false;
            }


            return true;
        });
    });
    $(function () {
        $("#btnSubmitEdit").click(function () {

            if($("#ProdID").val().length ==0){
                alert("Please enter  for Product ID!")
                return false;}

            if($("#ProdName").val().length ==0) {
                alert("Please enter  for Product Name!")
                return false;
            }
            if($("#ProdCpu").val().length ==0) {
                alert("Please enter  for Product Name!")
                return false;
            }
            if($("#ProdRam").val().length ==0) {
                alert("Please enter  for Product Name!")
                return false;
            }
            if($("#ProdStorage").val().length ==0) {
                alert("Please enter  for Product Name!")
                return false;
            }
            if($("#ProdScreen").val().length ==0) {
                alert("Please enter  for Product Name!")
                return false;
            }
            if($("#ProdBattery").val().length ==0) {
                alert("Please enter  for Product Name!")
                return false;
            }


            return true;
        });
    });
</script>
</body>
</html>