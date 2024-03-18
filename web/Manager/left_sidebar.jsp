<%-- Document : left_sidebar Created on : Feb 26, 2024, 8:29:58 PM Author : To Do Hong Y - CE171148 --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<html>

    <head>
        <title>Page</title>
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
        <script src="/assets/js/validation/jquery.min.js"></script>
        <link rel="stylesheet" href="../assets/css/left_slide_bar.css"/>
    </head>

    <body>
        <nav id="sidebarMenu" class="collapse d-lg-block sidebar collapse bg-white" style="padding: 0px;">
            <div class="position-sticky">
                <div class="list-group list-group-flush mx-2 mt-4">
                    <a class="d-block text-lg font-weight-bold text-dark mb-4">
                        <c:choose>
                            <c:when test="${admin != null}">
                                Hello, ${admin.getUsername()}
                            </c:when>
                            <c:when test="${staff != null}">
                                Hello, ${staff.getUsername()}
                            </c:when>
                        </c:choose>
                    </a>
                    <c:if test="${admin != null}">
                        <a href="/dashboard" class="list-group-item list-group-item-action py-2 ripple">
                            <i class="fas fa-vihara"></i><span style="margin-left: 5px">Dashboard</span>
                        </a>
                    </c:if>
                    <c:if test="${admin != null}">
                        <a href="#manager" id="accountManager"
                           class="list-group-item list-group-item-action py-2 ripple">
                            <i class="fas fa-user-circle fa-fw me-3"></i><span style="margin-left: 5px">Account
                                management</span>
                        </a>
                        <div id="manager" style="display: none;">
                            <a href="staffmanager" class="list-group-item list-group-item-action py-2 ripple whitespace-nowrap">
                                <div class="ellipsis">Staff account management</div>
                            </a>
                            <a href="adminmanager" class="list-group-item list-group-item-action py-2 ripple whitespace-nowrap">
                                <div class="ellipsis">Admin account management</div>
                            </a>
                            <a href="customermanager" class="list-group-item list-group-item-action py-2 ripple whitespace-nowrap">
                                <div class="ellipsis">Customer account management</div>
                            </a>
                        </div>

                    </c:if>
                    <a href="productmanagement" class="list-group-item list-group-item-action py-2 ripple">
                        <i class="fas fa-shoe-prints fa-fw me-3"></i>
                        <span style="margin-left: 5px">Product management</span>
                    </a>
                    <a href="brandmanager" class="list-group-item list-group-item-action py-2 ripple">
                        <i class="fas fa-tag fa-fw me-3"></i><span style="margin-left: 5px">Brand management</span>
                    </a>
                    <a href="ordermanagement" class="list-group-item list-group-item-action py-2 ripple">
                        <i class="fas fa-clipboard-list fa-fw me-3"></i><span style="margin-left: 5px">Order
                            management</span>
                    </a>
                    <a href="logout" class="list-group-item list-group-item-action py-2 ripple">
                        <i class="fas fa-sign-out-alt fa-fw me-3"></i><span style="margin-left: 5px">Log
                            out</span>
                    </a>


                </div>
            </div>
        </nav>
        <script>
            document.getElementById('accountManager').addEventListener('click', function (event) {
                event.preventDefault(); // Prevent default anchor behavior
                
                var managerDiv = document.getElementById('manager');
                if (managerDiv.style.display === 'none') {
                    managerDiv.style.display = 'block';
                } else {
                    managerDiv.style.display = 'none';
                }
            });
        </script>

    </body>

</html>