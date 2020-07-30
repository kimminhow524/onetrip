package com.onetrip.app.user;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.onetrip.action.Action;
import com.onetrip.action.ActionForward;
import com.onetrip.app.user.dao.UserDao;

public class UserLoginOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		UserDao u_dao=new UserDao();
		
		ActionForward forward= new ActionForward();
		HttpSession session=request.getSession();
		
		String id=request.getParameter("user_id");
		String en_pw=u_dao.encrypt(request.getParameter("user_pw"));
		Map<String, String> resultMap = u_dao.login(id, en_pw);
		if(resultMap!=null) {
			session.setAttribute("session_id", resultMap.get("USER_ID"));
			session.setAttribute("admin", resultMap.get("ADMIN"));
			forward.setPath(request.getContextPath() + "/index.jsp");
		}else{
			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=UTF-8");
			forward.setPath(request.getContextPath()+"/index.jsp?login=false");
		}
		
		forward.setRedirect(true);
		return forward;
	}

}
