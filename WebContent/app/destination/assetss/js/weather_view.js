

 var apiURI1 = "http://api.openweathermap.org/data/2.5/weather?q=";
      	
            var apiURI3 ="&appid=4e4dbcba7a47c49a9a7e5cb187d86bd9";
        
            var apiURI = apiURI1.concat(apiURI2,apiURI3);
            $.ajax({
               url : apiURI,
               dataType : "json",
               type : "GET",
               async : "false",
               success : function(resp) {
                  console.log(resp);
                  console.log("현재온도 : " + (resp.main.temp - 273.15));
                  console.log("현재습도 : " + resp.main.humidity);
                  console.log("날씨 : " + resp.weather[0].main);
                  console.log("상세날씨설명 : " + resp.weather[0].description);
                  console.log("날씨 이미지 : " + resp.weather[0].icon);
                  console.log("바람   : " + resp.wind.speed);
                  console.log("나라   : " + resp.sys.country);
                  console.log("도시이름  : " + resp.name);
                  console.log("구름  : " + (resp.clouds.all) + "%");
                  var dorn= "";
                  var prefix = "wi wi-";

                  var today = new Date();
                  var hour = today.getHours();
               var weather =resp.weather[0].main;
         
               var temperature =(resp.main.temp.toFixed(0) - 273) +"℃";
                  if (hour > 6 && hour < 20) {
                   //Day time
                  dorn = "day-";

               } else {
                   //Night time
                  dorn ="night-";
               }
                  console.log(dorn);
                  var code = resp.weather[0].id;
                  iconD = prefix + "owm-" +dorn+ code;
                  $("#weatherIcon").attr('class',iconD);
                  
                  $("#temperature").text(temperature);
                  $("#weather-text").text(weather);
               }
            })