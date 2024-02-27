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

                        <!--
                        <div class="px-4 md:px-24 flex md:justify-between items-center py-4 flex-col md:flex-row">
                            <div class="mb-4 md:mb-0">
                                <span class="font-medium text-lg">PRODUCT</span>
                            </div>
                            <div>
                                <ul class="flex items-center md:space-x-24 md:text-xl font-medium space-x-4">
                                    <li class=" transition-all duration-200">PRICE</li>
                                    <li class=" transition-all duration-200">QTY</li>
                                    <li class="transition-all duration-200">UNIT PRICE</li>                                
                                </ul>
                            </div>
                        </div>


                        <div class="px-4 md:px-24 flex md:justify-between items-center py-4 flex-col md:flex-row">
                                <div class="mb-2 md:mb-0">
                                    <span class="font-medium text-lg">Nice Airmax 270 react</span>
                                </div>
                                <div>
                                <ul class="flex items-center md:space-x-24 md:text-xl font-medium space-x-4 px-4">
                                    <li class="transition-all duration-200">$988</li>
                                    <li class=" transition-all duration-200">1</li>
                                    <li class="transition-all duration-200">$499</li>                                
                                </ul>
                            </div>
                        </div> -->
                        
    <table class="min-w-full divide-y divide-gray-200  ">
        <thead>
            <tr>
                <th scope="col" class="px-20 py-2 text-left text-lg font-medium ml-3">
                    PRODUCT
                </th>
                <th scope="col" class="px-4 py-2 text-left text-lg font-medium">
                    PRICE
                </th>
                <th scope="col" class="px-4 py-2 text-left text-lg font-medium">
                    QTY
                </th>
                <th scope="col" class="px-4 py-2 text-left text-lg font-medium">
                    UNIT PRICE
                </th>
            </tr>
        </thead>
        <tbody class="bg-white divide-y divide-gray-200">
            <tr>
                <td class="px-20 py-2 whitespace-nowrap">
                    <span class="font-medium text-lg">Nice Airmax 270 react</span>
                </td>
                <td class="px-4 py-2 whitespace-nowrap">
                    $988
                </td>
                <td class="px-4 py-2 whitespace-nowrap">
                    1
                </td>
                <td class="px-4 py-2 whitespace-nowrap">
                    $499
                </td>
            </tr>
            <tr>
                <td class="px-20 py-2 whitespace-nowrap">
                    <span class="font-medium text-lg">Nice Airmax 270 react</span>
                </td>
                <td class="px-4 py-2 whitespace-nowrap">
                    $988
                </td>
                <td class="px-4 py-2 whitespace-nowrap">
                    1
                </td>
                <td class="px-4 py-2 whitespace-nowrap">
                    $499
                </td>
            </tr>
        </tbody>
    </table>
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
