<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <%@ include file="../include/head.jsp"  %>  
  <link rel="stylesheet" href="../../../resources/css/feed_style.css" />
<body>
<header>
	<!-- navbar -->
	<%@ include file="../include/navbar.jsp"  %>
</header>
	<main>
      <div class="container my-5">
        <div class="row">
          <div class="col-md-1"></div>
          <div class="col-md-7">
            <section class="story-container" id="story">
              <ul>
                <li>
                  <div class="story">
                    <img
                      src="https://mdbootstrap.com/img/Photos/Avatars/img (31).jpg"
                      class="rounded-circle"
                      height="50"
                      alt="Avatar"
                    />
                  </div>                  
                  <span>billy_M</span>                  
                </li>                
              </ul>
            </section>

            <section class="newsfeed my-5">
              <div class="post">
                <div class="card">
                  <div class="card-body">
                    <div class="container">
                      <!-- Author -->
                      <div class="row">
                        <div class="col-md-11">
                          <div class="d-flex story">
                            <img
                              src="https://mdbootstrap.com/img/Photos/Avatars/img (31).jpg"
                              class="rounded-circle"
                              height="40"
                              alt="Avatar"                              
                            />
                            <div class="mt-2">
                              <a href="#" class="text-dark">
                                <strong class="mt-5 ml-2">billy_M</strong>                                
                              </a>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-1">                         
                          <i class="fas fa-ellipsis-h fa-lf mt-2"></i>
                        </div>
                      </div>                      
                    </div>
                  </div>
                  <!-- Photo-->
                  <div
                      class="bg-image hover-overlay ripple shadow-1-strong rounded=0"
                      data-mdb-ripple-color="light"
                    >
                      <img src="https://mdbootstrap.com/img/new/fluid/city/113.jpg" class="w-100" />
                      <a href="#!">
                        <div class="mask" style="background-color: rgba(251, 251, 251, 0.2)"></div>
                      </a>
                  </div>

                  <!-- interaction -->
                  <div class="card-body">
                    <div class="container">
                      <div class="row">
                        <div class="col-md-11">
                          <i class="far fa-heart fa-lg ml-0"></i>
                          <i class="far fa-comment fa-lg mx-2"></i>
                          <i class="far fa-paper-plane fa-lg"></i>
                        </div>
                        <div class="col-md-1 text-right">
                          <i class="far fa-bookmark fa-lg"></i>
                        </div>
                      </div>

                      <!-- linked by-->
                      <div class="row mt-1">
                        <div class="col-md-8 mt-1">
                          <img
                            src="https://mdbootstrap.com/img/Photos/Avatars/img (31).jpg"
                            class="rounded-circle"
                            alt="avatar"
                            style="width: 20px"
                          />
                          <small>Linked by <strong>janet_t</strong> and <string>500,687</string> others</small>
                        </div>
                      </div>
                      <!-- Description -->
                      <div class="row">
                        <div class="col-md-12 mt-1">
                          <p>
                            <strong class="text-dark">juliar.art</strong>
                            Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
                            Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                            when an unknown printer took a galley of type and scrambled it to make a type specimen book. 
                            <small class="my-1">more</small>
                          </p>
                        </div>
                      </div>

                      <!-- Comments-->
                      <div class="row">
                        <small class="my-1">View all 2137 Comments</small>
                        <p class="mb-0">
                          <string class="text-dark">alex_123</string>Lorem, ipsum dolor.
                        </p>
                        <p class="mb-0">
                          <string class="text-dark">janet_t</string>Lorem, ipsum dolor. paokmsk
                        </p>                        
                        <small class="my-1">22 hours ago</small>
                      </div>
                        
                      <!-- Comments form -->
                      <div class="row mt-2">
                        <hr />
                        <div class="col-md-11">
                          <div class="form-outline">
                            <input type="text" class="form-control" placeholder="Leave a comment"/>
                          </div>
                        </div>
                        <div class="col-md-1">
                          <p class="text-info mt-1">Post</p>
                        </div>

                      </div>
                    </div>
                  </div>

                </div>
              </div>
            </section>
          </div>          
          <div class="col-md-2 d-md-none d-lg-block">
            <section class="mt-3">
              <!-- Author -->
              <div class="row">
                <div class="col-md-3">
                  <img
                    src="https://mdbootstrap.com/img/new/avatars/1.jpg"
                    class="rounded-circle"
                    height="60"
                    alt="Avatar"
                  />
                </div>
                <div class="col-md-9">
                  <ul class="ml-0 pl-1 mt-1 list-unstyled">
                    <li>
                      <p class="ml-3 text-dark mb-0 mt-1">
                        <strong>${login.userEmail}</strong>
                      </p>
                    </li>
                    <li>
                      <span class="ml-3 text-dark">${login.userEmail}</span>
                    </li>
                  </ul>
                </div>
                
              </div>

              <!-- Suggestions -->
              <div>
                <small>Suggestions For You</small>
                <span class="float-right">See All</span>
              </div>

              <!-- Suggested users -->
              <div class="row">
                <div class="col-md-2">
                  <img
                    src="https://mdbootstrap.com/img/new/avatars/1.jpg"
                    class="rounded-circle mt-2"
                    height="40"
                    alt="Avatar"
                  />
                </div>
                <div class="col-md-8">
                  <ul class="ml-0 pl-1 mt-1 list-unstyled">
                    <li>
                      <small class="user-name"><strong>bill_the_programmer.js</strong></small>
                    </li>
                    <li>
                      <span class="user-name">Followed by john_1 + 10 more</span>
                    </li>
                  </ul>
                </div>
                <div class="col-md-2">
                  <p class="user-name mt-2 text-primary">Follow</p>
                </div>
              </div>
            </section>
          </div>
        </div>
      </div>
    </main>
    
    <%@ include file="../include/plugin_js.jsp" %>
</body>
</html>