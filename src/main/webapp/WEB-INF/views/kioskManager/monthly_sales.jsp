<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="space"></div>
	<div class="eachSales">
	<form name="monthlySales" id="monthlySales" method="post" action="/kioskManager/monthly_sales">
		<div class="selectDate">
			<input type="date" id="start_date_sales" name="start_date" value="<%= start_date%>">
			<span> ~ </span>
			<input type="date" id="end_date_sales" name="end_date" value="<%= end_date%>">
			<input type="submit" value="검색">
		</div>
	</form>
		<div class="monthlySales">
			<table border="1">
				<colgroup>
					<col width="33%">
					<col width="33%">
					<col width="33%">
				</colgroup>
				<thead>
					<tr>
						<th>날짜</th>
						<th>판매건</th>
						<th>금액</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${monthlySales}">
					<tr>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.order_date }"/></td>
						<td>${list.total_cnt }</td>
						<td>${list.option_price }</td>
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
					<span>1000</span>
				</div>
			</div>
			<div class="resultList">
				<div class="resultCount">
					<span>판매금액</span>
				</div>
				<div class="resultAmount">
					<span>10000000</span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>