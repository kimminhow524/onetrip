
<%@page import="java.util.HashMap"%>
<%@page import="com.onetrip.app.review_photo.dao.Review_Photo_Bean"%>
<%@page import="com.onetrip.app.city.dao.CityBean"%>
<%@page import="com.onetrip.app.city.dao.CityDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.onetrip.app.review_days.dao.Review_Days_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%-- <%
//리뷰 정보를 받아오는 스크립틀릿 
	Review_Days_DAO rd_dao = new Review_Days_DAO();
	 List<Integer> scheduleList= rd_dao.getScheduleList();
	 HashMap<Integer,String> reviewMap =new HashMap<>();
	 HashMap<Integer,String> reviewTitleMap =new HashMap<>();
		for (Integer scheduleNum : scheduleList) {
			List<Review_Photo_Bean> tn_srcList=rd_dao.getPhotoList(scheduleNum);
			String reviewTitle =rd_dao.getReviewTitle(scheduleNum);
			System.out.println(reviewTitle);
			if(tn_srcList.size()==0) {
				reviewMap.put(scheduleNum, "null");
				reviewTitleMap.put(scheduleNum,reviewTitle);
			}else {
				reviewMap.put(scheduleNum,tn_srcList.get(0).getReview_photo_name());
				reviewTitleMap.put(scheduleNum,reviewTitle);
			}
		}
	 	
		pageContext.setAttribute("scheduleList", scheduleList);
		pageContext.setAttribute("reviewMap",reviewMap);
		pageContext.setAttribute("reviewTitleMap",reviewTitleMap);
			
%> --%>
<!DOCTYPE HTML>
<!--
	Editorial by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
	<head>
		<title>OneTrip 여행의 시작!</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="app/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="app/assets/css/noscript.css" /></noscript>
		<script src="app/assets/js/jquery.min.js"></script>
	</head>
	
	<body class="homepage is-preload">
<%-- 	<c:set var="scheduleList" value="${pageScope.scheduleList}" />
	<c:set var="reviewMap" value="${pageScope.reviewMap}" />
	<c:set var="reviewTitleMap" value="${pageScope.reviewTitleMap}" /> --%>
	
		<c:if test="${session_id ne null}">
			<script>
				window.onload  = function() {
					successLogin();
				}
			</script>
		</c:if>
	<c:if test="${not empty param.login}">
			<c:if test="${not param.login}">
				<script>alert("입력하신 정보를 다시 확인해주세요.");</script>
			</c:if>
		</c:if>
		<c:if test="${not empty param.del}">
			<c:if test="${param.del}">
				<script>alert("지금까지 ONETRIP과 함께 해주셔서 감사합니다.");
				location.href="${pageContext.request.contextPath}/index.jsp";
				</script>
			</c:if>
		</c:if>
		<!-- Wrapper -->
			<div id="wrapper">
				<!-- Main -->
					<div id="main">					
						<div id="start">
							<div class="content">
								<header>
									<h1>OneTrip</h1>
									<p>당신의 여행을 시작하세요.</p>
									</header>
									<p>여행을 여행답게 즐거움을 위해 떠나는 여행. 하지만 여행 준비와 과정은 누구에게나 만만치 않은 일이죠.
						어려운. 복잡한. 귀찮은. 우리는 여행 앞에 이런 말을 지우고자 합니다. 누구에게나 손쉽고 즐거운 여행이 될 수
						있도록ㅡ</p>
									<br>
									<ul class="actions">
										<li><a href="#intro " class="button big scrolly">시작하기</a></li>
									</ul>
							</div>
							<section id="descript">
									<header class="major">
										<h2>Erat lacinia</h2>
									</header>
									<div class="features">
										<article>
											<span class="icon fa-gem"></span>
											<div class="content">
												<h3>일정 만들기</h3>
												<p>일정을 만들어요.</p>
											</div>
										</article>
										<article>
											<span class="icon solid fa-paper-plane"></span>
											<div class="content">
												<h3>일정 보기</h3>
												<p>남의 일정의 봐요.</p>
											</div>
										</article>
										<article>
											<span class="icon solid fa-rocket"></span>
											<div class="content">
												<h3>여행기</h3>
												<p>여행후기를 볼 수 있어요.</p>
											</div>
										</article>
									</div>
								</section>
						</div>
					
						<div id="intro">
							
							<div class="intro_detail">
								<header>
									<h1><a href="#" id="logo">OneTrip</a></h1>
									<hr />
									<p>당신의 여행 플래너</p>
								<section id="search" class="alt">
							<form name ="cityquery" method="post" action="${pageContext.request.contextPath}/city/CityList.ci">
								<input onkeyup="enterkey();" type="text" name="query" id="query" placeholder="Search" />
							</form>
						</section>
								<div class="select_Modal">
								<div id="select_login" class="log_sel_modal">
									<div  class="col-12 col-12-xsmall" style="margin: 0 auto;">
										<a><img style="width: 60%; height:30%;" onclick="kakaoLogin()" src="app/kakao/kakao_login_medium_wide.png"></a>
										<form id="kakaoLoginForm"
  										action="${pageContext.request.contextPath}/User/KakaoLogin.us" method="post">		
										<input type="hidden" name="kakao_Login_id" id="kakao_Login_id">
										</form>
									</div>
									<div class="col-12 col-12-xsmall" style=" height: 50%; margin: 0 auto;">
										<div id="onetrip_login_bt"><a onclick="loginOpen()">OneTrip 로그인</a></div>
									</div>
									<br>
									<div>
										<a class="close" style="color: black;" onclick="closeSelect()">닫기</a>
									</div>	
								</div>
								</div>
								
								<div class="select_sign_modal">
								<div id="select_sign" class="sign_sel_modal">
									<div class="col-12 col-12-xsmall" style="margin: 0 auto;">
										<div id="kakao_sign_bt"><a onclick="kakaoJoin()">카카오로 회원가입</a></div>
									</div>
									<br>
									<div class="col-12 col-12-xsmall" style="margin: 0 auto;">
										<div id="onetrip_sign_bt"><a onclick="modalopen()">OneTrip 회원가입</a></div>
									</div>
									<br>
									<div>
										<a style="color: black;" class="close" onclick="closeSign()">닫기</a>
									</div>	
								</div>
								</div>
								
								
								<div class="login_Modal">
				 				<div id="login_wrap" class="log_modal">
				 					<form id="loginForm" method="post" action="${pageContext.request.contextPath}/user/UserLoginOkAction.us" method="post">
										<div class="fields">
											<div class="col-6 col-12-xsmall" style="margin: 0 auto;">
												<label for="id">ID</label>
												<input type="text" name="user_id" id="id" style="color: black;"/>
											</div>
											<br>
										</div>
										<div class ="fields">
											<div class="col-6 col-12-xsmall" style="margin-left: auto; margin-right: auto; line-height:250%">
												<label for="pw">PASSWORD</label>
												<input type="password" name="user_pw" id="pw" style="color: black;"/>
												<sup style= "font-size: 0.6em;">아이디 또는 비밀번호 찾기</sup>
											</div>
										</div>
										<div>
											<a href="javascript:loginForm.submit()">로그인</a>&nbsp;&nbsp;
										</div>
									</form>
									<div>
										<a class="close" onclick="closeLogin()">닫기</a>
									</div>					
				 				</div>
				 				</div>
				 				
				 				<div id="modal" class="searchModal">
									<div class="search-modal-content">
										<form name="joinForm" method="post" action="${pageContext.request.contextPath}/user/UserJoinOk.us">
  										<div class="row gtr-uniform" id="sign_form">								
											<div class="col-6 col-12-xsmall"  style="margin: 0 auto;">
												<div id="name_text">
												<label for="name">이름</label>
												<input type="text" name="user_name" id="name" value="" />
												</div>
											</div>
											<div class="col-6 col-12-small">
												<input type="radio" id="man" name="user_gender" value="man" checked>
												<label for="man">남</label>
												<input type="radio" id="woman" name="user_gender" value="woman">
												<label for="woman">여</label>
											</div>
											<div class="col-12 col-12-xsmall">
												<div id="id_area">
													<label for="id">id</label>
													<input type="text" name="user_id" id="id" value="" />
												</div>
												<a class = "button small " onclick="checkid()" >중복확인</a>
											</div>
											<div class="col-12 col-12-xsmall">
												<label for="name">password</label>
												<input type="password" name="user_pw" id="password" value="" placeholder="Password" />
											</div>
											<div class="col-12 col-12-xsmall">
											<label for="name">password 확인</label>
												<input type="password" name="user_pw_re" id="password_re" value="" placeholder="Password" />
											</div>
											<div class="col-12 col-12-xsmall">
											<label for="name">나이</label>
												<input type="text" name="user_age" id="age" value="" />
											</div>
											<div class="col-12 col-12-xsmall" >
												<label for="email">email</label>
												<input type="email" name="user_email" id="email" value="" placeholder="abc@xxx.xxx" />
											</div>
											<div class="col-12 col-12-xsmall" >
												<label for="name">전화번호</label>
												<input type="text" name="user_hp" id="hp" value="" placeholder="-를 제외하고 입력해주세요." />
											</div>
											<div class="col-12 col-12-xsmall">
											<label for="name">주소</label>
												<input type="text" name="user_address" id="address" value=""/>
											</div>
											<div class="col-12 col-12-xsmall" id="confirm_wrap">
												<div>
												<a id = "term" onclick="openTerm()">이용약관</a>
												</div>
												<div>
													<input type="checkbox" id="comfirm" name="confirm">
													<label for="comfirm">동의 합니다.</label>
												</div>
											</div>
											<div class="col-12 col-12-xsmall" id="submit">
												<div><a href="javascript:formSubmit()">회원가입</a>&nbsp;&nbsp;</div>
												<div><a href="javascript:joinForm.reset()">다시작성</a>&nbsp;&nbsp;</div>
											</div>
										</div>
  									</form>
									<div>
										<a class="close" onclick="closeModal()">닫기</a>
									</div>
									</div>
								</div>
								</header>
								<br>
								<br>
								<footer id="link_con">
									<a  id = "recom_sc" href="#banner" class="start scrolly">
									<div style="display: inline-block;"><img id="recom_icon" src="${pageContext.request.contextPath}/app/assets/css/images/plan_icon3.png"/>
									<div style="text-decoration: none;">인기일정</div>
									</div>
									</a>
									<a  id = "recom_sc" href="#recom_city" class="start scrolly">
									<div style="display: inline-block;"><img id="recom_icon" src="${pageContext.request.contextPath}/app/assets/css/images/city_icon2.png"/>
									<div style="text-decoration: none;">추천도시</div>
									</div>
									</a>
								</footer>
							</div>
							<!-- Nav -->
							<form id="kakaoJoinForm" action="${pageContext.request.contextPath}/User/KakaojoinOk.us" method="post">
												
												<input type="hidden" name="age_range" id="age_range">
												<input type="hidden" name="email" id="email">
												<input type="hidden" name="gender" id="gender">
												<input type="hidden" name="nickname" id="nickname">
												<input type="hidden" name="profile_image_url" id="profile_image_url">
												<input type="hidden" name="kakao_id" id="kakao_id">
							</form>
							<nav id="nav">
									<ul>
										<li><a href="${pageContext.request.contextPath}/plan/PlanView.pl">일정만들기</a></li>
										<li><a href="#">여행지</a></li>
										<li><a href="#">여행기</a></li>
										<li id = "signup_bt"><a  onclick="openSign()">회원가입</a></li>
										<li id ="login_bt"><a  onclick="selectOpen()">로그인</a></li>
										<li style="display: none; right: 0;" id = "mypage_bt"><a href="#">
										<div>
										<img class="log_img" src="${pageContext.request.contextPath}/app/assets/css/images/img_profile.png"/>
										</div></a>
											<ul>
												<li><a href="${pageContext.request.contextPath}/app/mypage/Mypage.acom">마이페이지</a></li>
												<li><a href="#">여행기</a></li>
												<li><a href="${pageContext.request.contextPath}/app/plan/AcomList.acom">동행신청</a></li>
												<li><a href="${pageContext.request.contextPath}/user/UserLogOut.us">로그아웃</a></li>
											</ul>
										</li>	
									</ul>
								</nav>
									<%-- <nav id="nav">
										<ul>
											<li><a href="${pageContext.request.contextPath}/plan/PlanView.pl">일정 만들기</a></li>
											<li><a href="right-sidebar.html">일정 보기</a></li>
											<li><a href="no-sidebar.html">여행기</a></li>																				
										</ul>	
										<div id="nav2">
											<ul id = "sign">
												<li><a id = "signup_bt1"class = "button small " onclick="kakaoJoin()">카카오로 회원가입</a></li>
												<li><a id = "signup_bt"class = "button small " onclick="modalopen()">회원가입</a></li>
												<li><a id ="login_bt" class="button small" onclick="selectOpen()">로그인</a></li>
												<li><a id = "mypage_bt" href="javascript:goPage()" class="button primary small" style="display: none;">내정보</a>
														<ul>
															<li><a href="${pageContext.request.contextPath}/app/mypage/Mypage.acom">마이페이지</a></li>
															<li><a href="#">여행기</a></li>
															<li><a href="${pageContext.request.contextPath}/app/plan/AcomList.acom">동행신청</a></li>
															<li><a href="${pageContext.request.contextPath}/user/UserLogOut.us">로그아웃</a></li>
														</ul>
												</li>										
											</ul>									
										</div>
									</nav>	 --%>						
						</div>
						
			<div id="trip">	
				<!-- Banner -->
				<section id="banner">
					<header>
						<h2>인기 여행일정</h2>
						<p>
							다른 여행자들의 일정을 참고해 나만의 여행을 계획해보세요!
						</p>
					</header>
				</section>

			<!-- Carousel -->
			<!-- 여행 후기 목록 -->
				<section class="carousel" style="background-color: #D8D8D8;">
					<div class="reel">
				<%-- 	<c:forEach var="scheduleNum" items="${scheduleList}">
						<article>
							<a href="${pageContext.request.contextPath}/review/ReviewDetailView.re?seq=${scheduleNum}&day=1" class="image featured"><img src="${reviewMap.get(scheduleNum)}" /></a>
							<header>
								<h3><a href="#">${ reviewTitleMap.get(scheduleNum)}</a></h3>
							</header>
							<p>더 알아보기</p>
						</article>
					
					</c:forEach> --%>
						
						<article id="dummy" style="display: none;">
							<a href="#" class="image featured"><img src="images/contents1.jpg" alt="" /></a>
							<header>
								<h3><a id ="sch_title" href="#">정재영의 파리 여행</a></h3>
							</header>
						</article>
					</div>
				</section>
				</div>
				<!-- Features -->
				<div id = "recom_city"class="wrapper style1">

					<section id="features" class="container special">
						<header>
							<h2>추천 도시</h2>
							<p>원하는 도시를 찾아보세요.</p>
						</header>
						<div class="row" id ="recomcity">
							<article id = "city_dummy" class="col-4 col-12-mobile special" style="display: none;">
								<a href="#" class="image featured" id="recom_img"><img src="images/pic01.jpg" alt="" /></a>
								<p id ="recom_cityname">대전</p><br>
							</article>
						</div>
					</section>

				</div>
			
				<div id="footer">
					<div class="container">

								<!-- Copyright -->
									<div class="copyright">
										<ul class="menu">
											<li>&copy; OneTrip(주). All rights reserved.</li>
										</ul>
									</div>
					</div>
				</div>
			</div>

		<!-- Scripts -->
			
			<script src="app/assets/js/browser.min.js"></script>
			<script src="app/assets/js/breakpoints.min.js"></script>
			<script src="app/assets/js/util.js"></script>
			<script src="app/assets/js/jquery.scrolly.min.js"></script>
			<script src="app/assets/js/jquery.scrollex.min.js"></script>
			<script src="app/assets/js/jquery.dropotron.min.js"></script>
			<script src="app/assets/js/main.js"></script>			
			<script src="app/assets/js/join.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
			<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
			<script src="app/kakao/kakaoJoin.js"></script>
			<script src="app/assets/js/main_ajax.js"></script>
			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
		<script>var contextPath = "${pageContext.request.contextPath}";</script>
		<script>
			function search(){
				var form = document.cityquery
				var id = document.getElementByID("query");
				if(id==""){
					alert('검색어를 입력해주세요.');
					form.query.focus();
					return false;
				}
				form.submit();
			}
			
			function enterkey() {
				if (window.event.keyCode == 13) {
					search();
				}
			}
		</script>

		<!-- 로그인 성공시 페이지 이동(매인화면으로)-->
			<script>
				$(document).ready(function () {
					getReview();
			    });
			</script>
		<script>
	var contextPath = "${pageContext.request.contextPath}";
			function modalopen(){		
				$("#modal").show();
				$('html').css('overflow-y','hidden');
			}
			
			function loginOpen(){
				closeSelect();
				$(".login_Modal").show();
				$('html').css('overflow-y','hidden');
				
			}
			function closeModal(){
				closeSign();
				$('.searchModal').hide();
				$('html').css('overflow-y','auto');
			}
			function closeSelect(){
				
				$(".select_Modal").hide();
				$('html').css('overflow-y','auto');
			}
			function openSign(){		
				$(".select_sign_modal").show();
				$('html').css('overflow-y','hidden');
			}
			function closeSign(){
				
				$(".select_sign_modal").hide();
				$('html').css('overflow-y','auto');
			}
			
			function closeLogin(){
				$(".login_Modal").hide();
				$('html').css('overflow-y','auto');
			}
			function openTerm(){
				$("term_window").show();
			}		
			function selectOpen(){		
				$(".select_Modal").show();
				$('html').css('overflow-y','hidden');
			}
			
			function successLogin(){
				 $('html, body').animate({
			            scrollTop: $('#intro').offset().top
			        }, 'fast'); //slow
			     $('#signup_bt').css('display','none');
			     $('#signup_bt1').css('display','none');
			     $('#login_bt').css('display','none');
			     $('#mypage_bt').css('display','inline-block');
			}
			function goPage() { 
				var pw=prompt("비밀번호를 입력해주세요.");
				location.href="${pageContext.request.contextPath}/user/Useridentity.us?pw="+pw;
				}

		</script>	
	</body>
</html>