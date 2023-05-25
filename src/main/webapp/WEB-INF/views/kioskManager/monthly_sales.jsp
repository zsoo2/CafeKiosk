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
		<div class="selectDate">
			<input type="date" id="start_date_sales" name="start_date" value="">
			<span> ~ </span>
			<input type="date" id="end_date_sales" name="end_date" value="">
			<input type="submit" value="검색">
		</div>
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
					<tr>
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
	document.getElementById("start_date_sales").value = new Date().toISOString().substring(0,10);
	document.getElementById("end_date_sales").value = new Date().toISOString().substring(0,10);
</script>
</html>