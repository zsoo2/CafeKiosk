<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1, maximum-scale=1">
<title>Payment</title>
<script
  src="https://code.jquery.com/jquery-3.6.4.js"
  integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
  crossorigin="anonymous"></script>
<link rel="stylesheet" href="../resources/css/main.css">
<link rel="stylesheet" href="../resources/css/customer.css">
</head>
<body>
<!-- <form name="payForm" id="payForm" action="#" method="post"> -->
	<div class="wrapper">
		<div class="wrap">
			<div class="top">
				<span><a href="/customer/join">이전으로</a></span>
				<span>카드결제</span>			
			</div>
			<div class="contents">
				<div class="payment_container">
					<div class="payment_title">
						<span>결제하기</span>
						<span>선택 후 카드를 투입구 끝까지 밀어넣은 후 영수증이 나올 때까지 카드를 빼지 마세요.</span>
					</div>
					<div class="payment_amount">
						<div>
							<span>결제금액 : </span>
							<span>@@@@</span>
							<span>원</span>
						</div>
						<div class="payment_button">
							<input type="button" value="결제하기">
						</div>
					</div>
				</div>
				<div class="order_container">
					<div class="order_title"><span>주문내역</span></div>
					<div>
						<table>
							<tr>
								<td>1.</td>
								<td>아이스 아메리카노</td>
								<td>2500</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- </form> -->
</body>
</html>