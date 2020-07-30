<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<!--
	Editorial by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
<head>
<title>후기작성페이지</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/app/review/assetss/css/mainhelios.css" />
<noscript>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/app/review/assetss/css/noscript.css" />
</noscript>
<link rel="stylesheet" href="${pageContext.request.contextPath}/app/review/assetss/css/reviewform-style2.css" />
<style>
.ms {
	margin: 0 auto;
}

.row {
	margin: 0px auto;
}

#rbn {
	margin: 0px 0px 0px 20px;
}

@media screen and (max-width: 736px) {
	.row.col-12-small {
		
	}
	.row>.col-6 {
		width: 50%;
	}
	ul.actions li {
		display: block;
		margin: 0 auto;
	}
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

#header {
	position: relative;
	background-position: center center;
	background-attachment: inherit;
	background-image: url(../destination/images/schrecksee-2534484_1920.jpg);
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

#page-wrapper {
	font-family: Open Sans, sans-serif;
}

#logo {
	font-family: Open Sans, sans-serif;
	font-size: 48px;
	font-weight: normal;
}
ul.actions li {
			padding: 0 0 0 2.5em;
			vertical-align: middle;}
input[type="checkbox"], input[type="radio"] {
    -moz-appearance: none;
    -webkit-appearance: none;
    -ms-appearance: none;
    appearance: none;
    display: block;
    float: left;
    margin-right: 0em;
    opacity: 0;
    width: 1em;
    z-index: -1;}			
</style>
</head>
<body class="is-preload">
	<c:set var="destinationBeanList"
		value="${requestScope.destinationBeanList}" />
	<c:set var="seq" value="${requestScope.seq}" />
	<c:set var="day" value="${requestScope.day}" />
	<c:set var="scheduleName" value="${requestScope.scheduleName}" />
	<c:set var="reviewDaysNum" value="${requestScope.reviewDaysNum}" />
	<c:set var="reviewDaysBeanList"
		value="${requestScope.reviewDaysBeanList}" />
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


		<!-- Wrapper -->
		<div id="wrapper">

			<!-- Main -->
			<div id="main">
				<div class="inner">



					<!-- Content -->
					<section class="ms">
						<header class="main">
							<h2>후기 작성</h2>
						</header>
						<hr class="major" />
						<br> <br>

						<h2 id="content">${scheduleName}</h2>

						<header class="major">
							<h2>${day}일차</h2>
						</header>
						<div>
							<c:forEach var="i" begin="1" end="${reviewDaysNum}" step="1">
								<a
									href="${pageContext.request.contextPath}/review/ReviewWrite.re?seq=${seq}&day=${i-1}"
									class="button primary">day ${i-1}</a>
							</c:forEach>
						</div>
						<br>



						<section>
							<div class="row">

								<!-- Table -->
								<c:if test="${destinationBeanList.size()!=0}">
							
								<div class="table-wrapper">
									<table class="alt">
										<thead>
											<tr>
												<th>순서</th>
												<th>관광지명</th>
												<th>장소 추천</th>
											</tr>
										</thead>
										<tbody>
											
									 <c:forEach var="destination" items="${destinationBeanList}" varStatus="status">
															<tr>
																<td>${status.count}</td>
																<td>${destination.getDestination_name()}</td> 
																<td>
																	<div class="col-4 col-12-small">
								               							<input type="button" onclick="recommend(${destination.getDestination_city_num()});" id="placerecommend" value="장소 추천하기" name = onclick">
								             						</div>
																</td>
															</tr>
															</c:forEach> 

															</tbody>
														</table>
													
														<input type="button" onclick="resetRecommend();" id="resetrecommend" value="추천 초기화" >
													</div>
														</c:if>
											</div>
										

						</section>


						<hr class="major" />
						<br /> <br />
						<!-- Elements -->
						<h2 id="elements">${scheduleName}${day}일차 Review</h2>
						<form method="post"
							action="${pageContext.request.contextPath}/review/ReviewWriteOk.re?seq=${seq}&day=${day}&id=${session_id}"
							enctype="multipart/form-data">
							<div class="row gtr-200" id="list">
								
								<c:if test="${ reviewDaysBeanList.size()!=0}">
									<c:forEach var="reviewDaysBean" items="${reviewDaysBeanList}">
										<br>
										<div class="row gtr-uniform"
											id="Item${reviewDaysBean.getReview_days_num()}"
											style="width: 100%">
											<div class="col-10 col-12-medium">
												<input type="text"
													name="demo-name${reviewDaysBean.getReview_days_num()}"
													id="demo-name"
													value="${reviewDaysBean.getReview_days_title()}"
													placeholder="Name" />
											</div>
											<!-- Break -->
											<div class="col-4 col-12-small" style="display: inline;">
												<input class="rphoto" type="file" value="파일 선택"
													name="file${reviewDaysBean.getReview_days_num()}"
													style="border: 1px solid gray; border-radius: 5px;" />
												<!-- <a href="#" class="button primary icon solid fa-search" style="font-size: 10px;">선택</a> -->
											</div>
											<!-- Break -->
											<div class="col-10 col-12-small">
												<textarea
													name="demo-message${reviewDaysBean.getReview_days_num()}"
													id="demo-message" placeholder="후기를 작성해주세요." rows="6"
													style="resize: none">${reviewDaysBean.getReview_days_content()}</textarea>
											</div>
											<!-- Break -->
											<br /> <br />
											<!-- Break -->
											<div class="col-12">
												<ul class="actions">
													<li><input type="reset" value="초기화" /></li>
												</ul>
												<br>
											</div>
										</div>
									</c:forEach>
								</c:if>
								<c:if test="${ reviewDaysBeanList.size()==0}">

									<div class="row gtr-uniform" id="Item1" style="width: 100%">
										<div class="col-10 col-12-medium">
											<input type="text" name="demo-name1" id="demo-name" value=""
												placeholder="소제목" />
										</div>
										<!-- Break -->
										<div class="col-4 col-12-small" style="display: inline;">
											<input class="rphoto" type="file" value="파일 선택" name="file1"
												style="border: 1px solid gray; border-radius: 5px;" />
											<!-- <a href="#" class="button primary icon solid fa-search" style="font-size: 10px;">선택</a> -->
										</div>
										<!-- Break -->
										<div class="col-10 col-12-small">
											<textarea name="demo-message1" id="demo-message"
												placeholder="후기를 작성해주세요." rows="6" style="resize: none"></textarea>
										</div>
										<!-- Break -->
										<br>
										<br>
										<br>
										<br>
										<br>
										<br>
										<br>
										<br />
										<br />
										<!-- Break -->
									</div>
								</c:if>
							</div>
							<div class="col-12">
								<ul class="actions">
									<li><input type="reset" value="초기화" /></li>
								</ul>
								<br>
							</div>
							<div class="col-4 col-12-small">
								<input type="radio" id="demo-priority-low" name="demo-priority"
									value="0" checked> <label for="demo-priority-low">공개</label>
							</div>
							<div class="col-4 col-12-small">
								<input type="radio" id="demo-priority-normal" value="1"
									name="demo-priority"> <label for="demo-priority-normal">비공개</label>
							</div>
							<button type="button" class="button" id="rbn">후기추가</button>
							<input type="submit" value="등록" />
							<input type="hidden" id="daysNum" name="daysnum" value="${reviewDaysNum}">
							<input type="hidden" id="recommendCnt" name="recommendCnt" value="0">
							<input type="hidden" id= "user_id" name ="user_id" value="${session_id}">
							<div style="display: none" id="recommendDiv">
								<input type="hidden" id="destRecommend1" name="destRecommend1"
									value="">
							</div>
						</form>
						<br>
					</section>
				</div>
	

				<br> <br>
				<!-- Footer -->
				<footer id="footer">
					<p class="copyright">&copy; OneTrip(주). All rights reserved.</p>
				</footer>




				<!-- </div> -->
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
<!-- Scripts 추가2 -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<script>
	$('#rbn').click(
			function() {

				// get the last DIV which ID starts with ^= "klon"
				var $div = $('div[id^="Item"]:last');

				// Read the Number from that DIV's ID (i.e: 3 from "klon3")
				// And increment that number by 1
				var num = parseInt($div.prop("id").match(/\d+/g), 10) + 1;

				// Clone it and assign the new ID (i.e: from num 4 to ID "klon4")
				var $klon = $div.clone().appendTo("#list");
				$klon.prop('id', 'Item' + num);
				$klon.children().children().attr('name', 'demo-name' + num);
				$klon.children().next().children().attr('name', 'file' + num);
				$klon.children().next().next().children().attr('name',
						'demo-message' + num);
				$('#daysNum').attr('value', num);

				// Finally insert $klon wherever you want

			});
	function recommend(cityNum, btn) {

		// get the last DIV which ID starts with ^= "klon"
		var $input = $('input[id^="destRecommend"]:last');

		// Read the Number from that DIV's ID (i.e: 3 from "klon3")
		// And increment that number by 1
		var beforeNum = parseInt($input.prop("id").match(/\d+/g), 10);
		var num = beforeNum + 1;
		if ($('#recommendCnt').attr('value') == 0) {
			$input.prop('value', cityNum);
			$('#recommendCnt').attr('value', 1);
		} else {
			var $klon = $input.clone().appendTo("#recommendDiv");
			$klon.prop('id', 'destRecommend' + num);
			$klon.prop('name', 'destRecommend' + num);
			$klon.prop('value', cityNum);
			$('#recommendCnt').attr('value', num);
			// Clone it and assign the new ID (i.e: from num 4 to ID "klon4")

		}
		var button = document.getElementById('placerecommend' + btn);
		button.disabled = true;

		// Finally insert $klon wherever you want

	}
function resetRecommend(){
		
		var buttonCnt = 4;
		for(var i =1; i<buttonCnt+1;i++){
			var button = document.getElementById('placerecommend'+i);
			button.disabled= false;
			}
		var recommendCnt = $('#recommendCnt');
		if(recommendCnt.attr('value')>1){
		for (var i = 2;i<=recommendCnt.attr('value');++i ){
			var deleteTarget = document.getElementById('destRecommend'+i);
			deleteTarget.remove();
			}
		}
		recommendCnt.attr('value',"0")
		var defaultSet = document.getElementById('destRecommend1');
		defaultSet.setAttribute('value',"");

		
	}

</script>



<!-- Scripts 추가3-->
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBEyfOniI-0AlYyNAKxrAMZonOQhOCGvsQ&callback=initMap"
	async defer></script>
<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>



</html>