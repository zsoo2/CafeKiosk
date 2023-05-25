<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/main.css">
<link rel="stylesheet" href="../resources/css/kioskManager.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<form id="listForm" name="listForm" method="post">
			<div class="itembox">
				<div class="button_box">
					<input type="button" id="insert" onclick="location.href='/manager/insert_item'" value="추가">
					<input type="button" name="deleteButton" id="deleteButton" onclick="frmFunc()" value="삭제">
				</div>
				<div class="list_box">
					<table>
						<colgroup>
							<col width="10%">
							<col width="10%">
							<col width="20%">
							<col width="25%">
							<col width="25%">
						</colgroup>
						<thead>
							<tr>
								<th><input type="checkbox" id='chk_all' name='chk_all' value='chk_all' onclick='SelectAll(this)'/></th>
								<th>No.</th>
								<th>메뉴명</th>
								<th>분류</th>
								<th>메뉴가격</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${menuList}">
								<tr>
									<td><input type="checkbox" name="chk_list" class="chk_indiv" onclick="CheckSelectAll()" value="${list.menu_idx}"></td>
									<td onclick = "location.href='/manager/edit_item?menu_idx=${list.menu_idx}'"><c:out value="${list.menu_idx}"/></td>
									<td onclick = "location.href='/manager/edit_item?menu_idx=${list.menu_idx}'"><c:out value="${list.menu_name}"/></td>
									<td onclick = "location.href='/manager/edit_item?menu_idx=${list.menu_idx}'"><c:out value="${list.menu_category}"/></td>
									<td onclick = "location.href='/manager/edit_item?menu_idx=${list.menu_idx}'"><fmt:formatNumber pattern="###,###,###" value="${list.menu_price}"/><span>원</span></td>
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

	// th 체크박스	 --> 전체 체크하는 체크박스
	function SelectAll(selectAll)  {
	    var checkboxes = document.getElementsByName('chk_list');
	
	    checkboxes.forEach((checkbox) => {
	        checkbox.checked = selectAll.checked
	    })
	}

	// td 체크박스
	function CheckSelectAll()  {
	   var checkboxes  = document.querySelectorAll('input[name="chk_list"]');
	   var checked     = document.querySelectorAll('input[name="chk_list"]:checked');
	   var select_all  = document.querySelector('input[name="chk_all"]');
	   
	   if(checkboxes.length === checked.length)  {
	       select_all.checked = true;
	   }else {
	       select_all.checked = false;
	   }
	}
	
	// 체크박스 선택 여부 확인
	function CheckTest() {
		var checkboxes = document.getElementsByName("chk_list");
		
		for (var i = 0; i < checkboxes.length; i++) {
			if (checkboxes[i].checked) {
				return true;
			}
		}	
		alert("삭제할 항목을 선택하세요.");
		return false;		
	}


	/* alert */
	function frmFunc(){

		if(CheckTest() == false) {
		} else{
			var rtn;
			rtn = confirm('정말 삭제하시겠습니까?');
			
			if(rtn) {
				/* 메뉴삭제 버튼(메뉴 삭제 기능 작동) */
				$("#listForm").attr("action", "delete_item");
				$("#listForm").submit();
			} else{
				return false;
			}
		}
	}

</script>
</html>