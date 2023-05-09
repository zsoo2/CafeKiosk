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
						<input type="number" id="number_box" value=""/>
					</div>
					<div class="keypad_box">
						<div><input type="number" class="numKey" value="1" readonly></div>
					    <div><input type="number" class="numKey" value="2" readonly></div>
					    <div><input type="number" class="numKey" value="3" readonly></div>
					    <div><input type="number" class="numKey" value="4" readonly></div>
					    <div><input type="number" class="numKey" value="5" readonly></div>
					    <div><input type="number" class="numKey" value="6" readonly></div>
					    <div><input type="number" class="numKey" value="7" readonly></div>
					    <div><input type="number" class="numKey" value="8" readonly></div>
					    <div><input type="number" class="numKey" value="9" readonly></div>
					    <div><input type="submit" value="적립하기" readonly></div>
					    <div><input type="number" class="numKey" value="0" readonly></div>
					    <div><input type="button" class="btn" value="←" readonly></div>
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
</body>
<script type="text/javascript">
	$(document).ready(function(){
	    $('.numKey').click(function(){
	        var number_box = document.getElementById('number_box');
	        if(this.innerHTML == '0'){
	            if (number_box.innerHTML.length > 0)
	            	number_box.innerHTML = number_box.innerHTML + this.innerHTML;
	            
	        }
	        else
	        	number_box.innerHTML = number_box.innerHTML + this.innerHTML;
	        
	        event.stopPropagation();
	        console.log("dfsd");
	    });
	    
	    $('.btn').click(function(){
	        if(this.innerHTML == '←'){
	            var numBox = document.getElementById('number_box');
	            if(numBox.innerHTML.length > 0){
	                numBox.innerHTML = number_box.innerHTML.substring(0, number_box.innerHTML.length - 1);
	            }
	        }
	        else
			{
	            document.getElementById('number_box').innerHTML = '';
	        }
	        
	        event.stopPropagation();
	    });
	});
</script>
</html>