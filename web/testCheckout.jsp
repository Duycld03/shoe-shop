<%-- Document : testCheckout Created on : Mar 1, 2024, 2:39:56 AM Author : Duy --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>JSP Page</title>
		<%@include file="head.jsp" %>
	</head>

	<body>
		<button type="button" onclick="checkout()">checkout</button>
		<link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
		<script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
		<script type="text/javascript">
			function checkout() {
				$.ajax({
					type: "POST",
					url: "/checkout",
					data: {
						paymentMethod: "COD",
						amount: 100,
						customerId: "Cus2"
					},

					dataType: 'JSON',
					success: function (x) {
						if (x.paymentMethod == "VNPay") {
							if (x.code === '00') {
								if (window.vnpay) {
									vnpay.open({width: 768, height: 600, url: x.data});
								} else {
									location.href = x.data;
								}
							} else {
								alert(x.Message);
							}
						} else {
							window.location.href = "/"
						}
					},
					error: function (e) {
						console.log(e)
					}
				});
			}
		</script>
	</body>

</html>