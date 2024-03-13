<%-- Document : productDetail Created on : Feb 28, 2024, 9:39:14 AM Author : Doan Thanh Phuc - CE170580 --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <%@include file="/Components/head.jsp" %>
        <title>Product Detail</title>
    </head>

    <body>
        <%@include file="/Components/header.jsp" %>
        <P>${error}</P>
        <div class=" md:mx-28 h-auto mx-3 md:mt-28">
            <div class="Product_Infor grid md:grid-cols-2 md:mb-2">
                <div class="Product_Img">
                    <img class="md:w-4/5 md:h-4/6 w-full"
                         src="/assets/img/products/${product.primaryImage.imageURL}" alt="img">
                    <div class="small_Product md:grid md:grid-cols-4 md:my-9 md:w-5/6 hidden">
                        <c:forEach var="c" items="${listImg}">
                            <img class="md:w-3/4 h-32 border-2 border-gray-300"
                                 src="/assets/img/products/${c.imageURL}" alt="">
                        </c:forEach>
                    </div>
                </div>
                <div class="product_select grid md:gap-0 gap-5 md:py-0 py-4">
                    <div class="Product_Name font-bold text-3xl">${product.productName}</div>
                    <div class="border-t border-gray w-full"></div>
                    <div class="flex gap-10 md:items-center md:mx-2 w-full">
                        <div>
                            <span class="text-[#40BFFF] font-bold text-[10px] text-lg">${product.price -
                                                                                         product.price
                                                                                         * (product.discount/100)}</span>
                        </div>
                        <div class="flex flex-row gap-2">
                            <span
                                class="text-[#9098B1] line-through text-[8px] text-base">$${product.price}</span>
                            <span
                                class="text-[#FB7181] font-bold text-[8px]  text-base">${product.discount}%
                                Off</span>
                        </div>
                    </div>
                    <div class="Added_Infor grid md:gap-3 gap-5 text-xl font-medium w-full md:w-1/2">
                        <div class="Availability flex justify-between text-lg md:text-xl">
                            <p>Availability:</p>
                            <p>In Stock</p>
                        </div>
                        <div class="Availability flex justify-between text-lg md:text-xl">
                            <p>Categories:</p>
                            <p>${brand.brandName}</p>
                        </div>
                        <div class="Availability flex justify-between text-lg md:text-xl">
                            <p>Free Shipping</p>
                        </div>
                    </div>
                    <!-- line -->
                    <div class="border-t border-gray w-full"></div>
                    <div
                        class="select_Color md:text-xl grid md:grid-cols-2 md:gap-0 gap-5 md:w-3/4 w-full">
                        <div class="color_Content text-xl font-bold">Select Color:</div>
                        <div class="color grid grid-cols-4" id="color">
                            <c:forEach var="proVarC" items="${variantBySize}">
                                <label class="color-label bg-${proVarC.color}-500 rounded-full w-7 h-7 border-3 border-transparent transition duration-200 ease-in-out" for="${proVarC.color}" onclick="selectColor(this)"
                                       onmouseenter="this.style.border= '3px solid #40BFFF';"
                                       onmouseout="this.style.border = '0px solid transparent';"></label>
                                <input class="color" hidden type="radio" name="color" id="${proVarC.color}" value="${proVarC.color}">
                            </c:forEach>


                        </div>
                    </div>
                    <div class="select_Size text-xl grid grid-cols-2 w-full md:w-3/4 items-center">
                        <div class="color_Content text-xl font-bold">Size:</div>
                        <Select class="border-2 rounded-lg p-2 md:w-52" id="size" onchange="handleColorChange('${product.productId}', this)" >
                            <c:forEach var="size" items="${sizeList}">
                                <option value="${size}">${size}</option>
                            </c:forEach>
                        </Select>
                    </div>
                    <!-- line -->
                    <div class="border-t border-gray w-full md:my-5 my-3"></div>
                    <div class="numberAndCart flex justify-between md:w-5/6">
                        <div
                            class="Number flex md:justify-between justify-evenly px-3  md:text-xl text-sm font-medium bg-gray-200 w-2/6 rounded-lg md:py-0 py-3">
                            <button id="subtractBtn" class="sub text-sky-400 md:text-2xl"><i
                                    class='bx bx-minus'></i></button>
                            <input id="amountInput" min="1" value="1"
                                   class="amount outline-none bg-gray-200 ml-4 w-1/4" type="number">
                            <button id="addBtn" class="plus text-sky-400 md:text-2xl"><i
                                    class='bx bx-plus'></i></button>
                        </div>
                        <c:if test="${customer != null}">
                            <button onclick="addToCart('${product.productId}')"
                                    class="Cart bg-sky-200 text-sky-500 flex md:p-3 items-center gap-4 rounded-lg md:py-0 py-3">
                                <i class='bx bx-cart text-2xl'></i>
                                Add to cart
                            </button>
                        </c:if>
                        <c:if test="${customer == null}">
								<button onclick="message('warning', 'You are not logged in', 'Log in to add to cart', () => {
										window.location.href = '/customerLogin'
									})"
								class="Cart bg-sky-200 text-sky-500 flex md:p-3 items-center gap-4 rounded-lg md:py-0 py-3">
                                <i class='bx bx-cart text-2xl'></i>
                                Add to cart
                            </button>
                        </c:if>
                    </div>
                </div>
            </div>
            <div class="border-t border-gray w-full my-5"></div>

            <div class="Product_Review rounded-lg bg-gray-200 h-auto pt-5 pb-16 md:mt-20">
                <div class="InforTitle text-3xl md:text-xl md:px-10 text-sky-500 ">Product Information</div>
                <!-- line -->
                <div class="border-t-2 border-gray-300 w-full my-5 "></div>
                <div class="InforContent md:px-10 md:text-sm text-gray-500 grid gap-5">
                    <p>air max are always very comfortable fit, clean and just perfect in every way. just
                        the
                        box was too
                        small
                        and scrunched the sneakers up a little bit, not sure if the box was always this
                        small
                        but the 90s
                        are
                        and will always be one of my favorites.</p>
                    <p>air max are always very comfortable fit, clean and just perfect in every way. just
                        the
                        box was too
                        small
                        and scrunched the sneakers up a little bit, not sure if the box was always this
                        small
                        but the 90s
                        are
                        and will always be one of my favorites.</p>
                    <p>air max are always very comfortable fit, clean and just perfect in every way. just
                        the
                        box was too
                        small
                        and scrunched the sneakers up a little bit, not sure if the box was always this
                        small
                        but the 90s
                        are
                        and will always be one of my favorites.</p>
                </div>
            </div>
        </div>
        <div class="Relate_Product md:my-16 h-auto mb-10 ">
            <div class="Content_Relate text-3xl font-bold text-center py-10">RELATE PRODUCTS</div>
            <div class="grid md:grid-cols-4 gap-12 mx-20">
                <c:forEach var="relate" items="${relateP}">
                    <div onclick="redirectToDetailPage('${relate.productId}')"
                         class="border-solid border-2 h-full pb-[10px] md:pb-[20px] md:h-auto relative shadow-lg rounded-xl hover:scale-105 transition-all duration-200 ease-in hover:cursor-pointer">
                        <img src="/assets/img/products/${relate.primaryImage.imageURL}" class="h-96 rounded-t-xl" alt="img"
                             class="w-full" />
                        <div class="text-center md:mt-2 mt-1">
                            <p class="text-[10px] md:text-xl h-20 font-[700]">${relate.productName}</p>
                            <p class="text-[7px] md:text-[sm] font-medium md:text-base">
                                ${relate.description}</p>
                            <div
                                class="flex justify-between px-2 pt-2 items-center md:px-[40px] md:pt-[10px]">
                                <div>
                                    <span
                                        class="text-[#40BFFF] font-bold text-[10px] text-lg">${relate.price
                                                                                           - relate.price * (relate.discount/100)}</span>
                                </div>
                                <div class="flex flex-row gap-2">
                                    <span
                                        class="text-[#9098B1] line-through text-[8px] text-base">${relate.price}</span>
                                    <span
                                        class="text-[#FB7181] font-bold text-[8px] text-base">${relate.discount}%
                                        Off</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <%@include file="/Components/footer.jsp" %>
        <script src="/assets/js/validation/amountInputDetail.js">
        </script>

    </body>

</html>