<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1, maximum-scale=1">
<title>Membership</title>
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
						<input type="number" value=""/>
					</div>
					<div class="keypad_box">
						<div><input type="number" value="1" readonly></div>
					    <div><input type="number" value="2" readonly></div>
					    <div><input type="number" value="3" readonly></div>
					    <div><input type="number" value="4" readonly></div>
					    <div><input type="number" value="5" readonly></div>
					    <div><input type="number" value="6" readonly></div>
					    <div><input type="number" value="7" readonly></div>
					    <div><input type="number" value="8" readonly></div>
					    <div><input type="number" value="9" readonly></div>
					    <div><input type="submit" value="적립하기" readonly></div>
					    <div><input type="number" value="0" readonly></div>
					    <div><input type="button" value="←" readonly></div>
					</div>
					<div class="check_box">
						<button>이전화면</button>
						<button>건너뛰기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>