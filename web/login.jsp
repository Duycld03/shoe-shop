<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.jsp" %>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="w-full max-w-md p-8 space-y-3 rounded-xl dark:bg-gray-900 dark:text-gray-100 mx-auto bg-gray-100 p-6 m-8">
            <h1 class="text-2xl font-bold text-center mb-4">Login</h1>
            <form novalidate="" action="" class="space-y-6">
                <div class="space-y-1 text-sm">
                    <label for="username" class="block dark:text-gray-400">Username</label>
                    <input type="text" name="username" id="username" placeholder="Username" class="w-full px-4 py-3 rounded-md dark:border-gray-700 dark:bg-gray-900 dark:text-gray-100 focus:dark:border-violet-400">
                </div>
                <div class="space-y-1 text-sm">
                    <label for="password" class="block dark:text-gray-400">Password</label>
                    <input type="password" name="password" id="password" placeholder="Password" class="w-full px-4 py-3 rounded-md dark:border-gray-700 dark:bg-gray-900 dark:text-gray-100 focus:dark:border-violet-400">
                    <div class="flex justify-end text-xs dark:text-gray-400">
                        <a rel="noopener noreferrer" href="#" class="text-[#40BFFF] font-bold hover:underline">Forgot Password?</a>
                    </div>
                </div>
                <button class="block w-full p-3 text-center rounded-sm text-[#FFFFFF] font-bold bg-[#40BFFF] hover:bg-[#BCDDFE]">Sign in</button>
            </form>
            <div class="flex items-center pt-4 space-x-1">
                <div class="flex-1 h-px sm:w-16 dark:bg-gray-700"></div>
                <p class="font-bold px-3 text-sm dark:text-gray-400">OR</p>
                <div class="flex-1 h-px sm:w-16 dark:bg-gray-700"></div>
            </div>
            <div class="flex justify-center space-x-4">
                <button class="hover:bg-[#BCDDFE] cursor-pointer w-full py-4 pr-[17px] pl-[15px] bg-[transparent] self-stretch rounded-8xs shadow-[0px_10px_30px_rgba(64,_191,_255,_0.24)] overflow-hidden flex flex-row items-center justify-start gap-[10px] border-[1px] border-solid border-neutral-light">
                    <img
                        class="h-6 w-6 relative overflow-hidden shrink-0"
                        alt=""
                        src="assets/img/Google.png"
                        />
                    <b class="flex-1 relative text-sm tracking-[0.5px] leading-[180%] font-link-small text-neutral-grey text-center">
                        Login with Google
                    </b>
                </button>

            </div>
            <p class="text-xs text-center sm:px-6 dark:text-gray-400">Don't have an account?
                <a rel="noopener noreferrer" href="#" class="text-[#40BFFF] font-bold hover:underline dark:text-gray-100">Sign up</a>
            </p>
        </div>
    </body>
</html>
