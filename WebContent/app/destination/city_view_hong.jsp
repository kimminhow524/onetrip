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
<link
	href="${pageContext.request.contextPath}/app/assets/css/weather-icons.min.css"
	rel="stylesheet" type="text/css">
<noscript>
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/app/assetss/css/noscript.css" />
</noscript>

<!-- css추가  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/app/destination/assetss/css/city_view.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
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
    margin: 0px;
      padding:10px;
}

}

@media screen and (min-width: 841px) and (max-width: 1280px) {
.wrapper {
    margin: 0px;
      padding:20px;
}
}
@media screen and (min-width: 737px) and (max-width: 840px) {
.wrapper {
    margin: 0px;
    padding:25px;
}

}

/* Mobile */
@media screen and (max-width: 736px) {

.wrapper {
    margin: 0px;
    padding:10px;
}

input[type="button"], input[type="submit"], input[type="reset"], button, .button {
    display: block;
    padding: 0;
    line-height: 3em;
    width: 100%;
    margin: 5px 1px;
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

.menu a {
	cursor: pointer;
}

.menu .hide {
	display: none;
}

ul {
	list-style: none;
}
</style>



</head>
<body class="no-sidebar is-preload">
	<c:set var="cityBean" value="${requestScope.cityBean}" />
	<c:set var="postBeanList" value="${requestScope.postBeanList}" />
	<c:set var="postDetail" value="${requestScope.postDetail}" />
	<c:set var="cityPhotoList" value="${requestScope.cityPhotoList}" />
	<c:set var="destinationBeanList"
		value="${requestScope.destinationBeanList}" />
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
				<article id="main" class="special">
					<header>
						<h2>
							<a href="#">${cityBean.getCity_name()}</a>
						</h2>
					</header>

					<table border="1" cellpadding="0" cellspacing="0"
						style="table-layout: fixed">
						<tr align="center" valign="middle">
							<td width="50px" height="50px">
								<div style="width: 100%; height: 100%">
									<img style="width: 100%; height: 100%"
										src="${pageContext.request.contextPath}/cphoto/${cityPhotoList.get(0)}"
										alt="" />
								</div>
							</td>
							<td width="50px" height="50px" align="center"
								style="vertical-align: middle; font-size: 4vw"><i
								id="weatherIcon" class=""></i> <i id="weather-text"
								class="wi wi-"></i><br> <i id="temperature" class="wi wi-"></i>

							</td>
						</tr>
					</table>
					<br> <br>

					<!-- 해당 도시의 인기관광지 목록 -->
					<div class="row">
						<!-- Carousel -->
						<section class="carousel">
							<div class="reel">
								<c:forEach var="destination" items="${destinationBeanList}">
									<article>
										<a href="${pageContext.request.contextPath}/city/CityDestinationView.ci?seq=${destination.getDestination_num()}" class="image featured"><img style="width:288px; height: 191px;"
											src="${pageContext.request.contextPath}/dphoto/<c:out value="${destination.getDestination_photo()}"/>"
											alt="" /></a>
										<header>
											<h3>
												<a href="#">${destination.getDestination_name()} </a>
											</h3>
										</header>

									</article>
								</c:forEach>


							</div>
						</section>
					</div>


					<section>
						<table border="1" cellpadding="0" cellspacing="0" width="900px">
							<tr align="center" valign="middle">
								<td width="14%">
									<div align="center">작성자</div>
								</td>
								<td width="50%">
									<div align="center">제목</div>
								</td>
								<td width="17%">
									<div align="center">날짜</div>
								</td>
							</tr>
							<c:choose>
								<c:when test="${postBeanList != null}">
									<c:forEach var="post" items="${postBeanList}" >
										<tr align="center" valign="middle">
											<td>
												<div align="center">${post.getPost_user_id() }</div>
											</td>
											<td>
												<div align="center">${postDetail.get(post.getPost_num()).getPost_contents()}</div><br>
												<div class="modal fade" id="modifyModal" role="dialog" style="max-width :100%;">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<button type="button" class="close" data-dismiss="modal">&times;</button>
																<h4 class="modal-title">댓글 수정창</h4>
															</div>
															<form action="${pageContext.request.contextPath}/city/CityPostModifyOk.ci?post_num=${post.getPost_num()}&seq=${cityBean.getCity_num()}"
													method="post" name="cityPostModify">
															<div class="modal-body">
																<div class="form-group">
																	<label for="post_user_id">작성자</label> <input style="width :100%;"
																		class="form-control" id="post_user_id"
																		name="post_user_id" value = "${post.getPost_user_id()}"readonly>
																</div>
																<div class="form-group">
																	<label for="post_contents">댓글 내용</label> <input style="width :100%;"
																		class="form-control" id="post_contents"
																		name="post_contents" >
																</div>
																<div class="form-group">
																	<label for="post_update_time">작성 시간</label> <input style="width :100%;"
																		class="form-control" id="post_update_time"
																		name="rpost_update_time" value="${postDetail.get(post.getPost_num()).getPost_update_time()}" readonly>
																</div>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-default pull-left"
																	data-dismiss="modal">닫기</button>
																<button type="button" onclick="postModify_click();"
																	class="btn btn-success modalModBtn" id="ok${post.getPost_num()}">수정</button>
															</div>
															</form>
														</div>
													</div>
												</div>
											</td>
											<td>

												<div align="left" style="float: left; width: 55%">${postDetail.get(post.getPost_num()).getPost_update_time()}</div>
												<div align="right" style="float: left; width: 45%">
													<ul id="main-menu">
														<li class="menu"><a>&#9477</a>
															<ul id="sub-menu" class="hide">
																<%-- <c:if test="${post.getPost_user_id() eq session_id}"> --%>
																	<li><a
																		href="${pageContext.request.contextPath}/city/CityPostDeleteOk.ci?post_num=${post.getPost_num()}&seq=${cityBean.getCity_num()}">[삭제]</a></li>
																	<li><a id="myBtn" class='btn btn-xs btn-success'
																		data-toggle='modal' data-target='#modifyModal'>
																			수정</a></li>

															<%-- 	</c:if> --%>
															</ul></li>
													</ul>
												</div>
												<div class="box-footer">
													<ul id="replies">

													</ul>
												</div>
												
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr height="50px">
										<td colspan="5" align="center">등록된 게시물이 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</table>


						<br />
						<table border="0" cellpadding="0" cellspacing="0" width="900px">
							<tr align="center" valign="middle">
								<td><c:choose>
										<c:when test="${nowPage > 1}">
											<a
												href="${pageContext.request.contextPath}/board/BoardList.bo?page=${nowPage - 1}&seq=${cityBean.getCity_num()}">[이전]</a>&nbsp;
										</c:when>
									</c:choose> <c:forEach var="i" begin="${startPage}" end="${endPage}">
										<c:choose>
											<c:when test="${i eq nowPage}">[${i}]
										</c:when>
											<c:otherwise>
												<a
													href="${pageContext.request.contextPath}/city/BoardList.bo?page=${i}&seq=${cityBean.getCity_num()}">[${i}]</a>
											</c:otherwise>
										</c:choose>
									</c:forEach> <c:choose>
										<c:when test="${nowPage < totalPage}">
											<a
												href="${pageContext.request.contextPath}/board/BoardList.bo?page=${nowPage + 1}&seq=${cityBean.getCity_num()}">[다음]</a>&nbsp;
										</c:when>
									</c:choose></td>
							</tr>
						</table>



						<form
							action="${pageContext.request.contextPath}/city/CityPostOk.ci?seq=${cityBean.getCity_num()}"
							method="post" name="cityPostWrite">
							<fieldset style="width: 250">
								<c:if test="${session_id eq null}">
									<textarea name="nl_comment" cols="50" rows="5"
										style="resize: none;" placeholder="로그인 후 이용해주세요." readonly></textarea>
								</c:if>
								<c:if test="${session_id ne null}">
									<textarea name="comment" cols="50" rows="5"
										style="resize: none;" placeholder="정보를 공유해주세요~!"></textarea>
								</c:if>

								<br> <input type="submit" value="submit" /> <input
									type="reset" value="reset" /> <br> <br>
							</fieldset>
						</form>

					</section>
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
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/app/destination/assetss/js/weather_view.js"
		defer></script>
	<script
		src="${pageContext.request.contextPath}/app/destination/assetss/js/login_alert.js"
		defer></script>
	<script>
		var apiURI2 = "${cityBean.getCity_eng_name()}";
	</script>
	<script>
		// html dom 이 다 로딩된 후 실행된다.
		$(document).ready(function() {
			// menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
			$(".menu>a").click(function() {
				var submenu = $(this).next("ul");

				// submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
				if (submenu.is(":visible")) {
					submenu.slideUp();
				} else {
					submenu.slideDown();
				}
			});
		});

		// Get the modal
        var modal = document.getElementById('modifyModal');
 
        // Get the button that opens the modal
        var btn = document.getElementById("myBtn");
 
        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];                                          
 
        // When the user clicks on the button, open the modal 
        btn.onclick = function() {
            modal.style.display = "block";
        }
 
        // When the user clicks on <span> (x), close the modal
        span.onclick = function() {
            modal.style.display = "none";
        }
 
        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
        
        function postModify_click() {
        	if($("#post_contents").val()==""){
        	alert("댓글을 입력하세요");
        	return false;
        	}
        	form.submit();
        
        }

	</script>



</body>
</html>