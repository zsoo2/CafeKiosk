<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1, maximum-scale=1">
<title>Membership</title>
<script
  src="https://code.jquery.com/jquery-3.6.4.js"
  integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
  crossorigin="anonymous"></script>
<link rel="stylesheet" href="../resources/css/main.css">
<link rel="stylesheet" href="../resources/css/customer.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<form id="joinForm" action="/customer/order" method="post">
	<div class="wrapper">
		<div class="wrap">
			<div class="top">
				<span><a href="../">처음으로</a></span>
			</div>
			<div class="contents">
				<div class="member_container">
					<div class="join_container">
						<div class="text_container">
						<input type="hidden" id="user_no" name="user_no" value="${user_no}">
						<input type="hidden" id="check_result" name="check_result" value="${check_result}">
							<span>${user_no}</span><span>님</span><br>
							<span>스탬프</span>
							<span>1</span>
							<span>개 적립하시겠습니까?</span>
						</div>
						<div class="check_container">
							<div>
								<input type="checkbox" name="chkSelect" id="chk_btn1">
								<label for="chk_btn1"><span>개인정보처리방침 동의(필수)</span></label>
								<input type="button" id="detail" value="상세보기">
								<div class="detail_container" id="detail_box">
									<%@ include file="contract.jsp" %>
								</div>
							</div>
							<div>
								<input type="checkbox" name="chkSelect" id="chk_btn2">
								<label for ="chk_btn2"><span>만 14세 이상입니다.</span></label>
							</div>
						</div>
						<div class="popup_submit" id="join_popup">
							<div>
								<input type="button" name="#" id="#" value="취소" onclick="location.href='#'"/>
								<input type="button" name="#" id="#" value="확인" onclick="modalOn()"/>
							</div>
						</div>
					    <div id="modal" class="modal-overlay">
					        <div class="modal-window">
    					            <div class="close-area">X</div>
					            <div class="title">
					                <span>구매 감사합니다.</span><br>
					                <span>결제 진행하시겠습니까?</span>
					            </div>
					            <div class="content">
   									<input type="button" value="취소" onclick="modalOff()"/>
									<input type="submit" value="확인">
									<!-- <input type="submit" name="#" value="확인" onclick="location.href='/customer/payment'"/> -->
					            </div>
					        </div>
					    </div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
</body>
<script type="text/javascript">
	var button = document.getElementById('detail');
	var detail_box = document.getElementById('detail_box');
	
	button.onclick = function() {
		if(detail_box.style.display !== 'block') {
			detail_box.style.display = 'block';
		} else {
			detail_box.style.display = 'none';
		}
	};

//확인 팝업창 뜨는 부분
    const modal = document.getElementById("modal");
    function modalOn() {
    	if($("input:checkbox[id='chk_btn1']").is(":checked") != true){
    		swal.fire("약관 동의에 체크해주세요");
    		return;
    	} else if ($("input:checkbox[id='chk_btn2']").is(":checked") != true){
    		swal.fire("연령 확인에 체크해주세요");
    		return
    	} else {
	        modal.style.display = "flex";
    	}
    }
    function isModalOn() {
        return modal.style.display === "flex"
    }
    function modalOff() {
        modal.style.display = "none"
    }
    
    const closeBtn = modal.querySelector(".close-area")
    closeBtn.addEventListener("click", e => {
        modalOff();
    });

//동의 체크박스 부분
	function Check() {
		var arrSelect = document.getElelementsByName("chkSelect");
		
		for (var i = 0; i<arrSelect.length; i++) {
			if(arrSelect[i].checked) {
				return location.href='/customer/payment';
			}
		}
		swal.fire("체크해주세요");
		return false;
	}

</script>
</html>