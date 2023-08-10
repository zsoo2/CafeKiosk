<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1, maximum-scale=1">
<script
  src="https://code.jquery.com/jquery-3.6.4.js"
  integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
  crossorigin="anonymous"></script>
<link rel="stylesheet" href="../resources/css/main.css">
<link rel="stylesheet" href="../resources/css/customer.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<div class="wrapper">
	<div class="wrap" id="wrap">
		<div class="top">
			<span><a href="../">처음으로</a></span>
		</div>
		<div class="contents">
			<div class="customer_menu">
				<input type="radio" name="tab_menu" id="tab01">
				<label for="tab01" onclick="location.href='/customer/menu_1'">커피</label>
				<input type="radio" name="tab_menu" id="tab02" checked>
				<label for="tab02" onclick="location.href='/customer/menu_2'">티/에이드</label>
				<input type="radio" name="tab_menu" id="tab03">
				<label for="tab03" onclick="location.href='/customer/menu_3'">논커피</label>
				<input type="radio" name="tab_menu" id="tab04">
				<label for="tab04" onclick="location.href='/customer/menu_4'">디저트</label>
				<div class="conbox con2">
				<div class="scroll_container">
					<div class="container">	
					
					<c:forEach var="list" items="${menuList}">
						<div class="item" onclick="PopupInfo(this)">
							<span style="display:none">${list.menu_idx}</span>
							<div class="item_img">
								<img id="real_pic" src="/display?fileName=${list.menu_picture}" alt="${list.menu_picture}" />
							</div>
							<div class="item_name">
								<span>${list.menu_name}</span>
							</div>
							<div class="item_price">
								<span>${list.menu_price}</span>원
							</div>
							<span style="display:none">${list.option1_YN}</span>
							<span style="display:none">${list.option2_YN}</span>
							<span style="display:none">${list.option3_YN}</span>
						</div>
					</c:forEach>
							
						<form id="insertCartForm" method="post" action="/customer/insertCart">
							<div id="popup" class="popup">
								<div class="popup_close">
									<img src="../resources/image/icon/x-icon.png" onclick="closePop()">
								</div>
								<div class="popup_container">
									<div class="popup_contents1">
										<div class="popup_img">
											<div><img src=""  id="pop_pic"/></div>
										
										</div>
										<div class="popup_detail">
											<div class="popup_option">
												<input type="hidden" id="info_menu_idx" name="menu_idx">
												<input type="hidden" id="info_menu_name" name="menu_name"> 
												<input type="hidden" id="info_menu_price" name="menu_price">
											 	<span id="info_menu_name2"></span>
												<span id="info_menu_option1" style="display:none"></span>
												<span id="info_menu_option2" style="display:none"></span>
												<span id="info_menu_option3" style="display:none"></span>
											</div>
											<div class="popup_option" id="popup_option1" style="display:none">
												<div class="popup_option_btn">
													<input type="radio" name="option1" id="option1" value="hot" checked><label for="option1">HOT</label>
												</div>
												<div class="popup_option_btn">
													<input type="radio" name="option1" id="option2" value="ice"><label for="option2">ICED</label>
												</div>
											</div>
											<div class="popup_option">
												<input type="button" name="minus" class="minus" onclick='checkQuantity("minus")' value="-"/>
												<input type="number" name="count" id="quantity" min="1" value="1" readonly/>
												<input type="button" name="plus" class="plus" onclick='checkQuantity("plus")' value="+"/>
											</div>
										</div>
					
									</div>
									<div class="popup_contents2">
										<div class="popup_list" id="popup_option2" style="display:none">
											<div class="popup_listname"><span>샷 추가</span></div>
											<div class="popup_listitem">
												<input type="button" name="minus" class="minus" onclick='shotCount("minus")' value="-"/>
												<input type="number" name="option3" id="option3" min="0" value="0" readonly/>
												<input type="button" name="plus" class="plus" onclick='shotCount("plus")' value="+"/>
											</div>
										</div>
										<div class="popup_list" id="popup_option3" style="display:none">
											<div class="popup_listname"><span>얼음양</span></div>
											<div class="popup_listitem">
												<input type="radio" name="option2" id="ice_0" value="1"/>
												<label for="ice_0">적게</label>
												<input type="radio" name="option2" id="ice_1" value="2" checked/>
												<label for="ice_1">보통</label>
												<input type="radio" name="option2" id="ice_2" value="3"/>
												<label for="ice_2">많이</label>
											</div>
										</div>
									</div>
								</div>
								<input type="hidden" name="menu_cate" value="teaade">
								<div class="popup_submit">
									<input type="submit" name="#" id="#" value="확인">
								</div>
							</div>
						</form>
					</div>
					</div>
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
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${cartList}" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td>${list.menu_name}</td>
								<td>
									<input type="button" name="minus" class="minus" 
											onclick='editCart("minus", ${status.count}, ${list.menu_price}, ${list.option3}, ${list.cart_idx})' value="-"/>
									<input type="number" name="price" class="count" min="1" value="${list.count}" readonly/>
									<input type="button" name="plus" class="plus" 
											onclick='editCart("plus", ${status.count}, ${list.menu_price}, ${list.option3}, ${list.cart_idx})' value="+"/>
								</td>
								<td>${list.option_price}<span>원</span></td>
								<td>
									<input type="button" name="cancle" id="cancle" class="cancle" onclick="deleteCart(${list.cart_idx})"/>
								<!-- <img src="../resources/image/icon/x-icon.png"> -->
								</td>
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
					<div class="payment_quantityNum"><span>${totalCnt}</span>개</div>
				</div>
				<div class="payment_box1">
					<div class="payment_text"><span>주문금액 :</span></div>
					<div class="payment_amountNum"><span>${totalSumCom}</span>원</div>
				</div>
			</div>
			<div class="payment_content">
				<div class="payment_box2">
					<img src="../resources/image/icon/cancle-icon.png">
				</div>
				<div class="payment_box2">
					<img src="../resources/image/icon/pay-icon.png" onclick="payItem()">
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	//장바구니 수량 수정
	function editCart(type, i, price, option, idx) {	
		count(type, i);
		
		const resultElement = document.getElementsByClassName("count")[i-1];
		let cnt = resultElement.value;
		
		$.ajax({
			type: "post", 
			url: "/customer/editCart",
			data: {	"idx" : idx,
					"price" : price,
					"option" : option,
					"cnt" : cnt
			},
			success: function (data) {
				location.reload();
			}
		}); 
	}

	// 장바구니 수량
	function count(type,i) {
		/* const resultElement = document.getElementById("price"); */
		const resultElement = document.getElementsByClassName("count")[i-1];
		let number = resultElement.value;
		//console.log(i);
		
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
	
	// 팝업 열기 
	function PopupInfo(e) {
		document.getElementById("pop_pic").src = document.getElementById("real_pic").src;
		
		var row_span 	= e.getElementsByTagName("span");
	   	var modal 		= document.getElementById("popup");

		document.getElementById("quantity").value 	= "1";
		document.getElementById("option3").value 	= "0";
		document.getElementById("option1").checked 	= true;
		document.getElementById("ice_1").checked 	= true;
		
		document.getElementById("option1").value = "hot";
		document.getElementById("ice_1").value = "2";
	   
	   	document.getElementById("info_menu_idx").value 			= row_span[0].innerHTML;
	   	document.getElementById("info_menu_name").value 		= row_span[1].innerHTML;
	   	document.getElementById("info_menu_name2").innerHTML 	= row_span[1].innerHTML;
	   	document.getElementById("info_menu_price").value 		= row_span[2].innerHTML;
	   	document.getElementById("info_menu_option1").innerHTML 	= row_span[3].innerHTML;
	   	document.getElementById("info_menu_option2").innerHTML 	= row_span[4].innerHTML;
	   	document.getElementById("info_menu_option3").innerHTML 	= row_span[5].innerHTML;
	   	
	   	if (row_span[3].innerHTML == 'Y') {
	   		document.getElementById("popup_option1").style.display ="block";
		}else {	// hot/ice
			document.getElementById("popup_option1").style.display ="none";
			document.getElementById("option1").value = "0";							
		}
	   	
	   	if (row_span[5].innerHTML == 'Y') {
	   		document.getElementById("popup_option2").style.display ="block";
		}else {	// 샷추가
			document.getElementById("popup_option2").style.display ="none";	
		}
	   	
	   	if (row_span[4].innerHTML == 'Y') {
	   		document.getElementById("popup_option3").style.display ="block";
		}else {	// 얼음양
			document.getElementById("popup_option3").style.display ="none";
			document.getElementById("ice_1").value = "0";	 						
		}

	   	modal.style.display ="block";
	}
	
	/* 팝업 닫기 */
	function closePop() {
		document.getElementById("popup").style.display ="none";
		/* popBlur(false); */
	}
	
	/* 팝업 열고 닫을 때 뒷배경 흐리게 */
	function popBlur(chk){
		if(chk==false){
			document.getElementById("wrap").style.opacity="1";
		} else {
			document.getElementById("wrap").style.opacity="0.3";
		}
	}
	
	/* 수량 증가, 감소 */
	function checkQuantity(type) {
		const resultElement = document.getElementById("quantity");
		let quantity = resultElement.value;
	
		if(type === 'plus') {
			quantity = parseInt(quantity) + 1;
		}else if(type === 'minus') {
			quantity = parseInt(quantity) - 1;
		    if(quantity < 0) {
		    	quantity = 0;
		    }else {
		    	quantity = quantity;
		    }
		}
		
		resultElement.value = quantity;
		
		/* console.log(quantity); */
	}
	
	/* 샷 추가 */
	function shotCount(type) {
		const resultElement = document.getElementById("option3");
		let option3 = resultElement.value;
 
		if(type === 'plus') {
			option3 = parseInt(option3) + 1;
			}else if(type === 'minus') {
				option3 = parseInt(option3) - 1;
			    if(option3 < 0) {
			    	option3 = 0;
			    }else {
			    	option3 = option3;
			    }
			}
		
		resultElement.value = option3;
		
 		/* console.log(option3); */
	}

	// 장바구니 삭제
	function deleteCart(idx) {
		$.ajax({
			type: "post", 
			url: "/customer/deleteCart",
			data: {"idx" : idx},
			success: function (data) {
				location.reload();
			}
		});
	}
	
	// 결제하기
	function payItem() {
		var item_cnt = document.querySelector('.payment_quantityNum span').innerText;
		if(item_cnt < 1) {
			swal.fire("상품을 장바구니에 담아주세요");
		}else {
			location.href='/customer/check_member'
		}
	}
	
</script>

</html>