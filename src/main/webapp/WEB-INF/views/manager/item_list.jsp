<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/main.css">
<link rel="stylesheet" href="../resources/css/manager.css">
</head>
<body>
	<div class="container">
		<form name="listForm" action="#" method="post">
			<div class="itembox">
				<div class="button_box">
					<input type="button" id="insert" onclick="location.href='/manager/insert_item'" value="추가">
					<input type="button" id="edit" onclick="location.href='/manager/edit_item'" value="수정">
					<input type="button" id="delete" onclick="location.href='#'" value="삭제">
				</div>
				<div class="list_box">
					<table>
						<colgroup>
							<col width="10%">
							<col width="20%">
							<col width="35%">
							<col width="35%">
						</colgroup>
						<thead>
							<tr>
								<th><input type="checkbox" name="allCheck" id="allCheck"/></th>
								<th>No.</th>
								<th>메뉴명</th>
								<th>메뉴가격</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="i" begin="1" end="3">
								<tr>
									<td><input type="checkbox" name="chkbox" class="chkbox"></td>
									<td><c:out value = "${i}"/><p></td>
									<td>아메리카노</td>
									<td><fmt:formatNumber pattern="###,###,###" value="3000"/><span>원</span></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</form>
	</div>
</body>
<script type="text/javascript">
	const checkAll = document.getElementById("allCheck");
	
	const checkboxes = document.querySelectorAll('input[type="checkbox"].checkbox');
	
	checkAll.addEventListener('click', ()=> {
		checkboxes.forEach(checkbox => {
			checkbox.checked = checkAll.checked;
		});
	});

</script>
</html>