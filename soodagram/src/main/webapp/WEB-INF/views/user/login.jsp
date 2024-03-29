<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="${path}/resources/css/login_style.css"/>
	<%@include file="../include/head.jsp" %>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="text-center">
					<img src="${path}/resources/static/soodagram-font-logo.png" class="instagram-logo">
					<div class="login-form">
						<form action="${path}/user/login" method="post">
							<div class="form-group">
								<input type="text" name="userEmail" class="form-control" placeholder="이메일">
							</div>
							<div class="form-group">
								<input type="password" name="userPw" class="form-control" placeholder="비밀번호">
							</div>
							<button type="submit" class="btn btn-primary btn-block">
								로그인
							</button>						
							<p class="or"> 또는 </p>				
							<button type="button" class="btn btn-link btn-block">
								<i class="fab fa-facebook-square"></i>
								<span class="fb-login">Facebook으로 로그인</span>
							</button>
							<a href="#" class="find-password">
								비밀번호를 잊으셨나요?
							</a>						
						</form>							
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<div class="text-center">					
					<span class="go-to-register">계정이 없으신가요?
					<a href="${path}/user/regist" class="register">가입하기</a>
					</span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>