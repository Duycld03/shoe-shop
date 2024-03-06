<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="DAOs.CartDAO" %>
<%@ page import="Models.Customer" %>
<%
        Customer customer = (Customer)request.getAttribute("customer");
        if(customer != null){
                CartDAO cartDAO = new CartDAO();
                int productCount = cartDAO.getProductCountByCustomerId(customer.getCustomerId());
                request.setAttribute("productCount", productCount);
        }

%>
<header class="shadow-sm">
    <div class="px-4 md:px-24 md:pt-8 pt-4 pb-4 flex justify-between items-center text-lg">
        <div class="text-xs md:text-lg flex space-x-2 md:space-x-4">
            <div class="flex space-x-1">
                <span>EN</span>
                <img src="/assets/img/svg/arrow down.svg" alt="">
            </div>
            <div class="flex space-x-1">
                <span>USD</span>
                <img src="/assets/img/svg/arrow down.svg" alt="">
            </div>
        </div>
        <div>
            <ul class="flex md:space-x-8 space-x-2 text-xs md:text-lg items-center">
                <c:choose>
                    <c:when test="${customer != null}">
                        <li>
                            <a href="/profile" class="flex space-x-2 items-center">
                                <img src="/assets/img/svg/profile_close_2.svg" alt="profile">
                                <span>${customer.username}</span>
                            </a>
                        </li>
                        <li class="relative">
                            <a href="Cart.jsp">
                                <img src="/assets/img/svg/Cart.svg" alt="">
                                <span
                                    class="absolute -top-1/4 -right-1/4 bg-[#FB7181] w-5 h-5 rounded-full text-[10px] flex justify-center items-center text-white">${productCount}</span>
                            </a>
                        </li>
                        <li class="hover:text-sky-400 transition-all duration-200">
                            <span>Hi, ${customer.fullname}</span>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li>
                            <a href="/profile" class="flex space-x-2 items-center">
                                <img src="/assets/img/svg/profile_close_2.svg" alt="profile">
                                <span>My profile</span>
                            </a>
                        </li>
                        <li class="relative">
                            <a href="Cart.jsp">
                                <img src="/assets/img/svg/Cart.svg" alt="">
                                <span
                                    class="absolute -top-1/4 -right-1/4 bg-[#FB7181] w-5 h-5 rounded-full text-[10px] flex justify-center items-center text-white">0</span>
                            </a>
                        </li>
                        <li class="hover:text-sky-400 transition-all duration-200">
                            <a href="/signUp">Register</a>
                        </li>
                        <li class="hover:text-sky-400 transition-all duration-200">
                            <a href="/customerLogin">Login</a>
                        </li>
                    </c:otherwise>
                </c:choose>

                <li>
                    <a href="#">
                        <img src="/assets/img/svg/search-icon.svg" alt="">
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <hr>
    <div class="px-4 md:px-24 flex md:justify-between items-center py-4 flex-col md:flex-row">
        <div class="mb-4 md:mb-0">
            <a href="#" class="flex items-center space-x-2">
                <img src="/assets/img/svg/Icon.svg" alt="">
                <span class="font-bold text-lg">E-Comm</span>
            </a>
        </div>
        <div>
            <ul class="flex items-center md:space-x-24 md:text-2xl font-medium space-x-4">
                <li class="text-[#40BFFF] hover:text-sky-400 transition-all duration-200"><a href="#">HOME</a></li>
                <li class="hover:text-sky-400 transition-all duration-200"><a href="/managerLogin">MANAGER</a></li>
                <li class="hover:text-sky-400 transition-all duration-200"><a href="/productFilter">SNEAKERS</a></li>
                <li class="hover:text-sky-400 transition-all duration-200"><a href="productDetail.jsp">BELT</a></li>
                <li class="hover:text-sky-400 transition-all duration-200"><a href="#">CONTACT</a></li>
            </ul>
        </div>
    </div>
</header>