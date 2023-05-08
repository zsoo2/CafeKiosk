<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>ManagerMainPage</title>
<link rel="stylesheet" href="../resources/css/main.css">
<link rel="stylesheet" href="../resources/css/manager.css">
</head>
<body>
	<div class="wrapper">
		<div class="wrap" id="wrap">
			<div class="top">
				<span><a href="../main">처음으로</a></span>
			</div>
			<div class="contents">
				<div class="manager_menu">
					<input type="radio" name="tab_menu" id="tab01" checked>
					<label for="tab01">메뉴관리</label>
					<input type="radio" name="tab_menu" id="tab02">
					<label for="tab02">주문내역</label>
					<input type="radio" name="tab_menu" id="tab03">
					<label for="tab03">매출내역</label>
					
					<div class="conbox con1">
						<%@ include file="insert_item.jsp" %>
					</div>
					<div class="conbox con2">
						<%@ include file="order_list.jsp" %>
					</div>
					<div class="conbox con3">
						<%@ include file="check_sales.jsp" %>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>