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
					<input type="radio" name="tab_menu" id="tab02" checked>
					<label for="tab02" onclick="location.href='/kioskManager/order_list'">주문내역</label>
					<input type="radio" name="tab_menu" id="tab03">
					<label for="tab03" onclick="location.href='/kioskManager/check_sales'">매출내역</label>
					
					<div class="conbox con2">
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
												<c:forEach var="list" items="${orderList}">
													<tr>
														<c:set var="except" value ="외"/>										
														<c:set var="count" value ="건"/>									
 														<td><c:out value="${list.order_date }"/></td>
														<td><c:out value="${list.order_no }"/></td>
														<c:choose>
															<c:when test="${list.cnt >= 1}">
																<td><c:out value="${list.menu_name} ${except} ${list.cnt }${count}"/></td>		<!-- 여러 잔 구매 시 -->
															</c:when>
															<c:otherwise>
																<td><c:out value="${list.menu_name}"/></td>										<!-- 한 잔 구매 시 -->
															</c:otherwise>
														</c:choose>
														<c:choose>
															<c:when test="${list.user_no ne 'N' }">
																<td><c:out value="${list.user_no }"/></td>					<!-- 핸드폰 뒷자리 번호 -->
															</c:when>
															<c:otherwise>
																<td><c:out value="-"/></td>									<!-- 미적립 표시 -->
															</c:otherwise>
														</c:choose>
														
														<td><c:out value="${list.option_price }"/></td>
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
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	document.getElementById("start_date").value = new Date().toISOString().substring(0,10);
	document.getElementById("end_date").value = new Date().toISOString().substring(0,10);
</script>
</html>