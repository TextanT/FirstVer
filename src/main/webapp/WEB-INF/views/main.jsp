<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="/textant/resources/Swiper-master/dist/css/swiper.min.css">
<link href="/textant/resources/css/header.css" rel="stylesheet"
	type="text/css">
<link href="/textant/resources/css/footer.css" rel="stylesheet"
	type="text/css">
<link href="/textant/resources/css/main_slider.css" rel="stylesheet"
	type="text/css">
<link href="/textant/resources/css/main_slider2.css" rel="stylesheet"
	type="text/css">
<link href="/textant/resources/css/book_list.css" rel="stylesheet"
	type="text/css">
<link href="/textant/resources/css/notice.css" rel="stylesheet"
	type="text/css">
<link href="/textant/resources/css/sign_modal.css" type="text/css"
	rel="stylesheet">
<link href="/textant/resources/css/log.css" type="text/css"
	rel="stylesheet">
<link href="/textant/resources/css/modal2.css" type="text/css"
	rel="stylesheet">
<link href="/textant/resources/css/bookover.css" type="text/css"
	rel="stylesheet">
<script src="/textant/resources/Swiper-master/dist/js/swiper.min.js"></script>
<title>Document</title>
<style>

</style>
</head>

<body>

	<div class="header">
		<div class="header_logo" style="padding-top: 20px;">
			<a href="/textant/main.text" class="logo_a"> <img
				src="/textant/resources/icon_img/logo_mini.png" class="logo">
			</a>
		</div>
		<div class="menu_box">
			<c:if test="${id!=null}">
				<c:out
					value="
			<a href='#' class='menu_title'><span class='menu1' >${nickname}</span></a>
			
			<a href='mypage.text' class='menu_title'><span class='menu2'>내정보</span></a> 

			<a href='logout.text' class='menu_title'><span class='menu3'id='menu3'>로그아웃</span></a> 
			
			<a href='first.text' class='menu_title'><span class='menu4'id='menu4'>처음으로</span></a>
			 "
					escapeXml="false" />
			</c:if>

			<c:if test="${id==null}">
				<c:out
					value="
			<a href='#' class='menu_title'><span class='menu1' id='menu1'>로그인</span></a>
			
			<a href='#' class='menu_title'><span class='menu2'id='menu2'>회원가입</span></a> 

			<a href='#' class='menu_title'><span class='menu3'id='menu3'>meme</span></a> 
			
			<a href='first.text' class='menu_title'><span class='menu4'id='menu4'>처음으로</span></a>
			 "
					escapeXml="false" />
			</c:if>



		</div>
	</div>
	<!-- 모달창 -->
	<div id="modal_log">
		<form action="login.text" method="post" id="loginForm">
			<button type="submit" class="aass" id="sasd"></button>

			<div id="idDiv" class="idDivc">
				<span class="id_sp int_id"> <input type="text" class="int"
					value maxlength="20" autocomplete="off" placeholder="아이디"
					name="userId">
				</span>
			</div>

			<div style="height: 15px;"></div>

			<div id="PassDiv" class="PassDivc">
				<span class="pass_sp int_pass"> <input type="password"
					id="pass" class="int" value maxlength="20" autocomplete="off"
					placeholder="비밀번호" name="pass">
				</span>
			</div>
			<div class="login_div">
				<a href="#" class="login_btn" id="login_mit">로그인</a>
			</div>
			<div class="exit_div">
				<a href="#" class="js_close" id="exit">돌아가기</a>
			</div>

		</form>
		<div class="exit2_div">
			<img src="/textant/resources/icon_img/exit3.jpg" class="js_close"
				style="cursor: pointer;">
		</div>

	</div>
	<!-- 모달창 -->
	<div id="modal">
		<form action="sign.text" method="post" id="signForm">
			<button type="submit" class="aass" id="sasd"></button>

			<div id="idDiv" class="idDivc">
				<span class="id_sp int_id"> <input type="text" id="signid"
					class="int" value maxlength="20" autocomplete="off"
					placeholder="아이디" name="userId">
				</span>
			</div>
			<div id="idCheckStatus"></div>

			<div style="height: 15px;"></div>

			<div id="PassDiv" class="PassDivc">
				<span class="pass_sp int_pass"> <input type="password"
					id="pass" class="int" value maxlength="20" autocomplete="off"
					placeholder="비밀번호" name="pass">
				</span>
			</div>
			<div id="PasscDiv" class="PasscDivc">
				<span class="passc_sp int_pass"> <input type="password"
					id="passcheck" class="int" value maxlength="20" autocomplete="off"
					placeholder="비밀번호확인" onblur="checkvalue()">
				</span>
			</div>

			<div id="status"></div>

			<div id="mailDiv" class="mailDivc">
				<span class="mail_sp int_pass"> <input type="email" id="mail"
					class="int" value maxlength="20" autocomplete="off"
					placeholder="E-mail" name="email">
				</span>
			</div>
			<div id="nicknameDiv" class="nicknameDivc">
				<span class="nickname_sp int_pass"> <input type="text"
					id="nickname" class="int" value maxlength="20" autocomplete="off"
					placeholder="별명" name="nickName">
				</span>
			</div>
			<div class="wrap">
				<input name="radio" type="radio" id="radio0" class="radio"
					onclick="gender1()"> <label for="radio0"
					class="radio-label"> <i class="fa fa-check"></i> <span>남자</span>
				</label> <input type="text" name="jender" id="jender" hidden="hidden">

				<input name="radio" type="radio" id="radio1" class="radio"
					onclick="gender2()"> <label for="radio1"
					class="radio-label"> <i class="fa fa-check"></i> <span>여자</span>
				</label>
			</div>

			<div class="signUp_div">
				<a href="#" class="signUp_btn" id="sign_mit">화원가입</a>
			</div>
			<div class="exit_div">
				<a href="#" class="js_close" id="exit">돌아가기</a>
			</div>

		</form>
		<div class="exit2_div">
			<img src="/textant/resources/icon_img/exit3.jpg" class="js_close"
				style="cursor: pointer;">
		</div>

	</div>
	<div class="sub_header">
		<div class="menu_dd">
			<div class="sub_sub1">
				<a href='' class='sub_header_menu1'>내서재</a>
			</div>
			<div class="sub_sub2">
				<a href='' class='sub_header_menu2' id="sub_menu2">창작카페</a>
			</div>
			<div class="sub_sub3">
				<a href='serchpage.genre' class='sub_header_menu3' id="sub_menu3">장르별검색</a>
			</div>
			<div class="sub_sub3">
				<a href='/textant/write.text' class='sub_header_menu3' id="sub_menu3">책쓰기</a>
			</div>
		</div>
	</div>
	<div class="menu_top">
		<div class="menu_box1">
			<div class="list_box1">
				<ul>
					<li><a href="#">카페</a></li>
					<li><a href="#">베스트</a></li>
					<li><a href="/textant/write.text">작품쓰기</a></li>

				</ul>
			</div>
			<div class="list_box2">
				<ul>
					<li><a href="#">창작도서</a></li>
					<li><a href="#">일반도서</a></li>
					<li style="cursor: default;">&nbsp</li>

				</ul>
			</div>

		</div>
	</div>


	<div class="swiper-container" onmouseover="slidestop()"
		onmouseout="slidestart()">
		<div class="swiper-wrapper">
			<c:forEach var="files" items="${fileList}">
				<div class="swiper-slide">
					<div class="img-wrapper">
						<div class="swiper-size"
							style="height: 320px; width: 220px; overflow: hidden;">
							<a href="/textant/read.text?fileName=${files.fileLocation}"><img
								src="displayFile.text?fileName=${files.fileLocation}/OriginImg&pageNum=1&fileType=jpg"
								style="display: block; height: 100%; width: auto; border: 1px solid #e8e8e8;"
								class="bookimg" /></a>
						</div>
						<a href="/textant/read.text?fileName=${files.fileLocation}"> <span
							class="bookname" style="text-align: center;">${files.bookName}</span><br />
							<span class="bookname">${files.userNum}</span>
						</a>

					</div>
				</div>
			</c:forEach>
		</div>
		<!-- Add Pagination -->
		<div class="swiper-pagination"></div>
		<!-- Add Arrows -->
		<div class="swiper-button-next"></div>
		<div class="swiper-button-prev"></div>

	</div>
	<div class="book_list_box">
		<div class="book_list1">
			<a href="#"><img src="/textant/resources/book_img/너의췌장을먹고싶어.jpg"
				style="border: 1px solid #D8D8D8; position: absolute; z-index: 2;"
				class="book_img_size" onmouseover="bookli1over()"
				onmouseout="bookli1out()">
				<div style="width: 176.66px; height: 259px; position: relative;"
					class="book_cap1" id="book_cap1">
					<h5>너의 췌장을 먹고싶어</h5>
					<p>기시미이치로</p>
					<br>
					<p>이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.
						이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.</p>
				</div> </a>
		</div>
		<div class="book_list2">
			<a href="#"><img src="/textant/resources/book_img/자존감수업.jpg"
				style="border: 1px solid #D8D8D8; position: absolute; z-index: 2;"
				class="book_img_size">
				<div style="width: 176.66px; height: 259px; position: relative;"
					class="book_cap2" id="book_cap2">
					<h5>자존감수업</h5>
					<p>윤홍균</p>
					<br>
					<p>이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.
						이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.</p>
				</div> </a>
		</div>

		<div class="book_list3">
			<a href="#"><img src="/textant/resources/book_img/신경끄기의 기술.jpg"
				style="border: 1px solid #D8D8D8; position: absolute; z-index: 2;"
				class="book_img_size">
				<div style="width: 176.66px; height: 259px; position: relative;"
					class="book_cap3" id="book_cap3">
					<h5>신경끄기의기술</h5>
					<p>마크맨슨</p>
					<br>
					<p>이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.
						이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.</p>
				</div> </a>
		</div>


		<div class="book_list4">
			<a href="#"><img src="/textant/resources/book_img/세도나메서드.jpg"
				style="border: 1px solid #D8D8D8; position: absolute; z-index: 2;"
				class="book_img_size">
				<div style="width: 176.66px; height: 259px; position: relative;"
					class="book_cap4" id="book_cap4">
					<h5>세도나메서드</h5>
					<p>헤일도스킨</p>
					<br>
					<p>이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.
						이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.</p>
				</div> </a>
		</div>
		<div class="book_list5">
			<a href="#"><img src="/textant/resources/book_img/언어의온도.jpg"
				style="border: 1px solid #D8D8D8; position: absolute; z-index: 2;"
				class="book_img_size">
				<div style="width: 176.66px; height: 259px; position: relative;"
					class="book_cap5" id="book_cap5">
					<h5>언어의온도</h5>
					<p>이기주</p>
					<br>
					<p>이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.
						이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.</p>
				</div> </a>
		</div>
		<div class="book_list6">
			<a href="#"><img src="/textant/resources/book_img/남아있는나날.jpg"
				style="border: 1px solid #D8D8D8; position: absolute; z-index: 2;"
				class="book_img_size">
				<div style="width: 176.66px; height: 259px; position: relative;"
					class="book_cap6" id="book_cap6">
					<h5>남아있는나날</h5>
					<p>이기주</p>
					<br>
					<p>이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.
						이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.</p>
				</div> </a>
		</div>
		<div class="book_list7">
			<a href="#"><img src="/textant/resources/book_img/남아있는나날.jpg"
				style="border: 1px solid #D8D8D8; position: absolute; z-index: 2;"
				class="book_img_size">
				<div style="width: 176.66px; height: 259px; position: relative;"
					class="book_cap7" id="book_cap7">
					<h5>남아있는나날</h5>
					<p>이기주</p>
					<br>
					<p>이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.
						이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.</p>
				</div> </a>
		</div>
		<div class="book_list8">
			<a href="#"><img src="/textant/resources/book_img/남아있는나날.jpg"
				style="border: 1px solid #D8D8D8; position: absolute; z-index: 2;"
				class="book_img_size">
				<div style="width: 176.66px; height: 259px; position: relative;"
					class="book_cap8" id="book_cap8">
					<h5>남아있는나날</h5>
					<p>이기주</p>
					<br>
					<p>이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.
						이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.</p>
				</div> </a>
		</div>
		<div class="book_list9">
			<a href="#"><img src="/textant/resources/book_img/남아있는나날.jpg"
				style="border: 1px solid #D8D8D8; position: absolute; z-index: 2;"
				class="book_img_size">
				<div style="width: 176.66px; height: 259px; position: relative;"
					class="book_cap9" id="book_cap9">
					<h5>남아있는나날</h5>
					<p>이기주</p>
					<br>
					<p>이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.
						이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.</p>
				</div> </a>
		</div>
		<div class="book_list10">
			<a href="#"><img src="/textant/resources/book_img/남아있는나날.jpg"
				style="border: 1px solid #D8D8D8; position: absolute; z-index: 2;"
				class="book_img_size">
				<div style="width: 176.66px; height: 259px; position: relative;"
					class="book_cap10" id="book_cap10">
					<h5>남아있는나날</h5>
					<p>이기주</p>
					<br>
					<p>이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.
						이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.</p>
				</div> </a>
		</div>
		<div class="book_list11">
			<a href="#"><img src="/textant/resources/book_img/남아있는나날.jpg"
				style="border: 1px solid #D8D8D8; position: absolute; z-index: 2;"
				class="book_img_size">
				<div style="width: 176.66px; height: 259px; position: relative;"
					class="book_cap11" id="book_cap11">
					<h5>남아있는나날</h5>
					<p>이기주</p>
					<br>
					<p>이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.
						이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.</p>
				</div> </a>
		</div>
		<div class="book_list12">
			<a href="#"><img src="/textant/resources/book_img/남아있는나날.jpg"
				style="border: 1px solid #D8D8D8; position: absolute; z-index: 2;"
				class="book_img_size">
				<div style="width: 176.66px; height: 259px; position: relative;"
					class="book_cap12" id="book_cap12">
					<h5>남아있는나날</h5>
					<p>이기주</p>
					<br>
					<p>이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.
						이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.</p>
				</div> </a>
		</div>
		<div class="book_list13">
			<a href="#"><img src="/textant/resources/book_img/남아있는나날.jpg"
				style="border: 1px solid #D8D8D8; position: absolute; z-index: 2;"
				class="book_img_size">
				<div style="width: 176.66px; height: 259px; position: relative;"
					class="book_cap13" id="book_cap13">
					<h5>남아있는나날</h5>
					<p>이기주</p>
					<br>
					<p>이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.
						이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.</p>
				</div> </a>
		</div>
		<div class="book_list14">
			<a href="#"><img src="/textant/resources/book_img/남아있는나날.jpg"
				style="border: 1px solid #D8D8D8; position: absolute; z-index: 2;"
				class="book_img_size">
				<div style="width: 176.66px; height: 259px; position: relative;"
					class="book_cap14" id="book_cap14">
					<h5>남아있는나날</h5>
					<p>이기주</p>
					<br>
					<p>이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.
						이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.</p>
				</div> </a>
		</div>
		<div class="book_list15">
			<a href="#"><img src="/textant/resources/book_img/남아있는나날.jpg"
				style="border: 1px solid #D8D8D8; position: absolute; z-index: 2;"
				class="book_img_size">
				<div style="width: 176.66px; height: 259px; position: relative;"
					class="book_cap15" id="book_cap15">
					<h5>남아있는나날</h5>
					<p>이기주</p>
					<br>
					<p>이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.
						이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.</p>
				</div> </a>
		</div>

		<!-- 		<div class="book_list4"></div> -->
		<!-- 		<div class="book_list5"></div> -->
	</div>


	<div class="data_box">
		<div class="tab_menu">
			<div class="tab_box">
				<ul class="tabs">
					<li class="active" rel="tab1">공지사항</li>
					<li rel="tab2">업데이트</li>
				</ul>
				<div class="tab_container">
					<div id="tab1" class="tab_content">
						<ul>
							<li><a href="#">17/11/24 공지사항 입니다.</a></li>
							<li><a href="#">17/11/25 공지사항 입니다.</a></li>
							<li><a href="#">17/11/26 공지사항 입니다.</a></li>
							<li><a href="#">17/11/27 공지사항 입니다.</a></li>
						</ul>
					</div>
					<div id="tab2" class="tab_content">
						<ul>
							<li><a href="#">17/11/24 업데이트 입니다.</a></li>
							<li><a href="#">17/11/24 업데이트 입니다.</a></li>
							<li><a href="#">17/11/24 업데이트 입니다.</a></li>
							<li><a href="#">17/11/24 업데이트 입니다.</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="visual">

			<div class="visual-controller">
				<a href="#visual-01">1번보기</a> <a href="#visual-01">2번보기</a> <a
					href="#visual-01">3번보기</a> <a href="#visual-01">4번보기</a>
				<div type="button" class="btn-stop">
					<img src="/textant/resources/slide_img/start.jpg">
				</div>
				<div type="button" class="btn-play">
					<img src="/textant/resources/slide_img/stop.jpg">
				</div>
			</div>


			<div class="visual-list">
				<ul>
					<li id="visual-01">
						<div class="img">
							<img src="/textant/resources/slide_img/event1.jpg" alt=""
								class="simg" />
						</div>
					</li>
					<li id="visual-02">
						<div class="img">
							<img src="/textant/resources/slide_img/event2.jpg" alt=""
								class="simg" />
						</div>
					</li>
					<li id="visual-03">
						<div class="img">
							<img src="/textant/resources/slide_img/event3.jpg" alt=""
								class="simg" />
						</div>
					</li>
					<li id="visual-04">
						<div class="img">
							<img src="/textant/resources/slide_img/event4.jpg" alt=""
								class="simg" />
						</div>
					</li>

				</ul>
			</div>
		</div>

	</div>




	<footer>
	<div>
		<img height="50px" src="/textant/resources/icon_img/footer_logo.png"
			class="footer_img">
	</div>
	<address>
		Tel. 010-1234-1234<br> Fax. 051)555-555<br> E-Mail.
		cwj1102@naver.com<br> 주소. 부산광역시 남구 신선로 365 부경대학교<br> <br>
		<br> <a href="#" class="foo_a">회사소개</a> <a href="#" class="foo_a">광고문의</a>
		<a href="#" class="foo_a">제휴문의</a> <a href="#" class="foo_a">인재채용</a>
		<a href="#" class="foo_a">서비스약관</a> <a href="#" class="foo_a">고객센터</a>
		<a href="#" class="foo_a">Q&A게시판</a>
	</address>
	</footer>

	<div style="position: fixed; bottom: 15px; right: 30px;">
		<a href="#" id="MOVE_TOP_BTN"><img
			src="/textant/resources/icon_img/top.jpg"></a>
	</div>



	<script src="https://code.jquery.com/jquery-2.2.0.min.js"
		type="text/javascript"></script>

	<!-- Initialize Swiper -->
	<script src="/textant/resources/js/main_slider.js"></script>

	<script src="/textant/resources/js/header_over.js"></script>

	<script src="/textant/resources/js/top_move.js"></script>

	<script src="/textant/resources/js/notice.js"></script>

	<script src="/textant/resources/js/main_slider2.js"></script>
	<script type="text/javascript"
		src="/textant/resources/js/Example.Modal.js"></script>
	<script type="text/javascript" src="/textant/resources/js/modal1.js"></script>
	<script>
		function gender1() {

			// 			alert("남자");
			document.getElementById("jender").value = "1";

		};
		function gender2() {

			// 			alert("여자");
			document.getElementById("jender").value = "0";

		};
	</script>
	<script language="javascript">
		$.ajaxSetup({
			type : "POST",
			async : true,
			dataType : "json",
			error : function(xhr) {
				alert("error html = " + xhr.statusText);
			}
		});

		$(function() {
			$("#signid").on(
					"blur",
					function() {
						$.ajax({
							url : "joinIdCheck.text",
							data : {
								inputId : $("#signid").val()
							},
							success : function(data) {
								let html;
								// 								alert(data);
								if ($("#signid").val() != "") {
									if (data == 1) {
										html = "<p>사용가능한 아이디입니다</p>";
										$("#idCheckStatus").html(html).css(
												"color", "highlight");
										$("#idCheckStatus").html(html).css(
												"font-size", "12px");
										$("#idCheckStatus").html(html).css(
												"height", "16.3px");
										$("#idCheckStatus").html(html).css(
												"left", "16%");

										;
									} else if (data == 0) {
										html = "<p>중복된 아이디입니다</p>";
										$("#idCheckStatus").html(html).css(
												"color", "red");
										$("#idCheckStatus").html(html).css(
												"font-size", "12px");
										$("#idCheckStatus").html(html).css(
												"height", "16.3px");
										$("#idCheckStatus").html(html).css(
												"left", "16%");
									}

								} else {
									html = "<p>아이디를 입력하세요</p>";
									$("#idCheckStatus").html(html).css("color",
											"red");
									$("#idCheckStatus").html(html).css(
											"font-size", "13px");
									$("#idCheckStatus").html(html).css(
											"height", "16.3px");
								}
							}
						});
					})
		});
	</script>
	<script>
		// checkvalue 기능
		function checkvalue() {
			let html;
			// a 텍스트 필드와 b 텍스트 필드 중 둘다 값이 있을 때
			if (signForm.pass.value && signForm.passcheck.value) {

				// 두 필드의 값이 서로 다를 때
				if (signForm.pass.value != signForm.passcheck.value) {

					html = "<p>일치하지않습니다.</p>";
					$("#status").html(html).css("color", "red");
					$("#status").html(html).css("font-size", "12px");
					$("#status").html(html).css("height", "16.3px");
					$("#status").html(html).css("left", "16%");

					// status 필드에 일치하지 않는다는 문장 출력
					// 					joinForm.status.value = "일치하지 않습니다";

					// 그에 맞게 길이 수정
					// 					joinForm.status.style.width = "120";
					// 					joinForm.status.style.color = "red";

					// 두 필드의 값이 동일 할 때
				} else {

					html = "<p>일치합니다.</p>";
					$("#status").html(html).css("color", "highlight");
					$("#status").html(html).css("font-size", "12px");
					$("#status").html(html).css("height", "16.3px");
					$("#status").html(html).css("left", "16%");

					// status 필드에 일치한다는 문장 출력
					// 					joinForm.status.value = "일치합니다";

					// 					joinForm.status.style.color = "highlight";

					// 역시 그에 맞게 길이 수정
					// 					joinForm.status.style.width = "83";

				}

				// a 텍스트 필드와 b 텍스트 필드 두중하나라도 값이 없을 때
			} else {

				// 아무것도 입력이 안 되어 있으므로 비밀번호를 입력해 달라는 메세지를 status 필드에 출력 함
				joinForm.status.value = "비밀번호를 입력해 주세요";

				// 그에 맞게 길이 수정
				joinForm.status.style.width = "160";

				joinForm.status.style.color = "red";
			}
			if (joinForm.passc.value == null) {

			}
			form.submit();

		}
	</script>
	<script type="text/javascript">
		window.onload = function() {
			document.getElementById('login_mit').onclick = function() {
				document.getElementById('loginForm').submit();
				return false;
			};
			document.getElementById('sign_mit').onclick = function() {
				document.getElementById('signForm').submit();
				return false;
			};
		};
	</script>
	<script type="text/javascript">
		var overindex = 2;
		var outindex = 1;
		//book1 over	
		$('.book_list1').mouseenter(function() {
			document.getElementById('book_cap1').style.zIndex = overindex;
		});
		$('.book_list1').mouseleave(function() {
			document.getElementById('book_cap1').style.zIndex = outindex;
		});
		//book2 over
		$('.book_list2').mouseenter(function() {
			document.getElementById('book_cap2').style.zIndex = overindex;
		});
		$('.book_list2').mouseleave(function() {
			document.getElementById('book_cap2').style.zIndex = outindex;
		});
		//book3 over
		$('.book_list3').mouseenter(function() {
			document.getElementById('book_cap3').style.zIndex = overindex;
		});
		$('.book_list3').mouseleave(function() {
			document.getElementById('book_cap3').style.zIndex = outindex;
		});
		//book4 over
		$('.book_list4').mouseenter(function() {
			document.getElementById('book_cap4').style.zIndex = overindex;
		});
		$('.book_list4').mouseleave(function() {
			document.getElementById('book_cap4').style.zIndex = outindex;
		});
		//book5 over
		$('.book_list5').mouseenter(function() {
			document.getElementById('book_cap5').style.zIndex = overindex;
		});
		$('.book_list5').mouseleave(function() {
			document.getElementById('book_cap5').style.zIndex = outindex;
		});
		//book6 over
		$('.book_list6').mouseenter(function() {
			document.getElementById('book_cap6').style.zIndex = overindex;
		});
		$('.book_list6').mouseleave(function() {
			document.getElementById('book_cap6').style.zIndex = outindex;
		});
		//book7 over
		$('.book_list7').mouseenter(function() {
			document.getElementById('book_cap7').style.zIndex = overindex;
		});
		$('.book_list7').mouseleave(function() {
			document.getElementById('book_cap7').style.zIndex = outindex;
		});
		//book8 over
		$('.book_list8').mouseenter(function() {
			document.getElementById('book_cap8').style.zIndex = overindex;
		});
		$('.book_list8').mouseleave(function() {
			document.getElementById('book_cap8').style.zIndex = outindex;
		});
		//book9 over
		$('.book_list9').mouseenter(function() {
			document.getElementById('book_cap9').style.zIndex = overindex;
		});
		$('.book_list9').mouseleave(function() {
			document.getElementById('book_cap9').style.zIndex = outindex;
		});
		//book10 over
		$('.book_list10').mouseenter(function() {
			document.getElementById('book_cap10').style.zIndex = overindex;
		});
		$('.book_list10').mouseleave(function() {
			document.getElementById('book_cap10').style.zIndex = outindex;
		});
		//book11 over
		$('.book_list11').mouseenter(function() {
			document.getElementById('book_cap11').style.zIndex = overindex;
		});
		$('.book_list11').mouseleave(function() {
			document.getElementById('book_cap11').style.zIndex = outindex;
		});
		//book12 over
		$('.book_list12').mouseenter(function() {
			document.getElementById('book_cap12').style.zIndex = overindex;
		});
		$('.book_list12').mouseleave(function() {
			document.getElementById('book_cap12').style.zIndex = outindex;
		});
		//book13 over
		$('.book_list13').mouseenter(function() {
			document.getElementById('book_cap13').style.zIndex = overindex;
		});
		$('.book_list13').mouseleave(function() {
			document.getElementById('book_cap13').style.zIndex = outindex;
		});
		//book14 over
		$('.book_list14').mouseenter(function() {
			document.getElementById('book_cap14').style.zIndex = overindex;
		});
		$('.book_list14').mouseleave(function() {
			document.getElementById('book_cap14').style.zIndex = outindex;
		});
		//book15 over
		$('.book_list15').mouseenter(function() {
			document.getElementById('book_cap15').style.zIndex = overindex;
		});
		$('.book_list15').mouseleave(function() {
			document.getElementById('book_cap15').style.zIndex = outindex;
		});
	</script>
</body>

</html>
