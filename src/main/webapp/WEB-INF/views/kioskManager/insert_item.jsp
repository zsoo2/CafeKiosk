<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
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
	<div class="wrapper">
		<div class="wrap" id="wrap">
			<div class="top">
				<span><a href="../">처음으로</a></span>
			</div>
			<div class="contents">
				<div class="manager_menu">
					<input type="radio" name="tab_menu" id="tab01" checked>
					<label for="tab01" onclick="location.href='/kioskManager/kioskManager'">메뉴관리</label>
					<input type="radio" name="tab_menu" id="tab02">
					<label for="tab02" onclick="location.href='/kioskManager/order_list'">주문내역</label>
					<input type="radio" name="tab_menu" id="tab03">
					<label for="tab03" onclick="location.href='/kioskManager/check_sales'">매출내역</label>
					
					<div class="conbox con1">
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
							<input type="file" name="uploadFile" id="itemImg"/>
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
					<div>
						<input type="button" name="#" id="#" value="취소" onclick="location.href='/manager/manager'">
						<input type="button" class="insertButton" value="확인" onclick="frmFunc()">
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
	
	let fileInput = $('input[name="uploadFile"]');
	let fileList = fileInput[0].files;
	let fileObj = fileList[0];
	
	console.log("fileName : " + fileObj.name);
	console.log("fileSize : " + fileObj.size);
	console.log("fileType(MimeType) : " + fileObj.type);
	
	if(!fileCheck(fileObj.name, fileObj.size)){
		return false;
	}
	
	formData.append("uploadFile", fileObj);
	
	$.ajax({
		url: '/kioskManager/insertMenuAjaxAction',
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


/* 체크박스 동작 */
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
/* $(document).ready(function(){
	$(".insertButton").click(function(){
		$("#insertForm").attr("action", "insert_item");
		$("#insertForm").submit();
	});
}); */

/* alert */
function frmFunc(){
	var rtn;
	rtn = confirm('등록하시겠습니까?');
	
	if(rtn){
		document.getElementById("insertForm").submit();
		//item_list페이지로 이동하게
	}else{
		return false;
	}
}

</script>
</body>
</html>