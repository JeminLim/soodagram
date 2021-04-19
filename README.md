<details>
  <summary> 목차 </summary>  
  1. 프로젝트 소개   
    1.1 프로젝트 기능    
    1.2 개발 환경
    1.3 프로젝트 구조
  2. Fronend architecture
  3. Backend architecture   
    3.1 DB 스키마   
    3.2 Endpoints       
  4. 느낀점 및 향후 계획
 </details>
 
# Soodagram(Instagram clone)
## 1. 프로젝트 소개
  Spring을 공부하면서 공부한 내용을 실제 사용하는 어플리케이션에 적용하여 구현하는 클론코딩을 해봄으로써, 어떻게 서비스가 동작이 되는지 경험해 보고자 시작한 개인 프로젝트 입니다.
혼자 독학하며 제작을 하기 때문에, 많은 내용이 부족하고 기초가 부족하다 느껴지는 프로젝트이나, 차근차근 공부할 수 있는 계기가 되는 프로젝트 입니다.

### 1.1 프로젝트 기능
  클론코딩이기 때문에 인스타그램에 존재하고 있는 기본 기능을 구현해보고자 했습니다.    
- 회원가입 및 로그인        
<img width="70%" src="https://user-images.githubusercontent.com/65437310/115199410-25d1b500-a12e-11eb-8a5e-239e555f4dab.gif"/>    
- 유저 팔로잉/팔로우    
<img width="70%" src="https://user-images.githubusercontent.com/65437310/115199523-439f1a00-a12e-11eb-8017-b39920766f6d.gif"/>    
- 피드 작성/삭제    
<img width="70%" src="https://user-images.githubusercontent.com/65437310/115199569-531e6300-a12e-11eb-94a4-ecbfc37baf8a.gif"/>    
- 다른 유저 피드 열람    
<img width="70%" src="https://user-images.githubusercontent.com/65437310/115199799-87921f00-a12e-11eb-8d4c-32da046119db.gif"/>    
- 댓글 등록 및 열람    
<img width="70%" src="https://user-images.githubusercontent.com/65437310/115200010-c031f880-a12e-11eb-9eb0-643b3e71ee48.gif"/>    
- 유저/해시태그 검색    
<img width="70%" src="https://user-images.githubusercontent.com/65437310/115199848-94af0e00-a12e-11eb-8cec-737361d901c0.gif"/>    

### 1.2 개발 환경
운영체제: window 10
IDE: Eclipse 4.18.0
Backend: Spring Framework 4.3.8.RELEASE, Tomcat 9.0, mybatis 3.5.6
Database: MariaDB 

### 1.3 프로젝트 구조
  인스타그램은 SPA 구조지만, 아직 리액트와 같은 라이브러리를 공부 못한 관계로 SPA 구조로 만들지 못하고 jsp를 이용하여 view단을 구성하였습니다. 그래서 전체적으로는 서버 사이드 렌더링 방식의 구조를 취하고 있지만, 동적으로 필요한 데이터는 ajax 비동기 통신을 이용하여 데이터를 요청, Handlebar template을 이용하여 페이지에 렌더링하여 최대한 SPA 구조와 비슷하게 효과를 가질 수 있도록 구현하였습니다. 또한 MVC 디자인 패턴으로 설계하여, 프로젝트의 유지 및 보수를 용이하도록 구성하며, RESTful API 설계 가이드를 최대한 따르며 RESTful 설계를 할 수 있도록 노력했습니다.    
  
## 2. Frontend architecture
<img src="https://user-images.githubusercontent.com/65437310/115201367-397e1b00-a130-11eb-8616-82297e28eb7a.png" />
View를 구성하는 jsp 페이지를 기능별로 묶어 유사한 기능을 하는 페이지들로 구성하였으며, resources 폴더에는 css, js, static img를 구성하여 참조 가능하도록 분리하였습니다.
부트스트랩을 이용하여 레이아웃을 구성하였으며, View의 페이지들의 구성은 ajax 통신을 하여 데이터를 받아오면, 동적으로 추가하는 방법 이외에는 기본적인 Form 데이터 전송에 대한 결과 또는 a 태그를 활용한 페이지 이동을 활용하였습니다. 

```html:feed.jsp
  <main>
  ...  
  <!-- Feed Section -->
  <div id="feedSection" class="col-md-12"></div> 		  

  </div>  
  ...

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
    
```

팔로잉 유저들의 피드를 보여주는 feed.jsp 페이지 발췌한 부분입니다.
feedSection id를 가진 div에 appending 함으로써 사용자의 상황에 따라 동적으로 피드 정보를 수신하여 표시하도록 했습니다. 
분리된 자바스크립트를 통해 템플릿을 컴파일하고, 데이터와 바인딩하여 표시하고자 하는 위치에 삽입이 이루어집니다. 


```javascript:feedJS.js
  /**
 *  javascript for feed.jsp
 */

var page = 0;
var numFeed = 4;

var feedTemplate = Handlebars.compile($('#feedTemplate').html());
var replyTemplate = Handlebars.compile($('#replyTemplate').html());

const io = new IntersectionObserver(entries => {
	if(entries.some(entry => entry.intersectionRatio > 0)) {
		// 피드 받아와서 출력하기
		attachFeeds();
	}
})

attachFeeds(); // 초기 피드 로드

$('.replySubmit').click(function(e) {
	
	e.preventDefault();
	
	var target = e.target;	
		
	var feedNo = Number(target.getAttribute("id").substr(6));
	var content = document.getElementById("content_" + feedNo).value;
	var form = {
		content: content,
		feedNo: feedNo
	}
	
	var replyList = [];
	
	$.ajax({
		url: "/reply/" + feedNo,
		data : form,
		type: "POST",
		dataType: "json",
		success : function(result) {	
			replyList = result;
			var bindingData = { replyList : replyList };
			var html = replyTemplate(bindingData);
			$('#replies' + result[0].feedNo).append(html);	
			document.getElementById("content_" + result[0].feedNo).value = "";					
		}
	});	
	
});

$('.unfoldReply').click(function(e) {
	
	e.preventDefault();
	
	var target = e.target;
	var feedNo = Number(target.getAttribute("id").substr(10));
	attachReplies(feedNo, 5);
	
});

// 서버로부터 피드 받아오기
function getFeeds(curPage) {
	
	var feedList = [];
	
	$.ajax({
		url: "/feeds/" + curPage,
		data: {page : curPage},
		dataType:"json",
		type: "GET",
		async: false,
		success: function(result) {
			if(result.code === "success"){
				feedList = result.followingFeed;
			}
		},
		error: function(request, status, error) {
			alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
		}
		
	});
	
	return feedList;	
}



// 서버로부터 해당 피드 댓글 받아오는 함수
function getReplies(feedNo, loadNum) {
	
	var curPage = Number(document.getElementById('replyPage_' + feedNo).getAttribute("value"));
	
	var replyList = [];
	data = { feedNo: feedNo,
			 curPage : curPage,
			 loadNum : loadNum};
	
	$.ajax({
		url: "/reply/" + feedNo,
		data: data,    					
		dataType: "json",
		type: "GET",
		async: false,
		success: function(result) {  
			 if(result.code === "success") {    					 
			      replyList = result.replyList;
			 }
		},				
		error: function(request, status, error) {
			alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
		}
	});
	
	return replyList;
}

// 수신 된 피드를 출력하는 함수
function attachFeeds() {	
	// 피드 표시
	var feedList = getFeeds(page);
	var receivedFeed = { feedList : feedList };
	var html = feedTemplate(receivedFeed);
	$("#feedSection").before(html);
	
	
	for(var i = 0; i < feedList.length; i++) {		
		
		var loadNum = 2;
		// 댓글 로드
		attachReplies(feedList[i].feedNo, loadNum);				
	}	
	
	page = (page + 1) * numFeed;
	
}

// 수신된 댓글 출력하는 함수
function attachReplies(feedNo, loadNum) {
	
	var replyList = getReplies(feedNo, loadNum);
		
	if(replyList.length > 0){
		var replyData = {replyList: replyList};
		var html = replyTemplate(replyData);
		$('#replies' + feedNo).prepend(html);
		var updatedPage = Number(document.getElementById('replyPage_' + feedNo).getAttribute("value")) + loadNum;
		document.getElementById('replyPage_' + feedNo).setAttribute("value", updatedPage);
	}
	
}

//좋아요 갯수 수신 및 갯수 갱신
function updateLikeNo(feedNo) {
	
	$.ajax({
		url: "/feeds/like/" + feedNo,	
		dataType: "text",
		type: "GET",
		success: function(result) {  
			 $("#totalLike_" + feedNo).html("<small><strong>좋아요 " + result + "개</strong></small>");
		}
	});
	
}
```
피드 수신을 위한 자바스크립트 파일 입니다. feedTemplate 이라는 변수를 통해 자바스크립트 파일이 로딩이 될 때 컴파일을 합니다. 이후 feed를 ajax통신을 통해 피드 정보를 수신하고 사용자에게 출력게 됩니다. 처음 페이지 로딩 이외, 사용자의 요청을 받아들이는 방법으로는 IntersectionObserver를 통해 사용자의 휠 스크롤 위치를 감시하고 일정 영역까지 내려오면 attachFeeds() 함수를 호출하여 피드를 받아와 출력합니다. 만약 불러올 피드가 더 이상 없으면 IntersectionObserver의 감시를 해제합니다.

## 3. Backend architecture
### 3.1 DB 스키마
<img width="70%" src="https://user-images.githubusercontent.com/65437310/115210097-3cc9d480-a139-11eb-9099-fe23b93357ee.png" />
DB설계에 아직 미숙하지만, 각 테이블 레코드의 중복성 방지 및 무결성을 해치지 않기 위해 정규화를 진행하여 테이블을 총 7가지로 나누고,
외래키에는 cascade delete 제약을 설정하여, 종속된 테이블의 레코드도 같이 삭제 될 수 있도록 했습니다. 

### 3.2 Endpoints
```java
@RequestMapping(value="/feed/post", method = RequestMethod.POST) 		// 피드 업로드 
@RequestMapping(value="/feed/post/img", method = RequestMethod.POST) 		// 피드 사진 업로드 
@RequestMapping(value="/feed/post/img", method = RequestMethod.DELETE) 		// 피드 업로드 사진 삭제
@RequestMapping(value="/feed/thumbnail", method = RequestMethod.GET)		// 피드 미리보기 사진 
@RequestMapping(value="/feed/{feedNo}", method = RequestMethod.DELETE) 		// 업로드 되었던 피드 삭제

@RequestMapping(value="/", method = RequestMethod.GET) 				// 피드 열람 페이지(메인페이지) 요청
@RequestMapping(value="/feeds/{page}", method = RequestMethod.GET) 		// 피드 데이터 요청
@RequestMapping(value="/feed/like/{feedNo}", method = RequestMethod.GET) 	// 해당 피드 좋아요 개수

@RequestMapping(value="/reply/{feedNo}", method = RequestMethod.GET)		// 댓글 열람
@RequestMapping(value="/reply/{feedNo}", method = RequestMethod.POST)		// 댓글 작성

@RequestMapping(value="/search", method = RequestMethod.POST)			// 검색
@RequestMapping(value="/search/{hashtag}", method = RequestMethod.GET)		// 검색된 해시태그 페이지 요청

@RequestMapping(value="/user/{userId}", method = RequestMethod.GET)		// 해당 유저 피드 페이지 요청

@RequestMapping(value="/user/login", method = RequestMethod.GET)		// 로그인 페이지 요청
@RequestMapping(value="/user/login", method = RequestMethod.POST)		// 로그인 요청
@RequestMapping(value="/user/logout", method = RequestMethod.GET)		// 로그아웃 요청

@RequestMapping(value="/profile", method = RequestMethod.GET)			// 프로필 페이지 요청
@RequestMapping(value="/profile", method = RequestMethod.PATCH)			// 프로필 수정 요청
@RequestMapping(value="/profile/img", method = RequestMethod.POST)		// 프로필 이미지 업로드 요청

@RequestMapping(value="/user/regist", method = RequestMethod.GET)		// 회원가입 페이지 요청
@RequestMapping(value="/user/regist", method = RequestMethod.POST)		// 회원가입 요청
@RequestMapping(value="/user/regist/check/email", method = RequestMethod.POST)	// 이메일 중복 검사 요청
@RequestMapping(value="/user/regist/check/id", method = RequestMethod.POST)	// 아이디 중복 검사 요청

@RequestMapping(value="/relation/like", method = RequestMethod.POST)		// 소셜 관련 좋아요 요청
@RequestMapping(value="/relation/follow", method = RequestMethod.POST)		// 소셜 관련 유저 팔로우 요청
```
빈 줄을 기준으로, 각 controller의 구성된 URL 매핑 정보 입니다. REST API 명명 규칙과 적절한 HTTP method를 사용하고자 노력했습니다.


