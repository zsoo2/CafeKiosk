<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1, maximum-scale=1">
<title>ManagerMainPage</title>
<link rel="stylesheet" href="../resources/css/main.css">
<link rel="stylesheet" href="../resources/css/kioskManager.css">
</head>
<body>
	<div class="wrapper">
		<div class="wrap" id="wrap">
			<div class="top">
				<span><a href="../">처음으로</a></span>
			</div>
			<div class="contents">
				<div class="manager_menu">
					<input type="radio" name="tab_menu" id="tab01" checked>
					<label for="tab01" onclick="location.href='/kioskManager/manager'">메뉴관리</label>
					<input type="radio" name="tab_menu" id="tab02">
					<label for="tab02" onclick="location.href='/kioskManager/order_list'">주문내역</label>
					<input type="radio" name="tab_menu" id="tab03">
					<label for="tab03" onclick="location.href='/kioskManager/check_sales'">매출내역</label>
					
					<div class="conbox con1">
						<%@ include file="item_list.jsp" %>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>