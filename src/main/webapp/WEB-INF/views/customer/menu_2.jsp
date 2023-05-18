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
								<img src="../resources/image/menu/americano.png" alt="아메리카노"/>
							</div>
							<div class="item_name">
								<span>${list.menu_name}</span>
							</div>
							<div class="item_price">
								<span>${list.menu_price}원</span>
							</div>
							<span style="display:none">${list.option1_YN}</span>
							<span style="display:none">${list.option2_YN}</span>
							<span style="display:none">${list.option3_YN}</span>
						</div>
					</c:forEach>
						
						
						<!-- <form> -->
						<div id="popup" class="popup">
							<div class="popup_close">
								<img src="../resources/image/icon/x-icon.png" onclick="closePop()">
							</div>
							<div class="popup_container">
								<div class="popup_contents1">
									<div class="popup_img">
										<div><img src="../resources/image/menu/americano.png" alt="아메리카노"/></div>
									</div>
									<div class="popup_detail">
										<div class="popup_option">
											<input type="hidden" id="info_menu_idx">
											<span id="info_menu_name"></span>
											<input type="hidden" id="info_menu_price">
											<span id="info_menu_option1" style="display:none"></span>
											<span id="info_menu_option2" style="display:none"></span>
											<span id="info_menu_option3" style="display:none"></span>
										</div>
										<div class="popup_option" id="popup_option1" style="display:none">
											<div class="popup_option_btn">
												<input type="radio" name="option" id="option01" value="HOT" checked><label for="option01">HOT</label>
											</div>
											<div class="popup_option_btn">
												<input type="radio" name="option" id="option02" value="ICED"><label for="option02">ICED</label>
											</div>
										</div>
										<div class="popup_option">
											<input type="button" name="minus" id="minus" onclick='quantity("minus")' value="-"/>
											<input type="number" name="quantity" id="quantity" min="0" value="1" readonly/>
											<input type="button" name="plus" id="plus"onclick='quantity("plus")'value="+"/>
										</div>
									</div>
				
								</div>
								<div class="popup_contents2">
									<div class="popup_list" id="popup_option2" style="display:none">
										<div class="popup_listname"><span>샷 추가</span></div>
										<div class="popup_listitem">
											<input type="button" name="minus" id="minus" onclick='shotCount("minus")' value="-"/>
											<input type="number" name="option3" id="option3" min="0" value="1" readonly/>
											<input type="button" name="plus" id="plus"onclick='shotCount("plus")'value="+"/>
										</div>
									</div>
									<div class="popup_list" id="popup_option3" style="display:none">
										<div class="popup_listname"><span>얼음양</span></div>
										<div class="popup_listitem">
											<input type="radio" name="ice" id="0"/>
											<label for="0">적게</label>
											<input type="radio" name="ice" id="1" checked/>
											<label for="1">보통</label>
											<input type="radio" name="ice" id="2"/>
											<label for="2">많이</label>
										</div>
									</div>
								</div>
							</div>
							<div class="popup_submit">
								<input type="submit" name="#" id="#" value="확인">
							</div>
						</div>
						<!-- </form> -->
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
							<th>엑스</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="i" begin="1" end="3">
							<tr>
								<td><c:out value = "${i}"/><p></td>
								<td>아이스아메리카노</td>
								<td>
									<input type="button" name="minus" id="minus" onclick='count("minus",${i})' value="-"/>
									<input type="number" name="price" id="price" min="0" value="1" readonly/>
									<input type="button" name="plus" id="plus"onclick='count("plus",${i})'value="+"/>
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
					<img src="../resources/image/icon/pay-icon.png" onclick="location.href='/customer/check_member'">
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	function count(type,i) {
		/* const resultElement = document.getElementById("price"); */
		const resultElement = document.getElementsByClassName("price")[i-1];
		let number = resultElement.value;
		console.log(i);
		
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
		var row_span = e.getElementsByTagName("span");
	   	var modal = document.getElementById("popup");
	   
	   	document.getElementById("info_menu_idx").value 			= row_span[0].innerHTML;
	   	document.getElementById("info_menu_name").innerHTML 	= row_span[1].innerHTML;
	   	document.getElementById("info_menu_price").value 		= row_span[2].innerHTML;
	   	document.getElementById("info_menu_option1").innerHTML 	= row_span[3].innerHTML;
	   	document.getElementById("info_menu_option2").innerHTML 	= row_span[4].innerHTML;
	   	document.getElementById("info_menu_option3").innerHTML 	= row_span[5].innerHTML;
	   	
	   	if (row_span[3].innerHTML == 'Y') {
	   		document.getElementById("popup_option1").style.display ="block";
		}else {
			document.getElementById("popup_option1").style.display ="none";
		}
	   	
	   	if (row_span[5].innerHTML == 'Y') {
	   		document.getElementById("popup_option2").style.display ="block";
		}else {
			document.getElementById("popup_option2").style.display ="none";
		}
	   	
	   	if (row_span[4].innerHTML == 'Y') {
	   		document.getElementById("popup_option3").style.display ="block";
		}else {
			document.getElementById("popup_option3").style.display ="none";
		}
	   	
	   	modal.style.display ="block";

	  /*  	console.log(row_span);
	   	console.log(e); */
	}


	/* 팝업 닫기 */
	function closePop() {
		document.getElementById("popup").style.display ="none";
/* 		popBlur(false); */
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
	function quantity(type) {
		const resultElement = document.getElementById("quantity");
		let quantity = resultElement.value;
/* 		console.log(quantity); */

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
	}
	/* 샷 추가 */
	function shotCount(type) {
		const resultElement = document.getElementById("option3");
		let option3 = resultElement.value;
/* 		console.log(quantity); */

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
	}
</script>


</html>