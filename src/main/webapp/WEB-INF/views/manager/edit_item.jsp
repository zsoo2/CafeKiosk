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
					<input type="submit" name="#" id="#" value="확인">
				</div>
			</div>
		</form>
	</div>
</body>
</html>