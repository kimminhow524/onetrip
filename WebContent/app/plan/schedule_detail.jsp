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
<title>일정상세페이지</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assetss/css/mainhelios.css" />
<noscript>
	<link rel="stylesheet" href="assetss/css/noscript.css" />
</noscript>
<!-- css추가 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<link rel="stylesheet" href="assetss/css/schedule_detail.css" />
<style>
.wrapper {
   margin: 0px;
}
	input[type="button"], input[type="submit"], input[type="reset"], button, .button {
    position: relative;
    display: inline-block;
    background: #70c98c;
    color: #fff;
    text-align: center;
    border-radius: 0.5em;
    padding: 15px;
    cursor: pointer;
    outline: 0;
    margin-bottom: 5px;
    }
@media screen and (max-width: 736px){
.row > .col-12-mobile {
    width: 100%;
}

 #floatMenu{
 	width: 300px; 
  	height: 300px;
	position:static;
	margin: 0 auto;
	}
input[type="button"], input[type="submit"], input[type="reset"], button, .button {
    position: relative;
    display: inline-block;
    background: #70c98c;
    color: #fff;
    text-align: center;
    border-radius: 0.5em;
    padding: 2px 2px;
    cursor: pointer;
    outline: 0;
    margin: 3px 2px;
    width: 70%;
	}
	
section, article {
    text-align: center;
}}

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
 #header {
    position: relative;
    background-position: center center;
    background-attachment: inherit;
    background-image: url(images/schrecksee-2534484_1920.jpg);
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

<body class="right-sidebar is-preload">
	<%--동행 신청 성공시 alert (마이페이지로 신청현황 확인하러 가기) --%>
	<c:set var="DestinationBean" value="${requestScope.DestinationBean}"/>
	<c:set var="applycheck" value="${requestScope.applycheck}" />
	<c:if test="${applycheck eq true }">
		<script>
			var con_test = confirm("동행 신청 완료 <br> 마이페이지로 확인 하러 가시겠습니까? ");
			if (con_test == true) {
				location.replace("${pageContext.request.contextPath}/mypage/(수정)");
			}
		</script>
	</c:if>
	
	<div id="page-wrapper">

		<!-- Header -->
		<div id="header">

			<!-- Inner -->
			<div class="inner">
				<header>
					<h1>
						<a href="index.html" id="logo">OneTrip</a>
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
				<div class="row gtr-200">
					<div class="col-8 col-12-mobile" id="content">
						<article id="main">
							<header>
								<h2>여행 제목</h2>
								<br>
								<h3>조회수:    </h3>
							</header>
							<a href="#" class="image featured"><img
								src="images/pic06.jpg" alt="" /></a>

							<section>
								<table border="1" cellpadding="0" cellspacing="0" width="900px">
									<c:choose>
										<c:when test="">
											<c:forEach var="" items="">
												<tr align="center" valign="middle">
													<td colspan="5" align="center">
													
														<div class ="days-num" align="center">Day <br>
														 동행인원수: ${totalCnt}  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<a href="#ex1" rel="modal:open"><b>동행확인</b> </a> 
															<div id="ex1" class="modal">
															<form>
															  <table width="900px" border="1" cellpadding="0" cellspacing="0">
																<tr align="center" valign="middle">
																	<td>아이디 </td>
																	<td>성별 </td>
																	<td>나이</td>
																	<td>이메일 </td>
																	<td>수락 </td>
																	<td>거절</td>
																</tr>
															<%-- <c:choose>
													 		<c:when>
															<c:forEach> --%> 
														<tr align="center" valign="middle">
														<td>
															user01
														</td>
														<td>
															여자
														</td>
														<td>
															20
														</td>
														<td>
															onetrip@gmail.com
														</td>	
														<td>
															<button type="submit">수락</button>
														</td>
														<td>
															<button type="submit">거절</button>
														</td>
														</tr>	
													<%-- </c:forEach>
													</c:when>
													<c:otherwise> --%>
													<tr height="50px">
														<td colspan="6" align="center">등록된 게시물이 없습니다.</td>
													</tr>
													<%-- </c:otherwise> 
												</c:choose>--%>
		
														</table>
													</form>		
																							  
											<a href="#" rel="modal:close">닫기</a>
										</div>
														<form action="${pageContext.request.contextPath}/plan/ApplyAcomOk.acom?schedule_num=${수정}&days_n=${수정}&host_id=${수정}">	 
															<input name="" type="button" value="동행신청" class="com-apply" />
														</form>
														</div>
													</td>
												</tr>

												<tr align="center" valign="middle">
													<td height="23"
														style="font-family: Tahoma; font-size: 10pt;">순서</td>
													<td colspan="2" style="font-family: Tahoma; font-size: 10pt;">
														<div class="location" align="center">장소명</div>
													</td>
													<td>
														<div align="center">
															<a href="${pageContext.request.contextPath}/app/destination/DestinationView.de?seq=${DestinationBean.getDestination_num()}"><img class="mapicon" src="images/infoicon.png" alt="" /></a>
														</div>
													</td>
													<td>
														<div align="center">
															<a href="#map"><img class="mapicon" src="images/mapicon.png" alt="" /></a>
														</div>
													</td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr height="50px">
												<td colspan="5" align="center">등록된 일정이 없습니다.</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</table>
						
							<c:if test="">
							<a href="#"><button>일정 수정</button></a>
							<button onclick="btn()">일정 삭제</button> <!-- 로그인후 , 작성자 아이디 확인 후에! -->

							</c:if>
							
				</section>
			</article>
</div>

					
					<div class="col-4 col-12-mobile" id="sidebar">
						 <div id="floatMenu">
						 <div id="map" style="width:100%;height:100%; margin: 0 auto;" ></div> 
						 </div> 
					
				</div>

			</div>
					
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
	
	
</body>
	<!-- Scripts -->
	<script src="assetss/js/jquery.min.js"></script>
	<script src="assetss/js/jquery.dropotron.min.js"></script>
	<script src="assetss/js/jquery.scrolly.min.js"></script>
	<script src="assetss/js/jquery.scrollex.min.js"></script>
	<script src="assetss/js/browser.min.js"></script>
	<script src="assetss/js/breakpoints.min.js"></script>
	<script src="assetss/js/util.js"></script>
	<script src="assetss/js/main.js"></script>
	
	<!-- Script 추가 -->
	<script src="assetss/js/schedule_detail.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>


<script>

var map;
function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: -34.397, lng: 150.644},
    zoom: 8
  });
}

function btn(){ alert('일정을 삭제합니다.'); }


</script>


	<!-- Scripts 추가3-->
   <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBEyfOniI-0AlYyNAKxrAMZonOQhOCGvsQ&callback=initMap"
   async defer></script>
	<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
</html>