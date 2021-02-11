<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <!-- Container wrapper -->
      <div class="container-fluid">
        <!-- Toggle button -->
        <button
          class="navbar-toggler"
          type="button"
          data-mdb-toggle="collapse"
          data-mdb-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <i class="fas fa-bars"></i>
        </button>

        <div class="container">
          <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-5 pt-2">
              <img src="../../../resources/static/soodagram-font-logo.png" class="soodagram-logo" height="30">
            </div>
            <div class="col-md-2">
              <form class="d-flex input-group w-auto">
                <input
                  type="search"
                  class="form-control"
                  placeholder="Search"
                  aria-label="Search"
                />
              </form>
            </div>
            <div class="col-md-3">
              <ul class="navbar-nav justify-content-center">
                <!-- Icons -->
                <li class="nav-item me-3 me-lg-0">
                  <a class="nav-link" href="#">
                    <i class="fas fa-home fa-lg text-dark"></i>
                  </a>
                </li>
                <li class="nav-item me-3 me-lg-0">
                  <a class="nav-link" href="#">
                    <i class="far fa-paper-plane fa-lg text-dark"></i>
                  </a>
                </li>
                <li class="nav-item me-3 me-lg-0">
                  <a class="nav-link" href="#">
                    <i class="far fa-compass fa-lg text-dark"></i>
                  </a>
                </li>
                <li class="nav-item me-3 me-lg-0">
                  <a class="nav-link" href="#">
                    <i class="far fa-heart fa-lg text-dark"></i>
                  </a>
                </li>
                <!-- Avatar -->
                <li class="nav-item dropdown">
                  <a
                    class="nav-link dropdown-toggle d-flex align-items-center"
                    href="#"
                    id="navbarDropdownMenuLink"
                    role="button"
                    data-mdb-toggle="dropdown"
                    aria-expanded="false"
                  >
                    <img
                      src="https://mdbootstrap.com/img/Photos/Avatars/img (31).jpg"
                      class="rounded-circle"
                      height="22"
                      alt=""
                      loading="lazy"
                    />
                  </a>
                  <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <li><a class="dropdown-item" href="${path}/main/account">My profile</a></li>
                    <li><a class="dropdown-item" href="#">Settings</a></li>
                    <li><a class="dropdown-item" href="#">Logout</a></li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <!-- Container wrapper -->
    </nav>
    <!-- Navbar -->