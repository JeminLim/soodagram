/**
 * Control account.jsp file
 */

// 피드 작성 modal 컨트롤
$("#postBtn").click(function(e){
	  e.preventDefault();
	  $("#feedModal").modal("show");
	});

	// 팔로우 modal 컨트롤
	$("#followBtn").click(function(e){
	  e.preventDefault();
	  $("#followModal").modal("show");
	});

	 // 팔로워 modal 컨트롤
	 $("#followerBtn").click(function(e){
	  e.preventDefault();
	  $("#followerModal").modal("show");
	});

	$(".closeBtn").click(function(e){
	  e.preventDefault();
	  $("#feedModal").modal("hide");
	  $("#followModal").modal("hide");
	  $("#followerModal").modal("hide");
	});

	$(".closeIcon").click(function(e){
	  e.preventDefault();
	  $("#feedModal").modal("hide");
	  $("#followModal").modal("hide");
	  $("#followerModal").modal("hide");
	});
	
	
// Handlerbars 파일 템플릿 컴파일
var fileTemplate = Handlebars.compile($("#imgTemplate").html());

// 파일 선택 완료시
$(document).ready(function() {
	$("#imgUpload").change(function(e){
		e.preventDefault();
		var files = $("#imgUpload").get(0).files;
		
		for (var i = 0; i < files.length; i++) {
			var file = files[i];
			var formData = new FormData();
			formData.append("file", file);
			uploadFile(formData);		
		}
		
	});
});
   

// 파일 업로드 Ajax 통신
function uploadFile(formData) {
	$.ajax({
		url: "/main/account/uploadFile",
		data: formData,		
		dataType: "text",
		//processData: 데이터를 일반적인 query string으로 변환 처리 여부
		// true일 경우 application/x-www-form-urlencoded 타입
		processData: false,
		// contentType: processData의 기본타입과 동일
		contentType: false,
		type: "POST",
		success: function(data) {
			printFiles(data);
		}		
	});
}

// 첨부파일 출력
function printFiles(data) {
	// 파일 정보
	var fileInfo = getFileInfo(data);
	// 템플릿 파일 정보 바인딩 및 html 생성
	var html = fileTemplate(fileInfo);
	// html을 DOM에 주입
	$(".fileDiv").append(html);
}


// 게시글 입력/ 수정 submit 처리시에 첨부파일 정보도 함께 처리
function filesSubmit(that) {
	var str = "";
	// 여기서 value에 대해서 imgSrc 일텐데? 
	$(".delBtn").each(function(index){
		str += "<input type='hidden' name='files[" + index + "]' value='" + $(this).attr("href") + "'>"
	});
	that.append(str);
	that.get(0).submit();
	
}


// 파일 삭제(입력페이지) : 첨부파일만 삭제처리
function deleteFileWrtPage(that) {
	var url = "/main/account/delete";
	deleteFile(url, that);	
}

// 파일 삭제 AJAX 통신
function deleteFile(url, that) {
	$.ajax({
		url: url,
		type: "post",
		data: {fileName: that.attr("href")},
		dataType: "text",
		success: function(result) {
			if(result ==="DELETED"){
				alert("삭제되었습니다");
				that.parents("li").remove();
			}
		}
	});	
}

function getFileInfo(fullName){	
	var fileName; // 파일명
	var imgSrc; // 썸네일 파일 요청 URL
	var getLink; // 원본파일 요청 URL
	var fileLink; // 날짜 제외 파일명
	
	imgSrc = "/main/account/display?fileName=" + fullName;
	fileLink = fullName.substr(14);
	var datePath = fullName.substr(0,12);
	getLink = "/main/account/display?fileName=" + datePath + fileLink;
	
	fileName = fileLink.substr(fileLink.indexOf("_") + 1);
	
	return { fileName : fileName,
			 imgSrc : imgSrc,
			 getLnk : getLink,
			 fullName : fullName}
}



