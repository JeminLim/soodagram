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
                  src="${login.userImg}"
                  class="rounded-circle"
                  height="160"
                  alt="Avatar"
                  id="profileImg"
              />
              <input type="file" id="profileImgUpload" style="display:none;" /> 
            </div>
            <!-- Profile abstact -->
            <div class="col-md-7 container-fluid">
              <div class="col-md-12 userInfo">
                <span class="profile">${login.userId}</span>
                <span class="profile profileBtn"><a href="${path}/profile" class="btn btn-default">프로필 편집</a> </span>
                <span class="profile profileIcon"><button type="button" class="btn-link profile text-dark"><i class="fas fa-cog fa-lg"></i></button></span>
                <span class="profile profileIcon"><button type="button" class="btn-link profile text-dark" id="postBtn"><i class="fas fa-edit fa-lg"></i></button></span>              
              </div>
              <div class="col-md-12 userInfo">
                <span class="userLog feedNum">게시물 ${fn:length(feedList)}</span>              
                <button type="button" class="userLog followBtn" id="followBtn">팔로우 ${fn:length(followingList)} </button>              
                <button type="button" class="userLog followBtn" id="followerBtn">팔로워 ${fn:length(followerList)} </button>            
              </div>
              <div class="col-md-12 userInfo">
                <span class="profile">${login.userName}</span>
              </div>
            </div>
          </div> 
        </div>
        
        
        <div class="row">
          <div class="col-md-2"></div>
          <div class="col-md-8 text-center my-4 feedNavBar">
            <a href="#" class="myFeed text-dark"><i class="fas fa-th" id="icon"></i><span class="list">게시물</span></a>
            <a href="#" class="myFeed text-dark"><i class="fas fa-tv" id="icon"></i><span class="list">IGTV</span></a>
            <a href="#" class="myFeed text-dark"><i class="far fa-bookmark" id="icon"></i><span class="list">저장됨</span></a>
            <a href="#" class="myFeed text-dark"><i class="far fa-id-badge" id="icon"></i><span class="list">태그됨</span></a>
          </div>
        </div>
        
        <c:if test="${fn:length(feedList) > 0 }">
       	   <div class="row uploadedFeedRow">
	       	 <div class="container-fluid">
	       		<div class="col-md-3"> </div>
	       		<div class="myFeedList col-md-7"> 			
        		<c:forEach items="${feedList}" var="file" varStatus="feedListStatus">
        			<div class="col-md-3 myFeedImg">
                  		<img class="feedImg" src="/resources/dist/upload/media/${file.fileVO[0].fileName}"/>  
                  		<div class="btnRow">			
              				<button id="feedNo_${file.feedNo} "type="button" class="btn btn-primary feedDelBtn">삭제</button>
              			</div>       
              		</div>              		       	
        		</c:forEach>
        	  	</div>
       	  	 </div>
       	   </div>
        </c:if>
	        

      <!-- Feed write modal -->
      <div class="modal fade" id="feedModal" tabindex="-1" role="dialog" aria-labelledby="feedModal" aria-hidden="true">
        <div class="modal-dialog modal-dialog-center" role="document">
          <div class="modal-content">
            <div class="modal-header container-fluid">
              <div class="modal-title col-md-11" id="feedModal">피드 작성</div>
              <div class="modal-title-close col-md-1">
                <button type="button" class="close closeIcon" data-dimdiss="modal" aria-label="Close" id="closeOnHeader">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
            </div>
            <div class="modal-body">
              <form role="form" action="${path}/feed/post" id="writeForm" method="post" enctype="multipart/form-data">
                <p><small>사진 업로드</small></p>
                <!-- 첨부파일 영역 -->
                <div class="form-group border fileDiv">                             
                </div> 
                <input type="file" class="btn btn-primary selectFileBtn" id="imgUpload" name="feedImg" multiple/>
                <div class="form-group my-5">
                  <div class="feedContent">
                    <input type="text" class="contentInput" placeholder="내용을 입력해주세요" name="content"/>
                  </div>
                </div>
                <input type="hidden" name="userEmail" id="userEmail" value="${login.userEmail}">          
	            <div class="modal-footer">
	              <button type="button" class="btn btn-secondary closeBtn" data-dimdiss="modal" id="closeBtn">Close</button>
	              <button type="submit" class="btn btn-primary submitBtn">upload Feed</button>
	            </div>                    
         	  </form>
            </div>  
          </div>  
        </div>
      </div>

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
                  <c:choose>
                  	<c:when test="${empty followingList}">
	                  	<div class="col-md-12 text-center align-items-center" id="noFollow">
		                    <div class="iconBorder">                  
		                      <i class="fas fa-user-plus addPeople"></i>
		                    </div>
		                    <p class="my-2" style="font-size: 25px;">팔로우</p>
		                    <P>회원님이 팔로우하는 모든 사람이 여기에 표시됩니다.</P>
	                  	</div>
                  	</c:when>
                  	<c:otherwise>
                  		<c:forEach items="${followingList}" var="followingList">	
                      	<div class="container-fluid follower">
	                        <!-- 유저 프로필 -->
	                        <div class="col-md-2"></div>
	                        <div class="col-md-2 text-center">
	                          <img
	                              src="${followingList.userImg}"
	                              class="rounded-circle"
	                              height="50"
	                              alt="Avatar"
	                          /> 
	                        </div>                 
	                        <div class="col-md-3">
	                          <!-- 유저 아이디 -->
	                          <div class="col-md-12">
	                            <span><strong>${followingList.userId}</strong></span>
	                          </div>
	                          <!-- 유저 이름-->
	                          <div class="col-md-12">
	                            <span>${followingList.userName}</span>
	                          </div>
	                        </div>    
	                        <!-- 팔로우 버튼 -->
	                        <div class="col-md-3">
	                          <button type="button" id="followBtn_${followingList.userEmail}" class="followBtnAcc btn btn-default">팔로잉</button>
	                        </div>                        
                     	 </div>
                      </c:forEach>
                  	</c:otherwise>
                  </c:choose>
                  
                  <p><strong>회원님을 위한 추천</strong></p>

                  <div class="col-md-12 text-center align-items-center" id="recommandUser">					  
                      <c:forEach items="${recommendList}" var="recommendList">	
                      	<div class="container-fluid recommandList">
	                        <!-- 유저 프로필 -->
	                        <div class="col-md-2"></div>
	                        <div class="col-md-2 text-center">
	                          <img
	                              src="${recommendList.userImg}"
	                              class="rounded-circle"
	                              height="50"
	                              alt="Avatar"
	                          /> 
	                        </div>                 
	                        <div class="col-md-3">
	                          <!-- 유저 아이디 -->
	                          <div class="col-md-12">
	                            <span><strong>${recommendList.userId}</strong></span>
	                          </div>
	                          <!-- 유저 이름-->
	                          <div class="col-md-12">
	                            <span>${recommendList.userName}</span>
	                          </div>
	                        </div>    
	                        <!-- 팔로우 버튼 -->
	                        <div class="col-md-3">
	                          <button type="button" id="followBtn_${recommendList.userEmail}" class="followBtnAcc btn btn-primary">팔로우</button>
	                        </div>                        
                     	 </div>
                      </c:forEach>
                  </div>
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
                  <c:choose>
                  	<c:when test="${empty followerList}">
	                  	<div class="col-md-12 text-center align-items-center" id="noFollow">
		                    <div class="iconBorder">                  
		                      <i class="fas fa-user-plus addPeople"></i>
		                    </div>
		                    <p class="my-2" style="font-size: 25px;">팔로우</p>
		                    <P>회원님이 팔로우하는 모든 사람이 여기에 표시됩니다.</P>
	                  	</div>
                  	</c:when>
                  	<c:otherwise>
                  		<c:forEach items="${followerList}" var="followerList">	
	                      	<div class="container-fluid follower">
		                        <!-- 유저 프로필 -->
		                        <div class="col-md-2"></div>
		                        <div class="col-md-2 text-center">
		                          <img
		                              src="${followerList.userImg}"
		                              class="rounded-circle"
		                              height="50"
		                              alt="Avatar"
		                          /> 
		                        </div>                 
		                        <div class="col-md-3">
		                          <!-- 유저 아이디 -->
		                          <div class="col-md-12">
		                            <span><strong>${followerList.userId}</strong></span>
		                          </div>
		                          <!-- 유저 이름-->
		                          <div class="col-md-12">
		                            <span>${followerList.userName}</span>
		                          </div>
		                        </div>    
		                        <!-- 팔로우 버튼 -->
		                        <div class="col-md-3"> 
	                        	  <c:set var="eqFlag" value="false" /> 				
	                        	  <c:forEach items="${followingList}" var="followingList">
	                        	  	<c:if test="${followerList.userEmail eq followingList.userEmail && not eqFlag}">
	                        	  		<c:set var="eqFlag" value="true" />
	                        	  	</c:if>
	                         	  </c:forEach>   				                           
	                   			  <c:choose>
	                       			<c:when test="${eqFlag}">  
	                        			<button type="button" id="followBtn_${followerList.userEmail}" class="followBtnAcc btn btn-default">팔로잉</button>   
	                        			<c:set var="eqFlag" value="false" />                       					                        			
	                       			</c:when>	
	                       			<c:otherwise>
	                       				<button type="button" id="followBtn_${followerList.userEmail}" class="followBtnAcc btn btn-primary">팔로우</button>
	                       				<c:set var="eqFlag" value="false" />
	                       			</c:otherwise>  	                       			
	                        	  </c:choose>     	
		                        </div>                        
	                     	 </div>
                      </c:forEach>
                  	</c:otherwise>
                  </c:choose>

                  <p><strong>회원님을 위한 추천</strong></p>

                  <div class="col-md-12 text-center align-items-center" id="recommandUser">
                      <c:forEach items="${recommendList}" var="recommendList">	
                      	<div class="container-fluid recommandList">
	                        <!-- 유저 프로필 -->
	                        <div class="col-md-2"></div>
	                        <div class="col-md-2 text-center">
	                          <img
	                              src="${recommendList.userImg}"
	                              class="rounded-circle"
	                              height="50"
	                              alt="Avatar"
	                          /> 
	                        </div>                 
	                        <div class="col-md-3">
	                          <!-- 유저 아이디 -->
	                          <div class="col-md-12">
	                            <span><strong>${recommendList.userId}</strong></span>
	                          </div>
	                          <!-- 유저 이름-->
	                          <div class="col-md-12">
	                            <span>${recommendList.userName}</span>
	                          </div>
	                        </div>    
	                        <!-- 팔로우 버튼 -->
	                        <div class="col-md-3">
	                          <button type="button" id="followBtn_${recommendList.userEmail}" class="followBtnAcc btn btn-primary">팔로우</button>
	                        </div>                        
                     	 </div>
                      </c:forEach>
                  </div>
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
    
    <!-- for preview image -->
	<script id="imgTemplate" type="text/x-handlerbars-template">
		<li class="imgList" style="list-style:none; margin: 5px;">
			<span class="mailbox-attachment-icon uploadImage">
				<img src="{{imgSrc}}" class="fileImg" alt="Attachment" height="150", width="150">		
			</span>
			<a href="{{fullName}}" class="btn btn-danger delBtn" id="delBtn" name="delBtn">삭제</a>
		</li>
	</script>
    
    <%@ include file="../include/plugin_js.jsp" %> 
    <script type="text/javascript" src="${path}/resources/js/profileJS.js"> </script>
</body>
</html>