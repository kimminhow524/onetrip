package com.onetrip.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onetrip.action.Action;
import com.onetrip.action.ActionForward;
import com.onetrip.app.user.dao.UserDao;

import jdk.nashorn.internal.runtime.Undefined;

public class UserCheckIdOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		UserDao u_dao = new UserDao();
		String id = request.getParameter("id");
		PrintWriter out = response.getWriter();
		if(u_dao.check_Id(id)) {
			out.println("not-ok");
		}else {
			out.println("ok");
		}
		out.close();
		return null;
	}

}
