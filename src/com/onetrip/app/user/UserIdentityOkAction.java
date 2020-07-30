package com.onetrip.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.onetrip.action.Action;
import com.onetrip.action.ActionForward;
import com.onetrip.app.user.dao.UserDao;

public class UserIdentityOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		UserDao u_dao=new UserDao();
		
		ActionForward forward= new ActionForward();
		HttpSession session=request.getSession();
		
		String en_pw= u_dao.encrypt(request.getParameter("pw"));
		String userid = (String)session.getAttribute("session_id");
		String id= u_dao.user_Identity(en_pw,userid);
		if (userid.equals(id)) {
			forward.setRedirect(true);
			forward.setPath(request.getContextPath() + "/app/mypage/mypage.jsp");
		}else {
			forward.setRedirect(true);
			forward.setPath(request.getContextPath() + "/index.jsp?login=false");
		}
		
		return forward;
	}

}
