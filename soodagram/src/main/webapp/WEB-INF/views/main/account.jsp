<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		 <div class="container">
        <!-- Profile -->
        <div class="row pt-5">    
          <div class="col-md-2"></div>
          <!-- Profile-img -->      
          <div class="col-md-3 text-center">
            <img
                src="https://mdbootstrap.com/img/Photos/Avatars/img (31).jpg"
                class="rounded-circle"
                height="160"
                alt="Avatar"
            /> 
          </div>
          <!-- Profile abstact -->
          <div class="col-md-7">
            <div class="col-md-8 mx-4 my-4">
              <span class="profile">jamie_uu</span>
              <span class="profile"><button type="button" class="btn rounded border">프로필 편집</button> </span>
              <span class="profile"><button type="button" class="btn-link text-dark profile"><i class="fas fa-cog fa-lg"></i></span>
              <span class="profile"><button type="button" class="btn-link text-dark profile" id="postBtn"><i class="fas fa-edit fa-lg"></i></span>              
            </div>
            <div class="col-md-8 mx-4 my-4">
              <span class="feedNum">게시물 <span>0</span> </span>              
              <button type="button" class="followBtn" id="followBtn">팔로우 <span>0</span> </button>              
              <button type="button" class="followBtn" id="followerBtn">팔로워 <span>0</span> </button>            
            </div>
            <div class="col-md-5 mx-4 my-4">
              <span>jamie</span>
            </div>
         </div>
        </div>
        <div class="row">
          <div class="col-md-1"></div>
          <div class="col-md-11 text-center my-4">
            <a href="#" class="feed text-dark"><i class="fas fa-th" id="icon"></i><span class="list">게시물</span></a>
            <a href="#" class="feed text-dark"><i class="fas fa-tv" id="icon"></i><span class="list">IGTV</span></a>
            <a href="#" class="feed text-dark"><i class="far fa-bookmark" id="icon"></i><span class="list">저장됨</span></a>
            <a href="#" class="feed text-dark"><i class="far fa-id-badge" id="icon"></i><span class="list">태그됨</span></a>
          </div>
        </div>
        <div class="row">
          <div class="col-md-2"></div>
          <div class="col-md-4">
            <img src="../../../resources/static/picture_sample.jpg" alt="sample" height="400" width="350"/>
          </div>
        </div>
      </div>

      <!-- Feed write modal -->
      <div class="modal fade" id="feedModal" tabindex="-1" role="dialog" aria-labelledby="feedModal" aria-hidden="true">
        <div class="modal-dialog modal-dialog-center" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="feedModal">피드 작성</h5>
              <button type="button" class="close closeIcon" data-dismiss="modal" aria-label="Close" id="closeOnHeader">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form role="form" action="${path}/main/account/upload" id="writeForm" method="post" enctype="multipart/form-data">
                <p><small>사진 업로드</small></p>
                <!-- 첨부파일 영역 -->
                <div class="form-group border fileDiv">                             
                </div> 
                <input type="file" class="btn btn-primary" id="imgUpload" name="feedImg" />
                <div class="form-group my-5">
                  <div class="feedContent">
                    <input type="text" class="contentInput" placeholder="내용을 입력해주세요" name="content"/>
                  </div>
                </div>
                <input type="hidden" name="userNo" id="userNo" value="{login.userNo}">          
	            <div class="modal-footer">
	              <button type="button" class="btn btn-secondary closeBtn" data-dismiss="modal" id="closeBtn">Close</button>
	              <button type="submit" class="btn btn-primary">upload Feed</button>
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
            <div class="modal-header">
              <h5 class="modal-title" id="followModal">Follow</h5>
              <button type="button" class="close closeIcon" data-dismiss="modal" aria-label="Close" id="closeIcon">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <div class="row">
                <div class="col-md-12 text-center align-items-center" id="noFollow">
                  <i class="fas fa-user-plus addPeople"></i>
                  <p class="my-2" style="font-size: 25px;">팔로우</p>
                  <P>회원님이 팔로우하는 모든 사람이 여기에 표시됩니다.</P>
                </div>
                <div class="row">
                  <!-- 유저 프로필 -->
                  <div class="col-md-2 text-center">
                    <img
                        src="https://mdbootstrap.com/img/Photos/Avatars/img (31).jpg"
                        class="rounded-circle"
                        height="50"
                        alt="Avatar"
                    /> 
                  </div>                 
                  <div class="col-md-7">
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
                  <div class="col md-1">
                    <button type="button" class="btn btn-primary">팔로우</button>
                  </div>
                </div>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary closeBtn" data-dismiss="modal" id="closeBtn">Close</button>
            </div>
          </div>
        </div>
      </div>

    <!-- follower -->
    <div class="modal fade" id="followerModal" tabindex="-1" role="dialog" aria-labelledby="followerModal" aria-hidden="true">
      <div class="modal-dialog modal-dialog-center" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="followerModal">Follower</h5>
            <button type="button" class="close closeIcon" data-dismiss="modal" aria-label="Close" id="closeIcon">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <div class="row">
              <div class="col-md-12 text-center align-items-center" id="noFollow">
                <i class="fas fa-user-plus addPeople"></i>
                <p class="my-2" style="font-size: 25px;">팔로워</p>
                <P>회원님이 팔로우하는 모든 사람이 여기에 표시됩니다.</P>
              </div>
              <div class="row">
                <!-- 유저 프로필 -->
                <div class="col-md-2 text-center">
                  <img
                      src="https://mdbootstrap.com/img/Photos/Avatars/img (31).jpg"
                      class="rounded-circle"
                      height="50"
                      alt="Avatar"
                  /> 
                </div>                 
                <div class="col-md-7">
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
                <div class="col md-1">
                  <button type="button" class="btn btn-primary">팔로우</button>
                </div>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary closeBtn" data-dismiss="modal" id="closeBtn">Close</button>
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
    <script type="text/javascript" src="../../../resources/js/accountScript.js"> </script>    
      
    <script> 
	    // 버튼 클릭시 삭제
	   $(document).on("click", ".delBtn", function(e) {
	    	e.preventDefault();
	    	var that = $(this);
	    	deleteFileWrtPage(that);	
	   });
    </script> 
</body>
</html>