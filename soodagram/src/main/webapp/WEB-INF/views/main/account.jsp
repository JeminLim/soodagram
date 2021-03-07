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
                <span class="profile profileBtn"><button type="button" class="btn rounded border">프로필 편집</button> </span>
                <span class="profile profileIcon"><button type="button" class="btn-link profile text-dark"><i class="fas fa-cog fa-lg"></i></button></span>
                <span class="profile profileIcon"><button type="button" class="btn-link profile text-dark" id="postBtn"><i class="fas fa-edit fa-lg"></i></button></span>              
              </div>
              <div class="col-md-12 userInfo">
                <span class="userLog feedNum">게시물 0</span>              
                <button type="button" class="userLog followBtn" id="followBtn">팔로우 0 </button>              
                <button type="button" class="userLog followBtn" id="followerBtn">팔로워 0 </button>            
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
        
        <c:if test="${fn:length(myFeed) > 0 }">
       	   <div class="row uploadedFeedRow">
	       	 <div class="container-fluid">
	       		<div class="col-md-3"> </div>
	       		<div class="myFeedList col-md-7"> 			
        		<c:forEach items="${myFeed}" var="file" varStatus="myFeedStatus">
        			<div class="col-md-3 myFeedImg">
                  		<img class="feedImg" src="/resources/dist/upload/media/${file.fileVO[0].fileName}"/>
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
              <form role="form" action="${path}/main/account/upload" id="writeForm" method="post" enctype="multipart/form-data">
                <p><mdall>사진 업로드</mdall></p>
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
              <div class="modal-title col-md-11" id="followModal">Follow</div>
              <div class="modal-title-close col-md-1">
                <button type="button" class="close closeIcon" data-dimdiss="modal" aria-label="Close" id="closeIcon">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
            </div>
            <div class="modal-body">
              <div class="row">
                <div class="container-fluid text-center modalbodyContainer">
                  <div class="col-md-12 text-center align-items-center" id="noFollow">
                    <div class="iconBorder">                  
                      <i class="fas fa-user-plus addPeople"></i>
                    </div>
                    <p class="my-2" style="font-size: 25px;">팔로우</p>
                    <P>회원님이 팔로우하는 모든 사람이 여기에 표시됩니다.</P>
                  </div>

                  <p><strong>회원님을 위한 추천</strong></p>

                  <div class="col-md-12 text-center align-items-center" id="recommandUser">
                      <div class="container-fluid recommandList">
                        <!-- 유저 프로필 -->
                        <div class="col-md-2"></div>
                        <div class="col-md-2 text-center">
                          <img
                              src="https://mdbootstrap.com/img/Photos/Avatars/img (31).jpg"
                              class="rounded-circle"
                              height="50"
                              alt="Avatar"
                          /> 
                        </div>                 
                        <div class="col-md-3">
                          <!-- 유저 아이디 -->
                          <div class="col-md-12">
                            <span><strong>jamie_uu</strong></span>
                          </div>
                          <!-- 유저 이름-->
                          <div class="col-md-12">
                            <span>jamie</span>
                          </div>
                        </div>    
                        <!-- 팔로우 버튼 -->
                        <div class="col-md-1">
                          <button type="button" class="btn btn-primary">팔로우</button>
                        </div>
                      </div>

                      <div class="container-fluid recommandList">
                        <!-- 유저 프로필 -->
                        <div class="col-md-2"></div>
                        <div class="col-md-2 text-center">
                          <img
                              src="https://mdbootstrap.com/img/Photos/Avatars/img (31).jpg"
                              class="rounded-circle"
                              height="50"
                              alt="Avatar"
                          /> 
                        </div>                 
                        <div class="col-md-3">
                          <!-- 유저 아이디 -->
                          <div class="col-md-12">
                            <span><strong>jamie_uu</strong></span>
                          </div>
                          <!-- 유저 이름-->
                          <div class="col-md-12">
                            <span>jamie</span>
                          </div>
                        </div>    
                        <!-- 팔로우 버튼 -->
                        <div class="col-md-1">
                          <button type="button" class="btn btn-primary">팔로우</button>
                        </div>
                      </div>
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
                  <div class="col-md-12 text-center align-items-center" id="noFollow">
                    <div class="iconBorder">                  
                      <i class="fas fa-user-plus addPeople"></i>
                    </div>
                    <p class="my-2" style="font-size: 25px;">팔로워</p>
                    <P>회원님을 팔로우하는 모든 사람이 여기에 표시됩니다.</P>
                  </div>

                  <p><strong>회원님을 위한 추천</strong></p>

                  <div class="col-md-12 text-center align-items-center" id="recommandUser">
                      <div class="container-fluid recommandList">
                        <!-- 유저 프로필 -->
                        <div class="col-md-2"></div>
                        <div class="col-md-2 text-center">
                          <img
                              src="https://mdbootstrap.com/img/Photos/Avatars/img (31).jpg"
                              class="rounded-circle"
                              height="50"
                              alt="Avatar"
                          /> 
                        </div>                 
                        <div class="col-md-3">
                          <!-- 유저 아이디 -->
                          <div class="col-md-12">
                            <span><strong>jamie_uu</strong></span>
                          </div>
                          <!-- 유저 이름-->
                          <div class="col-md-12">
                            <span>jamie</span>
                          </div>
                        </div>    
                        <!-- 팔로우 버튼 -->
                        <div class="col-md-1">
                          <button type="button" class="btn btn-primary">팔로우</button>
                        </div>
                      </div>

                      <div class="container-fluid recommandList">
                        <!-- 유저 프로필 -->
                        <div class="col-md-2"></div>
                        <div class="col-md-2 text-center">
                          <img
                              src="https://mdbootstrap.com/img/Photos/Avatars/img (31).jpg"
                              class="rounded-circle"
                              height="50"
                              alt="Avatar"
                          /> 
                        </div>                 
                        <div class="col-md-3">
                          <!-- 유저 아이디 -->
                          <div class="col-md-12">
                            <span><strong>jamie_uu</strong></span>
                          </div>
                          <!-- 유저 이름-->
                          <div class="col-md-12">
                            <span>jamie</span>
                          </div>
                        </div>    
                        <!-- 팔로우 버튼 -->
                        <div class="col-md-1">
                          <button type="button" class="btn btn-primary">팔로우</button>
                        </div>
                      </div>
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
    
    <%@ include file="../include/plugin_js.jsp" %>    
    <script id="imgTemplate" type="text/x-handlerbars-template">
		<li class="imgList" style="list-style:none; margin: 5px;">
			<span class="mailbox-attachment-icon uploadImage">
				<img src="{{imgSrc}}" class="fileImg" alt="Attachment" height="150", width="150">		
			</span>
			<a href="{{fullName}}" class="btn btn-danger delBtn" id="delBtn" name="delBtn">삭제</a>
		</li>
	</script>	
	
    <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>
    <script type="text/javascript" src="${path}/resources/js/accountJS.js"> </script>    
      
    <script> 
    
	    // 버튼 클릭시 삭제
	   $(document).on("click", ".delBtn", function(e) {
	    	e.preventDefault();
	    	var that = $(this);
	    	deleteFileWrtPage(that);	
	   });
	    
	    // submit 버튼 작동시
	    $(document).ready(function() {
		   $("#writeForm").submit(function (e) {
			   e.preventDefault();
			   var that = $(this);
			   filesSubmit(that);
		   });
	    });	   

		 // 프로필 이미지 클릭
		 $(document).ready(function() {
		 	$("#profileImg").click(function(e) {
		 		e.preventDefault();	
		 		$("#profileImgUpload").click();
		 	});
		 });
		 

		// 프로필 등록시 ajax 통신
		 $(document).ready(function() {
		 	$("#profileImgUpload").on("change", function(e) {
		 		e.preventDefault();
		 		var imgSrc = $("#profileImgUpload")[0].files[0];	
		 		var formData = new FormData();
		 		formData.append("file", imgSrc);
		 		$.ajax({
		 			url: "/main/account/uploadUserImg",
		 			data: formData,
		 			dataType: "text",
		 			processData: false,
		 			contentType: false,
		 			type: "POST",
		 			success: function(result) {				
		 				$("#profileImg").attr("src", "/resources/dist/upload/media/" + result);
		 			}
		 		});
		 	});		
		 });
		
    </script> 
</body>
</html>