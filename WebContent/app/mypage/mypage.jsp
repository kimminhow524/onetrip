<%@page import="com.onetrip.app.review_photo.dao.Review_Photo_Bean"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="com.onetrip.app.review_days.dao.Review_Days_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="id" value="${session_id}" ></c:set>
<%
//리뷰 정보를 받아오는 스크립틀릿
	String id = (String)pageContext.getAttribute("id");
	Review_Days_DAO rd_dao = new Review_Days_DAO();
	 List<Integer> scheduleList= rd_dao.getMyScheduleList(id);
	 HashMap<Integer,String> reviewMap =new HashMap<>();
	 HashMap<Integer,String> reviewTitleMap =new HashMap<>();
		for (Integer scheduleNum : scheduleList) {
			List<Review_Photo_Bean> tn_srcList=rd_dao.getPhotoList(scheduleNum);
			String reviewTitle =rd_dao.getReviewTitle(scheduleNum);
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
		
		
%>
<%
	List<Integer> scheduleWriteList =rd_dao.getMyscheduleWriteList(id);
	HashMap<Integer,String> scheduleTitleMap =new HashMap<>();
	for(Integer scheduleNum : scheduleWriteList){
		String scheduleTitle =rd_dao.getReviewTitle(scheduleNum);
		scheduleTitleMap.put(scheduleNum,scheduleTitle);
	}
	pageContext.setAttribute("scheduleWriteList",scheduleWriteList);
	pageContext.setAttribute("scheduleTitleMap",scheduleTitleMap);

%>
<!DOCTYPE HTML>
<!--
	Helios by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
<head>
<title>마이페이지</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assetss/css/mainhelios.css" />
<noscript>
	<link rel="stylesheet" href="assetss/css/noscript.css" />
</noscript>
<!-- css추가  -->
<link rel="stylesheet" href="assetss/css/mypage.css" />
<style>
.wrapper {
	margin: 0px;
	padding: 200px 20px;
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

@media screen and (min-width: 1281px) and (max-width: 1680px) {
	.wrapper {
		margin: 0px;
		padding: 200px 20px;
	}
}

@media screen and (min-width: 841px) and (max-width: 1280px) {
	.wrapper {
		margin: 0px;
		padding: 200px 30px;
	}
}

@media screen and (min-width: 737px) and (max-width: 840px) {
	.wrapper {
		margin: 0px;
		padding: 200px 20px;
	}
}

@media screen and (max-width: 736px) {
	.wrapper {
		margin: 0px;
		padding: 150px 20px;
	}
}

#header {
	position: relative;
	background-position: center center;
	background-attachment: inherit;
	background-image: url(userPhoto/images/schrecksee-2534484_1920.jpg);
	background-size: cover;
	color: #fff;
	text-align: center;
	padding: 7.5em 0 2em 0;
	cursor: default;
	font-weight: bold;
}

a:hover {
	/* color: 	#07809F !important;	  */
	font-weight: bold;
	color: #698189 !important;
}

#page-wrapper {
	font-family: Open Sans, sans-serif;
}

#logo {
	font-weight: normal;
	font-size: 48px;
}
</style>
</head>
<body class="right-sidebar is-preload">
	<c:set var="scheduleList" value="${pageScope.scheduleList}" />
	<c:set var="reviewMap" value="${pageScope.reviewMap}" />
	<c:set var="reviewTitleMap" value="${pageScope.reviewTitleMap}" />
	<c:set var="scheduleWriteList" value="${pageScope.scheduleWriteList}" />
	<c:set var="scheduleTitleMap" value="${pageScope.scheduleTitleMap}" />
	<div id="page-wrapper">

		<!-- Header -->
		<div id="header">

			<!-- Inner -->
			<div class="inner">
				<header>
					<h1>
						<a href="/onetrip/index.jsp" id="logo">OneTrip</a>
					</h1>
				</header>
			</div>

			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li><a href="#">일정만들기</a></li>
					<li><a href="#">여행지</a></li>
					<li><a href="#">여행기</a></li>
					<li><a href="#">내 정보</a>
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

				<button class="tablink"
					onclick="openPage('mySche', this, 'rgb(207, 224, 206)')"
					>내 일정</button>
				<button class="tablink"
					onclick="openPage('myReview', this, 'rgb(230, 174, 252)')">여행
					후기</button>
				<button class="tablink"
					onclick="loadMyInfo('${session_id}');(openPage('myInfo', this, 'rgb(186, 225, 248)'))">내
					정보 수정</button>
				<button class="tablink" onclick=" javascript:myComp(this)" id="defaultOpen">
					동행 신청 목록</button>

				<%-- <!-- (내일정목록)foEach로 데이터 수 만큼 생성하기 -->
				<%-- <c:choose>
				<c:when >
			    <c:forEach var="" items=""> --%>
				<div id="mySche" class="tabcontent">
					<!-- Carousel -->
					<section class="carousel">
						<div class="reel">

							<article>
								<a href="#" class="image featured"><img src="images/서울2.jpg"
									alt="" /></a>
								<header>
									<h3>
										<a href="#">서울 여행</a>
									</h3>
								</header>
								<a href="#"><input type="button" value="후기 작성"></a>
							</article>

							<article>
								<a href="#" class="image featured"><img
									src="images/제주도2.jpg" alt="" /></a>
								<header>
									<h3>
										<a href="#">Fermentum sagittis proin</a>
									</h3>
								</header>
								<a href="#"><input type="button" value="후기 작성"></a>
							</article>

							<article>
								<a href="#" class="image featured"><img
									src="images/pic03.jpg" alt="" /></a>
								<header>
									<h3>
										<a href="#">Sed quis rhoncus placerat</a>
									</h3>
								</header>
								<p>Commodo id natoque malesuada sollicitudin elit suscipit
									magna.</p>
							</article>

							<article>
								<a href="#" class="image featured"><img
									src="images/pic04.jpg" alt="" /></a>
								<header>
									<h3>
										<a href="#">Ultrices urna sit lobortis</a>
									</h3>
								</header>
								<p>Commodo id natoque malesuada sollicitudin elit suscipit
									magna.</p>
							</article>

							<article>
								<a href="#" class="image featured"><img
									src="images/pic05.jpg" alt="" /></a>
								<header>
									<h3>
										<a href="#">Varius magnis sollicitudin</a>
									</h3>
								</header>
								<p>Commodo id natoque malesuada sollicitudin elit suscipit
									magna.</p>
							</article>

							<article>
								<a href="#" class="image featured"><img
									src="images/pic01.jpg" alt="" /></a>
								<header>
									<h3>
										<a href="#">Pulvinar sagittis congue</a>
									</h3>
								</header>
								<p>Commodo id natoque malesuada sollicitudin elit suscipit
									magna.</p>
							</article>

							<article>
								<a href="#" class="image featured"><img
									src="images/pic02.jpg" alt="" /></a>
								<header>
									<h3>
										<a href="#">Fermentum sagittis proin</a>
									</h3>
								</header>
								<p>Commodo id natoque malesuada sollicitudin elit suscipit
									magna.</p>
							</article>

							<article>
								<a href="#" class="image featured"><img
									src="images/pic03.jpg" alt="" /></a>
								<header>
									<h3>
										<a href="#">Sed quis rhoncus placerat</a>
									</h3>
								</header>
								<p>Commodo id natoque malesuada sollicitudin elit suscipit
									magna.</p>
							</article>

							<article>
								<a href="#" class="image featured"><img
									src="images/pic04.jpg" alt="" /></a>
								<header>
									<h3>
										<a href="#">Ultrices urna sit lobortis</a>
									</h3>
								</header>
								<p>Commodo id natoque malesuada sollicitudin elit suscipit
									magna.</p>
							</article>

							<article>
								<a href="#" class="image featured"><img
									src="images/pic05.jpg" alt="" /></a>
								<header>
									<h3>
										<a href="#">Varius magnis sollicitudin</a>
									</h3>
								</header>
								<p>Commodo id natoque malesuada sollicitudin elit suscipit
									magna.</p>
							</article>
						</div>
					</section>
				</div>


				<%-- <!-- (내후기목록)foEach로 데이터 수 만큼 생성하기 -->
				<%-- <c:choose>
				<c:when >
			    <c:forEach var="" items=""> --%>
				<div id="myReview" class="tabcontent" >
					<!-- Carousel -->
					<section >

						<div class="reel">
<table style="margin :auto;text-align :center;">
<tr>
							<c:forEach var="scheduleNum" items="${scheduleList}" varStatus ="stat">
							<c:if test="${stat.index%2==0}">
							</tr><tr></c:if>
							<td>
							<article style = "margin : 0%;">
							<a href="${pageContext.request.contextPath}/review/ReviewDetailView.re?seq=${scheduleNum}&day=1" class="image featured"><img src="${reviewMap.get(scheduleNum)}" style="width:90% height:60%" /></a>
							<header>
								<h3>
								<a href="${pageContext.request.contextPath}/review/ReviewDetailView.re?seq=${scheduleNum}&day=1">${reviewTitleMap.get(scheduleNum)}</a>
								</h3>
							</header>
							<a href="${pageContext.request.contextPath}/review/ReviewDetailView.re?seq=${scheduleNum}&day=1"><input type="button" value="더 알아보기"></a>
							</article>
						</td>	
					</c:forEach>
					</tr>
					</table>
<div>
<h3 Style="text-align :center;">
리뷰 작성하기
</h3>
</div>
<table style="margin :auto;text-align :center;">
<tr>


					<c:forEach var="scheduleNum" items="${scheduleWriteList}" varStatus ="status">
					<c:if test="${status.index%2==0}">
					</tr><tr></c:if>
					<td>
							<div style =" margin : 0%;">
								<a href="${pageContext.request.contextPath}/review/ReviewWrite.re?seq=${scheduleNum}&day=1" class="image featured"></a>
								<header>
									<h3>
										<a href="${pageContext.request.contextPath}/review/ReviewWrite.re?seq=${scheduleNum}&day=1">${scheduleTitleMap.get(scheduleNum)}</a>
									</h3>
								</header>
								<a href="${pageContext.request.contextPath}/review/ReviewWrite.re?seq=${scheduleNum}&day=1"><input type="button" value="후기 작성"></a>
							</div>
					</td>
					</c:forEach>
					</tr>
</table>

				
							
						</div>
					</section>
				</div>



				<!-- 내 정보 -->
				<div id="myInfo" class="tabcontent">

					<form class="contents"
						action="${pageContext.request.contextPath}/user/UpdateuserInfo.us"
						method="post" enctype="multipart/form-data">

						<table class="myInfo_fieldset" width="940"
							style="padding: 5px 0 5px 0;">

							<tr>
								<br>
								<img id="preview" src="images/human.png" alt="사용자 사진"
									style="width: 15%; padding: 10px;" />
								<br />
								<input name="user_photo" class="uphoto" type="file"
									value="파일 선택" accept="image/*" name="file"
									style="border: 1px solid gray; border-radius: 5px;" />
							</tr>


							<tr height="2" bgcolor="#FFC8C3">
								<td colspan="2"></td>
							</tr>

							<tr>
								<th>이름/별명</th>
								<td>
									<p>
										<input type="text" name="user_name" id="name" placeholder="">
									</p>
								</td>
							</tr>

							<tr>
								<th>아이디</th>
								<td>
									<p id="user_id" value="${session_id}">${session_id}</p>
								</td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td><input type="password" name="user_pw"></td>
							</tr>
							<tr>
								<th>비밀번호 확인</th>
								<!-- 비밀번호 확인 같은 경우 이퀄el 문으로 이퀄처리 -->
								<td><input type="password" name="pw_re"></td>
							</tr>

							<tr>
								<th>성별</th>
								<td>
									<p id="gender"></p>
								</td>
							</tr>

							<tr>
								<th>나이</th>
								<td>
									<p>
										<input type="text" id="age" name="user_age" placeholder="">
									</p>
								</td>
							</tr>

							<tr>
								<th>이메일</th>
								<td><input type="email" name="user_email"></td>
							</tr>
							<tr>
								<th>주소</th>
								<td>
									<p>
										<input type="text" id="address" name="user_address"
											placeholder="">
									</p>
								</td>
							</tr>
							<tr>
								<th>핸드폰 번호</th>
								<td><input type="text" name="user_hp"></td>
							</tr>
							<tr height="2" bgcolor="#FFC8C3">
								<td colspan="2"></td>
							</tr>

							</br>
							</br>
							<tr>
								<td class="myInfo_buttons" colspan="2" align="center"><input
									type="submit" value="완료"> <input type="reset"
									value="취소"> <input type="button" onclick="delUser()"
									value="회원탈퇴"></td>
							</tr>

						</table>
					</form>
				</div>
				<%-- <!-- (내동행 신청목록)foEach로 데이터 수 만큼 생성하기 -->
				<%-- <c:choose>
				<c:when >
			    <c:forEach var="" items=""> --%>
				<div id="myComp" class="tabcontent">

					<!-- Carousel -->

					<section class="carousel">

						<div class="reel" id="myCompList"></div>

					</section>

				</div>



			</div>

			<form id="delForm"
				action="${pageContext.request.contextPath}/user/Deleteuser.us"
				method="post">
				<input type="hidden" name="user_id" value="${session_id}"> <input
					type="submit" style="visibility: hidden;">
			</form>
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
	<script src="assetss/js/jquery.min.js"></script>
	<script src="assetss/js/jquery.dropotron.min.js"></script>
	<script src="assetss/js/jquery.scrolly.min.js"></script>
	<script src="assetss/js/jquery.scrollex.min.js"></script>
	<script src="assetss/js/browser.min.js"></script>
	<script src="assetss/js/breakpoints.min.js"></script>
	<script src="assetss/js/util.js"></script>
	<script src="assetss/js/main.js"></script>

	<!-- script추가 -->
	<script>
		var contextPath = "${pageContext.request.contextPath}";
	</script>
	<script>
		var loginType = ${admin}
	</script>
	<script src="assetss/js/mypage.js"></script>
	<script src="assetss/js/userinfo.js"></script>
</body>
</html>