<%-- Document : filterProduct Created on : Feb 2, 2024, 7:01:51 PM Author : Doan Thanh Phuc - CE170580 --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <title>JSP Page</title>
            <link rel="stylesheet" href="assets/css/Price_Range.css" />
            <%@include file="head.jsp" %>
        </head>

        <body class="m-0">
            <%@include file="header.jsp" %>
                <div
                    class=" grid grid-cols-1 gap-4 mx-2 md:flex md:w-full md:justify-between mt-[20px] h-auto mt-[20px] md:my-[40px] my-0">
                    <div class="slide-bar md:w-[25%]  md:ml-[50px] md:mr-0">
                        <!-- Hot deal box -->
                        <div
                            class="Hot-deal-box md:pt-[1.5rem] md:pr-[1.491rem] md:pb-[1rem] md:mb-8 md:pl-6 bg-[#F6F7F8] pb-2 pb:10px mb-3 w-full">
                            <p class=" font-bold md:text-[30px] md:mb-6 pt-1 text-xl">Hot deal</p>
                            <div class="hot-deal-content font-light text-sm md:text-[1.2rem]">
                                <div>
                                    <a href="#"
                                        class="flex justify-between  md:text-[20px] px-[5px] md:mb-3 hover:text-[#40BFFF]  transition-all duration-200 ease-in hover:cursor-pointer">
                                        <p class="">Nike</p>
                                        <p class="">2</p>
                                    </a>
                                    <a href="#"
                                        class="flex justify-between  md:text-[20px] px-[5px] md:mb-3 hover:text-[#40BFFF]  transition-all duration-200 ease-in hover:cursor-pointer">
                                        <p class="">Nike</p>
                                        <p class="">2</p>
                                    </a>
                                    <a href="#"
                                        class="flex justify-between  md:text-[20px] px-[5px] md:mb-3 hover:text-[#40BFFF]  transition-all duration-200 ease-in hover:cursor-pointer">
                                        <p class="">Nike</p>
                                        <p class="">2</p>
                                    </a>
                                    <a href="#"
                                        class="flex justify-between  md:text-[20px] px-[5px] md:mb-3 hover:text-[#40BFFF]  transition-all duration-200 ease-in hover:cursor-pointer">
                                        <p class="">Nike</p>
                                        <p class="">2</p>
                                    </a>
                                    <a href="#"
                                        class="flex justify-between  md:text-[20px] px-[5px] md:mb-3 hover:text-[#40BFFF]  transition-all duration-200 ease-in hover:cursor-pointer">
                                        <p class="">Nike</p>
                                        <p class="">2</p>
                                    </a>
                                    <a href="#"
                                        class="flex justify-between  md:text-[20px] px-[5px] md:mb-3 hover:text-[#40BFFF]  transition-all duration-200 ease-in hover:cursor-pointer">
                                        <p class="">Nike</p>
                                        <p class="">2</p>
                                    </a>
                                </div>

                            </div>
                        </div>
                        <!-- Price range -->
                        <div
                            class="Hot-deal-box md:pt-[1.5rem] md:pr-[1.491rem] md:pb-[1rem] md:mb-8 md:pl-6 bg-[#F6F7F8] pb-[10px]  h-auto w-full mb-3">
                            <div class="custom-wrapper w-full md:pr-[25px] md:pb-[40px] md:left-[63px] mx-0 md:mx-1">
                                <div class="price-input-container w-full ">
                                    <p class=" font-bold md:text-[30px] md:mb-6 pt-1 text-xl">Price</p>
                                    <div class="flex md:justify-between  w-full items-center">
                                        <p class="  md:mb-6 md:text-xl font-medium text-[15px]">Range:</p>
                                        <div
                                            class="price-input flex items-center md:items-center mb-3 mt-2 md:mb-[22px] md:w-[60%]">
                                            <input type="number"
                                                class="min-input w-14 mx-5  md:text-[20px] md:w-[75px] md:h-[30px] md:mx-1  border rounded-md"
                                                value="2500">
                                            <p class="md:font-medium  text-sm md:mx-2 items-center md:text-[20px]">to
                                            </p>
                                            <input type="number"
                                                class="max-input w-14 mx-5 md:text-[20px] md:w-[75px] md:h-[30px] md:mx-1  border rounded-md"
                                                value="8500">
                                        </div>
                                    </div>
                                    <div
                                        class="slider-container  h-[3px] md:h-[5px] relative bg-[#e4e4e4] rounded-[5px] w-auto">
                                        <div
                                            class="price-slider h-full left-[25%] right-[15%] absolute rounded-[5px] bg-[#05a3e7]">
                                        </div>
                                    </div>
                                </div>
                                <!-- Slider -->
                                <div class="range-input relative">
                                    <input type="range" class="min-range " min="0" max="10000" value="2500" step="1">
                                    <input type="range" class="max-range" min="0" max="10000" value="8500" step="1">
                                </div>
                            </div>
                        </div>

                        <div
                            class="Hot-deal-box md:pt-[1.5rem] md:pr-[1.491rem] md:pb-[1rem] pb-[15px] md:mb-8 md:pl-6 bg-[#F6F7F8] h-auto w-full mb-3">
                            <p class=" font-bold mb-3 md:text-[30px] md:mb-6 pt-1 text-xl">Color</p>
                            <div class="flex md:justify-evenly md:items-center md:mt-10">
                                <img src="assets/img/color/blue-removebg-preview.png"
                                    class="m-auto md:w-7 w-5 h-auto mb-3 border-3 border-transparent rounded-full transition duration-200 ease-in-out hover:border-blue-500 "
                                    onmouseenter="this.style.border = '3px solid #40BFFF';"
                                    onmouseout="this.style.border = '0px solid transparent';" />

                                <img src="assets/img/color/ellipse-1-copy-2-9tY.png"
                                    class="m-auto md:w-[25px] w-[20px] h-auto mb-3 border-3 border-transparent rounded-full transition duration-200 ease-in-out hover:border-blue-500 "
                                    onmouseover="this.style.border = '3px solid #40BFFF';"
                                    onmouseout="this.style.border = '0px solid transparent';" />

                                <img src="assets/img/color/ellipse-1-copy-3(2).png"
                                    class="m-auto md:w-[25px] w-[20px] h-auto mb-3 border-3 border-transparent rounded-full transition duration-200 ease-in-out hover:border-blue-500 "
                                    onmouseover="this.style.border = '3px solid #40BFFF';"
                                    onmouseout="this.style.border = '0px solid transparent';" />

                                <img src="assets/img/color/ellipse-1-copy-4(2).png"
                                    class="m-auto md:w-[25px] w-[20px] h-auto mb-3 border-3 border-transparent rounded-full transition duration-200 ease-in-out hover:border-blue-500 "
                                    onmouseover="this.style.border = '3px solid #40BFFF';"
                                    onmouseout="this.style.border = '0px solid transparent';" />

                                <img src="assets/img/color/ellipse-1-copy-5(2).png"
                                    class="m-auto md:w-[25px] w-[20px] h-auto mb-3 border-3 border-transparent rounded-full transition duration-200 ease-in-out hover:border-blue-500 "
                                    onmouseover="this.style.border = '3px solid #40BFFF';"
                                    onmouseout="this.style.border = '0px solid transparent';" />

                                <img src="assets/img/color/ellipse-1-copy-6(2).png"
                                    class="m-auto md:w-[25px] w-[20px] h-auto mb-3 border-3 border-transparent rounded-full transition duration-200 ease-in-out hover:border-blue-500 "
                                    onmouseover="this.style.border = '3px solid #40BFFF';"
                                    onmouseout="this.style.border = '0px solid transparent';" />
                            </div>
                        </div>
                        <!-- Brand box -->
                        <div
                            class="Hot-deal-box md:pt-[1.5rem] md:pr-[1.491rem] md:pb-[1rem] md:mb-8 md:pl-6 bg-[#F6F7F8] pb-2 pb:10px mb-3 w-full">
                            <p class=" font-bold md:text-[30px] md:mb-6 pt-1 text-xl">Brand</p>
                            <div class="hot-deal-content font-light text-sm md:text-[1.2rem]">
                                <div>
                                    <a href="#"
                                        class="flex justify-between  md:text-[20px] px-[5px] md:mb-3 hover:text-[#40BFFF]  transition-all duration-200 ease-in hover:cursor-pointer">
                                        <p class="">Nike</p>
                                        <p class="">2</p>
                                    </a>
                                    <a href="#"
                                        class="flex justify-between  md:text-[20px] px-[5px] md:mb-3 hover:text-[#40BFFF]  transition-all duration-200 ease-in hover:cursor-pointer">
                                        <p class="">Nike</p>
                                        <p class="">2</p>
                                    </a>
                                    <a href="#"
                                        class="flex justify-between  md:text-[20px] px-[5px] md:mb-3 hover:text-[#40BFFF]  transition-all duration-200 ease-in hover:cursor-pointer">
                                        <p class="">Nike</p>
                                        <p class="">2</p>
                                    </a>
                                    <a href="#"
                                        class="flex justify-between  md:text-[20px] px-[5px] md:mb-3 hover:text-[#40BFFF]  transition-all duration-200 ease-in hover:cursor-pointer">
                                        <p class="">Nike</p>
                                        <p class="">2</p>
                                    </a>
                                    <a href="#"
                                        class="flex justify-between  md:text-[20px] px-[5px] md:mb-3 hover:text-[#40BFFF]  transition-all duration-200 ease-in hover:cursor-pointer">
                                        <p class="">Nike</p>
                                        <p class="">2</p>
                                    </a>
                                    <a href="#"
                                        class="flex justify-between  md:text-[20px] px-[5px] md:mb-3 hover:text-[#40BFFF]  transition-all duration-200 ease-in hover:cursor-pointer">
                                        <p class="">Nike</p>
                                        <p class="">2</p>
                                    </a>
                                </div>

                            </div>
                        </div>

                        <!--                Button More-->
                        <div
                            class=" h-auto text-center bg-[#F6F7F8] flex justify-center items-center w-full md:py-[10px] px-2">
                            <button class="font-medium text-xl ">More</button>
                        </div>
                    </div>
                    <div class="Product-bar col-auto md:w-[70%]  md:mx-10 ">
                        <div
                            class="Show-Product-bar bg-[#40BFFF] text-white md:flex md:h-auto md:mb-7 pb-[20px] mb-5 md:block hidden ">
                            <div class="md:pl-[100px] pt-3 md:pt-[50px] md:w-full pl-5 relative">
                                <div class="md:text-4xl text-xl  font-[800] md:mb-3">
                                    Adidas Men Running
                                    <br />
                                    Sneakers
                                </div>
                                <p class="font-[400] md:text-[20px] text-[10px]">Performance and design. Taken right to
                                    the edge.
                                </p>
                                <div class="md:mt-[50px] mt-[30px] ">
                                    <p class="text-[15px] font-medium"><span class="underline decoration-2">SHOP</span>
                                        NOW</p>
                                </div>
                            </div>
                            <div class="w-full md:relative">
                                <img src="assets/img/big_shoe.png"
                                    class="md:w-[400px] w-[100px] top-[100px] md:left-[0] left-[190px] absolute md:right-[135px] md:top-[-13%]	" />
                            </div>
                        </div>

                        <!-- Sort-item -->
                        <div class="bg-[#F6F7F8] md:flex md:justify-between w-full h-auto md:mb-7 mb-3 md:pb-0 pb-1 ">
                            <div
                                class="flex md:h-full md:py-[15px] md:w-[60%] md:w-[70%] justify-evenly items-center text-[10px] md:text-[20px] pt-2">
                                <p>13 Items</p>
                                <div class="flex justify-between">
                                    <p>Sort By:</p>
                                    <select name="Show-Product" id=""
                                        class="md:w-[100px] bg-[#F6F7F8] rounded-[5px] md:mx-[10px]">
                                        <option value="Name" selected>Name</option>
                                        <option value="Name">Name</option>
                                        <option value="Name">Name</option>
                                        <option value="Name">Name</option>
                                        <option value="Name">Name</option>
                                    </select>
                                </div>
                                <div class="flex justify-between">
                                    <p>Show:</p>
                                    <select name="Show-Product" id=""
                                        class="md:w-[100px] bg-[#F6F7F8] rounded-[5px] mx-[10px]">
                                        <option value="12" selected>12</option>
                                        <option value="12">12</option>
                                        <option value="12">12</option>
                                        <option value="12">12</option>
                                        <option value="12">12</option>
                                    </select>
                                </div>

                            </div>
                            <div class="flex h-auto md:w-[12%] md:justify-center">
                                <div
                                    class="h-auto md:py-[25px] py-[5px] m-auto px-[10px] flex justify-center hover:bg-[#D3D4D6]">
                                    <img src="assets/img/incon/icon-cKv.png" class="md:w-[53%] w-[20%] h-[40%]" />
                                </div>
                                <div
                                    class="h-auto md:py-[25px] py-[5px] m-auto px-[10px] flex justify-center hover:bg-[#D3D4D6]">
                                    <img src="assets/img/incon/icon-2xk.png" class="md:w-[60%] w-[25%] h-auto" />
                                </div>
                            </div>

                        </div>
                        <!-- List product -->
                        <div class="Product-list">
                            <div class=" grid md:grid-cols-3 grid-cols-2 gap-4 md:mb-[30px] mb-3 md:w-full ">
                                <div
                                    class="border-solid border-2 h-full pb-[10px] md:pb-[20px] md:h-auto  rounded-[5%] relative shadow-lg rounded-sm hover:scale-105 transition-all duration-200 ease-in hover:cursor-pointer">
                                    <img src="assets/img/products/image Product1.jpg" class="cm:w-full" />
                                    <div class="text-center md:mt-2 mt-1">
                                        <div
                                            class="absolute top-0 rounded-[5%] left-0 bg-red-500 md:w-[70px] md:text-[17px] text-[8px] px-[10px] py-[5px] font-medium text-white text-center">
                                            HOT</div>
                                        <p class="text-[10px] md:text-xl font-[700]">Nike Air Max 270 React</p>
                                        <p class="text-[7px] md:text-[sm] font-medium md:text-base">Lorem ipsum dolor
                                            sit amet
                                            consectetur
                                            adipisicing elit.</p>
                                        <div
                                            class="flex justify-between px-2 pt-2 items-center md:px-[40px] md:pt-[10px]">
                                            <div>
                                                <span
                                                    class="text-[#40BFFF] font-bold text-[10px] md:text-lg">$299,43</span>
                                            </div>
                                            <div class="flex flex-col md:flex-row">
                                                <span
                                                    class="text-[#9098B1] line-through text-[8px] md:text-sm md:text-base">$534,33</span>
                                                <span
                                                    class="text-[#FB7181] font-bold text-[8px] md:text-sm md:text-base">24%
                                                    Off</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div
                                    class="border-solid border-2 h-full pb-[10px] md:pb-[20px] md:h-auto  rounded-[5%] relative shadow-lg rounded-sm hover:scale-105 transition-all duration-200 ease-in hover:cursor-pointer">
                                    <img src="assets/img/products/image Product1.jpg" class="cm:w-full" />
                                    <div class="text-center md:mt-2 mt-1">
                                        <div
                                            class="absolute top-0 rounded-[5%] left-0 bg-red-500 md:w-[70px] md:text-[17px] text-[8px] px-[10px] py-[5px] font-medium text-white text-center">
                                            HOT</div>
                                        <p class="text-[10px] md:text-xl font-[700]">Nike Air Max 270 React</p>
                                        <p class="text-[7px] md:text-[sm] font-medium md:text-base">Lorem ipsum dolor
                                            sit amet
                                            consectetur
                                            adipisicing elit.</p>
                                        <div
                                            class="flex justify-between px-2 pt-2 items-center md:px-[40px] md:pt-[10px]">
                                            <div>
                                                <span
                                                    class="text-[#40BFFF] font-bold text-[10px] md:text-lg">$299,43</span>
                                            </div>
                                            <div class="flex flex-col md:flex-row">
                                                <span
                                                    class="text-[#9098B1] line-through text-[8px] md:text-sm md:text-base">$534,33</span>
                                                <span
                                                    class="text-[#FB7181] font-bold text-[8px] md:text-sm md:text-base">24%
                                                    Off</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div
                                    class="border-solid border-2 h-full pb-[10px] md:pb-[20px] md:h-auto  rounded-[5%] relative shadow-lg rounded-sm hover:scale-105 transition-all duration-200 ease-in hover:cursor-pointer">
                                    <img src="assets/img/products/image Product1.jpg" class="cm:w-full" />
                                    <div class="text-center md:mt-2 mt-1">
                                        <div
                                            class="absolute top-0 rounded-[5%] left-0 bg-red-500 md:w-[70px] md:text-[17px] text-[8px] px-[10px] py-[5px] font-medium text-white text-center">
                                            HOT</div>
                                        <p class="text-[10px] md:text-xl font-[700]">Nike Air Max 270 React</p>
                                        <p class="text-[7px] md:text-[sm] font-medium md:text-base">Lorem ipsum dolor
                                            sit amet
                                            consectetur
                                            adipisicing elit.</p>
                                        <div
                                            class="flex justify-between px-2 pt-2 items-center md:px-[40px] md:pt-[10px]">
                                            <div>
                                                <span
                                                    class="text-[#40BFFF] font-bold text-[10px] md:text-lg">$299,43</span>
                                            </div>
                                            <div class="flex flex-col md:flex-row">
                                                <span
                                                    class="text-[#9098B1] line-through text-[8px] md:text-sm md:text-base">$534,33</span>
                                                <span
                                                    class="text-[#FB7181] font-bold text-[8px] md:text-sm md:text-base">24%
                                                    Off</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div
                                    class="border-solid border-2 h-full pb-[10px] md:pb-[20px] md:h-auto  rounded-[5%] relative shadow-lg rounded-sm hover:scale-105 transition-all duration-200 ease-in hover:cursor-pointer">
                                    <img src="assets/img/products/image Product1.jpg" class="cm:w-full" />
                                    <div class="text-center md:mt-2 mt-1">
                                        <div
                                            class="absolute top-0 rounded-[5%] left-0 bg-red-500 md:w-[70px] md:text-[17px] text-[8px] px-[10px] py-[5px] font-medium text-white text-center">
                                            HOT</div>
                                        <p class="text-[10px] md:text-xl font-[700]">Nike Air Max 270 React</p>
                                        <p class="text-[7px] md:text-[sm] font-medium md:text-base">Lorem ipsum dolor
                                            sit amet
                                            consectetur
                                            adipisicing elit.</p>
                                        <div
                                            class="flex justify-between px-2 pt-2 items-center md:px-[40px] md:pt-[10px]">
                                            <div>
                                                <span
                                                    class="text-[#40BFFF] font-bold text-[10px] md:text-lg">$299,43</span>
                                            </div>
                                            <div class="flex flex-col md:flex-row">
                                                <span
                                                    class="text-[#9098B1] line-through text-[8px] md:text-sm md:text-base">$534,33</span>
                                                <span
                                                    class="text-[#FB7181] font-bold text-[8px] md:text-sm md:text-base">24%
                                                    Off</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div
                                    class="border-solid border-2 h-full pb-[10px] md:pb-[20px] md:h-auto  rounded-[5%] relative shadow-lg rounded-sm hover:scale-105 transition-all duration-200 ease-in hover:cursor-pointer">
                                    <img src="assets/img/products/image Product1.jpg" class="cm:w-full" />
                                    <div class="text-center md:mt-2 mt-1">
                                        <div
                                            class="absolute top-0 rounded-[5%] left-0 bg-red-500 md:w-[70px] md:text-[17px] text-[8px] px-[10px] py-[5px] font-medium text-white text-center">
                                            HOT</div>
                                        <p class="text-[10px] md:text-xl font-[700]">Nike Air Max 270 React</p>
                                        <p class="text-[7px] md:text-[sm] font-medium md:text-base">Lorem ipsum dolor
                                            sit amet
                                            consectetur
                                            adipisicing elit.</p>
                                        <div
                                            class="flex justify-between px-2 pt-2 items-center md:px-[40px] md:pt-[10px]">
                                            <div>
                                                <span
                                                    class="text-[#40BFFF] font-bold text-[10px] md:text-lg">$299,43</span>
                                            </div>
                                            <div class="flex flex-col md:flex-row">
                                                <span
                                                    class="text-[#9098B1] line-through text-[8px] md:text-sm md:text-base">$534,33</span>
                                                <span
                                                    class="text-[#FB7181] font-bold text-[8px] md:text-sm md:text-base">24%
                                                    Off</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div
                                    class="border-solid border-2 h-full pb-[10px] md:pb-[20px] md:h-auto  rounded-[5%] relative shadow-lg rounded-sm hover:scale-105 transition-all duration-200 ease-in hover:cursor-pointer">
                                    <img src="assets/img/products/image Product1.jpg" class="cm:w-full" />
                                    <div class="text-center md:mt-2 mt-1">
                                        <div
                                            class="absolute top-0 rounded-[5%] left-0 bg-red-500 md:w-[70px] md:text-[17px] text-[8px] px-[10px] py-[5px] font-medium text-white text-center">
                                            HOT</div>
                                        <p class="text-[10px] md:text-xl font-[700]">Nike Air Max 270 React</p>
                                        <p class="text-[7px] md:text-[sm] font-medium md:text-base">Lorem ipsum dolor
                                            sit amet
                                            consectetur
                                            adipisicing elit.</p>
                                        <div
                                            class="flex justify-between px-2 pt-2 items-center md:px-[40px] md:pt-[10px]">
                                            <div>
                                                <span
                                                    class="text-[#40BFFF] font-bold text-[10px] md:text-lg">$299,43</span>
                                            </div>
                                            <div class="flex flex-col md:flex-row">
                                                <span
                                                    class="text-[#9098B1] line-through text-[8px] md:text-sm md:text-base">$534,33</span>
                                                <span
                                                    class="text-[#FB7181] font-bold text-[8px] md:text-sm md:text-base">24%
                                                    Off</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div
                                    class="border-solid border-2 h-full pb-[10px] md:pb-[20px] md:h-auto  rounded-[5%] relative shadow-lg rounded-sm hover:scale-105 transition-all duration-200 ease-in hover:cursor-pointer">
                                    <img src="assets/img/products/image Product1.jpg" class="cm:w-full" />
                                    <div class="text-center md:mt-2 mt-1">
                                        <div
                                            class="absolute top-0 rounded-[5%] left-0 bg-red-500 md:w-[70px] md:text-[17px] text-[8px] px-[10px] py-[5px] font-medium text-white text-center">
                                            HOT</div>
                                        <p class="text-[10px] md:text-xl font-[700]">Nike Air Max 270 React</p>
                                        <p class="text-[7px] md:text-[sm] font-medium md:text-base">Lorem ipsum dolor
                                            sit amet
                                            consectetur
                                            adipisicing elit.</p>
                                        <div
                                            class="flex justify-between px-2 pt-2 items-center md:px-[40px] md:pt-[10px]">
                                            <div>
                                                <span
                                                    class="text-[#40BFFF] font-bold text-[10px] md:text-lg">$299,43</span>
                                            </div>
                                            <div class="flex flex-col md:flex-row">
                                                <span
                                                    class="text-[#9098B1] line-through text-[8px] md:text-sm md:text-base">$534,33</span>
                                                <span
                                                    class="text-[#FB7181] font-bold text-[8px] md:text-sm md:text-base">24%
                                                    Off</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div
                                    class="border-solid border-2 h-full pb-[10px] md:pb-[20px] md:h-auto  rounded-[5%] relative shadow-lg rounded-sm hover:scale-105 transition-all duration-200 ease-in hover:cursor-pointer">
                                    <img src="assets/img/products/image Product1.jpg" class="cm:w-full" />
                                    <div class="text-center md:mt-2 mt-1">
                                        <div
                                            class="absolute top-0 rounded-[5%] left-0 bg-red-500 md:w-[70px] md:text-[17px] text-[8px] px-[10px] py-[5px] font-medium text-white text-center">
                                            HOT</div>
                                        <p class="text-[10px] md:text-xl font-[700]">Nike Air Max 270 React</p>
                                        <p class="text-[7px] md:text-[sm] font-medium md:text-base">Lorem ipsum dolor
                                            sit amet
                                            consectetur
                                            adipisicing elit.</p>
                                        <div
                                            class="flex justify-between px-2 pt-2 items-center md:px-[40px] md:pt-[10px]">
                                            <div>
                                                <span
                                                    class="text-[#40BFFF] font-bold text-[10px] md:text-lg">$299,43</span>
                                            </div>
                                            <div class="flex flex-col md:flex-row">
                                                <span
                                                    class="text-[#9098B1] line-through text-[8px] md:text-sm md:text-base">$534,33</span>
                                                <span
                                                    class="text-[#FB7181] font-bold text-[8px] md:text-sm md:text-base">24%
                                                    Off</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div
                                    class="border-solid border-2 h-full pb-[10px] md:pb-[20px] md:h-auto  rounded-[5%] relative shadow-lg rounded-sm hover:scale-105 transition-all duration-200 ease-in hover:cursor-pointer">
                                    <img src="assets/img/products/image Product1.jpg" class="cm:w-full" />
                                    <div class="text-center md:mt-2 mt-1">
                                        <div
                                            class="absolute top-0 rounded-[5%] left-0 bg-red-500 md:w-[70px] md:text-[17px] text-[8px] px-[10px] py-[5px] font-medium text-white text-center">
                                            HOT</div>
                                        <p class="text-[10px] md:text-xl font-[700]">Nike Air Max 270 React</p>
                                        <p class="text-[7px] md:text-[sm] font-medium md:text-base">Lorem ipsum dolor
                                            sit amet
                                            consectetur
                                            adipisicing elit.</p>
                                        <div
                                            class="flex justify-between px-2 pt-2 items-center md:px-[40px] md:pt-[10px]">
                                            <div>
                                                <span
                                                    class="text-[#40BFFF] font-bold text-[10px] md:text-lg">$299,43</span>
                                            </div>
                                            <div class="flex flex-col md:flex-row">
                                                <span
                                                    class="text-[#9098B1] line-through text-[8px] md:text-sm md:text-base">$534,33</span>
                                                <span
                                                    class="text-[#FB7181] font-bold text-[8px] md:text-sm md:text-base">24%
                                                    Off</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="bg-[#F6F7F8]  w-full h-auto ">
                            <div class=" grid grid-cols-5 h-auto md:mx-72 mx-4">
                                <p class="h-full hover:bg-[#40BFFF] text-center py-3  ">1
                                </p>
                                <p class="h-full hover:bg-[#40BFFF] text-center py-3  ">1
                                </p>
                                <p class="h-full hover:bg-[#40BFFF] text-center py-3  ">1
                                </p>
                                <p class="h-full hover:bg-[#40BFFF] text-center py-3  ">1
                                </p>
                                <p class="h-full hover:bg-[#40BFFF] text-center py-3  ">1
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <%@include file="footer.jsp" %>
                    <script src="assets/js/validation/priceRange.js"></script>

        </body>

        </html>