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
<title>관광지상세페이지</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/app/destination/assetss/css/mainhelios.css" />
<noscript>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/app/destination/assetss/css/noscript.css" />
</noscript>

<!-- css추가 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/app/destination/assetss/css/destination_detail.css" />

<style>
 .wrapper {
   margin: 0px;
}
     #star_grade a{
        text-decoration: none;
        color: gray;
    }
    #star_grade a.on{
        color: red;
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
@media screen and (min-width: 841px) and (max-width: 1280px) {

.wrapper {
    background: #fff;
    margin: 0px;
    padding: 150px 20px;
}
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
	<c:set var="destinationBean" value="${requestScope.destinationBean}" />


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
								<h2>
								${destinationBean.getDestination_name()}
								</h2><br>
								<h4>
								주소:${destinationBean.getDestination_address()}
								</h4>
							</header>
							<a href="#" class="image featured"><img
								src="${pageContext.request.contextPath}\dphoto\<c:out value="${destinationBean.getDestination_photo()}"/>" alt="" /></a>


							<section>
								<table border="1" cellpadding="0" cellspacing="0" width="900px">
									<tr align="center" valign="middle">
										<td >
											<div align="center">▶ 설명글 ◀</div>
											<div align ="left">${destinationBean.getDestination_description()}</div>
										</td>
										
									</tr>
								</table>
							</section>
						</article>
					</div>


					<div class="col-4 col-12-mobile" id="sidebar">
						<hr class="first" />
						<section>
						<div>
							<header>
									<div id = "map" style="width: 400px; height:400px;" class="col-6 col-12-small"></div>
							</header>
						</div>
						</section>
						<section>
						<div>
							<header>
								<h3>
									도시 추천수
								</h3>
							</header>
								<table border="1" cellpadding="0" cellspacing="0">
									<tr align="center" valign="middle">
										<td width="50px" height = "50px">
										<p style="text-align: center;">
										추천수 : ${DestinationBean.getDestination_recommend_cnt()}
										</p>
										</td>
									</tr>
								</table>
														
							</div>
						</section>
						
						
						
						<%-- <section>
						<div>
							<header>
								<h3>
									<a href="#">도시 별점</a>
								</h3>
							</header>
							<c:if test="${session_id} != null"> <!-- 로그인시에만 가능 -->
							<table border="1" cellpadding="0" cellspacing="0">
									<tr align="center" valign="middle">
										<td width="50px" height = "50px">
										<p id="star_grade" style="text-align: center;">
										        <a href="#">★</a>
										        <a href="#">★</a>
										        <a href="#">★</a>
										        <a href="#">★</a>
										        <a href="#">★</a>
										</p>
										</td>
									</tr>
								</table>
							</c:if>
							
							
								
						</div>
						</section> --%>
						
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

	<!-- Scripts -->
	<script src="${pageContext.request.contextPath}/app/destination/assetss/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/app/destination/assetss/js/jquery.dropotron.min.js"></script>
	<script src="${pageContext.request.contextPath}/app/destination/assetss/js/jquery.scrolly.min.js"></script>
	<script src="${pageContext.request.contextPath}/app/destination/assetss/js/jquery.scrollex.min.js"></script>
	<script src="${pageContext.request.contextPath}/app/destination/assetss/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/app/destination/assetss/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/app/destination/assetss/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/app/destination/assetss/js/main.js"></script>
	<script src="assetss/js/jquery.min.js"></script>
			
			
		
			<script src="assetss/js/reviewpage2.js"></script>

	</body>
		<script>
      var map;
      function initMap() {
    	  
    	  var pos = { lat: ${destinationBean.getDestination_latitude()}, lng :${destinationBean.getDestination_longitude()} };
        map = new google.maps.Map(document.getElementById('map'), {
          center: pos ,
          zoom: 18
        });
        
        var marker = new google.maps.Marker({position: pos, map: map});
      }

  
	</script>
  
	  
	<!-- Scripts -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBEyfOniI-0AlYyNAKxrAMZonOQhOCGvsQ&callback=initMap"
    async defer></script>
	<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>

	
	

</body>
<script>
        $('#star_grade a').click(function(){
            $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
            $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
            return false;
        });
</script>

</html>