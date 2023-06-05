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
<form id="payForm" action="/customer/payment" method="post">
	<div class="wrapper">
		<div class="wrap">
			<div class="top">
				<span><a href="../">처음으로</a></span>
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
						<input type="hidden" id="order_no" name="order_no" value="${order_no}">
						<input type="hidden" id="user_no" name="user_no" value="${user_no}">
						<input type="hidden" id="total_price" name="total_price" value="${total_price}">
							<span>결제금액 : </span>
							<span>${total_com}</span>
							<span>원</span>
						</div>
						<div class="payment_button">
							<input type="button" id="payBtn" onclick="paymentBtn()" value="결제하기">
						</div>
					</div>
				</div>
				<div class="order_container">
					<div class="order_title"><span>주문내역</span></div>
					<div class="order_contents">
						<table>
							<colgroup>
								<col width="10%">
								<col width="60%">
								<col width="30%">
							</colgroup>
							<c:forEach var="list" items="${cartList}" varStatus="status">
								<tr>
									<td>${status.count}</td>
									<td>${list.menu_name}</td>
									<td>${list.option_price} 원</td>
								</tr>
							</c:forEach>
								<tr style="display: ${display}">
									<td>*</td>
									<td>쿠폰 할인</td>
									<td>-2800 원</td>
								</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
</body>
<script type="text/javascript">
 	function paymentBtn() {
 		var order_no = $("#order_no").val();
		var user_no = $("#user_no").val();
		var total_price = $("#total_price").val();
		
 		$.ajax({
			url: "/customer/orderPay",
			type:'get',
			data:{
				 order_no: order_no
				,user_no: user_no
				,total_price: total_price
			},
			success: function (data) {
				location.href=data.next_redirect_pc_url;
			},
			error: function (data) {
				alert(error);
			}	
		});
		
		// alert("결제되었습니다.");
		//document.getElementById("payForm").submit();
	}	 
</script>
</html>