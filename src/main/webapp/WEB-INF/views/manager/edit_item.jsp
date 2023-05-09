<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/main.css">
<link rel="stylesheet" href="../resources/css/manager.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
	<div class="wrapper">
		<div class="wrap" id="wrap">
			<div class="top">
				<span><a href="../">처음으로</a></span>
			</div>
			<div class="contents">
				<div class="manager_menu">
					<input type="radio" name="tab_menu" id="tab01" checked>
					<label for="tab01" onclick="location.href='/manager/manager'">메뉴관리</label>
					<input type="radio" name="tab_menu" id="tab02">
					<label for="tab02" onclick="location.href='/manager/order_list'">주문내역</label>
					<input type="radio" name="tab_menu" id="tab03">
					<label for="tab03" onclick="location.href='/manager/check_sales'">매출내역</label>
					
					<div class="conbox con1">
	<div class="container">
		<form name="insertForm" action="#" method="post">
			<div class="itembox">
				<div class="item">
					<div class="managerMenu">
						<div class="itemList">
							<span>1. 음료 번호 </span>
						</div>
						<div class="itemValue">
							<input type="text" name="itemNo" value=""/>
						</div>
					</div>
					<div class="managerMenu">
						<div class="itemList">
							<span>2. 메뉴명 </span>
						</div>
						<div class="itemValue">
							<input type="text" name="itemName" value=""/>
						</div>
					</div>
					<div class="managerMenu">
						<div class="itemList">
							<span>3. 가격 </span>
						</div>
						<div class="itemValue">
							<input type="text" name="itemPrice" value=""/>
						</div>
					</div>
					<div class="managerMenu">
						<div class="itemList">
							<span>4. 대분류 </span>
						</div>
						<div class="itemValue">
							<select name="ItemCa">						<!-- 아이템카테고리 -->
								<option value="1">커피</option>
								<option value="2">티/에이드</option>
								<option value="3">논커피</option>
								<option value="4">디저트</option>
							</select>			
						</div>
					</div>
					<div class="managerMenu">
						<div class="itemList">
							<span>6. 이미지 </span>
						</div>
						<div class="filebox">
							<input class="uploadName" value="첨부파일" placeholder="첨부파일">
							<label for="itemImg">파일찾기</label>
							<input type="file" id="itemImg"/>
						</div>
					</div>
					<div class="managerMenu">
						<div class="itemList">
							<span>7. 핫/아이스 </span>
						</div>
						<div class="itemValue">
							<div class="toggle">
							    <input type="checkbox" name="toggle1" id="toggle1" value="1">
							    <label for="toggle1"></label>
							</div>
						</div>
					</div>
					<div class="managerMenu">
						<div class="itemList">
							<span>8. 샷 추가 </span>
						</div>
						<div class="itemValue">
							<div class="toggle">
							    <input type="checkbox" name="toggle2" id="toggle2" value="2">
							    <label for="toggle2"></label>
							</div>
						</div>
					</div>
					<div class="managerMenu">
						<div class="itemList">
							<span>9. 얼음 양 </span>
						</div>
						<div class="itemValue">
							<div class="toggle">
							    <input type="checkbox" name="toggle3" id="toggle3" value="3">
							    <label for="toggle3"></label>
							</div>
						</div>
					</div>
				</div>
				<div class="popup_submit">
					<div>
						<input type="button" name="#" id="#" value="취소" onclick="location.href='/manager/manager'">
						<input type="submit" name="#" id="#" value="확인">
					</div>
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
</html>