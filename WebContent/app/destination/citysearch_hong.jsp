<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML>
<!--
	Helios by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
<head>
<title>도시게시판페이지</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/app/destination/assetss/css/mainhelios.css" />
<noscript>
	<link rel="stylesheet" href="assetss/css/noscript.css" />
</noscript>
<style>
#footer {
	position: relative;
    overflow: hidden;
    padding: 4em 0 4em 0;
    background: black;
}

#footer .copyright {
	color: #808080;
	font-size: 1.2em;
	font-weight: bold;
}

#footer .copyright a {
	color: inherit;
}

.wrapper {
    background: #fff;
    margin: 0;
    padding: 6em 0 6em 0;
}
@media screen and (min-width: 1281px) and (max-width: 1680px) {
.wrapper {
    padding: 200px 20px;
    margin: 0px;
}

}

@media screen and (min-width: 841px) and (max-width: 1280px) {
.wrapper {
    padding: 200px 20px;
    margin: 0px;
}
}
@media screen and (min-width: 737px) and (max-width: 840px) {
.wrapper {
    padding: 200px 20px;
    margin: 0px;
}
}

/* Mobile */
@media screen and (max-width: 736px) {

.wrapper {
    padding: 200px 20px;
    margin: 0px;
}

}

 #header {
    position: relative;
    background-position: center center;
    background-attachment: inherit;
    background-image: url(../app/destination/images/schrecksee-2534484_1920.jpg);
    background-size: cover;
    color: #fff;
    text-align: center;
    padding: 7.5em 0 2em 0;
    cursor: default;
} 
a:hover {
	/* color: 	#07809F !important;	  */
	font-weight: bold;
	color: #698189 !important;	 
} 
 #page-wrapper{
font-family: Open Sans, sans-serif;} 
#logo{
font-weight:normal;
font-size: 48px;
}

</style>

</head>
<body class="no-sidebar is-preload">
	<c:set var="cityList" value="${requestScope.cityList}" />
	<c:set var="cityPhoto" value="${requestScope.cityPhoto}" />

	<div id="page-wrapper">

		<!-- Header -->
		<div id="header">

		<!-- Inner -->
			<div class="inner">
				<header>
					<h1>
						<a href="${pageContext.request.contextPath}/index.jsp" id="logo">OneTrip</a>
					</h1>
				</header>
			</div>

			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li><a href="#">일정만들기</a></li>
					<li><a href="#">여행지</a></li>
					<li><a href="#">여행기</a></li>
					<li>
					<a href="#">내 정보</a>
					<ul>
							<li><a href="${pageContext.request.contextPath}/app/mypage/Mypage.acom">마이페이지</a></li>
							<li><a href="#">여행기</a></li>
							<li><a href="${pageContext.request.contextPath}/app/plan/AcomList.acom">동행신청</a></li>
							<li><a href="${pageContext.request.contextPath}/user/UserLogOut.us">로그아웃</a></li>
					</ul>
				</ul>
			</nav>

		</div>


		<!-- Main -->
		<div class="wrapper style1">

			<div class="container">
				<article id="main" class="special">

					<!-- Search -->
					<section id="search" class="alt">
						<form name="cityquery" method="post"
							action="${pageContext.request.contextPath}/city/CityList.ci">
							<input onkeyup="enterkey();" type="text" name="query" id="query"
								placeholder="국가명 또는 도시명을 입력해주세요." />
						</form>
					</section>
					<br> <br>

					<!-- 해당 도시의 인기관광지 목록 -->
					<div class="row">
						<!-- Carousel -->
						<section class="carousel">
							<div class="reel">
								<c:forEach var="city_bean" items="${cityList}">
								
									<article>
										<a
											href="${pageContext.request.contextPath}/city/CityView.ci?seq=${city_bean.getCity_num()}"
											class="image featured"><img src="${pageContext.request.contextPath}/cphoto/${cityPhoto.get(city_bean.getCity_num()).get(0)}" alt="" /></a>
										<header>
											<h3>
												<a
													href="${pageContext.request.contextPath}/city/CityView.ci?seq=${city_bean.getCity_num()}">${city_bean.getCity_name()}</a>
											</h3>
										</header>

									</article>
								</c:forEach>
							</div>
						</section>
					</div>



				</article>
			</div>


		</div>




		<!-- Footer -->
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

	<script
		src="${pageContext.request.contextPath}/app/destination/assetss/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/app/destination/assetss/js/jquery.dropotron.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/app/destination/assetss/js/jquery.scrolly.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/app/destination/assetss/js/jquery.scrollex.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/app/destination/assetss/js/browser.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/app/destination/assetss/js/breakpoints.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/app/destination/assetss/js/util.js"></script>
	<script
		src="${pageContext.request.contextPath}/app/destination/assetss/js/main.js"></script>
	<script>
		function search() {
			var form = document.cityquery
			var id = $("input[name='query']").val();
			if (id == "") {
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
</body>
</html>