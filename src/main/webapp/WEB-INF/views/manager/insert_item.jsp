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
	<div class="container">
		<form id="insertForm" name="insertForm" method="post">
	
			<div class="itembox">
				<div class="item">
					<div class="managerMenu">
						<div class="itemList">
							<span>1. 메뉴명 </span>
						</div>
						<div class="itemValue">
							<input type="text" name="menu_name" value=""/>
						</div>
					</div>
					<div class="managerMenu">
						<div class="itemList">
							<span>2. 가격 </span>
						</div>
						<div class="itemValue">
							<input type="text" name="menu_price" value=""/>
						</div>
					</div>
					<div class="managerMenu">
						<div class="itemList">
							<span>3. 분류 </span>
						</div>
						<div class="itemValue">
							<select name="menu_category">						<!-- 아이템카테고리 -->
								<option value="coffee">커피</option>
								<option value="tea/ade">티/에이드</option>
								<option value="noncoffee">논커피</option>
								<option value="dessert">디저트</option>
							</select>			
						</div>
					</div>
					<div class="managerMenu">
						<div class="itemList">
							<span>4. 이미지 </span>
						</div>
						<div class="filebox">
							<input class="uploadName" value="첨부파일" placeholder="첨부파일">
							<label for="itemImg">파일찾기</label>
							<input type="file" id="itemImg"/>
						</div>
					</div>
					<div class="managerMenu">
						<div class="itemList">
							<span>5. 핫/아이스 </span>
						</div>
						<div class="itemValue">
							<div class="toggle">
								<input type="hidden" name="option1_YN" />
							    <input type="checkbox" name="toggle1" id="toggle1" onchange="YnCheck1(this);">
							    <label for="toggle1"></label>
							</div>
						</div>
					</div>
					<div class="managerMenu">
						<div class="itemList">
							<span>6. 샷 추가 </span>
						</div>
						<div class="itemValue">
							<div class="toggle">
								<input type="hidden" name="option2_YN" />
							    <input type="checkbox" name="toggle2" id="toggle2" onchange="YnCheck2(this);">
							    <label for="toggle2"></label>
							</div>
						</div>
					</div>
					<div class="managerMenu">
						<div class="itemList">
							<span>7. 얼음 양 </span>
						</div>
						<div class="itemValue">
							<div class="toggle">
								<input type="hidden" name="option3_YN" />
							    <input type="checkbox" name="toggle3" id="toggle3" onchange="YnCheck3(this);">
							    <label for="toggle3"></label>
							</div>
						</div>
					</div>
				</div>
				<div class="popup_submit">
					<input type="submit" class="insertButton" name="#" id="#" value="확인">
				</div>
			</div>
		</form>
	</div>
	
	<script>
	if ($('input[name=toggle1]').is(":checked")) {
	    $('input[name=option1_YN]').val('Y');
	} else {
	    $('input[name=option1_YN]').val('N');
	}
	
	if ($('input[name=toggle2]').is(":checked")) {
	    $('input[name=option2_YN]').val('Y');
	} else {
	    $('input[name=option2_YN]').val('N');
	}
	
	if ($('input[name=toggle3]').is(":checked")) {
	    $('input[name=option3_YN]').val('Y');
	} else {
	    $('input[name=option3_YN]').val('N');
	}
	
	 function YnCheck1(obj) {
		    var checked = obj.checked;
		    if(checked){
		    	$('input[name=option1_YN]').val('Y');
		    }else{
			    $('input[name=option1_YN]').val('N');
		    }
		 };
		 
	 function YnCheck2(obj) {
		    var checked = obj.checked;
		    if(checked){
		    	$('input[name=option2_YN]').val('Y');
		    }else{
			    $('input[name=option2_YN]').val('N');
		    }
		 };
		 
	 function YnCheck3(obj) {
		    var checked = obj.checked;
		    if(checked){
		    	$('input[name=option3_YN]').val('Y');
		    }else{
			    $('input[name=option3_YN]').val('N');
		    }
		 };
		 
		 
		 
$(document).ready(function(){
	//메뉴 등록 버튼(메뉴 등록 기능 작동)
	$(".insertButton").click(function(){
		$("#insertForm").attr("action", "insert_item");
		$("#insertForm").submit();
	});
});

</script>
</body>
</html>