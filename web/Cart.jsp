<%--
    Document   : Cart
    Created on : Feb 20, 2024, 7:51:27 PM
    Author     : Acer
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Models.Cart" %>
<%@page import="Models.Product" %>
<%@page import="DAOs.ProductDAO"%>
<%@page import="DAOs.CartDAO"%>
<%@page import="java.util.ArrayList" %>@
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List" %>@
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
        <%@include file="head.jsp" %>

    </head>

    <body onload="loadTotalMoney()">
        <%@include file="header.jsp" %>
        <div class="shopping-cart">
            <div class="pl-32">
                <!-- px-4 px-lg-0 pl-32 -->
                <div class="pb-5">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">

                                <!-- Shopping cart table -->
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <c:if test="${error!=null }">
                                            <div class="alert alert-danger" role="alert">
                                                ${error}
                                            </div>
                                        </c:if>
                                        <c:if test="${mess!=null }">
                                            <div class="alert alert-success" role="alert">
                                                ${mess}
                                            </div>
                                        </c:if>



                                        </thead>

                                    </table>
                                </div>
                                <!-- End -->
                            </div>
                        </div>





                        <table class="min-w-full divide-y divide-gray-200 px-8">
                            <thead>
                                <tr>
                                    <th scope="col" class="px-2 py-10 text-left text-lg font-medium ml-3">
                                        PRODUCT
                                    </th>

                                    <th scope="col" class="px-4 py-10 text-left text-lg font-medium">
                                        PRICE

                                    </th>
                                    <th scope="col" class="px-4 py-10 text-left text-lg font-medium">
                                        QTY
                                    </th>
                                    <th scope="col" class="px-4 py-10 text-left text-lg font-medium">
                                        UNIT PRICE
                                    </th>
                                    <th class="px-2 py-2">

                                    </th>
                                </tr>
                            </thead>
                            <tbody>

                                <%
                                    ResultSet listCart = (ResultSet)request.getAttribute("listCart");
                                    List<Product> listProduct = ( List<Product>)request.getAttribute("listProduct");
                                        for (Product p : listProduct ) {
                                            if (listCart.getString(6).equals(p.getProductId())) {
                                %>


                                <tr>
                                    <td class="row">
                                        <div class="p-2 flex">
                                            <img src="/assets/img/products/<%=p.getPrimaryImage().getImageURL()%>" alt="" width="70" class="img-fluid rounded shadow-sm">

                                            <div class="ml-3 d-inline-block align-middle">
                                                <h5 class="mb-0"> <a  class="text-dark d-inline-block"><%=p.getProductName()%> </a></h5><span class="text-muted font-weight-normal font-italic"></span>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="align-middle"><strong><%=p.getPrice()*listCart.getInt(2)%></strong></td>
                                    <td class="align-middle">
                                        <a href="subAmountCart?productID=<%=listCart.getString(6)%>&amount=<%=listCart.getInt(2)%>"><button class="btnSub">-</button></a>
                                        <strong><%=listCart.getInt(2)%></strong>
                                        <a href="addAmountCart?productID=<%=listCart.getString(6)%>&amount=<%=listCart.getInt(2)%>"><button class="btnAdd">+</button></a>
                                    </td>
                                    <td class="align-middle"><strong><%=p.getPrice()%></strong></td>




                                    <td class="align-middle"><a href="deleteCart?productID=<%=listCart.getString(6)%>" class="text-dark">
                                            <button type="button" class="btn btn-danger">Delete</button>
                                        </a>
                                    </td>
                                </tr>
                                <% }}%>
                            </tbody>
                        </table>
                    </div>

                    <div class="flex">
                        <div class="max-w-md w-full py-14 px-20">
                            <form class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4 py-14">
                                <div class="mb-4">
                                    <label class="block text-gray-700 text-sm font-bold mb-2 " for="voucher">
                                        Voucher Code
                                    </label>
                                    <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="voucher" type="text" placeholder="Enter voucher code">
                                </div>
                                <div class="flex items-center justify-between">
                                    <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" type="button">
                                        Apply Voucher
                                    </button>
                                    <a class="inline-block align-baseline font-bold text-sm text-blue-500 hover:text-blue-800" href="#">
                                        Cancel
                                    </a>
                                </div>
                            </form>
                        </div>




                        <div class="max-w-xs w-full mx-auto py-14">
                            <div class="max-w-xs mx-auto">
                                <table class="w-full border-collapse border border-gray-300">
                                    <tbody>
                                        <tr>
                                        </tr>
                                        <tr>
                                            <td class="p-3 border border-gray-300 pr-8">Shipping fee</td>
                                            <td class="p-3 border border-gray-300">$20</td>
                                        </tr>
                                        <tr>
                                            <td class="p-3 border border-gray-300 pr-8">Coupon</td>
                                            <td class="p-3 border border-gray-300">No</td>
                                        </tr>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td class="p-3 border border-gray-300 font-bold pr-8">Total</td>
                                            <%  CartDAO da = new CartDAO();
                                               //sua veg...thanh model tuong ung
                                                List<Cart> list = da.getAllCart();
                                                ProductDAO dao = new ProductDAO();
                                               //sua veg...thanh model tuong ung
                                                List<Product> products = dao.getAllProducts();
                                               double totalAmount = 0.0;
                                                   for (Product product : products) {
                                                       if (list.getString(6) == product.getProductId()) {
                                                           double productPrice = product.getPrice();
                                                           int productAmount = list.getInt(2);
                                                           double productTotal = productPrice * productAmount;
                                                           totalAmount += productTotal;
                                                       }
                                               }
                                            %>
                                    <strong><%= totalAmount %> $</strong>
                                    <td class="p-3 border border-gray-300 font-bold">$118</td>
                                    </tr>
                                    </tfoot>
                                </table>
                                <div class="flex justify-center mt-4">
                                    <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold px-4 py-2" type="button">
                                        Check out
                                    </button>
                                </div>
                            </div>
                        </div>



                    </div>

                </div>
            </div>
        </div>
    </div>
    <%@include file="footer.jsp" %>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
		function loadTotalMoney() {
			$.ajax({
				url: "/WebsiteBanGiay/totalMoneyCart",
				type: "get", //send it through get method
				data: {

				},
				success: function (responseData) {
					document.getElementById("contentTotalMoney").innerHTML = responseData;
				}
			});
		}

		window.addEventListener("load", function loadAmountCart() {
			$.ajax({
				url: "/WebsiteBanGiay/loadAllAmountCart",
				type: "get", //send it through get method
				data: {

				},
				success: function (responseData) {
					document.getElementById("amountCart").innerHTML = responseData;
				}
			});
		}, false);
    </script>
</body>

</html>
</html>
