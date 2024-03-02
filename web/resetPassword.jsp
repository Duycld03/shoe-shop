<!DOCTYPE html>
<html>

<head>
    <%@include file="head.jsp" %>
        <title>Login</title>
</head>

<body>
    <%@include file="header.jsp" %>
        <div class="w-full max-w-md p-8 space-y-3 rounded-xl mx-auto bg-gray-100 m-8">
            <h1 class="text-2xl font-bold text-center mb-4">Reset Password</h1>
            <form action="/resetPassword" method="POST" class="space-y-6">
                <div class="space-y-1 text-sm">
                    <label for="newPassword" class="block">New Password</label>
                    <input type="password" name="newPassword" id="newPassword" placeholder="New password" maxlength="50"
						   class="w-full px-4 py-3 rounded-md focus:dark:border-violet-400" required>
                </div>
                
                <button name="btnReset"
						class="block w-full p-3 text-center rounded-sm text-[#FFFFFF] font-bold bg-[#40BFFF] hover:bg-[#BCDDFE]">Confirm</button>
            </form>
            
        </div>
        <%@include file="footer.jsp" %>
</body>

</html>