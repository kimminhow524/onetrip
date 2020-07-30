function planSubmit(){
	/*var form = document.cityForm;*/
	
	var nameAry = new Array();
	var dayAry = new Array();
	$('.city_name').each(function(i){
		if(i != 0){
			nameAry.push($(this).text());
		}
	});
	
	$('.t_day').each(function(i){
		if(i != 0){
			dayAry.push($(this).text());
		}
	});

	cityForm.plan_value.value = nameAry;
	cityForm.plan_value2.value = dayAry;
	
	cityForm.submit();
}