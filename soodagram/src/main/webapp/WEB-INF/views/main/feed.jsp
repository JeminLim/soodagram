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
        
        <div class="col-md-2">
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
	                  <div class="col-md-6">
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
	                    <p class="user-name mt-2 text-primary"><b>Follow</b></p>
	                  </div>	                  
                	</div>
                  </c:forEach>
            </section>
            </div>      
      </div> 
    </main>
    
    <%@ include file="../include/plugin_js.jsp" %>
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
	                            src="{{userImg}}"
	                            class="rounded-circle authorUser"
	                            height="40"
	                            alt="Avatar"                              
	                          />
	                          <a href="#" class="authorUser">
	                            <strong>{{userId}}</strong>                                
	                          </a>
	                        </div>
	                      </div>
	                      <div class="col-md-1 authorMenu">                         
	                        <i class="fas fa-ellipsis-h fa-lf"></i>
	                      </div>
	                    </div>                      
	                  </div>
	                </div>      
           
	                 <div id="feedCarousel{{@index}}" class="carousel slide" data-ride="carousel" data-interval="false">	                 		                     
		                     <!-- indicators -->
		                     <ol class="carousel-indicators">	                 
								{{#each fileVO}} 
									{{#if @first}}
										<li data-target="#feedCarousel{{@../index}}" data-slide-to="{{@index}}" class="active"></li>
									{{else}}
										<li data-target="#feedCarousel{{@../index}}" data-slide-to="{{@index}}"></li>
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
	                     <a class="left carousel-control" href="#feedCarousel{{@index}}" role="button" data-slide="prev">
	                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	                        <span class="sr-only">Previous</span>
	                     </a>
	                     <a class="right carousel-control" href="#feedCarousel{{@index}}" role="button" data-slide="next">
	                      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	                      <span class="sr-only">Next</span>
	                   </a>
	                 </div>
	                 
	                 
	
	                <!-- interaction -->
	                <div class="card-body">
	                  <div class="container-fluid">
	                    <div class="row">
	                      <div class="col-md-11 interaction">
	                        <i class="far fa-heart fa-lg"></i>
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
	                        <small><strong>좋아요 1,538,457개</strong></small>
	                      </div>
	                    </div>
	                    <!-- Content -->
	                    <div class="row">
	                      <div class="col-md-12">
	                        <p>
	                          <strong class="text-dark">{{userId}}</strong>
	                          {{content}} 
	                        </p>
	                      </div>
	                    </div>
	
	                    <!-- Reply-->
	                    <div class="row">
	                      <div class="col-md-12">                        
	                        <span>댓글 58,238개</span>
	                        <a href="#" class="unfoldReply">모두 보기</a>
	                      </div>
	                      <div class="col-md-12">
	                          <p class="reply"><strong>alex_123</strong>Lorem, ipsum dolor.</p>
	                          <p class="reply"><strong>janet_t</strong>Lorem, ipsum dolor. paokmsk</p>             
	                        <small>22 hours ago</small>
	                      </div>                      
	                    </div>
	                      
	                    <!-- Comments form -->
	                    <div class="row commentForm">
	                      <div class="col-md-11">
	                        <div class="form-outline">
	                          <input type="text" class="form-control" placeholder="댓글 달기"/>
	                        </div>
	                      </div>
	                      <div class="col-md-1 post">
	                        <a href="#" class="text-info postBtn">게시</a>
	                      </div>
	
	                    </div>
	                  </div>
	                </div>
	
	              </div>
	            </div>
	          </section>
		{{/each}}
	</script>	
	
    <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>
    <script> 
       
    	var page = 0;

		var feedTemplate = Handlebars.compile($('#feedTemplate').html());	
    	
    	const io = new IntersectionObserver(entries => {
    		if(entries.some(entry => entry.intersectionRatio > 0)) {
    			loadFeeds();
    		}
    	});
    	
    	
		
		
    	// 초기 피드 불러오기
    	loadFeeds();
    	
    	function loadFeeds() {
    		
    		var feedList = [];
    		
    		// 1.ajax를 통해서 list를 받아옴
    		$.ajax({
    			url: "/main/getFeed",
    			dataType:"json",
    			type: "POST",
    			success: function(result) {
    				if(result.code === "success"){
        				feedList = result.followingFeed;
        				
        				// 불러올 피드가 있을 때
        				if(feedList.length > 0) {
	        				// 2.list를 가지고 template에 바인딩함 그냥 for가 아니라 데이터 리스트를 넘기고, template 첨부터 {{#each }} 를 하자
							var data = { feedList : feedList };
	    	    			var html = feedTemplate(data);    	    			
	    	    			$("#feedSection").before(html);
	    	    	    	// io에 div를 설정
	    	    	    	const feedSection = document.querySelectorAll('#feedSection');
	    	    	    	
	    	    	    	feedSection.forEach((el) => {
	    	    	    		io.observe(el);
	    	    	    	});
        				}
    				}
    			},
    			error: function(request, status, error) {
    				alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
    			}
    		});
    	}
    	
    </script>
    <!-- <script src="${path}/resources/js/feedJS.js"></script> -->
    
</body>
</html>