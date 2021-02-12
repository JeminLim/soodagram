<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=devide-width, initial-scale=1">
<title>soodagram</title>
<link href="${path}/resources/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="text-center">
					<img src="${path}/resources/static/soodagram-font-logo.png" class="instagram-logo">
						<p class="info">친구들의 사진과 동영상을 보려면 가입하세요.</p>
						<div class="register-form">											
							<button type="button" class="btn btn-primary btn-block">
								<i class="fab fa-facebook-square"></i>
								<span class="fb-login">Facebook으로 로그인</span>
							</button>										
							<p class="or"> 또는 </p>
							<form action="${path}/user/register" method="post">
								<div class="form-group">
									<input type="email" id="userEmail" class="form-control" placeholder="이메일" name="userEmail">
								</div>
								<div class="form-group">
									<input type="text" id="userName" class="form-control" placeholder="성명" name="userName">
								</div>
								<div class="form-group">
									<input type="text" id="userId" class="form-control" placeholder="사용자 이름" name="userId">
								</div>
								<div class="form-group">
									<input type="password" id="userPw" class="form-control" placeholder="비밀번호" name="userPw">
								</div>
								<button type="submit" id="submitBtn" class="btn btn-primary btn-block" disabled>
									가입
								</button>
							<div class="inform-polocies">
								<a href="#" class="to-polocies">
									가입하면 soodagram의 약관, 데이터 정책 및 쿠키정책에 동의하게 됩니다.
								</a>		
							</div>				
						</form>	
					</div>	
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<div class="text-center">					
					<span class="go-to-register">계정이 있으신가요?
					<a href="${path}/user/login" class="register">로그인</a>
					</span>
				</div>
			</div>
		</div>
	</div>
</body>

<%@ include file="../include/plugin_js.jsp" %>
<script src="${path}/resources/js/registerJS.js"></script>

</html>