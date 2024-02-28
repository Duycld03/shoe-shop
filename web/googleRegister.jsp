<%-- Document : googleRegister Created on : Feb 26, 2024, 11:37:59 PM Author : Duy --%>

  <%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
      <%@include file="head.jsp" %>
        <title>Google Register</title>
    </head>

    <body>
      <%@include file="header.jsp" %>
        <div class="w-full max-w-md p-8 space-y-3 rounded-xl mx-auto bg-gray-100 m-8">
          <h1 class="text-2xl font-bold text-center mb-4">Google Register</h1>
          <form action="/googleRegister" method="POST" class="space-y-6">
            <div class="space-y-1 text-sm">
              <label for="username" class="block">Username</label>
              <input type="text" name="username" id="username" placeholder="Username"
                class="w-full px-4 py-3 rounded-md focus:dark:border-violet-400" required>
            </div>
            <div class="space-y-1 text-sm">
              <label for="password" class="block">Password</label>
              <input type="password" name="password" id="password" placeholder="Password"
                class="w-full px-4 py-3 rounded-md focus:dark:border-violet-400" required>
            </div>
            <div class="space-y-1 text-sm">
              <label for="phoneNumber" class="block">Phone Number</label>
              <input type="text" name="phoneNumber" id="phoneNumber" placeholder="Phone Number"
                class="w-full px-4 py-3 rounded-md focus:dark:border-violet-400" maxlength="10" minlength="10"
                pattern="[0-9]{10}" required>
            </div>
            <button name="btnRegister" type="submit"
              class="block w-full p-3 text-center rounded-sm text-[#FFFFFF] font-bold bg-[#40BFFF] hover:bg-[#BCDDFE]">Confirm</button>
          </form>
        </div>
        <%@include file="footer.jsp" %>
    </body>

    </html>