package com.onetrip.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.onetrip.action.Action;
import com.onetrip.action.ActionForward;
import com.onetrip.app.user.dao.UserBean;
import com.onetrip.app.user.dao.UserDao;

public class UserInfoAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		UserDao u_dao = new UserDao();
		UserBean u = new UserBean();

		// 이름, 아이디 , 성별, 나이, 주소
		String id = request.getParameter("id");
		u = u_dao.myinfo(id);

		JSONObject info = new JSONObject();

		info.put("name", u.getUser_name());
		info.put("photo", u.getUser_photo());
		info.put("gender", u.getUser_gender());
		info.put("age", u.getUser_age());
		info.put("address", u.getUser_address());
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(info);
		out.flush();
		out.close();
		return null;
	}

}
