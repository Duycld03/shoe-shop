<%-- 
    Document   : updatestaff
    Created on : Feb 27, 2024, 7:21:42 PM
    Author     : To Do Hong Y - CE171148
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="assets/js/validation/bootstrap.min.css">
        <script src="assets/js/validation/jquery.min.js"></script>
    </head>
    <body>
        <div class="container">
            <h1 class="mt-5">Update Staff</h1>
            <h3>${requestScope.error}</h3>
            <c:set var="c" value="${requestScope.category}"/>
            <form action="loadStaff" method="post">
                <div class="form-group">
                    <label for="id">Enter ID:</label>
                    <input type="text" name="id" readonly value="${c.staffId}" class="form-control"/>
                </div>

                <div class="form-group">
                    <label>UserName</label>
                    <input name="username" type="text" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>FullName</label>
                    <input name="Fullname" type="text" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input name="password" type="text" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Email</label>
                    <input name="email" type="text" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Phone Number</label>
                    <input name="phonenumber" type="text" class="form-control" required>
                </div>

                <button class="btn btn-success" type="submit" onclick="return validateForm()">Save</button>
                <a href="staffmanager" class="btn btn-primary">Back</a>
            </form>
        </div>

        <script src="assets/js/validation//manager.js" type="text/javascript"></script>
        <script src="assets/js/validation/bootstrap.min.js"></script>
    </body>
</html>
