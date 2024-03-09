<%-- Document : myProfile Created on : Feb 27, 2024, 8:58:28 AM Author : Doan Thanh Phuc - CE170580 --%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@page contentType="text/html" pageEncoding="UTF-8" %>
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
                                                    <div class="datetime font-light">20/1/2023</div>
                                                </div>
                                                <div
                                                    class="md:w-32 md:h-10 border-2  rounded-xl flex items-center justify-center bg-white text-blue-400">
                                                    Success
                                                </div>
                                            </div>

                                            <div class="Body md:px-6 pt-3">
                                                <div class="product md:flex ">
                                                    <img class="md:w-52 md:mr-3 md:mb-3"
                                                        src="/assets/img/products/image Product1.jpg" alt="product">
                                                    <div class="content_product">
                                                        <h3 class="name-product font-bold">Adidas Pro3</h3>
                                                        <div class="font-light">Bule/30</div>
                                                        <div class="font-light">x 1</div>
                                                        <div class="font-bold">240$</div>
                                                    </div>
                                                </div>
                                                <div class="border-t border-gray-400 my-2"></div>
                                                <div class="product md:flex ">
                                                    <img class="md:w-52 md:mr-3 md:mb-3"
                                                        src="/assets/img/products/image Product1.jpg" alt="product">
                                                    <div class="content_product">
                                                        <h3 class="name-product font-bold">Adidas Pro3</h3>
                                                        <div class="font-light">Bule/30</div>
                                                        <div class="font-light">x 1</div>
                                                        <div class="font-bold">240$</div>
                                                    </div>
                                                </div>
                                                <div class="border-t border-gray-400 my-2"></div>
                                                <div class="product md:flex ">
                                                    <img class="md:w-52 md:mr-3 md:mb-3"
                                                        src="/assets/img/products/image Product1.jpg" alt="product">
                                                    <div class="content_product">
                                                        <h3 class="name-product font-bold">Adidas Pro3</h3>
                                                        <div class="font-light">Bule/30</div>
                                                        <div class="font-light">x 1</div>
                                                        <div class="font-bold">240$</div>
                                                    </div>
                                                </div>
                                                <div class="border-t border-gray-400 my-2"></div>
                                                <div class="product md:flex ">
                                                    <img class="md:w-52 md:mr-3 md:mb-3"
                                                        src="/assets/img/products/image Product1.jpg" alt="product">
                                                    <div class="content_product">
                                                        <h3 class="name-product font-bold">Adidas Pro3</h3>
                                                        <div class="font-light">Bule/30</div>
                                                        <div class="font-light">x 1</div>
                                                        <div class="font-bold">240$</div>
                                                    </div>
                                                </div>
                                                <div class="border-t border-gray-400 my-2"></div>
                                                <div class="product md:flex ">
                                                    <img class="md:w-52 md:mr-3 md:mb-3"
                                                        src="/assets/img/products/image Product1.jpg" alt="product">
                                                    <div class="content_product">
                                                        <h3 class="name-product font-bold">Adidas Pro3</h3>
                                                        <div class="font-light">Bule/30</div>
                                                        <div class="font-light">x 1</div>
                                                        <div class="font-bold">240$</div>
                                                    </div>
                                                </div>
                                                <div class="border-t border-gray-400 my-2"></div>
                                            </div>
                                            <div
                                                class="footer-order md:flex justify-between justify-items-center md:p-3">
                                                <button
                                                    class="md:p-2 text-center border-2 border-black rounded-xl hover:text-white hover:bg-black transition duration-300 ease-in-out">
                                                    Repurchase
                                                </button>

                                                <div>
                                                    <div>Total:</div>
                                                    <div>20.000$</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                    </div>
                    <%@include file="/Components/footer.jsp" %>
            </body>

            </html>