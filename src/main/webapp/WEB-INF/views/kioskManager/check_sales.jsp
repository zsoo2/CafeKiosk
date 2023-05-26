<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*, java.text.*" %>

<%
	Date date = new Date();
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
	String today = simpleDate.format(date);
	
/* 	SimpleDateFormat simpleDatefmt = new SimpleDateFormat("yyyy-MM-dd");
	String today_date = simpleDatefmt.format(todayDate);*/
	
	String this_day = request.getParameter("this_day"); 
	
	String start_date = request.getParameter("start_date");
	String end_date = request.getParameter("end_date");
	
	if(start_date == null) {
		start_date = today;
	} else {
		start_date = request.getParameter("start_date");
	}
	if(end_date == null) {
		end_date = today;
	}else {
		end_date = request.getParameter("end_date");
	}
	if(this_day == null) {
		this_day = today;
	}else {
		this_day = request.getParameter("this_day");
	}
%>

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
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	//오늘 날짜 셋팅
	 var start_date = document.getElementById("start_date").value;
	 var end_date = document.getElementById("end_date").value;
	 var this_day = document.getElementById("this_day").value;
	 
	// console.log(start_date);
	 if(start_date == null){
		 start_date = new Date().toISOString().substring(0,10);
	 } else {
		 start_date = <%=start_date%>;
	 }
	 
	 if(end_date == null){
		 end_date = new Date().toISOString().substring(0,10);
	 } else {
		 end_date = <%=end_date%>;
	 }
	 
	 if(this_day == null){
		 this_day = new Date().toISOString().substring(0,10);
	 } else {
		 this_day = <%=this_day%>;
	 }
 
</script>
</html>