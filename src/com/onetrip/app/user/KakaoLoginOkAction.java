package com.onetrip.app.user;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.onetrip.action.Action;
import com.onetrip.action.ActionForward;
import com.onetrip.app.user.dao.UserBean;
import com.onetrip.app.user.dao.UserDao;

public class KakaoLoginOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		
		ActionForward forward = new ActionForward();
		UserDao user_dao = new UserDao();
		HttpSession session=request.getSession();
		
		String id=request.getParameter("kakao_Login_id");
		String en_pw=user_dao.encrypt("1234");
		
		if(id!=null) {
			
			Map<String, String> resultMap=user_dao.login(id, en_pw);
			
		if(resultMap!=null) {
			session.setAttribute("session_id", resultMap.get("USER_ID"));
			session.setAttribute("admin", resultMap.get("ADMIN"));
			forward.setPath(request.getContextPath() + "/index.jsp");
		}else{
			forward.setPath(request.getContextPath()+"/index.jsp?login=false");
		}
		}
		forward.setRedirect(true);
		return forward;
	

	}

}
