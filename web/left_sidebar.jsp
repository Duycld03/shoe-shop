<%-- 
    Document   : left_sidebar
    Created on : Feb 26, 2024, 8:29:58 PM
    Author     : To Do Hong Y - CE171148
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
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

            @media (max-width: 844px) {
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
        <style>
            #manager a {
                font-size: 14px;
            }
            #manager span{
                padding-left: 0.5rem;
            }
        </style>
    </head>
    <body>
        <nav id="sidebarMenu" class="collapse d-lg-block sidebar collapse bg-white" style="padding: 0px;">
            <div class="position-sticky">
                <div class="list-group list-group-flush mx-3 mt-4">
                    <a class="d-block text-lg font-weight-bold text-dark mb-4">Menu</a>
					<c:if test="${admin != null}">
						<a href="#manager" id="accountManager" class="list-group-item list-group-item-action py-2 ripple">
							<i class="fas fa-user-circle fa-fw me-3"></i><span>Account manager</span>
						</a>

						<div id="manager" style="display: none;">
							<a href="staffmanager" class="list-group-item list-group-item-action py-2 ripple">
								<i class="fas fa-user-circle fa-fw me-3"></i><span>Staff manager</span>
							</a>
							<a href="adminmanager" class="list-group-item list-group-item-action py-2 ripple">
								<i class="fas fa-user-circle fa-fw me-3"></i><span>Admin manager</span>
							</a>
							<a href="customermanager" class="list-group-item list-group-item-action py-2 ripple">
								<i class="fas fa-user-circle fa-fw me-3"></i><span>Customer manager</span>
							</a>
						</div>
					</c:if>
                    <a href="#" class="list-group-item list-group-item-action py-2 ripple">
                        <i class="fas fa-shoe-prints fa-fw me-3"></i><span>Product manager</span>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action py-2 ripple">
                        <i class="fas fa-tag fa-fw me-3"></i><span>Brand manager</span>
                    </a>
                    <a href="ordermanagement?StaffID=ST2" class="list-group-item list-group-item-action py-2 ripple">
                        <i class="fas fa-clipboard-list fa-fw me-3"></i><span>Order manager</span>
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

