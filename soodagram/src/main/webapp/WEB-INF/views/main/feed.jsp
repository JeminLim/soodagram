<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
  <link rel="stylesheet" href="${path}/resources/css/feed_style.css" />
  <%@ include file="../include/head.jsp"  %>    
<body>
<header>
	<!-- navbar -->
	<%@ include file="../include/navbar.jsp"  %>
</header>
	<main>
      <div class="container my-5"></div>
      <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-4">
        <!-- Story section -->
          <section class="story-container">              
            <ul>
              <c:forEach items="${followingList}" var="followingList">
	              <li>
	                <div class="story text-center">
	                    <img                    
	                    src="${followingList.userImg}"
	                    class="rounded-circle gradient-border"
	                    height="50"
	                    alt="Avatar"
	                    /> 
	                </div>  
	                  <span><small>${followingList.userId}</small></span>          
	              </li>
              </c:forEach>
            </ul>              
          </section>
         
  			<!-- Feed Section -->
	    	<div id="feedSection" class="col-md-12"></div> 		  
		
        </div>  
        
        <div class="col-md-3">
          <section class="feedAside">
            <!-- current User -->
            <div class="container-fluid">
              <div class="row">
                <div class="col-md-4">
                  <img
                    src="${login.userImg}"
                    class="rounded-circle"
                    height="60"
                    alt="Avatar"
                  />
                </div>
                <div class="col-md-7">
                  <ul>
                    <li>
                      <p class="ml-3 text-dark mb-0 mt-1">
                        <strong>${login.userId}</strong>
                      </p>
                    </li>
                    <li>
                      <span class="ml-3 text-dark">${login.userName}</span>
                    </li>
                  </ul>
                </div>
                
              </div>
           </div>
  
              <!-- Suggestions -->
              <div class="suggestions">
                <small>회원님을 위한 추천</small>
                <small class="float-right"><b>모두 보기</b></small>
              </div>
              <!-- Suggested users -->   
                  <c:forEach items="${recommendList}" var="recommendList">
                  	<div class="row">
	                  <div class="col-md-2 sugUserImg">
	                    <img
	                      src="${recommendList.userImg}"
	                      class="rounded-circle mt-2"
	                      height="40"
	                      alt="Avatar"
	                    />
	                  </div>
	                  <div class="col-md-5">
	                    <ul class="ml-1 px-3 mt-1 list-unstyled">
	                      <li>
	                        <small class="user-name"><strong>${recommendList.userId}</strong></small>
	                      </li>
	                      <li>
	                        <span class="user-name">수다그램 추천</span>
	                      </li>
	                    </ul>
	                  </div>
	                  <div class="col-md-2">
	                    <button type="button" id="followBtn_${recommendList.userEmail}" class="followBtn" style="border: none; background-color: white; color: blue; outline: none;">팔로우</button>
	                  </div>	                  
                	</div>
                  </c:forEach>
            </section>
            </div>      
      </div> 
    </main>
    
    <%@ include file="../include/plugin_js.jsp" %>
        
    <script src="${path}/resources/js/feedJS.js"></script>
    <script>
    	$(".followBtn").click(function(event){
    		var target = event.target;
    		var targetEmail = target.getAttribute("id").substr(10);
    		
    		$.ajax({
    			url: "/main/account/follow",
    			data: {targetEmail: targetEmail},
    			type: "post",
    			success: function(result) {
    				if(result === 1) {
    					document.getElementById('followBtn_' + targetEmail).innerText = "팔로잉";
    					document.getElementById('followBtn_' + targetEmail).style.color = "black";
    				} else {
    					document.getElementById('followBtn_' + targetEmail).innerText = "팔로우";
    					document.getElementById('followBtn_' + targetEmail).style.color = "blue";
    				}
    				
    			}    			
    		});
    	});
    	
    	
    	$(".likeBtn").click(function(event){
    		var target = event.target;
    		var targetFeedNo = target.getAttribute("id").substr(8);
    		
    		$.ajax({
    			url: "/main/like",
    			data: { feedNo : targetFeedNo},
    			type: "post",
    			success: function(result) {
    				if(result === 1) {
    					// 좋아요 인 상태
    					var likeIcon = document.getElementById("likeBtn_" + targetFeedNo);
    					likeIcon.className = "fas fa-heart fa-lg likeBtn";
    					likeIcon.parentNode.style.color = "red";
    					
    				} else {
    					// 좋아요 취소 상태
    					var likeIcon = document.getElementById("likeBtn_" + targetFeedNo);
    					likeIcon.className = "far fa-heart fa-lg likeBtn";
    					likeIcon.parentNode.style.color = "black";
    				}
    			}
    		});
    	});
    	
    </script>
    
</body>
</html>