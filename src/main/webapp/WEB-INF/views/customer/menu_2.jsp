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
	<div class="container">
<%-- 		<span>${hi}</span>
		<span>${menuList}</span> --%>
		<c:forEach var="menu" items="${menuList}">
			<div class="item">
				<div>${menu.menu_name}</div>
				<div>${menu.menu_price}원</div>
			</div>
		</c:forEach>
	
		<!-- <div class="item"></div>
		<div class="item"></div>
		<div class="item"></div>
		<div class="item"></div>
		<div class="item"></div>
		<div class="item"></div>
		<div class="item"></div> -->
	</div>
</body>
</html>