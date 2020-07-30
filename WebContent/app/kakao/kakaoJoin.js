const KAKAO_KEY = "cbf723a45f21fb50c4a34f1477cc844f";
//const KAKAO_KEY = "3f9b328b2c8ebbcce48b0649c32c8025";

Kakao.init(KAKAO_KEY);

kakaoJoin = () => {
    Kakao.Auth.login({
        success: function (response) {
            Kakao.API.request({
                url: "/v2/user/me",
                success: function (res) {
                	
                	console.log(res);
                	
                	const  {id,kakao_account: { age_range, email, gender, profile: {nickname, profile_image_url} } } = res;
				
					const kakaoLoginForm = document.getElementById("kakaoJoinForm");

					const inputs = kakaoLoginForm.getElementsByTagName("input");
                    
					console.log(age_range);
					console.log(email);
					console.log(gender);
					console.log(nickname);
					console.log(profile_image_url);
					console.log(id);
					
					inputs[0].value = age_range;
					inputs[1].value = email;
					inputs[2].value = gender;
					inputs[3].value = nickname;
					inputs[4].value = profile_image_url;
					inputs[5].value = id;
					kakaoLoginForm.submit();
                	
					alert("초기 비밀번호는 1111, 전화번호는 0000000000으로 지정됩니다.");
                },
                fail: function (error) {
                	console.log("ERROR");
                    console.log(error);
                },
            });
        },
        fail: function (error) {
        	console.log("ERROR");
            console.log(error);
        },
    });
};



kakaoLogin = () => {
    Kakao.Auth.login({
        success: function (response) {
            Kakao.API.request({
                url: "/v2/user/me",
                success: function (res) {
                	
                	console.log(res);
                	
                	const  {id} = res;
				
					const kakaoLoginForm = document.getElementById("kakaoLoginForm");
					console.log(id);
		// const inputs = kakaoLoginForm.getElementById("#kakao_Login_id");
	// document.getElementsByTagName('input').item('kakao_Login_id',0).value
	// =id;
					document.getElementById('kakao_Login_id').value =id; 
			// inputs.value = id;
				// console.log(inputs);
					kakaoLoginForm.submit();
                },
                fail: function (error) {
                	console.log("ERROR");
                    console.log(error);
                },
            });
        },
        fail: function (error) {
        	console.log("ERROR");
            console.log(error);
        },
    });
};