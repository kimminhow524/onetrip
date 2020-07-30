/**
 * 
 */
     
         function postClick(){
        var comment = window.document.cityPostWrite.nl_comment;
        
        comment.onclick = function(){
           alert("로그인 후 다시 시도해주세요.");
        }
      }
         postClick();