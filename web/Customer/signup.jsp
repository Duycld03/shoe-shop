<%-- Document : signup Created on : Feb 26, 2024, 3:07:11 PM Author : Acer --%>

    <!DOCTYPE html>
    <html>

    <head>
        <%@include file="/Components/head.jsp" %>
            <script src="https://www.google.com/recaptcha/api.js" async defer></script>
            <script src="/assets/js/validation/signUp.js"></script>
            <title>Sign Up</title>
    </head>

    <body>
        <%@include file="/Components/header.jsp" %>
            <div class="w-full max-w-md p-8 space-y-3 rounded-xl mx-auto bg-gray-100 m-8">
                <h1 class="text-2xl font-bold text-center mb-4">Sign Up</h1>
                <form action="/signUp" method="POST" onsubmit="return validForm()" class="space-y-6">
                    <div class="space-y-1 text-sm">
                        <label for="Fullname" class="block">Fullname</label>
                        <input type="text" name="fullname" id="fullname" placeholder="Fullname" minlength="5"
                            maxlength="50" class="w-full px-4 py-3 rounded-md focus:dark:border-violet-400" required>
                    </div>
                    <div class="space-y-1 text-sm">
                        <label for="email" class="block">Email</label>
                        <input type="email" name="email" id="email" placeholder="Email" maxlength="50"
                            class="w-full px-4 py-3 rounded-md focus:dark:border-violet-400" required>
                    </div>
                    <div class="space-y-1 text-sm">
                        <label for="phoneNumber" class="block">Phone Number</label>
                        <input type="text" name="phoneNumber" id="phoneNumber" placeholder="Phone Number"
                            class="w-full px-4 py-3 rounded-md focus:dark:border-violet-400" maxlength="10"
                            minlength="10" pattern="[0-9]{10}" required>
                    </div>
                    <div class="space-y-1 text-sm">
                        <label for="username" class="block">Username</label>
                        <input type="text" name="username" id="username" placeholder="Username" minlength="5"
                            maxlength="50" class="w-full px-4 py-3 rounded-md focus:dark:border-violet-400" required>
                    </div>
                    <div class="space-y-1 text-sm">
                        <label for="password" class="block">password</label>
                        <input type="password" name="password" id="password" placeholder="Password" minlength="5"
                            maxlength="50" class="w-full px-4 py-3 rounded-md focus:dark:border-violet-400" required>
                    </div>
                    <div class="space-y-1 text-sm">
                        <label for="confirmPassword" class="block">Confirm Password</label>
                        <input type="password" name="confirmPassword" id="confirmPassword" minlength="5" maxlength="50"
                            placeholder="Confirm Password"
                            class="w-full px-4 py-3 rounded-md focus:dark:border-violet-400" required>
                    </div>
                    <div class="space-y-1 text-sm">
                        <label for="city" class="block">Your City</label>
                        <input type="text" name="city" id="city" placeholder="Your City" minlength="2" maxlength="50"
                            class="w-full px-4 py-3 rounded-md focus:dark:border-violet-400" required>
                    </div>
                    <div class="space-y-1 text-sm">
                        <label for="addressDetail" class="block">Address Detail</label>
                        <textarea name="addressDetail" id="addressDetail" placeholder="Address Detail"
                            class="w-full px-4 py-3 rounded-md focus:dark:border-violet-400" required></textarea>
                    </div>
                    <div class="g-recaptcha" data-sitekey="6LdYbLYZAAAAAOrln1pQOTOAUGDKZhfwVoZnMYr3"></div>
                    <button name="btnSignUp"
                        class="block w-full p-3 text-center rounded-sm text-[#FFFFFF] font-bold bg-[#40BFFF] hover:bg-[#BCDDFE]">Sign
                        up</button>
                </form>



                <p class="text-xs text-center sm:px-6">Have an account?
                    <a rel="noopener noreferrer" href="/customerLogin"
                        class="text-[#40BFFF] font-bold hover:underline">Sign in</a>
                </p>
            </div>
            <%@include file="/Components/footer.jsp" %>

    </body>

    </html>