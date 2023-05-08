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
		<form name="listForm" action="#" method="post">
			<div class="itembox">
				<div class="button_box">
					<input type="button" onclick="location.href='/manager/insert_item'" value="추가">
					<input type="button" onclick="location.href='/manager/edit_item'" value="수정">
					<input type="button" onclick="location.href='#'" value="삭제">

				</div>
			</div>
		</form>
	</div>
</body>
</html>