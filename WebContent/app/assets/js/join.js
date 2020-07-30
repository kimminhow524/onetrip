
	var check = true;

	function formSubmit() {
		var form = document.joinForm;
		console.log(form.user_id.value);
		if ('' == form.user_id.value || !check) {
			alert('아이디를 확인해주세요.');
			return false;

		} if ('' == form.user_pw.value||form.user_pw.value!=form.user_pw_re.value) {
			alert('비밀번호를 입력해주세요.');
			console.log("테스트(비밀번호)");
			return false;

		}  if ('' == form.user_name.value) {
			alert('이름을 입력해주세요.');
			return false;

		}if ('' == form.user_age.value) {
			alert('나이를 입력해주세요.');
			return false;

		} if ('' == form.user_email.value) {
			alert('이메일를 입력해주세요.');
			return false;
		}if (11 === form.user_hp.length) {
			console("전화번호 들어옴")
			alert('전화번호를 확인해 주세요.');
			return false;
		} if ('' === form.user_address.value) {
			console("이메일 들어옴")
			alert('이메일을 확인해 주세요.');
			return false;
		}
		 if($("input:checkbox[name=confirm]").is(":checked") == false) {
			alert('체크박스를 체크 해주세요.');
			return false;
		}
		console.log(form.user_hp);
	form.submit();
	}
	
	function checkid(){
		var form = document.joinForm;
		console.log(form);
		check = false;
		var id = form.user_id.value;
		console.log(form.user_id.value);
		if(id == ""||id==undefined||id==null){
			alert('아이디를 작성해주세요..');
		}else{
			$.ajax({
				url: contextPath + "/user/UserCheckIdOk.us?id="+id,
				type: 'get',
				dataType: 'text',
				success: function(data){
					if(data.trim() == 'ok'){/*
						$("#idCheck_text").text("사용할 수 있는 아이디입니다.");*/
						alert('사용 할 수있는 아이디 입니다..');
						check= true;
					}else{
						alert('사용할수 없는 아이디입니다.');
					}
				},
				error: function(){
					console.log("오류");
				}
			})
		}
	}
	

	
	
	
	
	
	
	
	
	
	
	
	