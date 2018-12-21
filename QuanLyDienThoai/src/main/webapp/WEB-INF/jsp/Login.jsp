<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form"
           prefix="springForm"%>
<html xmlns:th="http://www.thymeleaf.org">
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-
scale=1">
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.
min.css">
    <script
            src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.j
s"></script>
    <script
            src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.mi
n.js"></script>
</head>
<body>
<form action="/Login" method="post" modelAttribute="loginBean">
    <center>
        <h2>Login Admin</h2>
    </center>
    <div class="row">
        <div class="center-block col-md-6" style="float: none; background-color: cornsilk">
    <div class="form-group">
        <label>UserName</label>
        <input type="text" class="form-control" id="UserName" name ="UserName"  >
    </div>
    <div class="form-group">
        <label>Password</label>
        <input type="password" class="form-control" id="Password" name ="Password"  >
    </div>

    <button type="submit" class="btn btn-primary">Login</button>
        </div>
    </div>
</form>
</body>
</html>