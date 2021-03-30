<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
  <%@ include file="../include/head.jsp"  %>
  <link rel="stylesheet" href="${path}/resources/css/account_style.css" />
  
<body>
<header>
	<!-- navbar -->
	<%@ include file="../include/navbar.jsp"  %>
</header>
	<main>
	  <div class="container-fluid">
        <!-- Profile -->
        <div class="row">   
          <div class="col-md-2"></div>
          <div class="userProfile col-md-8">
            <div class="col-md-2"></div>
            <!-- Profile-img -->      
            <div class="col-md-2">            
              <img
                  src="${targetUser.userImg}"
                  class="rounded-circle"
                  height="160"
                  alt="Avatar"
                  id="profileImg"
              />
            </div>
            <!-- Profile abstract -->
            <div class="col-md-7 container-fluid">
              <div class="col-md-12 userInfo">
                <span class="profile">${targetUser.userId}</span>
                <div class="col-md-3"> 
               	  <c:set var="eqFlag" value="false" /> 				
               	  <c:forEach items="${userFollowingList}" var="userFollowingList">
               	  	<c:if test="${userFollowingList.userEmail eq targetUser.userEmail && not eqFlag}">
               	  		<c:set var="eqFlag" value="true" />
               	  	</c:if>
                	  </c:forEach>   				                           
          			  <c:choose>
              			<c:when test="${eqFlag}">  
                			<button type="button" id="followBtn_${targetUser.userEmail}" class="followBtnAcc btn btn-default">팔로잉</button>   
                			<c:set var="eqFlag" value="false" />                       					                        			
              			</c:when>	
              			<c:otherwise>
              				<button type="button" id="followBtn_${targetUser.userEmail}" class="followBtnAcc btn btn-primary">팔로우</button>
              				<c:set var="eqFlag" value="false" />
              			</c:otherwise>  	                       			
               	  </c:choose>     	
                </div>                              
              </div>
              <div class="col-md-12 userInfo">
                <span class="userLog feedNum">게시물 ${fn:length(targetFeed)}</span>              
                <button type="button" class="userLog followBtn" id="followBtn">팔로우 ${fn:length(targetFollowingList)} </button>              
                <button type="button" class="userLog followBtn" id="followerBtn">팔로워 ${fn:length(targetFollowerList)} </button>            
              </div>
              <div class="col-md-12 userInfo">
                <span class="profile">${targetUser.userName}</span>
                <span class="desc">${targetUser.userDesc}</span>
              </div>
            </div>
          </div> 
        </div>
        
        
        <div class="row">
          <div class="col-md-2"></div>
          <div class="col-md-8 text-center my-4 feedNavBar">
            <a href="#" class="myFeed text-dark"><i class="fas fa-th" id="icon"></i><span class="list">게시물</span></a>
            <a href="#" class="myFeed text-dark"><i class="fas fa-tv" id="icon"></i><span class="list">IGTV</span></a>
            <a href="#" class="myFeed text-dark"><i class="far fa-id-badge" id="icon"></i><span class="list">태그됨</span></a>
          </div>
        </div>
        
        <c:if test="${fn:length(targetFeed) > 0 }">
       	   <div class="row uploadedFeedRow">
	       	 <div class="container-fluid">
	       		<div class="col-md-3"> </div>
	       		<div class="myFeedList col-md-7"> 			
        		<c:forEach items="${targetFeed}" var="file" varStatus="myFeedStatus">
        			<div class="col-md-3 myFeedImg">
                  		<img class="feedImg" src="/resources/dist/upload/media/${file.fileVO[0].fileName}"/>      
              		</div>              		       	
        		</c:forEach>
        	  	</div>
       	  	 </div>
       	   </div>
        </c:if>
        
      <!-- follow -->
      <div class="modal fade" id="followModal" tabindex="-1" role="dialog" aria-labelledby="followModal" aria-hidden="true">
        <div class="modal-dialog modal-dialog-center" role="document">
          <div class="modal-content">
            <div class="modal-header container-fluid">
              <div class="modal-title col-md-11" id="followModal">팔로잉</div>
              <div class="modal-title-close col-md-1">
                <button type="button" class="close closeIcon" data-dimdiss="modal" aria-label="Close" id="closeIcon">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
            </div>
            <div class="modal-body">
              <div class="row">
                <div class="container-fluid text-center modalbodyContainer">
	          		<c:forEach items="${targetFollowingList}" var="targetFollowingList">	
		              	<div class="container-fluid follower">
			                 <!-- 유저 프로필 -->
			                 <div class="col-md-2"></div>
			                 <div class="col-md-2 text-center">
			                   <img
			                       src="${targetFollowingList.userImg}"
			                       class="rounded-circle"
			                       height="50"
			                       alt="Avatar"
			                   /> 
			                 </div>                 
			                 <div class="col-md-3">
			                   <!-- 유저 아이디 -->
			                   <div class="col-md-12">
			                     <span><strong>${targetFollowingList.userId}</strong></span>
			                   </div>
			                   <!-- 유저 이름-->
			                   <div class="col-md-9">
			                     <span>${targetFollowingList.userName}</span>
			                   </div>
			                 </div>    
			                 <!-- 팔로우 버튼 -->
		                       <div class="col-md-3"> 
		                      	  <c:set var="eqFlag" value="false" /> 				
		                      	  <c:forEach items="${userFollowingList}" var="userFollowingList">
		                      	  	<c:if test="${userFollowingList.userEmail eq targetFollowingList.userEmail && not eqFlag}">
		                      	  		<c:set var="eqFlag" value="true" />
		                      	  	</c:if>
		                       	  </c:forEach>   				                           
		                 			  <c:choose>
		                     			<c:when test="${eqFlag}">  
			                      			<button type="button" id="followBtn_${targetFollowingList.userEmail}" class="followBtnAcc btn btn-default">팔로잉</button>   
			                      			<c:set var="eqFlag" value="false" />                       					                        			
		                     			</c:when>	
		                     			<c:otherwise>
		                     				<button type="button" id="followBtn_${targetFollowingList.userEmail}" class="followBtnAcc btn btn-primary">팔로우</button>
		                     				<c:set var="eqFlag" value="false" />
		                     			</c:otherwise>  	                       			
		                      	  </c:choose>     	
		                       </div>                                   
		             	 </div>
	              </c:forEach>
                </div>
              </div>              
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary closeBtn" data-dimdiss="modal" id="closeBtn">Close</button>
            </div>
          </div>
        </div>
      </div>

      <!-- follower -->
      <div class="modal fade" id="followerModal" tabindex="-1" role="dialog" aria-labelledby="followerModal" aria-hidden="true">
        <div class="modal-dialog modal-dialog-center" role="document">
          <div class="modal-content">
            <div class="modal-header container-fluid">
              <div class="modal-title col-md-11" id="followerModal">팔로워</div>
              <div class="modal-title-close col-md-1">
                <button type="button" class="close closeIcon" data-dimdiss="modal" aria-label="Close" id="closeIcon">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
            </div>
            <div class="modal-body">
              <div class="row">
                <div class="container-fluid text-center modalbodyContainer">                  
               		<c:forEach items="${targetFollowerList}" var="targetFollowerList">	
                    	<div class="container-fluid follower">
                       <!-- 유저 프로필 -->
                       <div class="col-md-2"></div>
                       <div class="col-md-2 text-center">
                         <img
                             src="${targetFollowerList.userImg}"
                             class="rounded-circle"
                             height="50"
                             alt="Avatar"
                         /> 
                       </div>                 
                       <div class="col-md-3">
                         <!-- 유저 아이디 -->
                         <div class="col-md-12">
                           <span><strong>${targetFollowerList.userId}</strong></span>
                         </div>
                         <!-- 유저 이름-->
                         <div class="col-md-12">
                           <span>${targetFollowerList.userName}</span>
                         </div>
                       </div>    
                       <!-- 팔로우 버튼 -->
                       <div class="col-md-3"> 
                      	  <c:set var="eqFlag" value="false" /> 				
                      	  <c:forEach items="${userFollowingList}" var="userFollowingList">
                      	  	<c:if test="${userFollowingList.userEmail eq targetFollowerList.userEmail && not eqFlag}">
                      	  		<c:set var="eqFlag" value="true" />
                      	  	</c:if>
                       	  </c:forEach>   				                           
                 			  <c:choose>
                     			<c:when test="${eqFlag}">  
	                      			<button type="button" id="followBtn_${targetFollowerList.userEmail}" class="followBtnAcc btn btn-default">팔로잉</button>   
	                      			<c:set var="eqFlag" value="false" />                       					                        			
                     			</c:when>	
                     			<c:otherwise>
                     				<button type="button" id="followBtn_${targetFollowerList.userEmail}" class="followBtnAcc btn btn-primary">팔로우</button>
                     				<c:set var="eqFlag" value="false" />
                     			</c:otherwise>  	                       			
                      	  </c:choose>     	
                       </div>                        
                   	 </div>
                   </c:forEach>
                </div>
              </div>              
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary closeBtn" data-dimdiss="modal" id="closeBtn">Close</button>
            </div>
          </div>
        </div>
      </div>
   </main>
    
    <%@ include file="../include/plugin_js.jsp" %>   
    <script type="text/javascript" src="${path}/resources/js/userFeedJS.js"> </script>    
      
    <script> 

		 $(".followBtnAcc").click(function(event){
    		var target = event.target;
    		var targetEmail = target.getAttribute("id").substr(10);
    		
    		$.ajax({
    			url: "/main/account/follow",
    			data: {targetEmail: targetEmail},
    			type: "post",
    			success: function(result) {
    				if(result === 1) {
    					document.getElementById('followBtn_' + targetEmail).innerText = "팔로잉";
    					document.getElementById('followBtn_' + targetEmail).className = "followBtnAcc btn btn-default";
    				} else {
    					document.getElementById('followBtn_' + targetEmail).innerText = "팔로우";
    					document.getElementById('followBtn_' + targetEmail).className = "followBtnAcc btn btn-primary";
    				}
    				
    			}    			
    		});
    	});
	    
		
    </script> 
</body>
</html>