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
	<form name="monthlySales" id="monthlySales" method="post">
		<div class="selectDate">
			<input type="date" id="start_date" name="start_date" value="<%= start_date%>">
			<span> ~ </span>
			<input type="date" id="end_date" name="end_date" value="<%= end_date%>">
			<input type="hidden" id="chkStatus2" name="chkStatus2" value="checked">
			<input type="button" id="search_btn" value="검색" onclick="month()">
			<input type="button" id="download_btn" value="다운로드" onclick="excel_month()">
		</div>
	</form>
		<div class="monthlySales">
			<table>
				<colgroup>
					<col width="33%">
					<col width="22%">
					<col width="22%">
					<col width="33%">
				</colgroup>
				<thead>
					<tr>
						<th>날짜</th>
						<th>판매건</th>
						<th>판매수량</th>
						<th>금액</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${monthlySales}">
					<tr>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.order_date }"/></td>
						<td>${list.total_cnt }</td>								<!-- 판매건 -->
						<td>${list.cnt }</td>									<!-- 판매수량 -->
						<td>${list.total_price }원</td>
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
					<span>${monthCnt }</span>
				</div>
			</div>
			<div class="resultList">
				<div class="resultCount">
					<span>판매금액</span>
				</div>
				<div class="resultAmount">
					<span>${monthSum }</span>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	function month(){
		var monthForm = document.monthlySales;
		monthForm.action = "/kioskManager/monthly_sales";
		monthForm.submit();	
	}
	function excel_month(){
		var monthForm = document.monthlySales;
		monthForm.action = "/kioskManager/excel_download_month";
		monthForm.submit();
	}
</script>
</html>