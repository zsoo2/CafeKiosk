<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 완료</title>
<link rel="stylesheet" href="../resources/css/main.css">
<link rel="stylesheet" href="../resources/css/customer.css">
</head>
<body>
<div class="wrapper">
	<div class="wrap" id="wrap">
		<div class="top">
			<span><a href="../">처음으로</a></span>
		</div>
		<div class="contents">
			<div class="payment_container">
				<div class="payment_title">
					<div class="payment_div">
						<div>결제가 완료되었습니다.</div>
						<div>감사합니다.</div>
					</div>
				</div>		
				<div class="payment_amount">
					<div class="payment_button">
						<input type="button" onclick="location.href='/customer/menu_1'" value="확인">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>