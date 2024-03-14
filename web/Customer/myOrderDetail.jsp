<%-- Document : myProfile Created on : Feb 27, 2024, 8:58:28 AM Author : Doan Thanh Phuc - CE170580 --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="DAOs.ProductDAO" %>
<%@page import="DAOs.ProductVariantsDAO" %>
<%@page import="Models.Product" %>
<%@page import="Models.OrderDetail" %>
<%@page import="Models.ProductVariant" %>
<!DOCTYPE html>
<html>

    <head>
        <title>My profile</title>
        <%@include file="/Components/head.jsp" %>
    </head>

    <body>
        <%
          ProductDAO productDAO=new ProductDAO();
          ProductVariantsDAO productVariantDAO= new ProductVariantsDAO();
        %>
        <%@include file="/Components/header.jsp" %>
        <div class=" md:flex-wrap w-full h-auto md:flex md:justify-evenly md:my-4">
            <!-- Main Contail profile -->
            <%@include file="/Customer/leftProfile.jsp" %>
            <%--<%@include file="/Customer/leftProfile.jsp" %>--%>
            <div class="OrderDetail md:w-2/4 rounded-xl my-8 p-10 border-2 border-black-500">
                <div>
                    <div class="Header_Content md:text-3xl md:font-medium md:pb-5">Order history
                    </div>
                    <div class="Header_Content md:text-lg md:font-light md:mb-2">Your order: 1</div>
                    <div class="ProductPurches bg-gray-300 rounded-lg">
                        <div
                            class="headerPurches bg-blue-400 rounded-lg text-white flex md:px-5 justify-between items-center p-4">
                            <div>
                                <div class="Date-Content font-bold">Date of purchase:</div>
                                <div class="datetime font-light"><fmt:formatDate value="${order.orderDate}" pattern="dd-MM-yyyy" />
                                </div>
                            </div>
                            <div
                                class="md:w-32 md:h-10 border-2  rounded-xl flex items-center justify-center bg-white text-blue-400">
                                ${order.orderStatus}
                            </div>
                        </div>
                        <div class="Body md:px-6 pt-3">
                            <c:forEach var="de" items="${requestScope.orderDetails}">
                                <c:set var="orderDetail" value="${de}" />
                                <%
                                        OrderDetail detail = (OrderDetail)pageContext.getAttribute("orderDetail");
                                        ProductVariant
                                        productVariant=productVariantDAO.getVariantByID(detail.getProductVariant().getVariantId());
                                        Product product=productDAO.getProductByID(productVariant.getProductId());
                                %>
                                <div class="product md:flex ">
                                    <img class="md:w-52 md:mr-3 md:mb-3"
                                         src="/assets/img/products/<%= product.getPrimaryImage().getImageURL()%>">
                                    <div class="content_product">
                                        <h3 class="name-product font-bold">Adidas Pro3</h3>
                                        <div class="font-light">${de.getProductVariant().getColor()}/${de.getProductVariant().getSize()}</div>
                                        <div class="font-light text-sm">x ${de.quantity}</div>
                                        <div class="font-bold">${de.price}$</div>
                                    </div>
                                </div>
                                <div class="border-t border-gray-400 my-2"></div>
                            </c:forEach>
                        </div>
                        <div
                            class="footer-order md:flex justify-between justify-items-center md:p-3">
                            <a href="/profile/orderHistory" class=" bg-gray-300 hover:bg-black font-bold py-2 px-2 hover:text-white rounded-xl border-2 border-gray-500">
                                Back to List
                            </a>
                            <div>
                                <div>Total:</div>
                                <div class="font-bold text-2xl">${order.totalAmount}$</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/Components/footer.jsp" %>
    </body>

</html>