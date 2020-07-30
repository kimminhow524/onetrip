<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML>
<!--
	Editorial by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
<head>
<title>동행리스트 보기</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assetss/css/mainhelios.css" />
<noscript>
	<link rel="stylesheet" href="assetss/css/noscript.css" />
</noscript>
<link rel="stylesheet" href="assetss/css/companionListStyle.css" />
<style>
  .posts{
  	text-align:center;
  }

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

.pagination{
	text-align: center;
}
 #header {
    position: relative;
    background-position: center center;
    background-attachment: inherit;
    background-image: url(images/schrecksee-2534484_1920.jpg);
    background-size: cover;;
    color: #fff;
    text-align: center;
    padding: 7.5em 0 2em 0;
    cursor: default;
    padding: 150px 0px 40px;
    font-size: 20px;
} 
a {
	color: gray;
	text-decoration: none;
} 
a:hover {
	/* color: 	#07809F !important;	  */
	font-weight: bold;
	color: #698189 !important;	 
} 
#page-wrapper{
font-family: Open Sans, sans-serif;}
#logo{
font-family: Open Sans, sans-serif;
font-size: 48px;
font-weight:normal;
}
</style>

</head>

<body class="is-preload">
	<c:set var="list" value="${requestScope.boardList}" />
	<c:set var="nowPage" value="${requestScope.nowPage}" />
	<c:set var="startPage" value="${requestScope.startPage}" />
	<c:set var="endPage" value="${requestScope.endPage}" />
	<c:set var="totalCnt" value="${requestScope.totalCnt}" />
	<c:set var="totalPage" value="${requestScope.totalPage}" />
	
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


<!-- <body class="is-preload"> -->

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

 

				<!-- Section -->
				<section>
					<header class="major">
						<h2 >동행 리스트</h2>
					</header>
					<!-- Search -->
					<section id="search" class="alt">
						<form method="post" action="${pageContext.request.contextPath}/app/plan/AcomListByCity.acom">
							<input type="text" name="query" id="query" placeholder="여행하고자 하는  도시를 검색해 주세요" />
						</form>
					</section>
					<br>
					<div class="posts">
					<c:choose>
								<c:when test="${list != null and fn:length(list) > 0}">
									<c:forEach var="acom_dataMap" items="${list}">
										<article>
											<a
												href="${pageContext.request.contextPath}/app/plan/(action수정))seq=${acom_dataMap.get('SCHEDULE_NUM')}"
												class="image"> <img
												src="${pageContext.request.contextPath}/cphoto/${acom_dataMap.get('CITY_PHOTO_NAME')}"
												alt="이미지를 찾을 수 없습니다." /></a>
											<h3>${acom_dataMap.get('SCHEDULE_NAME')}</h3>
											<h5>HOST : ${acom_dataMap.get('SCHEDULE_USER_ID')}</h5>
											<ul class="actions">
												<li><a
													href="${pageContext.request.contextPath}/app/plan/(action수정))seq=${acom_dataMap.get('SCHEDULE_NUM')}"
													class="button">More</a></li>
											</ul>
										</article>
									</c:forEach>
								</c:when>
							<c:otherwise>
								<article>
									<a href="#" class="image"><img src="images/pic03.jpg"
										alt="이미지를 찾을 수 없습니다." /></a>
									<h3>등록된 동행 목록이 없습니다.</h3>
									<h5>일정만들고 동행 구하러 가기</h5>
									<ul class="actions">
										<li><a href="#" class="button">More</a></li>
									</ul>
								</article>
							</c:otherwise>
							</c:choose>
					</div>
				</section>
				
				<br><br>
				
						<ul class="pagination">
							<li><c:choose>
								<c:when test="${nowPage > 1}">
									<span
										onclick="location.href='${pageContext.request.contextPath}/app/plan/AcomList.acom?page=${nowPage-1}'"
										class="button">Prev</span>
								</c:when>
								<c:otherwise>
									<span class="button disabled">Prev</span>
								</c:otherwise>
							</c:choose></li>

						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:choose>
								<c:when test="${i eq 0}">
									<li><span>&hellip;</span></li>
								</c:when>
								<c:when test="${i eq nowPage}">
									<li><a class="page active">${i}</a></li>
								</c:when>
								<c:otherwise>
									<li><a
										href="${pageContext.request.contextPath}/app/plan/AcomList.acom?page=${i}"
										class="page">${i}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<li><c:choose>
								<c:when test="${nowPage < totalPage}">
									<span
										onclick="location.href='${pageContext.request.contextPath}/app/plan/AcomList.acom?page=${nowPage+1}'"
										class="button">Next</span>
								</c:when>
								<c:otherwise>
									<span class="button disabled">Next</span>
								</c:otherwise>
							</c:choose></li>
						</ul>
					</div>		
						
						
								<br/><br/>
						
				
					<!-- Footer -->
						<footer id="footer">
							<p class="copyright">&copy; OneTrip(주). All rights reserved.</p>
						</footer>
						
						

		
		</div>

	
</div>
</div>

	<!-- Scripts -->
	<script src="assetss/js/jquery.min.js"></script>
	<script src="assetss/js/browser.min.js"></script>
	<script src="assetss/js/breakpoints.min.js"></script>
	<script src="assetss/js/util.js"></script>
	<script src="assetss/js/normalpage.js"></script>

	<script src="assetss/js/jquery.dropotron.min.js"></script>
	<script src="assetss/js/jquery.scrolly.min.js"></script>
	<script src="assetss/js/jquery.scrollex.min.js"></script>
	<script src="assetss/js/main.js"></script>



</body>
</html>