<%-- Document : myProfile Created on : Feb 27, 2024, 8:58:28 AM Author : Doan Thanh Phuc - CE170580 --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

    <head>
        <title>My profile</title>
        <%@include file="/Components/head.jsp" %>
    </head>

    <body>
        <%@include file="/Components/header.jsp" %>
        <div class=" md:flex-wrap w-full h-auto md:flex md:justify-evenly md:my-4">
            <!-- Main Contail profile -->
            <%@include file="/Customer/leftProfile.jsp" %>
            <%--<%@include file="/Customer/leftProfile.jsp" %>--%>

            <div class="h-auto  md:w-3/5 rounded-2xl bg-gray-100 grid md:gap-8 gap-5">
                <!-- Profile Icon -->
                <section class="bg-[#40BFFF] rounded-t-2xl	 flex gap-2 items-center">
                    <div class="Profile_Name text-white md:font-bold md:text-4xl ml-4 p-4">Order
                        Table
                    </div>
                </section>
                <!-- Profile information -->
                <div class="container mx-auto">
                    <div class="overflow-x-auto">
                        <table class="table-auto border-collapse border border-gray-800 w-full">
                            <thead>
                                <tr class="bg-gray-200 text-gray-700">
                                    <th class="border border-gray-400 py-2">No.</th>
                                    <th class="border border-gray-400 py-2">OrderDate</th>
                                    <th class="border border-gray-400 py-2">PaymentStatus</th>
                                    <th class="border border-gray-400 py-2">OrderStatus</th>
                                    <th class="border border-gray-400 py-2">TotalAmount</th>
                                    <th class="border border-gray-400 py-2">PaymentMethod</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set value="1" var="cont"/>

                                <c:forEach items="${orders}" var="order">
                                    <tr class="text-gray-700">
                                        <td class="border border-gray-400 py-2 text-center">
                                            <a class="font-medium text-blue-600 dark:text-blue-500 underline"
                                               href="/profile/orderHistory/orderDetail?id=${order.orderId}">
                                                ${cont}
                                            </a>
                                        </td>
                                        <td class="border border-gray-400 py-2 text-center">
                                            <fmt:formatDate value="${order.orderDate}" pattern="dd-MM-yyyy" />
                                        </td>
                                        <td class="border border-gray-400 py-2 text-center">
                                            ${order.paymentStatus}
                                        </td>
                                        <td class="border border-gray-400 py-2 text-center">
                                            ${order.orderStatus}
                                        </td>
                                        <td class="border border-gray-400 py-2 text-center">
                                            ${order.totalAmount}
                                        </td>
                                        <td class="border border-gray-400 py-2 text-center">
                                            ${order.paymentMethod}
                                        </td>
                                    </tr>
                                    <c:set var="cont" value="${cont + 1}" />
                                </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/Components/footer.jsp" %>
    </body>

</html>