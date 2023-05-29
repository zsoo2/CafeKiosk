<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DAYSALES</title>
</head>
<body>
	<div class="space"></div>
	<div class="eachSales">
		<form name="daySales" id="daySales" method="post" action="/kioskManager/day_sales">
		<div class="selectDate">
			<input type="date" id="this_day" name="this_day" value="<%=this_day%>">
			<input type="hidden" id="chkStatus1" name="chkStatus1" value="checked">
			<input type="submit" value="검색">
		</div>
		</form>
		<div class="daySales">
			<table border="1">
				<colgroup>
					<col width="25%">
					<col width="25%">
					<col width="25%">
					<col width="25%">
				</colgroup>
				<thead>
					<tr>
						<th>주문번호</th>
						<th>날짜</th>
						<th>시간</th>
						<th>금액</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${daySales}">
						<tr>
							<td>${list.order_no}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.order_date }"/></td>
							<td><fmt:formatDate pattern="HH:mm:ss" value="${list.order_date }"/></td>
							<td>${list.option_price }원</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="result">
			<div class="resultList">
				<div class="resultCount">
					<span>판매건수</span>
				</div>
				<div class="resultAmount">
					<span>${dayCnt }</span>
				</div>
			</div>
			<div class="resultList">
				<div class="resultCount">
					<span>판매금액</span>
				</div>
				<div class="resultAmount">
					<span>${daySum }</span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>