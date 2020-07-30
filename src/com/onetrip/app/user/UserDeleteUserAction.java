package com.onetrip.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.onetrip.action.Action;
import com.onetrip.action.ActionForward;
import com.onetrip.app.user.dao.UserDao;

public class UserDeleteUserAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String id= request.getParameter("user_id");
		

		UserDao u_dao=new UserDao();
		HttpSession session=request.getSession();
		ActionForward forward = new ActionForward();
		
		u_dao.delete_user(id);
		session.invalidate();
		
		forward.setRedirect(true);
		forward.setPath(request.getContextPath() + "/index.jsp?del=true");
	
		return forward;
	}

}
