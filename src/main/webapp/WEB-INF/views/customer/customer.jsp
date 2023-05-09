<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1, maximum-scale=1">
<title>CustomerMainPage</title>
<script
  src="https://code.jquery.com/jquery-3.6.4.js"
  integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
  crossorigin="anonymous"></script>
<link rel="stylesheet" href="../resources/css/main.css">
<link rel="stylesheet" href="../resources/css/customer.css">
</head>
<body>
	<div class="wrapper">
		<div class="wrap" id="wrap">
			<div class="top">
				<span><a href="../">처음으로</a></span>
			</div>
			<div class="contents">
				<div class="customer_menu">
<%-- 					<input type="radio" name="tab_menu" id="tab01" checked>
					<label for="tab01">커피</label>
					<input type="radio" name="tab_menu" id="tab02">
					<label for="tab02">티/에이드</label>
					<input type="radio" name="tab_menu" id="tab03">
					<label for="tab03">논커피</label>
					<input type="radio" name="tab_menu" id="tab04">
					<label for="tab04">디저트</label>
					
					<div class="conbox con1">
						<%@ include file="menu_1.jsp" %>
					</div>
					<div class="conbox con2">
						<%@ include file="menu_2.jsp" %>
					</div>
					<div class="conbox con3">
						<%@ include file="menu_3.jsp" %>
					</div>
					<div class="conbox con4">
						<%@ include file="menu_4.jsp" %>
					</div> --%>
					<ul class="tit_list">
				        <!-- 디폴트 선택 li에 active 클래스 추가 -->
				        <li class="active"><a href="#coffee">커피</a></li>
				        <li><a href="#teaade">티/에이드</a></li>
				        <li><a href="#noncoffee">논커피</a></li>
				        <li><a href="#dessert">디저트</a></li>
				    </ul>
				    <!-- 탭메뉴 컨텐츠 -->
				    <div class="tab_con">
				        <div id="coffee" class="tab_list">
				            <%@ include file="menu_1.jsp" %>
				        </div>
				            
				        <div id="teaade" class="tab_list">
				            <%@ include file="menu_2.jsp" %>
				        </div>
				
				        <div id="noncoffee" class="tab_list">
				            <%@ include file="menu_3.jsp" %>
				        </div>
   				        <div id="dessert" class="tab_list">
				            <%@ include file="menu_4.jsp" %>
				        </div>
					</div>
				</div>
			<div class="cart">
				<div class="cart_list">
					<table border= "0">
						<thead>
							<tr>
								<th></th>
								<th>제품명</th>
								<th>수량</th>
								<th>가격</th>
								<th>엑스</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="i" begin="1" end="3">
								<tr>
									<td><c:out value = "${i}"/><p></td>
									<td>아이스아메리카노</td>
									<td>
										<input type="button" name="minus" id="minus" onclick='count("minus")' value="-"/>
										<input type="number" name="price" id="price" min="0" value="1" readonly/>
										<input type="button" name="plus" id="plus"onclick='count("plus")'value="+"/>
									</td>
									<td>3000<span>원</span></td>
									<td>
										<input type="button" name="cancle" id="cancle" class="cancle"/>
										
									<!-- <img src="../resources/image/icon/x-icon.png"></td> -->
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="payment">
				<div class="payment_content">
					<div class="payment_box1">
						<div class="payment_text"><span>주문수량 :</span></div>
						<div class="payment_quantityNum"><span>3</span></div>
					</div>
					<div class="payment_box1">
						<div class="payment_text"><span>주문금액 :</span></div>
						<div class="payment_amountNum"><span>9000</span></div>
					</div>
				</div>
				<div class="payment_content">
					<div class="payment_box2">
						<img src="../resources/image/icon/cancle-icon.png">
					</div>
					<div class="payment_box2">
						<img src="../resources/image/icon/pay-icon.png" onclick="location.href='/customer/check_member'">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	function count(type) {
		const resultElement = document.getElementById("price");
		let number = resultElement.value;
		console.log(number);
		
		if(type === 'plus') {
			   number = parseInt(number) + 1;
			}else if(type === 'minus') {
			   number = parseInt(number) - 1;
			    if(number < 0) {
			    	number = 0;
			    }else {
			    	number = number;
			    }
			}
		
		resultElement.value = number;
	}

	$(document).ready(function(){
	    tab();
	})

	function tab(){
	    //탭메뉴 클릭할 때 실행
	    $('.customer_menu .tit_list > li a').on('click', function(e) {
	        e.preventDefault();
	    
	        //초기화
	        $('.customer_menu .tit_list > li').removeClass('active');
	        $('.customer_menu .tab_list').hide(); 
	        
	        //실행
	        $(this).parent().addClass('active'); 
	        var activeTab = $(this).attr('href');
	        $(activeTab).show();

	        //파라미터 확인
	        urlParam =  location.search.substr(location.search.indexOf("?") + 1);
	        if(urlParam != ''){
	            urlParam = '?' + urlParam;
	        }

	        //파라미터 변경
	        getNewUrl('tabName', urlParam); //(변경·추가할 파라미터 이름, 현재 파라미터)
	        function getNewUrl(paramName, oldUrl) {
	            var newUrl;
	            var urlChk = new RegExp('[?&]'+paramName+'\\s*=');
	            var urlChk2 = new RegExp('(?:([?&])'+paramName+'\\s*=[^?&]*)')
	            
	            
	            if (urlChk.test(oldUrl)) { //해당 파라미터가 있을 때
	                newUrl = oldUrl.replace(urlChk2, "$1"+paramName+"=" + activeTab.substr(1));
	            } else if (/\?/.test(oldUrl)) { //해당 파라미터가 없고 다른 파라미터가 있을 때
	                newUrl = oldUrl + "&"+paramName+"=" + activeTab.substr(1);
	            } else { //파라미터가 없을 때
	                newUrl = oldUrl + "?"+paramName+"=" + activeTab.substr(1);
	            }

	            history.pushState(null, null, newUrl);
	        }
	    	
	        // 탭 이름 전달
		    $.ajax({
		    	url : "/customer/customer",
		    	type : 'get',
		    	data : {
		    		tabName : activeTab.substr(1)
	    		},
		    	success : function(data) {			
	         	},
		    	error : function() {
		    		alert("error");
		    	}
		    });
	     
	    });
	    //파라미터 값 검사
	    function getParameter(name) {
	        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	            results = regex.exec(location.search);
	        return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	    }

	    var getParam = getParameter('tabName'); //선택한 탭 파라미터
	    var loadChk = getParameter('loadChk'); //첫 로드 여부 체크
	    
	    if(getParam != ''){ //파라미터 값이 있으면 파라미터 값 기준으로 탭메뉴 선택
	        $('.customer_menu .tit_list > li a[href="#'+getParam+'"]').parent().addClass('active'); 
	        $('.customer_menu .tit_list > li a[href="#'+getParam+'"]').trigger('click');

	        if(loadChk == 'on'){ //처음 로드되었으면 스크롤 이동
	            //탭 위치로 이동
	            var tabTop = $('.customer_menu').offset().top;
	            $(window).scrollTop(tabTop - 100);

	            //파라미터 확인
	            var urlParam =  location.search.substr(location.search.indexOf("?") + 1);
	            if(urlParam != ''){
	                urlParam = '?' + urlParam;
	            }
	            
	            //loadChk 파라미터 값 변경
	            loadChange('loadChk', urlParam);
	            function loadChange(paramName, oldUrl) {
	                var newUrl;
	                var urlChk = new RegExp('[?&]'+paramName+'\\s*=');
	                var urlChk2 = new RegExp('(?:([?&])'+paramName+'\\s*=[^?&]*)')
	                newUrl = oldUrl.replace(urlChk2, "$1"+paramName+"=off");
	                history.pushState(null, null, newUrl);
	            }
	        }
	    }else{ //파라미터 값이 없으면 active 클래스 기준으로 탭메뉴 선택
	        var activeChk = 0;
	        $('.customer_menu .tit_list > li').each(function(i) { 
	            if ($(this).hasClass('active')){
	                $(this).addClass('active'); 
	                $(this).find('a').trigger('click');
	                activeChk ++
	            }
	        });

	        //active 지정 안했을 시 첫 탭메뉴 선택
	        if(activeChk == 0){
	            $('.customer_menu .tit_list > li:first-child a').trigger('click');
	        }
	    }

	    //뒤로가기 탭메뉴 복구
	    window.onpopstate = function(event) {
	        //초기화
	        $('.customer_menu .tit_list > li').removeClass('active');
	        $('.customer_menu .tab_list').hide(); 
	        var getParam2 = getParameter('tabName'); //선택한 탭 파라미터
	        
	        //탭메뉴 열기
	        if(getParam2 != ''){
	            $('.customer_menu .tit_list > li a[href="#'+getParam2+'"]').parent().addClass('active');
	            $('#'+getParam2).show()
	        }else{
	            $('.customer_menu .tit_list > li:first-child').addClass('active');
	            $('.customer_menu .tab_list:first-of-type').show();
	        }
	    };
	}
</script>
</html>