<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
					<input type="radio" name="tab_menu" id="tab01">
					<label for="tab01" onclick="location.href='/kioskManager/kioskManager'">메뉴관리</label>
					<input type="radio" name="tab_menu" id="tab02">
					<label for="tab02" onclick="location.href='/kioskManager/order_list'">주문내역</label>
					<input type="radio" name="tab_menu" id="tab03" checked>
					<label for="tab03" onclick="location.href='/kioskManager/check_sales'">매출내역</label>
					
					<div class="conbox con3">
						<div class="container">
							<div class="itembox">
								<form action="#" method="post" name="salesForm">
								<div class="select">
									<input type="radio" name="selectSales" id="daySales" checked>
									<label for="daySales">일매출</label>
									<input type="radio" name="selectSales" id="monthlySales">
									<label for="monthlySales">월매출</label>
									
									<div class="conbox con1">
										<%@ include file="day_sales.jsp" %>
									</div>
									<div class="conbox con2">
										<%@ include file="monthly_sales.jsp" %>
									</div>
								</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>