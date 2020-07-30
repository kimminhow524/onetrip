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
		<title>후기상세페이지</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/app/review/assetss/css/mainhelios.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/app/review/assetss/css/reviewform-style2.css" />
<style>
.ms{
	margin:0 auto;
}
.row{
	margin: 0px auto;
}
#rbn{
	margin-left: 25px;
}

@media screen and (max-width: 736px){
.row.col-12-small {}
.row > .col-6 {
    width: 50%;
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
    background-size: cover;
    background-position: center center;
    background-attachment: inherit;
    background-image: url(images/schrecksee-2534484_1920.jpg);
    background-size: cover;
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
	
	 	<c:set var="seq" value ="${requestScope.seq}" />
		<c:set var="reviewDaysNum" value ="${requestScope.reviewDaysNum}" />
		<c:set var="reviewDaysBeanList" value="${requestScope.reviewDaysBeanList}" />
		<c:set var="reviewPhotoMap" value ="${requestScope.reviewPhotoMap}"/>
		<c:set var="scheduleName" value ="${requestScope.scheduleName}"/>
		<c:set var="day" value ="${requestScope.day}"/>
		<c:set var="destinationBeanList" value="${requestScope.destinationBeanList}"/>
		<c:set var="id" value="${requestScope.id}"/>
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
	

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">
							<!-- Content -->
								<section class ="ms">
									<header class="main">
										<h1> ${scheduleName} </h1>
									</header>
									<hr class="major" />
									
									<!-- <h2 id="content">${reviewDaysBean.getReview_days_user_id()}님의 ${scheduleName}여행기</h2> -->
									
									<header class="major">
										<h2>${day}일차</h2>
									</header>
									<div>
									<c:forEach var="i" begin="1" end="${reviewDaysNum}" step="1">
									<a href="${pageContext.request.contextPath}/review/ReviewDetailView.re?seq=${seq}&day=${i}" class="button primary">day ${i}</a>
									</c:forEach>
									</div>
									<br>
								
								
									<section>
									 <div class="row" >
									
											<div id="map" class="col-6 col-12-small">
											</div>
									
										
										<!-- Table -->
											<div class="table-wrapper">
												<table class="alt">
													<thead>
														<tr>
															<th>순서</th>
															<th>관광지명</th>
														</tr>
													</thead>
													<tbody>
													<c:forEach var="destination" items="${destinationBeanList}" varStatus="status">
														<tr>
															<td>${status.count}</td>
															<td>${destination.getDestination_name()}</td> 
															<td>
																<div class="col-4 col-12-small">
								               						<input type="button" id="placerecomm" value="장소 추천하기">
								             					</div>
															</td>
														</tr>
													</c:forEach>
													</tbody>
												</table>
											</div>
									</div>
							</section>

									<hr class="major" />

									<!-- Elements -->
										<h2 id="elements">Review</h2>
										
										<!--foreach문 사용  -->
										<div class="row gtr-200">
										<c:forEach var="reviewDaysBean" items="${reviewDaysBeanList}" >
										 <h4>${reviewDaysBean.getReview_days_title()}</h4>	
											<p> 
											<c:if test="${reviewPhotoMap.get(reviewDaysBean.getReview_days_num()) ne null}"><span class="image left"><img src="${reviewPhotoMap.get(reviewDaysBean.getReview_days_num())}" alt="" /></span></c:if>
											${reviewDaysBean.getReview_days_content()}</p>
										</c:forEach>	
										</div>
										
										
										<br>
									<!-- Buttons -->
										
											<!-- <a href="#" class="button primary">후기 목록</a> -->
											<!--후기목록을 보여주는 페이지가 없음-->
											<c:if test="${session_id eq id}">
											<button OnClick="delete_click();">후기 삭제</button>
											<a href ="${pageContext.request.contextPath}/review/ReviewWrite.re?seq=${seq}&day=${day}" class="button primary">후기 수정</a>
											<!-- c:if 문으로 로그인한 경우에만 보이게!! ++ 다른 사용자인경우에   -->
											
											</c:if>
											<br/>
									<input type="text" id = "ShareUrl"><span class="btn-type1"><button OnClick="javascript:CopyUrlToClipboard()">링크 공유</button></span>
								</section>
							</div>
			<form action="${pageContext.request.contextPath}/review/ReviewDeleteOk.re" method="post" name="reviewform">
				<input type="hidden" name="seq" value="${seq}" />
 			</form>


									<br/><br/>
								<!-- Footer -->
								<footer id="footer">
									<p class="copyright">&copy; OneTrip(주). All rights reserved.</p>
								</footer>





					
	</div>
	</div>
	</div>
	

 
 
</body>
		<!-- Scripts -->
<script src="${pageContext.request.contextPath}/app/review/assetss/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/app/review/assetss/js/browser.min.js"></script>
<script src="${pageContext.request.contextPath}/app/review/assetss/js/breakpoints.min.js"></script>
<script src="${pageContext.request.contextPath}/app/review/assetss/js/util.js"></script>
<script src="${pageContext.request.contextPath}/app/review/assetss/js/reviewpage2.js"></script>
<!-- Scripts 추가1 -->
<script src="${pageContext.request.contextPath}/app/review/assetss/js/jquery.dropotron.min.js"></script>
<script src="${pageContext.request.contextPath}/app/review/assetss/js/jquery.scrolly.min.js"></script>
<script src="${pageContext.request.contextPath}/app/review/assetss/js/jquery.scrollex.min.js"></script>
<script src="${pageContext.request.contextPath}/app/review/assetss/js/main.js"></script>

		<script>
	//지도
	var paths;
	var pointList =[];
	
	<c:forEach var="destinationBean" items="${destinationBeanList}" >
	
	pointList.push( { lat : ${destinationBean.getDestination_latitude()} , lng : ${destinationBean.getDestination_longitude()} })

	</c:forEach>
	
	
	
	var map;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: pointList[0],
          zoom: 13
        });
        paths = new google.maps.Polyline({ //경로 정보
            path: pointList,
            geodesic: true,
            strokeColor: 'red',
            strokeOpacity: 1.0,
            strokeWeight: 3.0,
            icons : [{ //방향을 알기 위한 화살표 표시
             icon : {path : google.maps.SymbolPath.BACKWARD_CLOSED_ARROW}
     , offset  : '100%'
     , repeat : '100px'
            }]
      });
        paths.setMap(map);
      }
	


  
 

	
	
	
	
     
      
      //링크 복사
			function CopyUrlToClipboard()
		{
			var obShareUrl = document.getElementById("ShareUrl");
			obShareUrl.value = window.document.location.href;  // 현재 URL 을 세팅.
			obShareUrl.select();  // 해당 값이 선택되도록 select() 합니다.
			document.execCommand("copy"); // 클립보드에 복사.
			obShareUrl.blur(); // 선택된 것을 다시 선택안된것으로 바꾼다.
			alert("URL이 클립보드에 복사되었습니다"); 
		}
 
      
      function delete_click(){
    	  var confirmflag = confirm("정말로 삭제하시겠습니까?");
    	  if(confirmflag){
				
    		  reviewform.submit();
           }else{

            return false;
           }
    	  
      }
	</script>
 
	  
<!-- Scripts 추가3 -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBEyfOniI-0AlYyNAKxrAMZonOQhOCGvsQ&callback=initMap"
async defer></script>
<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>

	
	
	
</html>