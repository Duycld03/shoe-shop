<%-- Document : signup Created on : Feb 26, 2024, 3:07:11 PM Author : Acer --%>

<!DOCTYPE html>
<html>

    <head>
        <%@include file="head.jsp" %>
		<script src="https://www.google.com/recaptcha/api.js" async defer></script>
		<title>JSP Page</title>
    </head>

    <body>
        <%@include file="header.jsp" %>
        <div class="w-full max-w-md p-8 space-y-3 rounded-xl mx-auto bg-gray-100 m-8">
            <h1 class="text-2xl font-bold text-center mb-4">Sign Up</h1>
            <form action="/signUp" method="POST" class="space-y-6">
                <div class="space-y-1 text-sm">
					<label for="Fullname" class="block">Fullname</label>
                    <input type="text" name="fullname" id="fullname" placeholder="Fullname"
                           class="w-full px-4 py-3 rounded-md focus:dark:border-violet-400" required>
                </div>
                <div class="space-y-1 text-sm">
					<label for="emal" class="block">Email</label>
                    <input type="email" name="email" id="email" placeholder="Email"
                           class="w-full px-4 py-3 rounded-md focus:dark:border-violet-400" required>
                </div>
                <div class="space-y-1 text-sm">
					<label for="phoneNumber" class="block">Phone Number</label>
					<input type="text" name="phoneNumber" id="phoneNumber" placeholder="Phone Number"
						   class="w-full px-4 py-3 rounded-md focus:dark:border-violet-400" maxlength="10" minlength="10" pattern="[0-9]{10}" required>
                </div>
                <div class="space-y-1 text-sm">
					<label for="username" class="block">Username</label>
                    <input type="text" name="username" id="username" placeholder="Username"
                           class="w-full px-4 py-3 rounded-md focus:dark:border-violet-400" required>
                </div>
                <div class="space-y-1 text-sm">
					<label for="password" class="block">password</label>
                    <input type="password" name="password" id="password" placeholder="Password"
                           class="w-full px-4 py-3 rounded-md focus:dark:border-violet-400" required>
                </div>
                <div class="space-y-1 text-sm">
					<label for="confirmPassword" class="block">Confirm Password</label>
                    <input type="password" name="confirmPassword" id="confirmPassword" placeholder="Confirm Password" class="w-full px-4 py-3 rounded-md focus:dark:border-violet-400" required>
                </div>
                <div class="space-y-1 text-sm">
					<label for="city" class="block">Your City</label>
                    <input type="text" name="city" id="city" placeholder="Your City"
                           class="w-full px-4 py-3 rounded-md focus:dark:border-violet-400" required>
                </div>
                <div class="space-y-1 text-sm">
					<label for="addressDetail" class="block">Address Detail</label>
                    <textarea name="addressDetail" id="addressDetail" placeholder="Address Detail" 
                              class="w-full px-4 py-3 rounded-md focus:dark:border-violet-400" required></textarea>
                </div>
				<div class="g-recaptcha" data-sitekey="6LdYbLYZAAAAAOrln1pQOTOAUGDKZhfwVoZnMYr3"></div>
                <button name="btnSignUp"
                    class="block w-full p-3 text-center rounded-sm text-[#FFFFFF] font-bold bg-[#40BFFF] hover:bg-[#BCDDFE]">Sign up</button>
            </form>



            <p class="text-xs text-center sm:px-6">Have an account?
                <a rel="noopener noreferrer" href="login.jsp" class="text-[#40BFFF] font-bold hover:underline">Sign in</a>
            </p>
        </div>
        <%@include file="footer.jsp" %>
        <script>
			document.addEventListener('DOMContentLoaded', function () {
				const form = document.querySelector('form');
				form.addEventListener('submit', function (event) {
					event.preventDefault(); // Ng?n ch?n vi?c g?i form ?i ?? th?c hi?n ki?m tra tr??ng h?p
					let errors = [];

					const username = document.getElementById('username').value.trim();
					const fullname = document.getElementById('fullname').value.trim();
					const phonenumber = document.getElementById('phonenumber').value.trim();
					const youremail = document.getElementById('youremail').value.trim();
					const city = document.getElementById('city').value.trim();
					const addressdetail = document.getElementById('addressdetail').value.trim();
					const password = document.getElementById('password').value;
					const passwordagain = document.getElementById('passwordagain').value;

					// Ki?m tra các tr??ng d? li?u n?u r?ng
					if (username === '') {
						errors.push('Please enter your username.');
					}
					if (fullname === '') {
						errors.push('Please enter your fullname.');
					}
					if (phonenumber === '') {
						errors.push('Please enter your phone number.');
					}
					if (youremail === '') {
						errors.push('Please enter your email.');
					}
					if (city === '') {
						errors.push('Please enter your city.');
					}
					if (addressdetail === '') {
						errors.push('Please enter your address detail.');
					}
					if (password === '') {
						errors.push('Please enter your password.');
					}
					if (passwordagain === '') {
						errors.push('Please re-enter your password.');
					}
					let errors = [];

					const phoneNumber = document.getElementById('phonenumber').value.trim();

					// Ki?m tra s? ?i?n tho?i v?i bi?u th?c chính quy
					const phoneRegex = /^\d{10}$/; // ?ây là m?t ví d? bi?u th?c chính quy cho s? ?i?n tho?i 10 ch? s?

					if (!phoneRegex.test(phoneNumber)) {
						errors.push('Please enter a valid phone number.');
					}

					// Hi?n th? thông báo l?i n?u có
					if (errors.length > 0) {
						alert(errors.join('\n'));
					} else {
						// N?u không có l?i, g?i form ?i
						form.submit();
					}
					// Ki?m tra xem m?t kh?u có kh?p nhau không
					if (password !== passwordagain) {
						errors.push('Passwords do not match.');
					}

					// Hi?n th? thông báo l?i n?u có
					if (errors.length > 0) {
						alert(errors.join('\n'));
					} else {
						// N?u không có l?i, g?i form ?i
						form.submit();
					}
				});
			});
        </script>

		<div class="w-full max-w-md p-8 space-y-3 rounded-xl mx-auto bg-gray-100 m-8">
			<h1 class="text-2xl font-bold text-center mb-4">Sign Up</h1>
			<form novalidate="" action="" class="space-y-6">
				<div class="space-y-1 text-sm">
					<input type="text" name="username" id="username" placeholder="Username"
						   class="w-full px-4 py-3 rounded-md focus:dark:border-violet-400">
				</div>
				<div class="space-y-1 text-sm">
					<input type="text" name="fullname" id="fullname" placeholder="Fullname"
						   class="w-full px-4 py-3 rounded-md focus:dark:border-violet-400">
				</div>
				<div class="space-y-1 text-sm">
					<input type="text" name="phonenumber" id="phonenumber" placeholder="Phone Number"
						   class="w-full px-4 py-3 rounded-md focus:dark:border-violet-400">
				</div>
				<div class="space-y-1 text-sm">
					<input type="text" name="youremail" id="youremail" placeholder="Your Email"
						   class="w-full px-4 py-3 rounded-md focus:dark:border-violet-400">
				</div>
				<div class="space-y-1 text-sm">
					<input type="text" name="city" id="city" placeholder="Your city"
						   class="w-full px-4 py-3 rounded-md focus:dark:border-violet-400">
				</div>
				<div class="space-y-1 text-sm">
					<input type="text" name="addressdetail" id="addressdetail" placeholder="Address Detail"
						   class="w-full px-4 py-3 rounded-md focus:dark:border-violet-400">
				</div>
				<div class="space-y-1 text-sm">
					<input type="password" name="password" id="password" placeholder="Password"
						   class="w-full px-4 py-3 rounded-md focus:dark:border-violet-400">
				</div>
				<div class="space-y-1 text-sm">
					<input type="password" name="passwordagain" id="passwordagain" placeholder="Password again"
						   class="w-full px-4 py-3 rounded-md focus:dark:border-violet-400">
				</div>
				<div class="g-recaptcha" data-sitekey="6LdYbLYZAAAAAOrln1pQOTOAUGDKZhfwVoZnMYr3"></div>
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