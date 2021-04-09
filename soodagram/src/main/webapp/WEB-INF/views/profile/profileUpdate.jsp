<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
  <%@ include file="../include/head.jsp"  %>
  <link rel="stylesheet" href="${path}/resources/css/profile_style.css" />
<body>
<header>
	<!-- navbar -->
	<%@ include file="../include/navbar.jsp"  %>
</header>
	<main>    
	    <div class="main-container displayflex">
	      <ul class="leftMenu border-grey col-md-3">
	        <li class="leftMenu-li">
	          <a class="leftMenu-li-list" href="${path}/profile" tabindex="0">프로필 편집</a>
	        </li>
	        <li class="leftMenu-li">  
	          <a class="leftMenu-li-list" href="#" tabindex="0">비밀번호 변경</a>
	        </li>
	        <li class="leftMenu-li">
	          <a class="leftMenu-li-list disabled" href="#" tabindex="0">앱 및 웹사이트</a>
	        </li>
	        <li class="leftMenu-li">
	          <a class="leftMenu-li-list disabled" href="#" tabindex="0">이메일 및 SMS</a>
	        </li>
	        <li class="leftMenu-li">
	          <a class="leftMenu-li-list disabled" href="#" tabindex="0">푸시 알림</a>
	        </li>
	        <li class="leftMenu-li">
	          <a class="leftMenu-li-list disabled" href="#" tabindex="0">연락처 관리</a>
	        </li>
	        <li class="leftMenu-li">
	          <a class="leftMenu-li-list disabled" href="#" tabindex="0">고액 범위 및 보안</a>
	        </li>        
	      </ul>
	      <article class="rightContent border-grey col-md-9">
	        <div class="loginUser displayflex">
	          <aside class="leftSection col-md-3">
	            <img src="${loginUser.userImg}" class="loginUserImg" height="50" loading="lazy" />
	          </aside>
	          <div class="rightSection col-md-9">
	            <p id="userId">${loginUser.userId}</p>
	          </div>
	        </div>
	        <form action="${path}/profile" role="form" id="userInfoForm" method="post">
	          <div class="row displayflex">
	            <aside class="leftSection col-md-3">
	              <label>이름</label>
	            </aside>
	            <div class="rightSection col-md-9">
	              <input class="infoInput" type="text" placeHolder="이름" name="userName" id="inputUserName"/>
	              <div class="additionalInfo"><span><small>사람들의 이름, 별명 또는 비지니스 이름 등 회원님의 알려진 이름을 사용하여 회원님의 계정을 찾을 수 있도록 도와주세요</small></span></div>
	            </div>
	          </div>
	
	          <div class="row displayflex">
	            <aside class="leftSection col-md-3">
	              <label>사용자 이름</label>
	            </aside>
	            <div class="rightSection col-md-9">
	              <input class="infoInput" type="text" placeHolder="사용자 이름" name="userId" id="inputUserId"/>
	              <div class="additionalInfo"><span><small>대부분의 경우 14일 이내에 사용자 이름을 다시 ${loginUser.userId}(으)로 변경할 수 있습니다.</small></span></div>
	            </div>
	          </div>
	
	          <div class="row displayflex">
	            <aside class="leftSection col-md-3">
	              <label>소개</label>
	            </aside>
	            <div class="rightSection col-md-9">
	              <textarea class="infoInput" name="userDesc" id="inputUserDesc"></textarea>
	              <div class="additionalInfo">
	                <p class="desc"><strong>개인정보</strong></p>
	                <p class="desc descInfo">비지니스나 반려동물 등에 사용된 계정인 경우에도 회원님의 개인정보를 입력하세요. 공개 프로필에는 포함되지 않습니다.</p>
	              </div>
	            </div>
	          </div>
	
	          <div class="row displayflex">
	            <aside class="leftSection col-md-3">
	              <label>이메일</label>
	            </aside>
	            <div class="rightSection col-md-9">
	              <input class="infoInput" type="text" placeHolder="이메일" name="userEmail" id="inputUserEmail" readonly/>
	            </div>
	          </div>
	
	          <div class="row displayflex">
	            <aside class="leftSection col-md-3">
	              <label>전화번호</label>
	            </aside>
	            <div class="rightSection col-md-9">
	              <input class="infoInput" type="text" placeHolder="전화번호" name="userPhone" id="inputUserPhone"/>
	            </div>
	          </div>
	
	          <div class="row displayflex">
	            <aside class="leftSection col-md-3">
	              <label>성별</label>
	            </aside>
	            <div class="rightSection col-md-9">
	              <select name="userGender" id="inputUserGender">
	                <option value="">성별</option>
	                <option value="남">남</option>
	                <option value="여">여</option>
	                <option value="기타">기타</option>
	              </select>
	            </div>
	          </div>
	          <input type="hidden" name="_method" value="PATCH" />
	          <div class="row btnRow">
	            <button type="submit" class="btn btn-primary" id="updateUserInfo">제출</button>
	          </div>
        </form>
      </article>

    </div>
   </main>
    
    
    <%@ include file="../include/plugin_js.jsp" %>
    
    <script>
    	// 초기 정보 표시
    	$(document).ready(function() {
    		// 필수정보
	   		$('#inputUserId').val('${loginUser.userId}');
	   		$('#inputUserEmail').val('${loginUser.userEmail}');
	   		$('#inputUserName').val('${loginUser.userName}');
	   		
	   		if(${not empty loginUser.userDesc})
	   			$('#inputUserDesc').val('${loginUser.userDesc}');
	   		if(${not empty loginUser.userPhone})
	   			$('#inputUserPhone').val('${loginUser.userPhone}');
	   		if(${not empty loginUser.userGender})
	   			$("#inputUserGender option[value='${loginUser.userGender}']").attr("selected", true);	   		
	   		
    	});
    	
    	$("#updateUserInfo").click(function(e){
    		e.preventDefault();
    		
    		var gender = $("#inputUserGender option:selected").val();
    		
    		var form = document.getElementById('userInfoForm');
    		var formData = new FormData(form);
    		formData.set("userGender", gender);
    		
    		form.submit();    		
    		
    	});
    	
    </script>
    
</body>
</html>