<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!--DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>${"현재 책 제목"}</title>

<style>
*{margin:0; padding:0; text-decoration:none;}
.font7 {font-size:0.7em;}
.gray {color:#eee;}
.textEllipsis {white-space:pre-line; overflow:hidden; text-overflow:ellipsis;}


<!-- BOOK VIEWER  -->
#canvas {}
#viewer-top {width:600px; margin:0 auto;}
#slider-bar {}
#viewer-bottom {width:400px; margin:0 auto;}
#page-counter {margin: 20px;}
#page-counter #thisPage {width: 50px;}


nav {width:170px; height:100%; background:white; 
	position:fixed; top:0; right:0; z-index:101;
	font-size:0.8em;}
nav img {width:20px; height:20x;}
nav a{text-decoration:none;}

#look-comment a{background:#69F;  z-index:101;}

#nav-pop {position: absolute; bottom:30px; padding:10px; background:#fff; display:none; z-index:101;}
#nav-pop ul {list-style-type: none;}
#nav-pop ul li {float:right;}
#nav-config {position: absolute; bottom:0px; right:0px; z-index:101;}
.margin10 {margin:10px;}

.coOpen {display:block; width:50px; height:30px; line-height:30px;}
.open1 {position:absolute; top:100px; left:0px;}
.open2 {position:absolute; top:100px; left:50px;}
.open3 {width:100px; position:absolute; top:130px; left:0px;}

.coClose {display:block; width:30px; height:30px; line-height:30px; font-size:18px; font-weight:bold; /*background:#fff; color:#69F; border-radius:15px;*/ text-align:center; text-decoration:none;}
.close1 {position:absolute; top:15px; right:15px;}
.close2 {position:absolute; top:15px; left:15px;}
.close3 {position:absolute; top:15px; right:15px;}
.close4 {position:absolute; top:15px; right:15px;}

.comment{width:35%; height:100%; background:#ccc; font-size:0.9em;}
.RightWrap{position:fixed; top:5%; height:90%; right:-500px; z-index:100;}
.LeftWrap{position:fixed; top:0; left:0px; display:none; z-index:100;}

#coWrite h4 {display:bolck; width:100px; height:25px; line-height: 25px; text-align:center; background-color:yellow; margin-top:10px;}
.openCoWrite {}
#comment{margin:50px 30px;}
#comment table{width:100%; border-top:1px white dashed; }
#coShow{margin-top:30px;}
#coShow table{width:100%;}
#coPlace{width:100%;}
.coWrite {display: none;}
#coWriteBtn{}
.coWriteBtn{line-height:80px; width: 100%; height: 80px;}
.coWriteBtn_widthL{width:70%;}
.coWriteBtn_widthR{width:30%;}
#reCoWriteForm{display:none;}

.padding10 {padding:10px 0;}


#modalBg {
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    background: rgba(0, 0, 0, 0.8);
    display:none;
	z-index: 500;
    /*-webkit-transition: opacity 400ms ease-in;
    -moz-transition: opacity 400ms ease-in;
    transition: opacity 400ms ease-in;
    pointer-events: auto;*/
}
.totalCom {
	display:none;
	z-index: 501;
	background-color:white;
	position: absolute;
	top: 5%;
	left: 15%;
	width: 70%;
	height: 80%;
	padding: 16px;}

.Bookmark{
	display:none;
	z-index: 501;
	background-color:white;
	position: absolute;
	top: 2%;
	left: 0%;
	width: 40%;
	height: 90%;
	padding: 16px;}


</style>


<script src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="js/jquery.min.1.7.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.20.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.mousewheel.min.js"></script>
<script type="text/javascript" src="js/modernizr.2.5.3.min.js"></script>
<script type="text/javascript" src="js/hash.js"></script>

</head>

<body>
<!-- BOOK VIEWER -->
<section id="canvas">
	<div id="viewer-top">
		<div id="slider-bar" class="turnjs-slider">
			<div id="slider"></div>
		</div>
	</div><!--viewer-top-->
	<div id="book-zoom">
		<div class="sample-docs">
			<!--<div ignore="1" class="tabs"><div class="left">  </div> <div class="right"> </div></div>-->
			<div class="hard"></div>
			<div class="hard"></div>
			<div class="hard p29"></div>
			<div class="hard p30"></div>
			<!-- Next button -->
			<div ignore="1" class="next-button"></div>
			<!-- Previous button -->
			<div ignore="1" class="previous-button"></div>
		</div>
	</div>	
	<div id="viewer-bottom">
		<div id="page-counter" class=" ">
			<div id=""> 
			 <p>
			 ㅣ◀  
			 <a href="#" class="previousPage">◀</a>    
			 <input type="number" id="pageGo" placeholder="${thisPage}"> / ${totalPage}  
			 <a href="#" class="pageGoEnter"><b><i>Go</i></b></a> 
			 <a href="#" class="nextPage">▶</a>  
			 ▶ㅣ
			 </p>
			</div>
		</div>
	</div><!--viewer-bottom-->
</section> <!--canvas-->


<!-- NAVIGATION-->
<nav>
	<div id="look-comment">
		<br><br><br> 답글보기
		<a href="#" class="coOpen open1"><img src="" alt="">왼쪽</a>
		<a href="#" class="coOpen open2"><img src="" alt="">오른쪽</a>
		<a href="#" class="coOpen open3"><img src="" alt="">전체보기</a>
	</div>
	
	<div id="nav-pop" class="margin10">
	<!--input 으로 바꾸기-->
		<ul>
			<li><a href="#" class="openBookmark">북마크 보기 <img src="img/if_office-01_809597.png" alt="북마크보기"></a></li>
			<li>
				<!--c:if test="${bookmark==0}"-->
					<a href="#">북마크 하기 <img src="img/if_bookmark-outline_326548.png" alt="북마크 하기"></a>
				<!--/c:if>
				<c:if test="${bookmark==1}">
					<a href="#">북마크 없애기 <img src="img/if_bookmark-outline_326548.png" alt="북마크  없애기"></a>
				</c:if-->
			</li>
			<li>
				<!--c:if test="${}"-->
					<a href="#">책장에 추가 <img src="img/if_book_sans_add_103401.png" alt="책장에 추가"></a>
				<!--/c:if>
				<c:if test="${}">
					<a href="#">책장에서 빼기 <img src="img/if_book_sans_add_103401.png" alt="책장에서 빼기"></a>
				</c:if-->
			</li>
			<li><a href="#">별점주기 <img src="img/if_star_103714.png" alt="별점주기"></a></li>
			<li>
				<a href="#">신고하기 <img src="img/if_office-01_809597.png" alt="신고하기"></a>
			</li>
			<!--전자책 / 이미지 바꿔서 보여주기
			<c:if test="${isText != 'isText'}">
				<c:if test="${bookType=='jpg'}"-->
					<li><a href="#" id="goText" class="convertToTxt convert">전자책으로 보기 <img src="img/if_office-01_809597.png" alt="전자책으로 보기"></a></li>
				<!--/c:if>
				<c:if test="${bookType=='text'}">
					<li><a href="#"  id="goJpg" class="convertToJpg convert">이미지로 보기 <img src="img/if_office-01_809597.png" alt="이미지로 보기"></a></li>
				</c:if>

			</c:if-->
		</ul>
	</div>
	<div id="nav-config" class="margin10">
		<a href="#" class="navPopBtn"><img src="img/if_settings_103345.png" alt=""></a>
	</div>
</nav>

<div class="RightWrap comment">

	<a href="#" class="coClose close1">X</a>

	<div id="comment">

		<div id="coWrite">
			<div id="thisComInfo"></div>
			"<div id='commentCount' name='commentCount'>data.pageCountBlock+"~"+data.page+"<h3>"+data.page+"p 댓글 보기</h3> 총"+data.pageListCount+"개</div>"
			
			<h4><a href="#" class="openCoWrite toggle"> 덧글쓰기 </a></h4>
			<form action="/textant/" method="post"> 
			<input id="bookArticleNum" type="hidden" name="bookArticleNum" value="1">
			<input id="page" type="hidden" name="page" value="1">
			<input id="nextPage" type="hidden" name="nextPage" value="1">
			<input id='pageListCount' type='hidden' name='pageListCount'>
			<input id='pageCountBlock' type='hidden' name='pageCountBlock'>
			<input id='pageCut' type='hidden' name='pageCut'>
			<input id='pageSize' type='hidden' name='pageSize'>
			<input id='commentTo' type='hidden' name='commentTo'>
			<input id='conet' type='hidden' name='conet'>
			<input id='commentTop' type="hidden" name='commentTop' value='0'>
			<input id='commentCheck' type="hidden" name='commentCheck' value='0'>  
			
			
			<table class="coWrite toggleChild">
				<tr>
					<!--c:if test="${id != null}"--><td>${id}님</td>
					<!--c:if test="${id == null}"><td>게스트님</td></c:if-->
				</tr>
				<!--c:if test="${id != null}"-->
					<tr>	
						<td class="coWriteBtn_widthL">
							<textarea rows="5" id="coPlace"></textarea>
						</td>
						<td class="coWriteBtn_widthR">
							<input type="submit" value="입력" id="coWriteBtn" class="coWriteBtn">
						</td>
					</tr>
					<!--
				</c:if>
				<c:if test="${id == null}">
					<tr>
						<td>
							<textarea rows="5" cols="70" id="" placeholder="로그인 후 덧글을 입력해주세요"></textarea>
						</td>
						<td class="coWriteBtn_width">
							<input type="submit"value="입력" disabled="disabled" class="coWriteBtn">
						</td>
				</c:if-->
				<tr>
					<td align="right" class="font7 gray">${현재입력byte} / 1000 byte</td>
					<td></td>
				</tr>
			</table>
		</div>

		<div id="coShow">
		<c:forEach var="thisCom" item="${}">
			<table border="1" class="padding10">
				<tr>
					<td rowspan="4" width="30px">${thisCom.profilePicture}</td>
					<td colspan="2" class="">
						<p  class="textEllipsis ">${thisCom.conet}<br>
						두 줄만 보여줍니다 <br>
						세 줄만 보여줍니다세 줄만 보여줍니다세 줄만 보여줍니다세 줄만 보여줍니다세 줄만 보여줍니다</p>
					</td>
				</tr>
				<tr >
					<td class="font7" colspan="2" align="right">더보기 ▼</td>
				</tr>
				<tr>
					<td class="font7" colspan="2">${id}┃${writeDate}┃ ♥ (${commentGood}) ┃  (${commentBad}) ┃ 
					<a href="#" id="showReCo">댓글보기<a></td>
				</tr>
				
				<!-- 댓글의 댓글보기-->
				<!-- <tr>
					<td rowspan="4">   img   </td>
					<td colspan="2" class="textHidden">
						<p  class="textEllipsis">${답글내역} <br>
						두 줄만 보여줍니다 <br>
						세 줄만 보여줍니다</p>
					</td>
				</tr>
				<tr >
					<td></td>
					<td class="font7" colspan="2" align="right">더보기 ▼</td>
				</tr>
				<tr>
					<td></td>
					<td class="font7" colspan="2">아이디 ┃날짜 ┃ ♥ (2) ┃ 신고(2) </td>
				</tr>

				
				<tr> 
					<td></td>
					<td class="font7" colspan="2" align="right">좋아요 ┃ 신고하기 </td>
				</tr> -->
				<!-- 댓글의 댓글보기-->

				<tr>
					<td class="font7" colspan="2" align="right">
						<a href="#">좋아요</a> ┃ 
						<a href="#">싫어요</a> ┃
						<a href="#">신고하기</a> ┃
						<a href="#" id="reCoWrite" class="toggle2">댓글쓰기</a>
					</td>
				</tr>
	
				<form action="/textant/" method="post">
				<tr id="reCoWriteForm" class="toggleChild2">
					<td></td>
					<!--c:if test="${id != null}"-->
						<td class="reCoWriteBtn_widthL font7 gray" align="right" class="font7 gray">
							<textarea rows="5" id="coPlace"></textarea>
							${현재입력byte} / 1000 byte
						</td>
						<td class="reCoWriteBtn_widthR">
							<input type="submit" value="입력" id="reCoWriteBtn" class="reCoWriteBtn">
						</td>
						<!--
					</c:if>
					<c:if test="${id == null}">
						<td>
							<textarea rows="5" cols="70" id="" placeholder="로그인 후 덧글을 입력해주세요"></textarea>
						</td>
						<td class="reCoWriteBtn_width">
							<input type="submit" value="입력" disabled="disabled" class="reCoWriteBtn">
						</td>
					</c:if-->
				</tr>
				</form>
			</c:forEach>
				
			</table>
			<table>
				<tr>
					<td colspan="3" align="center">${pageCode}</td>
				</tr>
			</table>

			
			</div> <!--#coShow  -->
		</div> <!--//#comment -->
	</div> <!--//.RightWrap -->



	<div class="LeftWrap comment">

		<div>답글보기 영역</div>
		<a href="#" class="coClose close2">X</a>

		<div >
			<p>이쪽은 왼쪽 영역의 댓글창입니다 </p>
		
		</div> <!--//#comment -->
	</div> <!--//.LeftWrap -->



	<div id="modalBg"></div>
	<div class="totalCom">
		<div>
		<h3>${현재 책 이름 }</h3><span>덧글 ${totalCom} 개</span>
		<a href="#" class="coClose close3">X</a>


			sldj;afspiej;flskdjf;lajsd;fla fa;sldjf;asldj;afspiej;flskdjf;lajsd;fla fa;sldjf;as
			ldj;afspiej;flskdjf;lajsd;fla fa;sldjf;as
		</div>
	</div> <!--totalCom-->

	<div class="Bookmark">
		<div>
		<h3>${id}님의 북마크</h3>
		<a href="#" class="coClose close4">X</a>

		
		<ul>
			<c:forEach val="" items="">
				<li>북마크1 </li>
			</c:forEach>
		</ul>
		<div>
	</div> <!--Bookmark-->
			








<script type="text/javascript">

function loadApp() {

	var flipbook = $('.sample-docs');

	// Check if the CSS was already loaded
	
	if (flipbook.width()==0 || flipbook.height()==0) {
		setTimeout(loadApp, 10);
		return;
	}

	// Mousewheel

	$('#book-zoom').mousewheel(function(event, delta, deltaX, deltaY) {

		var data = $(this).data(),
			step = 30,
			flipbook = $('.sample-docs'),
			actualPos = $('#slider').slider('value')*step;

		if (typeof(data.scrollX)==='undefined') {
			data.scrollX = actualPos;
			data.scrollPage = flipbook.turn('page');
		}

		data.scrollX = Math.min($( "#slider" ).slider('option', 'max')*step,
			Math.max(0, data.scrollX + deltaX));

		var actualView = Math.round(data.scrollX/step),
			page = Math.min(flipbook.turn('pages'), Math.max(1, actualView*2 - 2));

		if ($.inArray(data.scrollPage, flipbook.turn('view', page))==-1) {
			data.scrollPage = page;
			flipbook.turn('page', page);
		}

		if (data.scrollTimer)
			clearInterval(data.scrollTimer);
		
		data.scrollTimer = setTimeout(function(){
			data.scrollX = undefined;
			data.scrollPage = undefined;
			data.scrollTimer = undefined;
		}, 1000);

	});

	// Slider

	$( "#slider" ).slider({
		min: 1,
		max: 100,

		start: function(event, ui) {
			if (!window._thumbPreview) {
				_thumbPreview = $('<div />');//현재페이지 프리뷰 제거 , {'class': 'thumbnail'}).html('<div></div>');
				setPreview(ui.value);
				_thumbPreview.appendTo($(ui.handle));
			} else
				setPreview(ui.value);

			moveBar(false);
		},

		slide: function(event, ui) {
			setPreview(ui.value);
		},

		stop: function() {
			if (window._thumbPreview)
				_thumbPreview.removeClass('show');
			
			$('.sample-docs').turn('page', Math.max(1, $(this).slider('value')*2 - 2));
		}
	});


	// URIs
	
	Hash.on('^page\/([0-9]*)$', {
		yep: function(path, parts) {
			var page = parts[1];

			if (page!==undefined) {
				if ($('.sample-docs').turn('is'))
					$('.sample-docs').turn('page', page);
			}

		},
		nop: function(path) {

			if ($('.sample-docs').turn('is'))
				$('.sample-docs').turn('page', 1);
		}
	});

	// Arrows

	$(document).keydown(function(e){

		var previous = 37, next = 39;

		switch (e.keyCode) {
			case previous:

				$('.sample-docs').turn('previous');

			break;
			case next:
				
				$('.sample-docs').turn('next');

			break;
		}

	});

	// Create the flipbook

	flipbook.turn({
		elevation: 50,
		acceleration: false,
		gradients: true,
		autoCenter: true,
		duration: 1000,
		pages: 30,
		when: {

		turning: function(e, page, view) {
			
			var book = $(this),
			currentPage = book.turn('page'),
			pages = book.turn('pages');
				
			if (currentPage>3 && currentPage<pages-3) {
				if (page==1) {
					book.turn('page', 2).turn('stop').turn('page', page);
					e.preventDefault();
					return;
				} else if (page==pages) {
					book.turn('page', pages-1).turn('stop').turn('page', page);
					e.preventDefault();
					return;
				}
			} else if (page>3 && page<pages-3) {
				if (currentPage==1) {
					book.turn('page', 2).turn('stop').turn('page', page);
					e.preventDefault();
					return;
				} else if (currentPage==pages) {
					book.turn('page', pages-1).turn('stop').turn('page', page);
					e.preventDefault();
					return;
				}
			}

			Hash.go('page/'+page).update();

			if (page==1 || page==pages)
				$('.sample-docs .tabs').hide();

				event.stopImmediatePropagation();
			

		},

		turned: function(e, page, view) {

			var book = $(this);

			$('#slider').slider('value', getViewNumber(book, page));

			if (page!=1 && page!=book.turn('pages'))
				$('.sample-docs .tabs').fadeIn(500);
			else
				$('.sample-docs .tabs').hide();

			book.turn('center');
			updateTabs();

		},

		start: function(e, pageObj) {
	
			moveBar(true);

		},

		end: function(e, pageObj) {
		
			var book = $(this);

			setTimeout(function() {
				$('#slider').slider('value', getViewNumber(book));
			}, 1);

			moveBar(false);

		},

		missing: function (e, pages) {

			for (var i = 0; i < pages.length; i++)
				addPage(pages[i], $(this));

		}
	}
	}). turn('page', 2);


	$('#slider').slider('option', 'max', numberOfViews(flipbook));

	flipbook.addClass('animated');


	// Show canvas

	$('#canvas').css({visibility: 'visible'});

	

	
}

$(".pageGoEnter").on("click",function(){
	let pageNum = $('#pageGo').val();
	
	$('.sample-docs').turn('page',pageNum);
});
$(".previousPage").on("click",function(){
	$('.sample-docs').turn('previous');
});
$(".nextPage").on("click",function(){
	$('.sample-docs').turn('next');
});
/*
$(".currPage").on("click",function(){
	let currPage = $(".sample-docs").turn("page");
	alert(currPage);
	alert("The current page is: "+(Math.floor(currPage/2))*2);
});
*/


// Hide canvas

$('#canvas').css({visibility: 'hidden'});

yepnope({
	test: Modernizr.csstransforms,
	yep: ['js/turn.min.js', 'css/jquery.ui.css'],
	nope: ['js/turn.html4.min.js', 'css/jquery.ui.html4.css'],
	both: ['css/docs.css', 'js/docs.js'],
	complete: loadApp
});
//*******************







//*******************오른쪽 슬라이드 
$(function(){

	$(".open1").click(function(){

		$(".RightWrap").animate({right:170},500,"swing") 
		event.stopImmediatePropagation();
	});

	$(".close1").click(function(){
		$(".RightWrap").animate({right:-500},500,"swing")
		event.stopImmediatePropagation();
	});

	event.stopImmediatePropagation();

}); 

//*******************왼쪽 슬라이드 
$(function() {
	$(".open2").click(function(){
		$(".LeftWrap").animate({width:'toggle'},500,"swing")
	});
	event.stopImmediatePropagation();
});
//////// 토글, 스윙 부딛힘
//$(function(){
//	$(".close2").click(function(){
//		$(".LeftWrap").animate({left:-500},500,"swing")
		//event.stopImmediatePropagation();
//	});
	//event.stopImmediatePropagation();
//}); 


//**********************전체 댓글
	function wrapWindowByMask(){
		//화면의 높이와 너비를 구한다.
		var bgHeight = $(document).height();  
		var bgWidth = $(window).width();  

		//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
		$('#modalBg').css({'width':bgWidth,'height':bgHeight});  

		//애니메이션 효과 - 일단 1초동안 까맣게 됐다가 80% 불투명도로 간다.
		$('#modalBg').fadeIn(1000);      
		$('#modalBg').fadeTo("slow",0.5);    

		//윈도우 같은 거 띄운다.
		$('.totalCom').show();
	}

	$(document).ready(function(){
		//검은 막 띄우기
		$('.open3').click(function(e){
			e.preventDefault();
			wrapWindowByMask();
		});

		//닫기 버튼을 눌렀을 때
		$('.totalCom .close3').click(function (e) {  
		    //링크 기본동작은 작동하지 않도록 한다.
		    e.preventDefault();  
		    $('#modalBg, .totalCom').hide();  
		});       

		//검은 막을 눌렀을 때
		$('#modalBg').click(function () {  
		    $(this).hide();  
		    $('.totalCom').hide();  
		});      
	});



//******************* 댓글쓰기 폼 보이기
$(function() {
	$(".toggle").click(function(){
		$(".toggleChild").toggle();
	});
	//event.preventDefault();
	event.stopImmediatePropagation();
});
$(function() {
	$(".toggle2").click(function(){
		$(".toggleChild2").toggle();
	});
	//event.preventDefault();
	event.stopImmediatePropagation();
});



//******************* nav pop-up toggle
$(function() {
	$(".navPopBtn").click(function(){
		$("#nav-pop").toggle();
	});
	event.stopImmediatePropagation();
});


//******************* 책 내용 이미지로 보기- 텍스트로 보기 전환
let bookType = "txt";
bookType = '${bookType}';
 
let pageNum =3;
let maxPage = 9999;
maxPage = '${totalPageNum}';

$(document).ready(function(){
			if(bookType=="txt"){
				for(let i = 1; i <= maxPage; i++){
					$(".flipbook").append('<div style="width:100%;height:100%;text-align: center;"><embed width="95%" height="100%" type="text/html" src="displayFile.text?fileName=${fileName}&pageNum='+i+'&fileType='+bookType+'"></embed></div>');
				}
			}else if(bookType=="jpg"){
				for(let i = 1; i <= maxPage; i++){
			        
				$(".flipbook").append('<img class="leftPage" alt="" src="displayFile.text?fileName=${fileName}&pageNum='+ i +'&fileType='+bookType+'"/>');
				}		
			}		
		});

$('#goText').click(function(){
	location.href="test.text?fileName=${fileName}&bookType=jpg";
});

$('#goJpg').click(function(){
	location.href="test.text?fileName=${fileName}&bookType=txt";
});

//**********************북마크 내용 보기
	function wrapWindowByMask1(){
		var bgHeight = $(document).height();  
		var bgWidth = $(window).width();  

		$('#modalBg').css({'width':bgWidth,'height':bgHeight});  
		$('#modalBg').fadeIn(1000);      
		$('#modalBg').fadeTo("slow",0.5);    

		$('.Bookmark').show();
	}

	$(document).ready(function(){
		$('.openBookmark').click(function(e){
			e.preventDefault();
			wrapWindowByMask1();
		});
		$('.Bookmark .close4').click(function (e) {  
		    e.preventDefault();  
		    $('#modalBg, .Bookmark').hide();  
		});       

		$('#modalBg').click(function () {  
		    $(this).hide();  
		    $('.Bookmark').hide();  
		});      
	});



</script>



</body>
</html>