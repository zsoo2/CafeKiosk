<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/main.css">
<link rel="stylesheet" href="../resources/css/manager.css">
</head>
<body>
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
</body>
</html>