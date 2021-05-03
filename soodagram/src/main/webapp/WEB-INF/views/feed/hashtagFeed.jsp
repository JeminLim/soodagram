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
            <div class="col-md-1" style="text-align: center; margin-top: 20px;">            
              <i class="fas fa-hashtag fa-lg" style="font-size: 4em;"></i>
            </div>
            <!-- Profile abstract -->
            <div class="col-md-7 container-fluid">
              <div class="col-md-12 userInfo">
                <p class="profile" style="font-size: 2em">${hashtagName}</p>
                <p class="numFeeds" style="font-size: 1.5em">게시물 <strong>${fn:length(searchedFeed)}</strong></p>                       
              </div>
            </div>
          </div> 
        </div>
        
        
        <div class="row">
          <div class="col-md-3"></div>
          <div class="col-md-8 my-4 feedNavBar">
            <span style="color: black; font-size: 1.5em">인기 게시물</span>
          </div>
        </div>
        
        <c:if test="${fn:length(searchedFeed) > 0 }">
       	   <div class="row uploadedFeedRow">
	       	 <div class="container-fluid">
	       		<div class="col-md-3"> </div>
	       		<div class="myFeedList col-md-7"> 			
        		<c:forEach items="${searchedFeed}" var="file" varStatus="feedStatus">
        			<div class="col-md-3 myFeedImg">
                  		<img class="feedImg" src="/resources/dist/upload/media/${file.fileVO[0].fileName}"/>      
              		</div>              		       	
        		</c:forEach>
        	  	</div>
       	  	 </div>
       	   </div>
        </c:if> 
      </div>       
   </main>
    
    <%@ include file="../include/plugin_js.jsp" %>   
    
</body>
</html>