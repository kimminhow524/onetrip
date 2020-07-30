function getReview(){
	
	$.ajax({
		url: contextPath + "/main/main.m",
		type: 'get',
		dataType: 'json',
		success: function(data){
			var temp = data.list;
			for(var i = 0; i<temp.length;i++){
				var dummy = $('#dummy').clone(true);
				dummy.attr("id","");
				dummy.attr("class","recom_sch");
				dummy.attr("style","");				
				dummy.children('.image').children('img').attr('src',contextPath+'/cphoto/'+temp[i].photo);
				dummy.find('#sch_title').text(temp[i].title);
				$('.reel').append(dummy);	
			}

			var citytemp = data.city;
			for(var i=0; i<citytemp.length;i++){
				var dummy = $('#city_dummy').clone(true);
				dummy.attr("id","");
				dummy.css("display","block");
				dummy.children('#recom_cityname').text(citytemp[i].name);
				dummy.children('.image').children('img').attr('src',contextPath+'/cphoto/'+citytemp[i].photo);
				dummy.children('.image').attr('href',contextPath+'/city/CityView.ci?seq='+citytemp[i].num);
				$('#recomcity').append(dummy);	
			}
		},
		error: function(){
			console.log("오류");
		}
	});
}
	
	
	
	
	
	
	