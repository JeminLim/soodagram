<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <%@ include file="../include/head.jsp"  %>
  <link rel="stylesheet" href="../../../resources/css/profile_style.css" />
<body>
<header>
	<!-- navbar -->
	<%@ include file="../include/navbar.jsp"  %>
</header>
	<main>
     <div class="container">
        <div class="row mt-4">
          <div class="col-md-1"></div>
          <div class="col-md-2 border">
            <ul class="menu">
              <li class="menu-list">프로필 편집</li>
              <li class="menu-list">비밀번호 변경</li>
              <li class="menu-list deactivated">앱 및 웹사이트</li>
              <li class="menu-list deactivated">이메일 및 SMS</li>
              <li class="menu-list deactivated">푸시 알림</li>
              <li class="menu-list deactivated">연락처 관리</li>
              <li class="menu-list deactivated">공개 범위 및 보안</li>
              <li class="menu-list deactivated">로그인 활동</li>
              <li class="menu-list deactivated">Instagram에서 보낸 이메일</li>
            </ul>
          </div>          
          <div class="col-md-7 border">
            <div class="col-md d-flex mt-5">
              <img
                  src="https://mdbootstrap.com/img/Photos/Avatars/img (31).jpg"
                  class="rounded-circle"
                  height="70"
                  id = "profile-img"
              />
              <div class="col-md-3 mx-4">                
                <h4 class="user">jamie_uu</h4>
                <button type="button" id="change_profile_img">프로필 사진 바꾸기</button>
              </div>
            </div>
            <form role="form">
              <div class="form-group d-flex my-5">
                <aside class="aside-input col-md-3">
                  <label>이름</label>
                </aside>
                <div class="col-md-9">
                  <input type="text" class="profile-input">
                  <div class="col-md">
                    <span><small>사람들이 이름, 별명 또는 비지니스 이름 등 회원님의 알려진 이름을 사용하여 회원님의 계정을 찾을 수 있도록 도와주세요</small></span>
                  </div>
                </div>
              </div>
              <div class="form-group d-flex my-5">
                <aside class="aside-input col-md-3">
                  <label>사용자 이름</label>
                </aside>
                <div class="col-md-9">
                  <input type="text" class="profile-input">
                </div>
              </div>          
              <div class="form-group d-flex my-5">
                <aside class="aside-input col-md-3">
                  <label>소개</label>
                </aside>
                <div class="col-md-9">
                  <input type="text" class="profile-input">
                </div>
              </div>          
              <div class="form-group d-flex my-5">
                <aside class="aside-input col-md-3">
                  <label>이메일</label>
                </aside>
                <div class="col-md-9">
                  <input type="text" class="profile-input">
                </div>
              </div>          
              <div class="form-group d-flex my-5">
                <aside class="aside-input col-md-3">
                  <label>전화번호</label>
                </aside>
                <div class="col-md-9">
                  <input type="text" class="profile-input">
                </div>
              </div>
              <div class="form-group d-flex my-5">
                <aside class="aside-input col-md-3">
                  <label>성별</label>
                </aside>
                <div class="col-md-9">
                  <input type="text" class="profile-input">
                </div>
              </div>  
              <div class="form-group d-flex my-5">
                <aside class="aside-input col-md-3">
                </aside>
                <div class="col-md-9">
                  <button type="submit" class="btn btn-primary">제출</button>
                </div>
              </div>                           
            </form>
          </div>

        </div>
      </div>
    </main>
    
    <%@ include file="../include/plugin_js.jsp" %>
</body>
</html>