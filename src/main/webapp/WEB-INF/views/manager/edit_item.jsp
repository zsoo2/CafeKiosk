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
		<form name="updateForm" method="post">
			<div class="itembox">
				<div class="item">
				
					<div class="managerMenu">
						<div class="itemList">
							<span>1. 메뉴명 </span>
						</div>
						<div class="itemValue">
							<input type="text" name="menu_name" value="${menuInfo.menu_name}"/>
						</div>
					</div>
					<div class="managerMenu">
						<div class="itemList">
							<span>2. 가격 </span>
						</div>
						<div class="itemValue">
							<input type="text" name="menu_price" value="${menuInfo.menu_price}"/>
						</div>
					</div>
					<div class="managerMenu">
						<div class="itemList">
							<span>3. 분류 </span>
						</div>
						<div class="itemValue">
							<select name="menu_category" id="menu_category">						<!-- 아이템카테고리 -->
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
							<input class="uploadName" value="${menuInfo.menu_picture}" placeholder="${menuInfo.menu_picture}">
							<label for="itemImg">파일찾기</label>
							<input type="file" name="menu_picture" id="itemImg"/>
						</div>
					</div>
					<div class="managerMenu">
						<div class="itemList">
							<span>5. 핫/아이스 </span>
						</div>
						<div class="itemValue">
							<div class="toggle">
							    <input type="text" name="option1_YN" value="${menuInfo.option1_YN}" />
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
							   <input type="hidden" name="option2_YN" value="${menuInfo.option2_YN}" />
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
								<input type="hidden" name="option3_YN" id="option3_YN" value="${menuInfo.option3_YN}" />
							    <input type="checkbox" name="toggle3" id="toggle3" onchange="YnCheck3(this);">
							    <label for="toggle3"></label>
							</div>
						</div>
					</div>
				</div>
				<div class="popup_submit">
					<div>
						<input type="button" name="#" id="#" value="취소" onclick="location.href='/manager/manager'">
						<input type="submit" name="#" id="updateButton" value="수정">
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
	
<script>

/* 이미지 업로드 */
 $("#itemImg").on('change',function(){
  var fileName = $("#itemImg").val();
  $(".uploadName").val(fileName);
});

$("input[type='file']").on("change", function(e){
	
	let formData = new FormData();
	
	let fileInput = $('input[name="menu_picture"]');
	let fileList = fileInput[0].files;
	let fileObj = fileList[0];
	
	if(!fileCheck(fileObj.name, fileObj.size)){
		return false;
	}
	
	formData.append("menu_picture", fileObj);
	
	$.ajax({
		url: '/manager/insertMenuAjaxAction',
    	processData : false,
    	contentType : false,
    	data : formData,
    	type : 'POST',
    	dataType : 'json'
	});	
});

/* var, method related with attachFile */
let regex = new RegExp("(.*?)\.(jpg|png)$");
let maxSize = 1048576; //1MB	

function fileCheck(fileName, fileSize){

	if(fileSize >= maxSize){
		alert("파일 사이즈 초과");
		return false;
	}
		  
	if(!regex.test(fileName)){
		alert("해당 종류의 파일은 업로드할 수 없습니다.");
		return false;
	}
	return true;	
}
/* 체크박스 & select박스 동작 */

var selectVal = "${menuInfo.menu_category}";
var checkYn1= "${menuInfo.option1_YN}";
var checkYn2= "${menuInfo.option2_YN}";
var checkYn3= "${menuInfo.option3_YN}";

if(selectVal == "coffee"){
	$("#menu_category").val("coffee").prop("selected", true);
}else if(selectVal == "noncoffee"){
	$("#menu_category").val("noncoffee").prop("selected", true);
}else if(selectVal == "teaade"){
	$("#menu_category").val("teaade").prop("selected", true);
}else if(selectVal == "dessert"){
	$("#menu_category").val("dessert").prop("selected", true);
}

if(checkYn1== "Y"){
$("#toggle1").prop("checked",true);
}else{
$("#toggle1").prop("checked",false);
}

if(checkYn2== "Y"){
	$("#toggle2").prop("checked",true);
	}else{
	$("#toggle2").prop("checked",false);
	}
	
if(checkYn3== "Y"){
	$("#toggle3").prop("checked",true);
	}else{
	$("#toggle3").prop("checked",false);
	}

//체크박스 value값 설정 
if($("#toggle1").is(':checked') == true){
   data.set("option1_YN", "Y");
}else{
   data.set("option1_YN", "N");
}

if($("#toggle2").is(':checked') == true){
	   data.set("option2_YN", "Y");
	}else{
	   data.set("option2_YN", "N");
	}
	
if($("#toggle3").is(':checked') == true){
	   data.set("option3_YN", "Y");
	}else{
	   data.set("option3_YN", "N");
	}

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
		 
		 /* 메뉴 등록 버튼(메뉴 등록 기능 작동) */
$(document).ready(function(){
	$("#updateButton").click(function(){
	$("#updateForm").attr("action", "edit_item");
	$("#updateForm").submit();
	});
});


</script>
</body>
</html>