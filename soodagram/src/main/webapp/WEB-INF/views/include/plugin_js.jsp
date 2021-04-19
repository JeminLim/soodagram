<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="${path}/resources/js/bootstrap.js"></script>
<script src="${path}/resources/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>
<!-- template for display data -->
<!-- for navigation bar -->
<script id="resultUserTemplate" type="text/x-handlerbars-template">
	{{#each searchedUser}}		
   		<a href="${path}/user/{{userId}}" class="searchUserList col-md-12">	
			<div class="col-md-3 searchedUserImg">		
				<img src="{{userImg}}" class="rounded-circle" height="40" loading="lazy" />		   		
			</div>
			<div class="col-md-8">
				<ul class="justify-content-left">
					<li>{{userId}}</li>
					<li>{{userName}}</li>
				</ul>
			</div>
		</a>
	{{/each}}
</script>	

<script id="resultHashtagTemplate" type="text/x-handlerbars-template">
	{{#each searchedTag}}
		<a href="#" class="searchHashtagList col-md-12" onclick="linkToHashtagFeed(this);">	
			<div class="col-md-3 searchedHashtag">	
				<i class="fas fa-hashtag fa-lg"></i>
			</div>
			<div class="col-md-8">
				<ul class="justify-content-left">
					<li>{{hashtagName}}</li>
					<li>{{tagCount}}</li>
				</ul>
			</div>
			<input type="hidden" value={{hashtagName}} class="hashtagNameVal"/>
        </a>
	{{/each}}
</script>

<!-- import navigation bar js file -->
<script src="${path}/resources/js/navbarJS.js"></script>