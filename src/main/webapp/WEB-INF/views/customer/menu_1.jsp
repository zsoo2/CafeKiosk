<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/main.css">
<link rel="stylesheet" href="../resources/css/customer.css">
</head>
<body>
	<div class="container" id="menu_1">
		<div class="item" onclick="openPop()">
			<div class="item_img">
				<img src="../resources/image/menu/americano.png" alt="아메리카노"/>
			</div>
			<div class="item_price">
				<span>음료 가격</span>
			</div>
		</div>
		<div class="item">
			<div class="item_img">
				<img src="../resources/image/menu/cafelatte.png" alt="카페라떼"/>
			</div>
			<div class="item_price">
				<span>음료 가격</span>
			</div>
		</div>
		<div class="item">
			<div class="item_img">
				<img src="../resources/image/menu/caramelmacchiato.png" alt="카라멜마끼야또"/>
			</div>
			<div class="item_price">
				<span>음료 가격</span>
			</div>
		</div>
		<div class="item">
			<div class="item_img">
				<img src="../resources/image/menu/cafemocha.png" alt="카페모카"/>
			</div>
			<div class="item_price">
				<span>음료 가격</span>
			</div>
		</div>
		<div class="item">
			<div class="item_img">
				<img src="../resources/image/menu/vanillalatte.png" alt="바닐라라떼"/>
			</div>
			<div class="item_price">
				<span>음료 가격</span>
			</div>
		</div>
		<div class="item">
			<div class="item_img">
				<!-- <img src="../resources/image/menu/americano.png" alt="아메리카노"/> -->
			</div>
			<div class="item_price">
				<!-- <span>음료 가격</span> -->
			</div>
		</div>
		<div class="item">
			<div class="item_img">
				<!-- <img src="../resources/image/menu/americano.png" alt="아메리카노"/> -->
			</div>
			<div class="item_price">
				<!-- <span>음료 가격</span> -->
			</div>
		</div>
		<div class="item">
			<div class="item_img">
				<!-- <img src="../resources/image/menu/americano.png" alt="아메리카노"/> -->
			</div>
			<div class="item_price">
				<!-- <span>음료 가격</span> -->
			</div>
		</div>
		<div class="item">
			<div class="item_img">
				<!-- <img src="../resources/image/menu/americano.png" alt="아메리카노"/> -->
			</div>
			<div class="item_price">
				<!-- <span>음료 가격</span> -->
			</div>
		</div>
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
						<div class="popup_option"><span>아메리카노</span></div>
						<div class="popup_option">
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
					<div class="popup_list">
						<div class="popup_listname"><span>샷 추가</span></div>
						<div class="popup_listitem">
							<input type="button" name="minus" id="minus" onclick='shotCount("minus")' value="-"/>
							<input type="number" name="option3" id="option3" min="0" value="1" readonly/>
							<input type="button" name="plus" id="plus"onclick='shotCount("plus")'value="+"/>
						</div>
					</div>
					<div class="popup_list">
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
	
</body>
<script type="text/javascript">
	/* 팝업 열고 닫기 */
	function openPop(){
		document.getElementById("popup").style.display ="block";
/* 		popBlur(true); */
	}
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