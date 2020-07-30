

function openPage(pageName, elmnt, color) {
   var i, tabcontent, tablinks;
   tabcontent = document.getElementsByClassName("tabcontent");
   for (i = 0; i < tabcontent.length; i++) {
      tabcontent[i].style.display = "none";
   }
   tablinks = document.getElementsByClassName("tablink");
   for (i = 0; i < tablinks.length; i++) {
      tablinks[i].style.backgroundColor = "";
   }
   document.getElementById(pageName).style.display = "block";
   elmnt.style.backgroundColor = color;
}
document.getElementById("defaultOpen").click();

function deleteAcom(seq){ 
    var check=confirm("동행 신청 내역을 삭제하시겠습니까?");
   if(check==true){location.replace(contextPath+"/app/mypage/DeleteAcomOk.acom?com_apply_num="+seq);}
}
function cancleAcom(seq){
   var check=confirm("동행 신청 내역을 취소하시겠습니까?");
   if(check==true){location.replace(contextPath+"/app/mypage/CancleAcomOk.acom?com_apply_num="+seq);}
   
}

function myComp(elmnt){
   openPage('myComp', elmnt, 'rgb(150, 160,200)');
   
   $.ajax({
      url:contextPath+'/app/mypage/acom_ajax.jsp',
      dataType:"json",
      cache:false,
      success:function(data){
         $("#myCompList").html("");
         if(data !=null){
            $.each(data.myAcomList, function(index,myAcomList){
               var items=[];
//               items.push("<a href='"+contextPath+"/app/plan/(해당일정으로 넘거가는 frontcontroller command)?(넘겨받을 키값 seq)="+myAcomList.SCHEDULE_NUM+"' class='image featured'>" +
               items.push("<a href='"+contextPath+"/app/plan/schedule_detail.jsp' class='image featured'>" +
                     "<img src='"+contextPath+"/cphoto/"+myAcomList.CITY_PHOTO_NAME+"' alt='이미지를 찾을 수 없습니다.'/></a>");
               var status="대기";
               switch(myAcomList.COM_APPLY_HOST_STATUS){
                  case 1: status="수락"; break;
                  case -1: status="거절";
               }
               items.push("<header><h3>"+myAcomList.SCHEDULE_NAME+"<br>");
               items.push("<a>동행 상태 ("+status+")</a></h3></header>");
                  var v = status=="거절"? "delete" : "cancle";
                  if(myAcomList.COM_APPLY_MEMBER_STATUS==-1){v="delete";}
                  items.push("<br><input type='button' onclick='"+v+"Acom("+myAcomList.COM_APPLY_NUM+")' value='"+v+"'>");
               $("<article/>",{html:items}).appendTo("#myCompList");
            });
         }else { 
            //목록이 없을 경우
            var items=[];
            items.push("<a href='"+contextPath+"/app/plan/AcomList.acom' class='image featured'>" +
                  "<img src='"+contextPath+"/app/images/pic04.jpg' alt='이미지를 찾을 수 없습니다.'/></a>");
            items.push("<header><h3>신청한 내역이 없습니다.<br>");
            items.push("<a href='"+contextPath+"/app/plan/AcomList.acom'>동행 구하러 가기</a></h3></header>");
            $("<article/>",{html:items}).appendTo("#myCompList");
         }
      
      },
      error: function(){
         console.log("오류");
      }
   });
   
   
}

