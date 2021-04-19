<details>
  <summary> 목차 </summary> 
	
  1. 프로젝트 소개     
    1.1 [프로젝트 기능](#11-프로젝트-기능)       
    1.2 [개발 환경](#12-개발-환경)   
    1.3 [프로젝트 구조](#13-프로젝트-구조)
  2. [Fronend architecture](#2-Frontend-architecture)
  3. Backend architecture   
    3.1 [DB 스키마](#31-DB-스키마)     
    3.2 [Backend 구조](#32-Backend-구조)     
    3.3 [Endpoints](#33-Endpoints)    
    3.4 [스프링 설정](#34-스프링-설정)    
  4. [느낀점 및 향후 계획](#4-느낀점-및-향후-계획)
  
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

### 3.2 Backend 구조
<img src="https://user-images.githubusercontent.com/65437310/115237385-790c2d80-a157-11eb-98a8-c6ef1cbd8c80.png" />
interceptor 폴더에는 로그인 및 권한 확인을 위한 interceptor 와 미디어 파일 관리를 위한 유틸 파일을 작성했습니다.
MVC 구조를 위해 분리한 컨트롤러는 각 기능별 패키지를 controller - service - repository - domain 으로 분리하여 역할에 따른 레이어를 나누었습니다.    
<img src="https://user-images.githubusercontent.com/65437310/115238569-cb018300-a158-11eb-8935-ac64fc4b9df6.png" />
Mybatis를 이용하여 mapper를 구성하여 DAO 클래스를 통해 주입된 sqlSession을 통해 DB에 접근하여 sql문을 실행하는데, 이 또한 각 기능별로 mapper를 구분하여
유지 보수를 쉽게 할 수 있도록 구성하였습니다. 코드의 생산성을 높이기 위한 typealias를 mybatis-config.xml을 통해 설정을 명시하여 지정해주었습니다. 

### 3.3 Endpoints
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

### 3.4 스프링 설정
#### web.xml
```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app version="2.5" xmlns="http://java.sun.com/xml/ns/javaee"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://java.sun.com/xml/ns/javaee https://java.sun.com/xml/ns/javaee/web-app_2_5.xsd">

	<!-- The definition of the Root Spring Container shared by all Servlets and Filters -->
	<context-param>
		<param-name>contextConfigLocation</param-name>
		<param-value>/WEB-INF/spring/root-context.xml</param-value>
	</context-param>
	
	<!-- Creates the Spring Container shared by all Servlets and Filters -->
	<listener>
		<listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
	</listener>

	<!-- Processes application requests -->
	<servlet>
		<servlet-name>appServlet</servlet-name>
		<servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
		<init-param>
			<param-name>contextConfigLocation</param-name>
			<param-value>/WEB-INF/spring/appServlet/servlet-context.xml</param-value>
		</init-param>
		<load-on-startup>1</load-on-startup>
	</servlet>
		
	<servlet-mapping>
		<servlet-name>appServlet</servlet-name>
		<url-pattern>/</url-pattern>
	</servlet-mapping>
	
	<!--  encoding filter -->
	<filter>
	  <filter-name>encodingFilter</filter-name>
	  <filter-class>
	    org.springframework.web.filter.CharacterEncodingFilter
	  </filter-class>
	  <init-param>
	    <param-name>encoding</param-name>
	    <param-value>UTF-8</param-value>
	  </init-param>
	  <init-param>
	    <param-name>forceEncoding</param-name>
	    <param-value>true</param-value>
	  </init-param>
	</filter>
	<filter-mapping>
	  <filter-name>encodingFilter</filter-name>
	  <url-pattern>/*</url-pattern>
	</filter-mapping>

	<!-- HiddenHttpMethodFilter -->
	<filter>
	 <filter-name>hiddenHttpMethodFilter</filter-name>
	 <filter-class>org.springframework.web.filter.HiddenHttpMethodFilter</filter-class>
	</filter>
	<filter-mapping>
		<filter-name>hiddenHttpMethodFilter</filter-name>
		<url-pattern>/*</url-pattern>
	</filter-mapping>	
</web-app>
```
스프링 환경설정 파일 로딩을 위한 root-context.xml을 등록 및 servlet 환경 설정을 위한 servlet-context.xml 파일을 등록, 그리고 각종 필터를 설정해주었습니다.
사용한 필터로는 한글 인코딩을 자동으로 하기 위한 encoding filter 와 form 태그에서 지원하지 않는 Patch를 보내기 위해 HiddenHttpMethodFilter를 설정해주었습니다.

#### root-context.xml
```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:context="http://www.springframework.org/schema/context"
	xmlns:mybatis-spring="http://mybatis.org/schema/mybatis-spring"
	xmlns:tx="http://www.springframework.org/schema/tx"
	xsi:schemaLocation="http://mybatis.org/schema/mybatis-spring http://mybatis.org/schema/mybatis-spring-1.2.xsd
		http://www.springframework.org/schema/beans https://www.springframework.org/schema/beans/spring-beans.xsd
		http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context-4.3.xsd
		http://www.springframework.org/schema/tx http://www.springframework.org/schema/tx/spring-tx-4.3.xsd">
	
	<!-- Root Context: defines shared resources visible to all other web components -->
		
		
	<!--DataSource 설정-->
	<bean id="dataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
		 <property name="driverClassName" value="net.sf.log4jdbc.sql.jdbcapi.DriverSpy" />
		 <property name="url" value="jdbc:log4jdbc:mariadb://localhost:3306/soodagram" />
		 <property name="username" value="soodaAdmin" />
		 <property name="password" value="1111" />
	</bean>
	
	<bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
		 <property name="dataSource" ref="dataSource" />
		 <property name="configLocation" value="classpath:/mybatis-config.xml" />
		 <property name="mapperLocations" value="classpath:mappers/**/*Mapper.xml" />
	</bean>
	
	<bean id="sqlSession" class="org.mybatis.spring.SqlSessionTemplate" destroy-method="clearCache">
		 <constructor-arg name="sqlSessionFactory" ref="sqlSessionFactory"/>
	</bean>	
	
	<context:component-scan base-package="com.soodagram.soodagram" />
	
	<bean id="transactionManager" class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
		<property name="dataSource" ref="dataSource" />
	</bean>
		
	<tx:annotation-driven/>
	
</beans>
```
root-context.xml 파일에서는 DB관련 설정을 해주었습니다. 사용 DB는 MariaDB를 사용했으며, DB 사용을 위한 driver manager 와 transaction 관리를 위한 transaction manager 를 설정해주었습니다.
또한 Mybatis 사용을 위한 sqlSession bean 설정을 해주었으며, mybatis 설정과 관련된 xml 파일 경로 지정 및 각종 맵퍼들의 경로들을 지정해주었습니다. 

#### servlet-context.xml
```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans:beans xmlns="http://www.springframework.org/schema/mvc"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:beans="http://www.springframework.org/schema/beans"
	xmlns:context="http://www.springframework.org/schema/context"
	xmlns:aop="http://www.springframework.org/schema/aop"
	xsi:schemaLocation="http://www.springframework.org/schema/mvc https://www.springframework.org/schema/mvc/spring-mvc.xsd
		http://www.springframework.org/schema/beans https://www.springframework.org/schema/beans/spring-beans.xsd
		http://www.springframework.org/schema/context https://www.springframework.org/schema/context/spring-context.xsd
		http://www.springframework.org/schema/aop http://www.springframework.org/schema/aop/spring-aop-4.3.xsd">

	<!-- DispatcherServlet Context: defines this servlet's request-processing infrastructure -->
	
	<!-- Enables the Spring MVC @Controller programming model -->
	<annotation-driven />

	<!-- Handles HTTP GET requests for /resources/** by efficiently serving up static resources in the ${webappRoot}/resources directory -->
	<resources mapping="/resources/**" location="/resources/" />

	<!-- Resolves views selected for rendering by @Controllers to .jsp resources in the /WEB-INF/views directory -->
	<beans:bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
		<beans:property name="prefix" value="/WEB-INF/views/" />
		<beans:property name="suffix" value=".jsp" />
	</beans:bean>
	
	<context:component-scan base-package="com.soodagram.soodagram" />
	
	<aop:aspectj-autoproxy/>
	
	<!-- login interceptor bean 객체 생성 -->
	<beans:bean id="loginInterceptor" class="com.soodagram.soodagram.commons.interceptor.LoginInterceptor" />
	
	<!-- login interceptor 맵핑 -->
	<interceptors>
		<interceptor>
			<mapping path="/user/login"/>
			<beans:ref bean="loginInterceptor" />
		</interceptor>
	</interceptors>
	
	<!-- Auth interceptor bean 객체 생성 -->
	<beans:bean id="authInterceptor" class="com.soodagram.soodagram.commons.interceptor.AuthInterceptor"/>
	
	<!-- auth interceptor 맵핑 -->
	<interceptors>
		<interceptor>
			<mapping path="/*"/>
			<beans:ref bean="authInterceptor"/>
		</interceptor>
	</interceptors>
	
	<!-- 로그인 회원 존재 시, 로그인 및 회원가입 화면 이동 방지 -->
	<beans:bean id="loginAfterInterceptor" class="com.soodagram.soodagram.commons.interceptor.LoginAfterInterceptor"/>
	
	<interceptors>
		<interceptor>
			<mapping path="/user/login"/>
			<mapping path="/user/register"/>
			<beans:ref bean="loginAfterInterceptor"/>
		</interceptor>
	</interceptors>
	
	
	<!-- 파일 업로드 MultipartResolver 설정 -->
	<beans:bean id="multipartResolver" class = "org.springframework.web.multipart.commons.CommonsMultipartResolver">
		<beans:property name="maxUploadSize" value="10485760" />
	</beans:bean>

</beans:beans>

```
DispatcherServlet을 설정하는 파일로써, 각종 annotation을 사용할 수 있도록 설정하며, 각종 리소스에 대한 위치를 지정해주었습니다.
코드의 생산성을 높이기 위해, jsp 파일에 대한 경로에 접두, 접미어 설정을 해주었습니다. 또한 interceptor 사용을 위한 설정을 했습니다. 
로그인 여부를 확인하기 위한 loginInterceptor, 로그인 이후 다시 로그인 페이지 및 회원가입 페이지 이동을 방지하기 위한 loginAfterInterceptor에 대한 설정이 있습니다.
또한 모든 페이지에 대한 접근에 미로그인 사용자의 서비스 이용을 제한하여 위해 미권한 사용자를 로그인 페이지로 이동시킬 수 있는 authInterceptor에 대한 설정이 있습니다. 

## 4. 느낀점 및 향후 계획
스프링을 공부하면서 처음으로 frontend 부터 backend 까지 전체적으로 만들어본 프로젝트 입니다. 뿌듯하지만 아직 기초적인 단계까지만 구현되어 있고 미흡한 점이 많아 아쉬운 프로젝트 입니다.
웹페이지의 구동과 기능에만 치중해서 많은 것을 놓친 것 같습니다.     
 우선 기능적으로 RESTful 하게 구현하고자 하였지만 아직 이해가 미숙하여 Http 상태 코드를 적절히 사용하지 못하는 등 앞으로 갈 길이 멀다고 생각 됩니다. 또한 transaction 관리를 통해, 다중 사용자의 동시 요청 처리, 보안 관점에서의 허술함 등 기능적으로 추가해야 할 점들이 많은 것 같습니다. 앞으로 좀 더 공부해서 이 프로젝트에 추가하는 방향으로 공부해야겠습니다. 또한 스프링을 도구로써 사용하는 방법은 익혔지만, 내부 작동 원리에 대한 이해도가 얕다고 생각되어 심도있는 공부가 병행되어야 겠다는 생각이 듭니다.      
 구현 외적인 측면에서도 아쉬운 점이 많은 것 같습니다. 우선 개인 프로젝트이기 때문에 놓친 협업을 염두에 둔 주석처리, javadoc 미활용 등이 아쉬우며, TDD 방식의 개발 미적용 같은 기능 구현 외적인 부분도 반성하게 되는 프로젝트 입니다. 

앞으로 리팩토링과 기능 추가를 병행하며, 부족한 부분에 대한 수정 보완을 하며, 공부한 내용과 생각들을 기록하는 습관을 위해 블로그에 정리할 예정입니다. 
