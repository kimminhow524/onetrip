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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/app/plan/assets/css/main.css" />
		
</head>
<body>
		<c:if test="${session_id eq null}">
			<script>
				alert("로그인 후 이용해주세요");
				location.replace("${pageContext.request.contextPath}/index.jsp");
			</script>
		</c:if>
		<c:set var="list" value="${requestScope.cityList}"/>
		<c:set var="photo" value="${requestScope.photoList}"/>		
	<div id="wrapper">
		<div id="title">
			<div>
			<img src=""/>
			<a style="font-weight: bold;">계획짜기 ▷ 도시선택</a></div>
			<a id="submit_sc" style="float:right;"><div id ="submit_bt">완료</div></a>
		</div>
		<div id="view">
			<div id="nation">
				<ul>
					<li style="list-style-type: none;">			
						<img src="${pageContext.request.contextPath}/app/assets/css/images/na_img.jpg">
						대한민국
					</li>
				</ul>
			</div>
			<div id="city">
				<div id="city_list_title"><div>대한민국</div></div>
				<div id="city_list">
					<c:choose>
						<c:when test="${list != null and fn:length(list) > 0}">
							<c:forEach var="c_bean" items="${list}" varStatus="status">
								<div class="item" data-val="${c_bean.getCity_name()}" data-num="1" data-latlng="11">
									<img src="${pageContext.request.contextPath}/cphoto/${photo[status.index].getCity_photo_name()}"><div>${c_bean.getCity_name()}</div>
								</div>
							</c:forEach>
						</c:when>
					</c:choose>						
				</div>
				
			<!-- el문으로 추가 -->		
			</div>
			<div id="right_view">
			
				
				<div id="map">
					
				</div>
				<div id="select_city">
					<div id="select_city_title" style="height: 20%;">
						<div>여행도시</div>
						<div style="float: right; display: flex;">
							<div style="font-size: 8pt; display: flex; align-items: center;">출발일</div><input type="date" id="trip_date_in"/>
						</div>
					</div>
					<div id="route_city" style="height: 50%; overflow: auto;">
					<form name="cityForm" method="post" action="${pageContext.request.contextPath}/plan/PlanViewDetail.pl" method="post">
					<input type="hidden" name="plan_value" id="plan_value" value="${plan_value}"/>
					<input type="hidden" name="plan_value2" id="plan_value2" value="${plan_value2}"/>
					<div id="route_city_list">
						<div class="dummy" style="display: none;">
							<div id="del_city"><img src="${pageContext.request.contextPath}/app/assets/css/images/del_icon.png"/></div>
							<div id="city_name" class="city_name">서울</div>
							<div id="choice_day">
								<div id="m_day"><img src="${pageContext.request.contextPath}/app/assets/css/images/minus_btn.png"/></div>
								<div id="t_day" class="t_day">1일</div>
								<div id="p_day"><img src="${pageContext.request.contextPath}/app/assets/css/images/plus_btn.png"/></div>
							</div>
						</div>
					</div>
					
					<div class="select_conform">
					<div id="select_in" class="sel_modal">
						<div class="col-12 col-12-xsmall" id="plan_title">
							<label for="trip_name">여행제목</label>
							<input type="text" name ="trip_name" id="trip_name" placeholder="여행제목을 입력해주세요."/>
						</div>
						<br>
						<div id="plan_date">
							<label for="start_date">날짜</label>
							<input type="date" name="start_date" id="start_date" value=""/>
						</div>
						<br>
						<div>
							<a href="javascript:planSubmit()" style="text-decoration: none;">일정 만들기</a>
							<a class="close" onclick="closeModal()">닫기</a>
						</div>	
					</div>
					</div>
					</form>
					</div>
					<div id="select_city_button" style="height: 30%;">
						<div style=" display:flex; justify-content: center; background-color: #49b2e9; width: 60%; height: 50%; align-items: center;"><a onclick="sel_conformOpen()"><div style=" color: white; font-size: 12pt;">일정 만들기
						</div></a></div>
					</div>
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
<script src="${pageContext.request.contextPath}/app/plan/assets/js/plan.js"></script>
<script>
	var trip_day = 0;
	var trip_order = 1;
	
	$('#city_list').on('click','.item', function(){
			var data_num = $(this).attr('data-num');
			var data_name = $(this).attr('data-val');
			var temp = $('.dummy').clone(true);
			temp.attr('class','selected_city');
			temp.attr('data-order',trip_order);
			trip_order += 1;
			temp.css('display','flex');
			temp.children('#city_name').text(data_name);
			$('#route_city_list').append(temp);
	});
	
	$('#choice_day').on('click','#m_day',function(){
		var days = $(this).next().text();
		var days = Number(days.split('일')[0]);
		if(days != 1){
			days -= 1;		
		}
		$(this).next().text(days+"일");
	});
	
	$('#choice_day').on('click','#p_day',function(){
		var days = $(this).prev().text();
		var days = Number(days.split('일')[0]);
		if(days <= 31){
			days += 1;		
		}
		$(this).prev().text(days+"일");
	});

	$('#del_city').on('click',function(){
		var p = $(this).parent();
		if(p.next().length == 0){
			trip_order -= 1;
		}else{
			var temp = p;
			while(temp.next().length != 0){	
				temp.next().attr('data-order',temp.next().attr('data-order')-1);
				temp = temp.next();
			}
			trip_order -= 1;
		}
		p.remove();
	});
	
	
	function sel_conformOpen(){		
		$(".select_conform").show();
		$('html').css('overflow-y','hidden');
		var date = $('#trip_date_in').val();
		if(date !=""){
			$('#start_date').val(date);
		}
	}
	
	function closeModal(){
		$('.select_conform').hide();
		$('html').css('overflow-y','auto');
	}
</script>
</html>