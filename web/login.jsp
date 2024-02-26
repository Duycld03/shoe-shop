<!DOCTYPE html>
<html>

<head>
    <%@include file="head.jsp" %>
        <title>JSP Page</title>
</head>

<body>
    <%@include file="header.jsp" %>
        <div class="w-full max-w-md p-8 space-y-3 rounded-xl mx-auto bg-gray-100 m-8">
            <h1 class="text-2xl font-bold text-center mb-4">Login</h1>
            <form action="" class="space-y-6">
                <div class="space-y-1 text-sm">
                    <label for="username" class="block">Username</label>
                    <input type="text" name="username" id="username" placeholder="Username"
                        class="w-full px-4 py-3 rounded-md focus:dark:border-violet-400">
                </div>
                <div class="space-y-1 text-sm">
                    <label for="password" class="block">Password</label>
                    <input type="password" name="password" id="password" placeholder="Password"
                        class="w-full px-4 py-3 rounded-md focus:dark:border-violet-400">
                    <div class="flex justify-end text-xs">
                        <a rel="noopener noreferrer" href="#" class="text-[#40BFFF] font-bold hover:underline">Forgot
                            Password?</a>
                    </div>
                </div>
                <button
                    class="block w-full p-3 text-center rounded-sm text-[#FFFFFF] font-bold bg-[#40BFFF] hover:bg-[#BCDDFE]">Sign
                    in</button>
            </form>
            <div class="flex items-center space-x-4">
                <div class="flex-1 h-px bg-[#40BFFF]"></div>
                <p class="text-center text-[14px] font-bold tracking-[0px] font-[Poppins] not-italic leading-[150px]">OR
                </p>
                <div class="flex-1 h-px bg-[#40BFFF]"></div>
            </div>

            <div class="flex justify-center space-x-4">
                <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:8080/auth/LoginGoogleHandler&response_type=code
		   &client_id=890248307249-p2bid9b832qnpvfnf05nins9pvoerjrt.apps.googleusercontent.com&approval_prompt=force"
                    class="hover:bg-[#BCDDFE] cursor-pointer w-full py-4 pr-[17px] pl-[15px] bg-[transparent] self-stretch rounded-8xs shadow-[0px_10px_30px_rgba(64,_191,_255,_0.24)] overflow-hidden flex flex-row items-center justify-start gap-[10px] border-[1px] border-solid border-neutral-light">
                    <img class="h-6 w-6 relative overflow-hidden shrink-0" alt="" src="assets/img/Google.png" />
                    <b
                        class="flex-1 relative text-sm tracking-[0.5px] leading-[180%] font-link-small text-neutral-grey text-center">
                        Login with Google
                    </b>
                </a>

            </div>
            <p class="text-xs text-center sm:px-6">Don't have an account?
                <a rel="noopener noreferrer" href="#" class="text-[#40BFFF] font-bold hover:underline">Sign up</a>
            </p>
        </div>
        <%@include file="footer.jsp" %>
</body>

</html>