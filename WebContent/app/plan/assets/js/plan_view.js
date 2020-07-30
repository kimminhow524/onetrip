function planSubmit(){
	/*var form = document.cityForm;*/
	
	var dayJson = new Object();
	var dayloc = new Array();	
	dayJson.title = $('#trip_text').text();
	dayJson.start = start_date;
	dayJson.end = end_date;
	dayJson.term = $('.days').length;
	
	$('.days').each(function(i){
		var city = $(this).attr("data-city").trim();
		$(this).children('.location').each(function(){
			var loc = new Object();
			if($(this).attr('id') != 'dummy'){
				loc.day = i+1;
				loc.num = $(this).attr('data-seq').trim();
				loc.city = city;
				loc.name = $(this).attr('data-val').trim();
				loc.order = $(this).attr('data-order').trim();
				dayloc.push(loc);
			}
		});
	});
	dayJson.days = dayloc;	
	
	$.ajax({
		url: contextPath + "/plan/PlanSubmitOk.pl",
		type: 'post',
		data: JSON.stringify(dayJson) ,
		dataType: 'text',
		success: function(data){
			if(data.trim() == 'ok'){
				parent.location.href = contextPath+"/index.jsp";
			}
		},
		error: function(){
			console.log("오류");
		}
	});
}


function searchDest(){
	$('.item').remove();
	var searched = $('.search_area').val();
	console.log(searched);
	$.ajax({
		url: contextPath + "/plan/SearchDestOk.pl?search="+searched,
		type: 'get',
		dataType: 'json',
		success: function(data){
			var temp = data.list;

			for(var i = 0; i<temp.length;i++){
				
				var dummy = $('#dummy_dest').clone(true);
				dummy.attr("id","location");
				dummy.attr("class","item");
				dummy.css("display","flex");
				dummy.attr("data-seq",temp[i].num);
				dummy.attr("data-val",temp[i].name);
				dummy.attr("data-num",1);
				dummy.attr("data-latlng",temp[i].long+","+temp[i].lati);
				dummy.attr("data-cate",temp[i].cate);
				dummy.children('#img').children('img').attr('src',contextPath+"/dphoto/"+temp[i].photo);
				dummy.children('#search_destName').text(temp[i].name);
				$('#lo_lists').append(dummy);	
			}
		},
		error: function(){
			console.log("오류");
		}
	});
	
	
}