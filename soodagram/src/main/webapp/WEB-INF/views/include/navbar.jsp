<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container-fluid">
          <div class="container">
              <div class="row">
                  <div class="col-md-1"></div>
                  <div class="col-md-4 logoBtn">
                      <img src="${path}/resources/static/soodagram-font-logo.png" class="fontLogo" height="30">
                  </div>
                  <div class="col-md-3">
                      <form class="d-flex input-group w-auto">
                          <input type="search" class="form-control" placeholder="검색" aria-label="Search"/>
                      </form>
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
                              <a href="#" class="nav-link dropdown-toggle d-flex align-items-center" id="dropdownMenu" role="button" data-toggle="dropdown" aria-expanded="false">
                                <img src="${login.userImg}" class="rounded-circle" height="25" loading="lazy" />
                              </a>
                              <ul class="dropdown-menu" aria-labelledby="dropdownMenu">
                                <li><a class="dropdown-item" href="${path}/main/account">프로필</a></li>
                                <li><a class="dropdown-item" href="#">설정</a></li>
                                <li><a class="dropdown-item" href="#">로그아웃</a></li>
                              </ul>
                            </li>
                      </ul>
                  </div>
              </div>
          </div>
      </div>
</nav>  