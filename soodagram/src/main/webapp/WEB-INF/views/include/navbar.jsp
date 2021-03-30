<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container-fluid">
          <div class="container">
              <div class="row">
                  <div class="col-md-2"></div>
	                  <a href="/" class="col-md-2 logoBtn">
	                      <img src="${path}/resources/static/soodagram-font-logo.png" class="fontLogo" height="30">
	                  </a>
                  <div class="col-md-3">
                  	<div class="center">                  	
                      <input type="search" class="form-control searchInput" placeholder="검색" id="searchBar" aria-label="Search"/> 
                      <div id="searchResult" class="searchResult">
                      	
                      </div> 
                  	</div>                      
                  </div>
                  <div class="col-md-4">
                      <ul class="navbar-nav justify-content-center">
                          <!-- Icons -->
                          <li class="nav-item">
                              <a href="#" class="nav-link">
                                  <i class="fas fa-home fa-lg nav-icon"></i>
                              </a>
                          </li>
                          <li class="nav-item">
                              <a class="nav-link" href="#">
                                <i class="far fa-paper-plane fa-lg nav-icon"></i>
                              </a>
                            </li>
                            <li class="nav-item">
                              <a class="nav-link" href="#">
                                <i class="far fa-compass fa-lg nav-icon"></i>
                              </a>
                            </li>
                            <li class="nav-item">
                              <a class="nav-link" href="#">
                                <i class="far fa-heart fa-lg nav-icon"></i>
                              </a>
                            </li>
                            <!-- Avatar -->
                            <li class="dropdown">
                              <a href="#" class="dropdown-toggle" id="navDropdownMenu" role="button" data-toggle="dropdown" aria-hashpopup="ture" aria-expanded="false">
                                <img src="${login.userImg}" class="rounded-circle" height="25" loading="lazy" />
                              </a>
                              <ul class="dropdown-menu" aria-labelledby="navDropdownMenu">
                                <li><a class="dropdown-item" href="${path}/main/account">프로필</a></li>
                                <li><a class="dropdown-item" href="#">설정</a></li>
                                <li><a class="dropdown-item" href="${path}/user/logout">로그아웃</a></li>
                              </ul>
                            </li>
                      </ul>
                  </div>
              </div>
          </div>
      </div>
</nav>  












