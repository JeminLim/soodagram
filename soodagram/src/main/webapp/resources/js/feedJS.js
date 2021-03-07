/**
 *  javascript for feed.jsp
 */


const getScrollTop = function(){
	return (window.pageYOffset !== undefined) ? window.pageYOffset : (document.documentElement || document.body.parentNode || document.body).scrollTop;	
};

const getDocumentHeight = function(){
	const body = document.body;
	const html = document.documentElement;
	
	return Math.max(
		body.scrollHeight, body.offsetHeight,
		html.clientHeight, html.scrollHeight, html.offsetHeight
	);	
};

const onScroll = function (){
	if (getScrollTop() === getDocumentHeight() - window.innerHeight){
		var feedVar = "${followingFeed}";
		
		
	}
};