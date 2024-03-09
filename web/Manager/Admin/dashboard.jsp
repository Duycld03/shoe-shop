<%-- Document : staffmanager Created on : Feb 26, 2024, 7:39:02 PM Author : To Do Hong Y - CE171148 --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>JSP Page</title>
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
                <link rel="stylesheet" href="/assets/css/icon.css">
                <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
                <script src="/assets/js/validation/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
                <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
                <script src="/assets/js/script.js"></script>
            </head>

            <body>
                <header>
                    <jsp:include page="/Manager/left_sidebar.jsp"></jsp:include>
                </header>
                <main>
                    <div class="row" style="margin: 20px;">
                        <div class="col-xl-3 col-sm-6">
                            <div class="card">
                                <div class="card-body" style="padding: 20px;">
                                    <div class="d-flex gap-3 flex-wrap align-items-top justify-content-between">
                                        <div class="flex-fill d-flex align-items-top mb-4 mb-sm-0">
                                            <div class="" style="margin-right: 16px;">
                                                <span
                                                    class="d-flex justify-content-center align-items-center rounded-circle"
                                                    style="width: 48px; height: 48px; color: #fff; background-color: #845adf;">
                                                    <i class="fas fa-dollar-sign"></i>
                                                </span>
                                            </div>

                                            <div>
                                                <span class="d-block text-muted">
                                                    Total Revenue
                                                </span>
                                                <span class="font-weight-bold" style="font-size: 16px;">$${totalRevenue}
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-sm-6">
                            <div class="card">
                                <div class="card-body" style="padding: 20px;">
                                    <div class="d-flex gap-3 flex-wrap align-items-top justify-content-between">
                                        <div class="flex-fill d-flex align-items-top mb-4 mb-sm-0">
                                            <div class="" style="margin-right: 16px;">
                                                <span
                                                    class="d-flex justify-content-center align-items-center rounded-circle"
                                                    style="width: 48px; height: 48px; color: #fff; background-color: #f5b849;">
                                                    <i class="fas fa-cart-arrow-down"></i>
                                                </span>
                                            </div>

                                            <div>
                                                <span class="d-block text-muted">
                                                    Total Order
                                                </span>
                                                <span class="font-weight-bold"
                                                    style="font-size: 16px;">${totalOrder}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-sm-6">
                            <div class="card">
                                <div class="card-body" style="padding: 20px;">
                                    <div class="d-flex gap-3 flex-wrap align-items-top justify-content-between">
                                        <div class="flex-fill d-flex align-items-top mb-4 mb-sm-0">
                                            <div class="" style="margin-right: 16px;">
                                                <span
                                                    class="d-flex justify-content-center align-items-center rounded-circle"
                                                    style="width: 48px; height: 48px; color: #fff; background-color: #23b7e5;">
                                                    <i class="fas fa-store"></i>
                                                </span>
                                            </div>

                                            <div>
                                                <span class="d-block text-muted">
                                                    Total Product
                                                </span>
                                                <span class="font-weight-bold"
                                                    style="font-size: 16px;">${totalProduct}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-sm-6">
                            <div class="card">
                                <div class="card-body" style="padding: 20px;">
                                    <div class="d-flex gap-3 flex-wrap align-items-top justify-content-between">
                                        <div class="flex-fill d-flex align-items-top mb-4 mb-sm-0">
                                            <div class="" style="margin-right: 16px;">
                                                <span
                                                    class="d-flex justify-content-center align-items-center rounded-circle"
                                                    style="width: 48px; height: 48px; color: #fff;background-color: #26bf94;">
                                                    <i class="fas fa-users"></i>
                                                </span>
                                            </div>

                                            <div>
                                                <span class="d-block text-muted">
                                                    Total Users
                                                </span>
                                                <span class="font-weight-bold" style="font-size: 16px;">${totalUsers}
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="margin: 20px;">
                        <div class="col-12">
                            <div class="card mx-auto" style="max-width:600px">
                                <div class="card-header">
                                    <div class="card-title"
                                        style="font-size: 16px; font-weight: bold; text-align: center;">
                                        Overview of the current year
                                    </div>
                                </div>
                                <div class="card-body" style="padding: 20px;">
                                    <div id="chart"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <script src="/assets/js/validation/bootstrap.min.js"></script>
                <script src="/assets/js/dashboard.js"></script>
                <script>
                    var options = {
                        chart: {
                            type: 'line',
                            toolbar: {
                                show: false
                            }
                        },
                        series: [{
                            name: 'revenue',
                            data: [${ revenueDate }]
                        }, {
                            name: 'order',
                            data: [${ orderData }]
                        }
                        ],
                        xaxis: {
                            categories: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
                        },
                        colors: [
                            "#845adf",
                            "#f5b849"
                        ],
                        markers: {
                            size: 4
                        }
                    }
                    var chart = new ApexCharts(document.querySelector("#chart"), options);
                    chart.render();
                </script>
                <c:if test="${sessionScope.error != null}">
                    <script>
                        message("error", "${sessionScope.error}")
                    </script>
                    <% session.removeAttribute("error");%>
                </c:if>
                <c:if test="${sessionScope.success != null}">
                    <script>
                        message("success", "${sessionScope.success}")
                    </script>
                    <% session.removeAttribute("success");%>
                </c:if>
            </body>

            </html>