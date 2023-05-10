<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1, maximum-scale=1">
<title>Membership</title>
<script
  src="https://code.jquery.com/jquery-3.6.4.js"
  integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
  crossorigin="anonymous"></script>
<link rel="stylesheet" href="../resources/css/main.css">
<link rel="stylesheet" href="../resources/css/customer.css">
</head>
<body>			
<!-- <form id="checkForm" name="checkForm" action="/customer/join" method="post"> -->
	<div class="wrapper">
		<div class="wrap">
			<div class="top">
				<span><a href="../">처음으로</a></span>
			</div>

			<div class="contents">
				<div class="member_container">
					<div class="title_box">
						<span>적립할 번호를 입력하세요.</span>
					</div>
					<div class="number_box">
						<input type="text" id="number_box" value="010"/>
					</div>
					<div class="keypad_box">
						<div><input type="text" class="numKey" value="1" onclick="add(1)" readonly></div>
					    <div><input type="text" class="numKey" value="2" onclick="add(2)" readonly></div>
					    <div><input type="text" class="numKey" value="3" onclick="add(3)" readonly></div>
					    <div><input type="text" class="numKey" value="4" onclick="add(4)" readonly></div>
					    <div><input type="text" class="numKey" value="5" onclick="add(5)" readonly></div>
					    <div><input type="text" class="numKey" value="6" onclick="add(6)" readonly></div>
					    <div><input type="text" class="numKey" value="7" onclick="add(7)" readonly></div>
					    <div><input type="text" class="numKey" value="8" onclick="add(8)" readonly></div>
					    <div><input type="text" class="numKey" value="9" onclick="add(9)" readonly></div>
					    <div><input type="submit" value="적립하기" onclick="location.href='/customer/join'" readonly></div>
					    <div><input type="text" class="numKey" value="0" onclick="add(0)" readonly></div>
					    <div><input type="text" class="btn" value="←" onclick="deleteNum()"readonly></div>
					</div>
					<div class="check_box">
						<div>
							<button type="button" onclick="location.href='/customer/customer'">이전화면</button>
							<button type="button" onclick="location.href='/customer/payment'">건너뛰기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- </form>	 -->
</body>
<script type="text/javascript">
	function add(char){
		var numBox = document.getElementById('number_box');
		var numBoxValue = numBox.value;

			numBox.value = numBox.value + char;
	}
	
	function deleteNum() {
		var numBox = document.getElementById('number_box');
		var numBoxValue = numBox.value;
		
		numBox.value = numBoxValue.substring(0, numBoxValue.length-1);
	}

	
</script>
</html>