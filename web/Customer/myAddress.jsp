<%-- Document : myProfile Created on : Feb 27, 2024, 8:58:28 AM Author : Doan Thanh Phuc - CE170580 --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <%@include file="/Components/head.jsp" %>
        <title>Address</title>
    </head>

    <body>
        <%@include file="/Components/header.jsp" %>
        <div class=" md:flex-wrap w-full h-auto md:flex md:justify-evenly md:my-4">
            <!-- Main Contail profile -->
            <%@include file="/Customer/leftProfile.jsp" %>

            <!-- address infor -->
            <div class="h-auto  md:w-3/5 rounded-2xl bg-gray-100 grid md:gap-8 gap-5 px-10 py-10">
                <div class="Adress-Header md:text-3xl md:flex justify-between items-center">
                    <div>My address</div>
                    <button onclick="openAddModal()"
                            class="bg-sky-400 text-white p-3 rounded-3xl md:text-xl">Add new
                        address</button>
                </div>
                <div class="border-t border-sky-400 w-full"></div>
                <div class="Adress-body md:grid md:grid-cols-1 gap-4">
                    <div class="text-2xl">Address List</div>
                    <div class="space-y-4">
                        <c:forEach items="${addresses}" var="address">
                            <div class="bg-white p-4 rounded-md">
                                <div class="User-function md:flex justify-between">
                                    <div class="md:flex md:gap-2">
                                        <c:if test="${address.isPrimary()}">
                                            <div
                                                class="flex font-light border-2 w-28 border-sky-400 rounded-2xl px-3 items-center space-x-1">
                                                <i class='bx bx-star'></i>
                                                <span>Primary</span>
                                            </div>
                                        </c:if>
                                    </div>
                                    <div class="flex items-center font-light text-sky-700 space-x-2">
                                        <a href="#"
                                           onclick="updateAddress('${address.addressId}', '${address.city}', '${address.addressDetail}')"
                                           class="hover:text-sky-300 duration-200 transition-all font-semibold">Update</a>
                                        <span class="border-r border-2 border-gray-300 h-4"></span>
                                        <a href="#" onclick="messageConfirm('Delete address!', () => {
                                                    window.location.href = '/address/delete?id=${address.addressId}'
                                                })" class="hover:text-sky-300 duration-200 transition-all font-semibold">Delete</a>
                                        <span class="border-r border-2 border-gray-300 h-4"></span>
                                        <a href="/address/setPrimary?id=${address.addressId}"
                                           class="hover:text-sky-300 duration-200 transition-all font-semibold">Set
                                            Primary</a>
                                    </div>

                                </div>
                                <div class="Adress font-light">
                                    <div class="City">${address.city}</div>
                                    <div class="Adress-detail">${address.addressDetail}</div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/Components/footer.jsp" %>
        <!-- Modal -->
        <div id="addModal"
             class="modal hidden fixed inset-0 bg-gray-500 bg-opacity-75 flex justify-center items-center">
            <!-- Modal Content -->
            <div class="bg-white rounded-lg p-8">
                <!-- Modal Header -->
                <div class="flex justify-between items-center mb-4">
                    <h2 class="text-xl font-bold w-[280px] md:w-[500px]">Add Address</h2>
                    <!-- Close Button -->
                    <button class="text-gray-500 hover:text-gray-700 text-3xl"
                            onclick="closeAddModal()">&times;</button>
                </div>
                <!-- Modal Body (Form) -->
                <form action="/address" method="POST">
                    <input type="hidden" name="customerId" value="${customer.customerId}">
                    <div class="mb-4">
                        <label for="city" class="block text-gray-700 font-bold mb-2">City:</label>
                        <input type="text" id="city" name="city" required
                               class="w-full border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:border-blue-500"
                               placeholder="Enter City">
                    </div>
                    <div class="mb-4">
                        <label for="addressDetail" class="block text-gray-700 font-bold mb-2">Address
                            Detail:</label>
                        <textarea id="addressDetail" name="addressDetail"
                                  class="w-full border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:border-blue-500"
                                  placeholder="Enter Address Detail" required></textarea>
                    </div>
                    <!-- Submit Button -->
                    <div class="flex justify-center">
                        <button type="submit" name="btnAdd"
                                class="md:w-32 bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Add</button>
                    </div>
                </form>
            </div>
        </div>

        <div id="updateModal"
             class="modal hidden fixed inset-0 bg-gray-500 bg-opacity-75 flex justify-center items-center">
            <!-- Modal Content -->
            <div class="bg-white rounded-lg p-8">
                <!-- Modal Header -->
                <div class="flex justify-between items-center mb-4">
                    <h2 class="text-xl font-bold w-[280px] md:w-[500px]">Update Address</h2>
                    <!-- Close Button -->
                    <button class="text-gray-500 hover:text-gray-700 text-3xl"
                            onclick="closeUpdateModal()">&times;</button>
                </div>
                <!-- Modal Body (Form) -->
                <form action="/address" method="POST">
                    <input type="hidden" name="customerId" value="${customer.customerId}">
                    <input type="hidden" name="addressId" id="addressId">
                    <div class="mb-4">
                        <label for="city" class="block text-gray-700 font-bold mb-2">City:</label>
                        <input type="text" id="city" name="city" required
                               class="w-full border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:border-blue-500"
                               placeholder="Enter City">
                    </div>
                    <div class="mb-4">
                        <label for="addressDetail" class="block text-gray-700 font-bold mb-2">Address
                            Detail:</label>
                        <textarea id="addressDetail" name="addressDetail"
                                  class="w-full border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:border-blue-500"
                                  placeholder="Enter Address Detail" required></textarea>
                    </div>
                    <!-- Submit Button -->
                    <div class="flex justify-center">
                        <button type="submit" name="btnSave"
                                class="md:w-32 bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Save</button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Script to open/close modal -->
        <script>
            function openAddModal() {
                document.getElementById('addModal').classList.remove('hidden');
            }

            function closeAddModal() {
                document.getElementById('addModal').classList.add('hidden');
            }

            function openUpdateModal() {
                document.getElementById('updateModal').classList.remove('hidden');
            }

            function closeUpdateModal() {
                document.getElementById('updateModal').classList.add('hidden');
            }
            function updateAddress(addressId, city, addressDetail) {
                document.querySelector("#updateModal #addressId").value = addressId
                document.querySelector("#updateModal #city").value = city
                document.querySelector("#updateModal #addressDetail").value = addressDetail
                document.getElementById('updateModal').classList.remove('hidden');
            }
        </script>

    </body>

</html>