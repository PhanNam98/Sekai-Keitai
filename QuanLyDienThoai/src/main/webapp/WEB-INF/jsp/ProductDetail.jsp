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
        <c:when test="${mode == 'ProdDetail_view'}">
            <h2>All Product Detail ${ProdDetailID}</h2>

            <button type="button" onclick="location.href='/CreateProductDetail?id=${ProdDetailID}'" class="btn btn-primary" >
                <a href="/CreateProductDetail?id=${ProdDetailID}"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>Create Product Detail
            </button>

            <table class="table table-hover">
                <thead>
                <tr>
                    <th>Model ID</th>
                    <th>Product ID</th>
                    <th>Color ID</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th> <a><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>Edit</th>
                    <th> <a><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>Delete</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="prod" items="${proddetaillist}">
                    <tr>
                        <td>${prod.modelid}</td>
                        <td>${prod.productid}</td>
                        <td>${prod.colorid}</td>
                        <td>${prod.price}</td>
                        <td>${prod.quantity}</td>


                        <td>
                            <button type="button" onclick="location.href='/EditProductDetail?id=${prod.modelid}'" class="btn btn-primary" >
                                <a href="/EditProductDetail?id=${prod.modelid}"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>Edit
                            </button>
                        </td>
                            <%--<td><a href="/DeleteEmployee?id=${emp.empID}"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a></td>--%>
                        <td>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#${prod.modelid}" data-whatever="${prod.modelid}">
                                <a href="#"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>Delete
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="${prod.modelid}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                                            <a type="button" class="btn btn-primary" href="/DeleteProductDetail?id=${prod.modelid}&&idproduct=${prod.productid}" >Agree</a>
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
        <c:when test="${mode == 'ProdDetail_Edit'}">

            <center>
                <h2>Edit Product Detail</h2>
            </center>

            <div class="row">
                <div class="center-block col-md-6" style="float: none; background-color: cornsilk">
                    <form action="/SaveEditProductDetail" method="post">
                        <div class="form-group">
                            <label>Model ID</label>
                            <input type="text" class="form-control" value="${prodDetail.modelid}" id="ModelID"  name ="ModelID"   readonly="readonly">
                        </div>
                        <div class="form-group">
                            <label>Product ID</label>
                            <input type="text" class="form-control" value="${prodDetail.productid}" id="ProdID2" name ="ProdID" readonly="readonly">
                        </div>
                        <div class="form-group">
                            <label>Color</label>
                                <%--<input type="text" class="form-control"  id="EmployeeEmpType1" name ="EmployeeEmpType" >--%>
                            <select id="SelectColor" name="SelectColor" >
                                <c:forEach var="color" items="${listcolor}">
                                    <option value="${color.colorid}"
                                            <c:if test="${color.colorid eq colorselect}">selected="selected"</c:if>>${color.colorname}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <%--<div class="form-group">--%>
                            <%--<label>Color ID</label>--%>
                            <%--<input type="text" class="form-control" value="${prodDetail.colorid}" id="ColorID" name ="ColorID" >--%>
                        <%--</div>--%>
                        <div class="form-group">
                            <label>Price</label>
                            <input type="text" class="form-control" value="${prodDetail.price}" id="Price" name ="Price" >
                        </div>
                        <div class="form-group">
                            <label>Quantity</label>
                            <input type="text" class="form-control" value="${prodDetail.quantity}" id="Quantity" name ="Quantity" >
                        </div>



                        <button type="submit" class="btn btn-primary" id="btnSubmitEdit">Save</button>

                    </form>
                </div>
            </div>
        </c:when>
        <c:when test="${mode == 'ProductDetail_Create'}">
            <center>
                <h2>Create Product Detail</h2>
            </center>
            <div class="row">
                <div class="center-block col-md-6" style="float: none; background-color: cornsilk">

                    <form action="/SaveNewProductDetail" method="post">

                        <div class="form-group">
                            <label>Model ID</label>
                            <input type="text" class="form-control" value="${prod.modelid}" id="ModelID1"  name ="ModelID"  >
                        </div>
                        <div class="form-group">
                            <label>Product ID</label>
                            <input type="text" class="form-control" value="${ProdDetailID}" id="ProdID1" name ="ProdID" readonly="readonly">
                        </div>
                        <div class="form-group">
                            <label>Color</label>
                                <%--<input type="text" class="form-control"  id="EmployeeEmpType1" name ="EmployeeEmpType" >--%>
                            <select id="SelectColor" name="SelectColor" >
                                <c:forEach var="color" items="${listcolor}">
                                    <option value="${color.colorid}">${color.colorname}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <%--<div class="form-group">--%>
                            <%--<label>Color ID</label>--%>
                            <%--<input type="text" class="form-control" value="${prod.colorid}" id="ColorID1" name ="ColorID" >--%>
                        <%--</div>--%>
                        <div class="form-group">
                            <label>Price</label>
                            <input type="text" class="form-control" value="${prod.price}" id="Price1" name ="Price" >
                        </div>
                        <div class="form-group">
                            <label>Quantity</label>
                            <input type="text" class="form-control" value="${prod.quantity}" id="Quantity1" name ="Quantity" >
                        </div>

                        <button type="submit" class="btn btn-primary" id="btnSubmit">Save</button>
                    </form>
                </div>
            </div>
        </c:when>
    </c:choose>

</div>
<script type="text/javascript">
    $(function () {
        $("#btnSubmit").click(function () {
            if($("#ModelID1").val().length ==0){
                alert("Please enter  for Model ID!")
                return false;}


            if($("#Price1").val().length ==0) {
                alert("Please enter  for Price!")
                return false;
            }

            if(!/^[0-9]+$/.test($("#Price1").val())){
                alert("Please only enter numeric characters only for Price! (Allowed input:0-9)")

            }
            if($("#Quantity1").val().length ==0) {
                alert("Please enter  for Quantity!")
                return false;
            }

            if(!/^[0-9]+$/.test($("#Quantity1").val())){
                alert("Please only enter numeric characters only for Quantity! (Allowed input:0-9)")

            }

            return true;
        });
    });
    $(function () {
        $("#btnSubmitEdit").click(function () {

            if($("#ModelID").val().length ==0){
                alert("Please enter  for Model ID!")
                return false;}


            if($("#Price").val().length ==0) {
                alert("Please enter  for Price!")
                return false;
            }

            if(!/^[0-9]+$/.test($("#Price").val())){
                alert("Please only enter numeric characters only for Price! (Allowed input:0-9)")

            }
            if($("#Quantity").val().length ==0) {
                alert("Please enter  for Quantity!")
                return false;
            }

            if(!/^[0-9]+$/.test($("#Quantity").val())){
                alert("Please only enter numeric characters only for Quantity! (Allowed input:0-9)")

            }



            return true;
        });
    });
</script>
</body>
</html>