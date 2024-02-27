<%-- 
    Document   : signup
    Created on : Feb 26, 2024, 3:07:11 PM
    Author     : Acer
--%>

<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.jsp" %>

        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="w-full max-w-md p-8 space-y-3 rounded-xl mx-auto bg-gray-100 m-8">
            <h1 class="text-2xl font-bold text-center mb-4">Sign Up</h1>
            <form novalidate="" action="" class="space-y-6">
                <div class="space-y-1 text-sm">
                    <label for="username" class="block">Username</label>
                    <input type="text" name="username" id="username" placeholder="Username"
                           class="w-full px-4 py-3 rounded-md focus:dark:border-violet-400">
                </div>
                <div class="space-y-1 text-sm">
                    <label for="youremail" class="block">Your email</label>
                    <input type="text" name="youremail" id="youremail" placeholder="Your Email"
                           class="w-full px-4 py-3 rounded-md focus:dark:border-violet-400">
                </div>
                <div class="space-y-1 text-sm">
                    <label for="password" class="block">Password</label>
                    <input type="password" name="password" id="password" placeholder="Password"
                           class="w-full px-4 py-3 rounded-md focus:dark:border-violet-400">

                </div>
                <div class="space-y-1 text-sm">
                    <label for="passwordagain" class="block">Password again</label>
                    <input type="passwordagain" name="passwordagain" id="passwordagain" placeholder="Password again"
                           class="w-full px-4 py-3 rounded-md focus:dark:border-violet-400">
                </div>
                <button
                    class="block w-full p-3 text-center rounded-sm text-[#FFFFFF] font-bold bg-[#40BFFF] hover:bg-[#BCDDFE]">Sign
                    up</button>
            </form>



            <p class="text-xs text-center sm:px-6">Have an account?
                <a rel="noopener noreferrer" href="#" class="text-[#40BFFF] font-bold hover:underline">Sign in</a>
            </p>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
