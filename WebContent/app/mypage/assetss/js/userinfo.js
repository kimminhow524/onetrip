/*
 * ^^ 
 * 
 */
//사진 테스트 중
var file = document.querySelector('.uphoto');

file.onchange = function(){
    var fileList = file.files ;

    // 읽기
    var reader = new FileReader();
    reader.readAsDataURL(fileList [0]);

    // 로드 한 후
    reader.onload = function  () {
        document.querySelector('#preview').src = reader.result ;
    };
};


// 유저정보 불러오기

function loadMyInfo(id) {
$.ajax({
	url: contextPath + "/user/Userinfo.us?id="+id,
	type: 'post',
	dataType: 'json',
	success: function(data){
		document.getElementById('name').placeholder=data.name;
		document.getElementById('gender').innerHTML=data.gender;
		document.getElementById('age').placeholder=data.age;
		document.getElementById('address').placeholder=data.address;
// $('#gender').val(data.gender);
// $('#age').val(data.age);
// $('#address').val(data.address);
	
		if(data.photo != null ||data.photo != undefined){
			if(loginType==1){
				$('#preview').attr("src",data.photo); 
			}else{
			
			$('#preview').attr("src", `${contextPath}/app/mypage/userPhoto/${data.photo}`);
			}
		}
		
	},
	error: function(){
		
		console.log("오류");
	}
}

)

}
function delUser() {
	var form = $("#delForm");
	console.log(form.action);
	var check=confirm("진짜루 탈퇴하실건가요?");
	if(check){
		form.submit();
	}else{
		return false;
	}
	
}

