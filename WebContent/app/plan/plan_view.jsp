<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/app/plan/assets/css/main_view.css" />
		
		<c:if test="${session_id eq null}">
			<script>
				alert("로그인 후 이용해주세요");
				location.replace("${pageContext.request.contextPath}/index.jsp");
			</script>
		</c:if>
		<c:set var="list" value="${requestScope.dest_list}"/>
		<c:set var="dayList" value ="${requestScope.dayList}"/>
		<c:set var="trip_name" value="${requestScope.trip_name}"/>
		<c:set var="start_date" value="${requestScope.start_date}"/>
		<c:set var="end_date" value="${requestScope.end_date}"/>
		<c:set var="daylen" value = "1"/>
</head>
<body>
	<div id="wrapper">
		<div id="title">
			<div>
			<a style="font-weight: bold; font-size: 16pt;"><div id="trip_text">${trip_name}</div></a></div>
			<a id="submit_sc" onclick= "planSubmit()" style="float:right;"><div id ="submit_bt">완료</div></a>
		</div>
		<div id="view">
			<div id="search_citys">
				<div id=search_bar>
					<h3>검색</h3> <br>
					<input onkeypress="keyevent();" class="search_area" type="text">
				</div>
				<div id="lo_tag">
					<div>관광지</div>
					<div>숙박</div>
					<div>음식점</div>
				</div>
			
				<div id="lo_lists" style="overflow: auto;">
					<div id = "dummy_dest" style="display: none;">
						<div id="img"><img src=""></div>
						<div id="search_destName"></div>
					</div>
					<c:choose>
						<c:when test="${list != null and fn:length(list) > 0}">
							<c:forEach var="d_bean" items="${list}">
								<div id = "location" class="item" data-seq = "${d_bean.getDestination_num()}" data-val="${d_bean.getDestination_name()}" data-num="1" 
								data-latlng="${d_bean.getDestination_latitude()},${d_bean.getDestination_longitude()}" 
								data-cate="${d_bean.getDestination_category_A()}">
								<div id="img"><img src="${pageContext.request.contextPath}/dphoto/${d_bean.getDestination_photo()}"></div>
									<div id="search_destName">${d_bean.getDestination_name()}
									</div>
								</div>
							</c:forEach>
						</c:when>
					</c:choose>					
				</div>
			</div>
			<c:choose>
					<c:when test="${dayList != null and fn:length(dayList) > 0}">
							<c:forEach var="day_city" items="${dayList}">
								<c:set var="prev_dis" value="visible"/>
								<c:set var ="next_dis" value="visible"/>
								<c:set var="isCurrent" value =""/>
								<c:if test="${daylen eq 1}">
									<c:set var="isCurrent" value ="current"/>
									<c:set var="prev_dis" value="hidden "/>
								</c:if>
								<c:if test="${daylen eq fn:length(dayList)}">
									<c:set var ="next_dis" value="hidden "/>
								</c:if>
								<div id="${isCurrent}" class="days" data-cnt="0" data-city = "${day_city}" style="display: none;">
									<div id="day_list_title">
										<div id="prev_w"><a id="prev_bt" onclick="prevDay()" style="visibility:${prev_dis};">이전</a></div>
										<div id ="day_num">${daylen}DAY</div>
										<div id="next_w"><a id="next_bt" onclick="nextDay()" style="visibility: ${next_dis};">다음</a></div>
									</div>
									<div id="dummy" class="location" style="display: none;">
										<div id="d_img"><img src="../../images/contents1.jpg"></div>
										<div id="dest_name">해운대</div>
									</div>
								</div>
								<c:set var="daylen" value="${daylen+1}"/>
							</c:forEach>
					</c:when>
			</c:choose>
			<div id="right_view">
				<div id="map">
					
				</div>
			</div>
			
		</div>
		
	</div>
	
	
	
</body>
<script>
      var map;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -34.397, lng: 150.644},
          zoom: 8
        });
      }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBEyfOniI-0AlYyNAKxrAMZonOQhOCGvsQ&callback=initMap"
    async defer></script>
<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script>var contextPath = "${pageContext.request.contextPath}";</script>
<script>var start_date = "${start_date}";</script>
<script>var end_date = "${end_date}";</script>
<script src="${pageContext.request.contextPath}/app/plan/assets/js/plan_view.js"></script>
<script>
	$(document).ready(function () {
		$('#current').css('display','block');
		if($('.days').length == 1){
			$('#next_bt').css('display','block');
		}
	});	

	$('#lo_lists').on('click','.item', function(){
		var data_num = $(this).attr('data-num');
		var data_name = $(this).children("#search_destName").text();
		var positon = $(this).attr('data-latlng');
		var seq = $(this).attr('data-seq');
		var cnt = Number($('#current').attr('data-cnt')) + 1;
		var photo = $(this).children("#img").children('img').attr("src");
		$('#current').attr('data-cnt',cnt);
		var temp = $('#dummy').clone(true);
		temp.css('display','flex');
		temp.attr('id','day_dest');
		temp.children('#d_img').children('img').attr("src",photo);
		temp.attr('data-seq',seq);
		temp.attr('data-val',data_name);
		temp.attr('data-latlng',positon);
		temp.attr('data-order', cnt);
		temp.children('#dest_name').text(data_name);
		$('#current').append(temp);
	});
	
	function nextDay(){
		
		current = $('#current');
		current.css('display','none');
		current.attr('id','');
		next = current.next();
		console.log(next);
		next.css('display','block');
		next.attr('id','current');			

	}
	
	function prevDay(){
		current = $('#current');
		current.css('display','none');
		current.attr('id','');
		prev = current.prev();
		console.log(next);
		prev.css('display','block');
		prev.attr('id','current');		
	}
	function keyevent(){
		
		if(event.keyCode == 13){
			searchDest();
		}
	}
</script>
</html>