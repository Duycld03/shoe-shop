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
                                        <!-- comment  <tr>
                                            <th scope="col" class="border-0 bg-light">
                                                <div class="p-2 px-3 text-uppercase">S?n Ph?m</div>
                                            </th>
                                            <th scope="col" class="border-0 bg-light">
                                                <div class="py-2 text-uppercase">??n Giá</div>
                                            </th>
                                            <th scope="col" class="border-0 bg-light">
                                                <div class="py-2 text-uppercase">Màu S?c</div>
                                            </th>
                                            <th scope="col" class="border-0 bg-light">
                                                <div class="py-2 text-uppercase">Delivery</div>
                                            </th>
                                            <th scope="col" class="border-0 bg-light">
                                                <div class="py-2 text-uppercase">Kích Th??c</div>
                                            </th>
                                            <th scope="col" class="border-0 bg-light">
                                                <div class="py-2 text-uppercase">S? L??ng</div>
                                            </th>
                                            <th scope="col" class="border-0 bg-light">
                                                <div class="py-2 text-uppercase">Xóa</div>
                                            </th>
                                        </tr> 
                                        -->



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

                        </<!--  <div class="row py-5 p-4 bg-white rounded shadow-sm">

                            <div class="col-lg-6">
                                <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Thành ti?n</div>

                                <div class="p-4">
                                    <ul class="list-unstyled mb-4" id="contentTotalMoney">
                                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">T?ng ti?n hàng</strong>


                                        </li>
                                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Phí v?n chuy?n</strong><strong>Free ship</strong></li>

                                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">T?ng thanh toánnnnn</strong>

                                        </li> 
                                    </ul><a href="order" class="btn btn-dark rounded-pill py-2 btn-block text-white">Thanh Toán</a>
                                </div>
                            </div>
                        </div>  -->


                        <div class="flex font-sans">                          
                            <form class="flex-auto p-6">
                                <div class="flex flex-wrap">
                                    <h1 class="flex-auto text-lg font-semibold text-slate-900">
                                        Utility Jacket
                                    </h1>
                                    <div class="text-lg font-semibold text-slate-500">
                                        $110.00
                                    </div>
                                    <div class="w-full flex-none text-sm font-medium text-slate-700 mt-2">
                                        In stock
                                    </div>
                                </div>
                                <div class="flex items-baseline mt-4 mb-6 pb-6 border-b border-slate-200">
                                    <div class="space-x-2 flex text-sm">
                                        <label>
                                            <input class="sr-only peer" name="size" type="radio" value="xs" checked />
                                            <div class="w-9 h-9 rounded-lg flex items-center justify-center text-slate-700 peer-checked:font-semibold peer-checked:bg-slate-900 peer-checked:text-white">
                                                XS
                                            </div>
                                        </label>
                                        <label>
                                            <input class="sr-only peer" name="size" type="radio" value="s" />
                                            <div class="w-9 h-9 rounded-lg flex items-center justify-center text-slate-700 peer-checked:font-semibold peer-checked:bg-slate-900 peer-checked:text-white">
                                                S
                                            </div>
                                        </label>
                                        <label>
                                            <input class="sr-only peer" name="size" type="radio" value="m" />
                                            <div class="w-9 h-9 rounded-lg flex items-center justify-center text-slate-700 peer-checked:font-semibold peer-checked:bg-slate-900 peer-checked:text-white">
                                                M
                                            </div>
                                        </label>
                                        <label>
                                            <input class="sr-only peer" name="size" type="radio" value="l" />
                                            <div class="w-9 h-9 rounded-lg flex items-center justify-center text-slate-700 peer-checked:font-semibold peer-checked:bg-slate-900 peer-checked:text-white">
                                                L
                                            </div>
                                        </label>
                                        <label>
                                            <input class="sr-only peer" name="size" type="radio" value="xl" />
                                            <div class="w-9 h-9 rounded-lg flex items-center justify-center text-slate-700 peer-checked:font-semibold peer-checked:bg-slate-900 peer-checked:text-white">
                                                XL
                                            </div>
                                        </label>
                                    </div>
                                </div>
                                <div class="flex space-x-4 mb-6 text-sm font-medium">
                                    <div class="flex-auto flex space-x-4">
                                        <button class="h-10 px-6 font-semibold rounded-md bg-black text-white" type="submit">
                                            Buy now
                                        </button>
                                        <button class="h-10 px-6 font-semibold rounded-md border border-slate-200 text-slate-900" type="button">
                                            Add to bag
                                        </button>
                                    </div>
                                    <button class="flex-none flex items-center justify-center w-9 h-9 rounded-md text-slate-300 border border-slate-200" type="button" aria-label="Like">
                                        <svg width="20" height="20" fill="currentColor" aria-hidden="true">
                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M3.172 5.172a4 4 0 015.656 0L10 6.343l1.172-1.171a4 4 0 115.656 5.656L10 17.657l-6.828-6.829a4 4 0 010-5.656z" />
                                        </svg>
                                    </button>
                                </div>
                                <p class="text-sm text-slate-700">
                                    Free shipping on all continental US orders.
                                </p>
                            </form>
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
