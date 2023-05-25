<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DAYSALES</title>
</head>
<body>
	<div class="space"></div>
	<div class="eachSales">
		<div class="selectDate">
			<input type="date" id="this_day" name="this_day" value="">
			<input type="submit" value="검색">
		</div>
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
					<tr>
						<td>aaa</td>
						<td>aaa</td>
						<td>aaa</td>
						<td>aaa</td>
					</tr>
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
<script type="text/javascript">
	document.getElementById("this_day").value = new Date().toISOString().substring(0,10);
</script>
</html>