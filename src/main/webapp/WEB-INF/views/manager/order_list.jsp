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
		<form action="#" name="selectToday" method="post">
			<div class="itembox">
				<div class="selectDate">
					<input type="date" id="start_date" name="start_date" value="">
					<span> ~ </span>
					<input type="date" id="end_date" name="end_date" value="">
					<input type="submit" value="검색">
				</div>
				<div class="order_list">
					<table>
						<colgroup>
							<col width="30%">
							<col width="15%">
							<col width="30%">
							<col width="10%">
							<col width="10%">
							<col width="5%">
						</colgroup>
						<thead>
							<tr>
								<th>주문 시각</th>
								<th>주문 번호</th>
								<th>주문 내역</th>
								<th>구매자</th>
								<th>금액</th>
								<th>취소</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="i" begin="1" end="3">
								<tr>
									<td>2023-05-03 14:00:00</td>
									<td><c:out value = "${i}"/><p></td>
									<td>아이스아메리카노 외 1건</td>
									<td>1234</td>					<!-- 핸드폰 뒷자리 번호 -->
									<td>6000</td>
									<td><input type="button" name="cancle" id="cancle" class="cancle"/></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="page">
					<ul class="pagination modal">
						<li><a href="#" class="first">처음 페이지</a></li>
						<li><a href="#" class="arrow left"><<</a></li>
						<li><a href="#" class="active num">1</a></li>
						<li><a href="#" class="num">2</a></li>
						<li><a href="#" class="num">3</a></li>
						<li><a href="#" class="num">4</a></li>
						<li><a href="#" class="num">5</a></li>
						<li><a href="#" class="arrow right">>></a></li>
						<li><a href="#" class="last">끝 페이지</a></li>
					</ul>
				</div>
			</div>
		</form>
	</div>
</body>
<script type="text/javascript">
	document.getElementById("start_date").value = new Date().toISOString().substring(0,10);
	document.getElementById("end_date").value = new Date().toISOString().substring(0,10);
</script>
</html>