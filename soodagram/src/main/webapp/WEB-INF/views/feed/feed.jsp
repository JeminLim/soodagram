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
    	<div id="feedSection" class="col-md-12" height="20"></div> 
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
    
    
	<!-- for feed.jsp -->
	<script id="feedTemplate" type="text/x-handlerbars-template">
	  {{#each feedList}}
		<section class="newsFeed">
	            <div class="post">
	              <div class="card">
	                <div class="card-body">
	                  <div class="container-fluid">
	                    <!-- Author -->
	                    <div class="row authorRow">
	                      <div class="col-md-11">
	                        <div class="author">
	                          <img
	                            src="{{userVO.userImg}}"
	                            class="rounded-circle authorUser"
	                            height="40"
	                            alt="Avatar"                              
	                          />
	                          <a href="${path}/user/{{userVO.userId}}" class="authorUser">
	                            <strong>{{userVO.userId}}</strong>                                
	                          </a>
	                        </div>
	                      </div>
	                      <div class="col-md-1 authorMenu">                         
	                        <i class="fas fa-ellipsis-h fa-lf"></i>
	                      </div>
	                    </div>                      
	                  </div>
	                </div>      
           
	                 <div id="feedCarousel{{feedNo}}" class="carousel slide" data-ride="carousel" data-interval="false">	                 		                     
		                     <!-- indicators -->
		                     <ol class="carousel-indicators">	                 
								{{#each fileVO}} 
									{{#if @first}}
										<li data-target="#feedCarousel{{../feedNo}}" data-slide-to="{{@index}}" class="active"></li>
									{{else}}
										<li data-target="#feedCarousel{{@../feedNo}}" data-slide-to="{{@index}}"></li>
									{{/if}}
								{{/each}}
		                     </ol>
		                     
		                     <!-- Wrapper for slides -->
		                     <div class="carousel-inner">
							 {{#each fileVO}}
		                        {{#if @first}}
		                       		<div class="item active" >
					                   <img class="feedImg" src="/resources/dist/upload/media/{{fileName}}">
					                </div>
								{{else}}
									<div class="item">
					                   <img class="feedImg" src="/resources/dist/upload/media/{{fileName}}">
					                 </div>	  
								{{/if}}
		                     {{/each}}                    
		                     </div>
	                     
	                     <!-- left and right controls -->
	                     <a class="left carousel-control" href="#feedCarousel{{feedNo}}" role="button" data-slide="prev">
	                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	                        <span class="sr-only">Previous</span>
	                     </a>
	                     <a class="right carousel-control" href="#feedCarousel{{feedNo}}" role="button" data-slide="next">
	                      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	                      <span class="sr-only">Next</span>
	                   </a>
	                 </div>
	                 
	                 
	
	                <!-- interaction -->
	                <div class="card-body">
	                  <div class="container-fluid">
	                    <div class="row">
	                      <div class="col-md-11 interaction">	        
							{{#if isLike}}              
								<a href="#"><i id="likeBtn_{{feedNo}}" class="fas fa-heart fa-lg likeBtn" style="color: red;"></i> </a>
							{{else}}
								<a href="#"><i id="likeBtn_{{feedNo}}" class="far fa-heart fa-lg likeBtn" style="color: black;"></i> </a>
							{{/if}}
	                        <i class="far fa-comment fa-lg"></i>
	                        <i class="far fa-paper-plane fa-lg"></i>
	                      </div>
	                      <div class="col-md-1 interaction">
	                        <i class="far fa-bookmark fa-lg"></i>
	                      </div>
	                    </div>
	
	                    <!-- Content-->
	                    <div class="row mt-1">
	                      <div class="col-md-12">
	                        <!-- 좋아요 표시 -->
	                        <span id="totalLike_{{feedNo}}"><small><strong>좋아요 {{totalLike}}개</strong></small></span>
	                      </div>
	                    </div>
	                    <!-- Content -->
	                    <div class="row">
	                      <div class="col-md-12">
	                        <p>
	                          <strong class="text-dark">{{userVO.userId}}</strong>
	                          {{{content}}} 
	                        </p>
	                      </div>
	                    </div>
	
	                    <!-- Reply-->
	                    <div class="row">
	                      <div class="col-md-12">                        
	                        <span>댓글 {{totalReplies}}개</span>
	                        <a href="#" class="unfoldReply" id="moreReply_{{feedNo}}">더 보기</a>
	                      </div>
	                      <div class="col-md-12">
							  <ul id="replies{{feedNo}}">
	
							  </ul>           
	                        <input type="hidden" name="replyPage_{{feedNo}}" id="replyPage_{{feedNo}}" value="0" />
	                      </div>           
						  <div id="col-md-12 replyArea"></div>           
	                    </div>
	                      
	                    <!-- Comments form -->
	                    <div class="row commentForm">
						  <div class="col-md-12">
						  	<form name="insertReply">
	                     	 	<div class="col-md-10">
								   <div class="form-outline">
	                	          	  <input type="text" class="form-control" placeholder="댓글 달기" name="content" id="content_{{feedNo}}"/>
									  <input type="hidden" value="{{feedNo}}" name="feedNo" id="feedNo{{feedNo}}" />							  
	               	            	</div>
	               		      	</div>
	                  	 	    <div class="col-md-2 replyPost">
	                     		   <button type="submit" id="reply_{{feedNo}}" class="btn btn-primary replySubmit">게시</button>
	                    		</div>
						    </form>
						  </div>
	                    </div>
	                  </div>
	                </div>
	              </div>
	            </div>
	          </section>
		{{/each}}
	</script>	

	<script id="replyTemplate" type="text/x-handlerbars-template">
		{{#each replyList}}
			<li>
				<p class="reply"><strong>{{userId}}</strong>{{content}}</p>
			</li>
		{{/each}}
	</script>
    
    
    <%@ include file="../include/plugin_js.jsp" %>
        
    <script src="${path}/resources/js/feedJS.js"></script>
    <script>

	    $(".followBtn").click(function(event){	
	    	event.preventDefault();
	    	var target = event.target;
	    	var targetEmail = target.getAttribute("id").substr(10);
	    	
	    	$.ajax({
	    		url: "/relation/follow",
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
	    	event.preventDefault();
	    	var target = event.target;
	    	var targetFeedNo = target.getAttribute("id").substr(8);
	    	
	    	$.ajax({
	    		url: "/relation/like",
	    		data: { feedNo : targetFeedNo},
	    		type: "post",
	    		success: function(result) {
	    			if(result === 1) {
	    				// 좋아요 인 상태
	    				var likeIcon = document.getElementById("likeBtn_" + targetFeedNo);
	    				likeIcon.className = "fas fa-heart fa-lg likeBtn";
	    				likeIcon.style.color = "red";
	    				
	    			} else {
	    				// 좋아요 취소 상태
	    				var likeIcon = document.getElementById("likeBtn_" + targetFeedNo);
	    				likeIcon.className = "far fa-heart fa-lg likeBtn";
	    				likeIcon.style.color = "black";
	    			}
	    			
	    			// 좋아요 개수 업데이트
	    			updateLikeNo(targetFeedNo);
	    		}
	    	});
	    });
	    
	    
    </script>
</body>
</html>