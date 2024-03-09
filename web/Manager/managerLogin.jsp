<%-- Document : managerLogin Created on : Feb 29, 2024, 1:52:19 PM Author : Duy --%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@page contentType="text/html" pageEncoding="UTF-8" %>
            <!DOCTYPE html>
            <html>

            <head>

                <%@include file="/Components/head.jsp" %>
                    <title>Manager Login</title>
            </head>

            <body>
                <div class="w-full max-w-md p-8 space-y-3 rounded-xl mx-auto bg-gray-100 m-8">
                    <h1 class="text-2xl font-bold text-center mb-4">Manager Login</h1>
                    <form action="managerLogin" method="POST" class="space-y-6">
                        <div class="space-y-1 text-sm">
                            <label for="username" class="block">Username</label>
                            <input type="text" name="username" id="username" placeholder="Username"
                                class="w-full px-4 py-3 rounded-md focus:dark:border-violet-400" required>
                        </div>
                        <div class="space-y-1 text-sm">
                            <label for="password" class="block">Password</label>
                            <input type="password" name="password" id="password" placeholder="Password"
                                class="w-full px-4 py-3 rounded-md focus:dark:border-violet-400" required>
                            <div class="flex justify-end text-xs">
                                <a rel="noopener noreferrer" href="/forgotPassword"
                                    class="text-[#40BFFF] font-bold hover:underline">Forgot
                                    Password?</a>
                            </div>
                        </div>
                        <button name="btnManagerLogin"
                            class="block w-full p-3 text-center rounded-sm text-[#FFFFFF] font-bold bg-[#40BFFF] hover:bg-[#BCDDFE]">Sign
                            in</button>
                    </form>

                </div>
                <c:if test="${sessionScope.error != null}">
                    <script>
                        message("error", "${sessionScope.error}")
                    </script>
                    <% session.removeAttribute("error");%>
                </c:if>
                <c:if test="${sessionScope.success != null}">
                    <script>
                        message("success", "${sessionScope.success}")
                    </script>
                    <% session.removeAttribute("success");%>
                </c:if>
            </body>

            </html>