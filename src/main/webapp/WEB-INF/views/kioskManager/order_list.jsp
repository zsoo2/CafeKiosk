<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*, java.text.*" %>

<%
	Date date = new Date();
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
	String today = simpleDate.format(date);
	
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
/*  	out.println(start_date);
	out.println(end_date); */
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
					<input type="radio" name="tab_menu" id="tab02" checked>
					<label for="tab02" onclick="location.href='/kioskManager/order_list'">주문내역</label>
					<input type="radio" name="tab_menu" id="tab03">
					<label for="tab03" onclick="location.href='/kioskManager/check_sales'">매출내역</label>
					
					<div class="conbox con2">
						<div class="container">
							<div class="itembox">
								<form name="selectToday" method="get">								
									<div class="selectDate">
										<input type="date" id="start_date" name="start_date" value="<%= start_date%>">
										<span> ~ </span>
										<input type="date" id="end_date" name="end_date" value="<%= end_date%>">
										<input type="button" id="search_btn" value="검색" onclick="search()">
										<input type="button" id="download_btn" value="다운로드" onclick="excel()">
									</div>
								</form>
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
												<%-- <c:forEach var="list" items="${orderList}"> --%>
												<c:forEach var="list" items="${viewAll}">
													<tr>
														<c:set var="except" value ="외"/>										
														<c:set var="count" value ="건"/>
 														<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${list.order_date }"/></td>
														<td><c:out value="${list.order_no }"/></td>
														<c:choose>
															<c:when test="${list.cnt > 1}">
																<td><c:out value="${list.menu_name} ${except} ${list.cnt -1}${count}"/></td>		<!-- 여러 잔 구매 시 -->
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
														<td><input type="button" name="cancle" id="cancle" class="cancle" onclick="deleteOrder(${list.order_no})"/></td>
 													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<div class="page">
										<div class="pagination">
 											<c:if test="${paging.startPage != 1 }">
												<a href="/kioskManager/order_list?start_date=<%=start_date %>&end_date=<%=end_date %>&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">이전페이지</a>
											</c:if>
											<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
												
												<c:choose>
													<c:when test="${p == paging.nowPage }">
														<b>${p }</b>
													</c:when>
<%-- 													<c:when test="${p != paging.nowPage }">
														<a href="/kioskManager/order_list?start_date=<%=start_date %>&end_date=<%=end_date %>&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
													</c:when> --%>
													<c:otherwise>
														<a href="/kioskManager/order_list?start_date=<%=start_date %>&end_date=<%=end_date %>&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
													</c:otherwise>
												</c:choose>
											</c:forEach>
 											<c:if test="${paging.endPage != paging.lastPage}">
												<a href="/kioskManager/order_list?start_date=<%=start_date %>&end_date=<%=end_date %>&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">다음페이지</a>
											</c:if>										
											
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
 
	// 장바구니 삭제
	function deleteOrder(order_no) {
		$.ajax({
			type: "post", 
			url: "/kioskManager/deleteOrder",
			data: {"order_no" : order_no},
			success: function (data) {
				location.reload();
			}
		});
	}
	
	function search(){
		var form = document.selectToday;
		form.method = "get";
		form.action = "/kioskManager/order_list";
		form.submit();
	}
	function excel(){
		var form = document.selectToday;
		form.method = "post";
		form.action = "/kioskManager/excel_download";
		form.submit();
	}
</script>
</html>