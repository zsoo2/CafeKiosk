<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>CustomerMainPage</title>
<link rel="stylesheet" href="../resources/css/main.css">
<link rel="stylesheet" href="../resources/css/customer.css">
</head>
<body>
	<div class="wrapper">
		<div class="wrap" id="wrap">
			<div class="top">
				<span><a href="../main">처음으로</a></span>
			</div>
			<div class="contents">
				<div class="customer_menu">
					<input type="radio" name="tab_menu" id="tab01" checked>
					<label for="tab01">커피</label>
					<input type="radio" name="tab_menu" id="tab02">
					<label for="tab02">티/에이드</label>
					<input type="radio" name="tab_menu" id="tab03">
					<label for="tab03">논커피</label>
					<input type="radio" name="tab_menu" id="tab04">
					<label for="tab04">디저트</label>
					
					<div class="conbox con1">
						<%@ include file="menu_1.jsp" %>
					</div>
					<div class="conbox con2">
						<%@ include file="menu_2.jsp" %>
					</div>
					<div class="conbox con3">
						<%@ include file="menu_3.jsp" %>
					</div>
					<div class="conbox con4">
						<%@ include file="menu_4.jsp" %>
					</div>
				</div>
			</div>
			<div class="cart">
				<div class="cart_list">
					<table border= "0">
						<thead>
							<tr>
								<th></th>
								<th>제품명</th>
								<th>수량</th>
								<th>가격</th>
								<th>엑스</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="i" begin="1" end="3">
								<tr>
									<td><c:out value = "${i}"/><p></td>
									<td>아이스아메리카노</td>
									<td>
										<input type="button" name="minus" id="minus" onclick='count("minus")' value="-"/>
										<input type="number" name="price" id="price" min="0" value="1" readonly/>
										<input type="button" name="plus" id="plus"onclick='count("plus")'value="+"/>
									</td>
									<td>3000<span>원</span></td>
									<td>
										<input type="button" name="cancle" id="cancle" class="cancle"/>
										
									<!-- <img src="../resources/image/icon/x-icon.png"></td> -->
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="payment">
				<div class="payment_content">
					<div class="payment_box1">
						<div class="payment_text"><span>주문수량 :</span></div>
						<div class="payment_quantityNum"><span>3</span></div>
					</div>
					<div class="payment_box1">
						<div class="payment_text"><span>주문금액 :</span></div>
						<div class="payment_amountNum"><span>9000</span></div>
					</div>
				</div>
				<div class="payment_content">
					<div class="payment_box2">
						<img src="../resources/image/icon/cancle-icon.png">
					</div>
					<div class="payment_box2">
						<img src="../resources/image/icon/pay-icon.png">
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
	function count(type) {
		const resultElement = document.getElementById("price");
		let number = resultElement.value;
		console.log(number);
		
		if(type === 'plus') {
			   number = parseInt(number) + 1;
			}else if(type === 'minus') {
			   number = parseInt(number) - 1;
			    if(number < 0) {
			    	number = 0;
			    }else {
			    	number = number;
			    }
			}
		
		resultElement.value = number;
	}
</script>
</html>