<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="${path}/resources/js/bootstrap.js"></script>
<script src="${path}/resources/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>
<!-- template for display data -->
<!-- for navigation bar -->
<script id="resultUserTemplate" type="text/x-handlerbars-template">
	{{#each searchedUser}}		
   		<a href="${path}/main/account/user?userId={{userId}}" class="searchUserList col-md-12">	
			<div class="col-md-3 searchedUserImg">		
				<img src="{{userImg}}" class="rounded-circle" height="40" loading="lazy" />		   		
			</div>
			<div class="col-md-8">
				<ul class="justify-content-left">
					<li>{{userId}}</li>
					<li>{{userName}}</li>
				</ul>
			</div>
		</a>
	{{/each}}
</script>	

<script id="resultHashtagTemplate" type="text/x-handlerbars-template">
	{{#each searchedTag}}
		<a href="#" class="searchHashtagList col-md-12" onclick="linkToHashtagFeed(this);">	
			<div class="col-md-3 searchedHashtag">	
				<i class="fas fa-hashtag fa-lg"></i>
			</div>
			<div class="col-md-8">
				<ul class="justify-content-left">
					<li>{{hashtagName}}</li>
					<li>{{tagCount}}</li>
				</ul>
			</div>
			<input type="hidden" value={{hashtagName}} class="hashtagNameVal"/>
        </a>
	{{/each}}
</script>

<!-- for account.jsp -->
<script id="imgTemplate" type="text/x-handlerbars-template">
		<li class="imgList" style="list-style:none; margin: 5px;">
			<span class="mailbox-attachment-icon uploadImage">
				<img src="{{imgSrc}}" class="fileImg" alt="Attachment" height="150", width="150">		
			</span>
			<a href="{{fullName}}" class="btn btn-danger delBtn" id="delBtn" name="delBtn">삭제</a>
		</li>
</script>	

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
	                          <a href="${path}/main/account/user?userId={{userVO.userId}}" class="authorUser">
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
							<a href="#" style="color: black"><i id="likeBtn_{{feedNo}}" class="far fa-heart fa-lg likeBtn"></i></a>
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
	                        <small><strong>좋아요 {{totalLike}}개</strong></small>
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


<!-- import navigation bar js file -->
<script src="${path}/resources/js/navbarJS.js"></script>