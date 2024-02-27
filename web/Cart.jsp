<%-- 
    Document   : Cart
    Created on : Feb 20, 2024, 7:51:27 PM
    Author     : Acer
--%>



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
            <div class="px-4 px-lg-0">

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
                                        <tbody>
                                            <c:forEach items="${listCart}" var="o">
                                                <c:forEach items="${listProduct}" var="p">
                                                    <c:if test="${o.productID == p.id}">
                                                        <tr>
                                                            <th scope="row">
                                                                <div class="p-2">

                                                                    <img src="${p.image}" alt="" width="70" class="img-fluid rounded shadow-sm">

                                                                    <div class="ml-3 d-inline-block align-middle">
                                                                        <h5 class="mb-0"> <a href="#" class="text-dark d-inline-block">${p.name}</a></h5><span class="text-muted font-weight-normal font-italic"></span>
                                                                    </div>
                                                                </div>
                                                            </th>
                                                            <td class="align-middle"><strong>${p.price}$</strong></td>
                                                            <td class="align-middle"><strong>${p.color}</strong></td>
                                                            <td class="align-middle"><strong>${p.delivery}</strong></td>

                                                            <td class="align-middle">
                                                                <strong>${o.size}</strong>
                                                            </td>

                                                            <td class="align-middle">
                                                                <a href="subAmountCart?productID=${o.productID}&amount=${o.amount}"><button class="btnSub">-</button></a> 
                                                                <strong>${o.amount}</strong>
                                                                <a href="addAmountCart?productID=${o.productID}&amount=${o.amount}"><button class="btnAdd">+</button></a>
                                                            </td>
                                                            <td class="align-middle"><a href="deleteCart?productID=${o.productID }" class="text-dark">
                                                                    <button type="button" class="btn btn-danger">Delete</button>
                                                                </a>
                                                            </td>
                                                        </tr> 
                                                    </c:if>
                                                </c:forEach>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- End -->
                            </div>
                        </div>



                        <table class="min-w-full divide-y divide-gray-200  ">
                            <thead>
                                <tr>
                                    <th scope="col" class="px-32 py-10 text-left text-lg font-medium ml-3">
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
                                </tr>
                            </thead>
                            <tbody class="bg-white divide-y divide-gray-200">
                                <tr>
                                    
                                       <td class="px-32 py-10 whitespace-nowrap">
                            <span class="font-medium text-lg">Nice Airmax 270 react</span>
                            </td>
                            <td class="px-4 py-10 whitespace-nowrap">
                                $988
                            </td>
                            <td class="px-4 py-10 whitespace-nowrap">
                                1
                            </td>
                            <td class="px-4 py-10 whitespace-nowrap">
                                $499
                            </td>
                            </tr>
                            <tr>


                                <td class="px-32 py-10 whitespace-nowrap">
                                    <span class="font-medium text-lg">Nice Airmax 270 react</span>
                                </td>
                                <td class="px-4 py-10 whitespace-nowrap">
                                    $988
                                </td>
                                <td class="px-4 py-10 whitespace-nowrap">
                                    1
                                </td>
                                <td class="px-4 py-10 whitespace-nowrap">
                                    $499
                                </td>
                            </tr>
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
                                            <td class="p-3 border border-gray-300 pr-8">Subtotal</td>
                                            <td class="p-3 border border-gray-300">$998</td>
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
