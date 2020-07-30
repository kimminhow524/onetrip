package com.onetrip.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.onetrip.action.Action;
import com.onetrip.action.ActionForward;

public class UserLogOutAction implements Action{
	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ActionForward forward= new ActionForward();
		HttpSession session=request.getSession();
		session.invalidate();
	
		forward.setRedirect(true);
		forward.setPath(request.getContextPath()+"/index.jsp");
		
		return forward;
		
	}
}
