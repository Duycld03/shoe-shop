<%-- 
    Document   : staffmanager
    Created on : Feb 26, 2024, 7:39:02 PM
    Author     : To Do Hong Y - CE171148
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
            function doDelete(order_id) {
                if (confirm("Ban co chac chan xoa staff_id = " + order_id)) {
                    window.location = "delete?staffId=" + order_id;
                }

            }

        </script>
        <link rel="stylesheet" href="assets/js/validation/bootstrap.min.css">
        <script src="assets/js/validation/jquery.min.js"></script>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
        <style>
            body {
                margin: 0;
                padding: 0;
            }
        </style>
        <style>
            body {
                background-color: #fbfbfb;
            }
            @media (min-width: 991.98px) {
                main {
                    padding-left: 240px;
                }
            }

            /* Sidebar */
            .sidebar {
                position: fixed;
                top: 0;
                bottom: 0;
                left: 0;
                padding: 58px 0 0; /* Height of navbar */
                box-shadow: 0 2px 5px 0 rgb(0 0 0 / 5%), 0 2px 10px 0 rgb(0 0 0 / 5%);
                width: 240px;
                z-index: 600;
            }

            @media (max-width: 991.98px) {
                .sidebar {
                    width: 100%;
                }
            }
            .sidebar .active {
                border-radius: 5px;
                box-shadow: 0 2px 5px 0 rgb(0 0 0 / 16%), 0 2px 10px 0 rgb(0 0 0 / 12%);
            }

            .sidebar-sticky {
                position: relative;
                top: 0;
                height: calc(100vh - 48px);
                padding-top: 0.5rem;
                overflow-x: hidden;
                overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
            }</style>
    </head>
    <body>
        <header>
            <jsp:include page="left_sidebar.jsp"></jsp:include>
        </header>
        <!--               <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <div class="container">
                        <div class="navbar-text ml-auto">
                            <a href="logout" class="btn btn-danger">Logout</a>
                        </div>
                    </div>
                </nav>-->

        <main>
              <div class="container mt-3 pt-4">
            <h1>STAFF MANAGEMENT</h1>
            <h3>
                <a href="add.jsp"><button class="btn btn-primary">Add new</button></a>
            </h3>
            <table class="table table-bordered table-striped mt-3">
                <thead class="thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>User Name</th>
                        <th>FullName</th>
                        <th>Password</th>
                        <th>Email</th>
                        <th>Phone Number</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <c:forEach items="${requestScope.data}" var="c">
                    <c:set var="order_id" value="${c.staffId}" />
                    <tr>
                        <td>${order_id}</td>
                        <td>${c.username}</td>
                        <td>${c.fullname}</td>
                        <td>${c.password}</td>
                        <td>${c.email}</td>
                        <td>${c.phoneNumber}</td>
                        <td>
                            <div class="btn-group">
                                <button class="btn btn-success" onclick="location.href = 'update?id=${c.staffId}'">Update</button>
                                &nbsp;&nbsp;&nbsp;
                                <button class="btn btn-danger" onclick="doDelete('${c.staffId}')">Delete</button>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>   
        </main>

    </body>
</html>

