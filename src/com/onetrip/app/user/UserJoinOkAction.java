package com.onetrip.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onetrip.action.Action;
import com.onetrip.action.ActionForward;
import com.onetrip.app.user.dao.UserBean;
import com.onetrip.app.user.dao.UserDao;

public class UserJoinOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		boolean check = false;
		UserDao u_dao = new UserDao();
		UserBean user = new UserBean();
		ActionForward forward = new ActionForward();
		
		user.setUser_id(request.getParameter("user_id"));
		String en_pw = u_dao.encrypt(request.getParameter("user_pw"));
		user.setUser_pw(en_pw);
		user.setUser_age(Integer.parseInt(request.getParameter("user_age")));
		user.setUser_name(request.getParameter("user_name"));
		user.setUser_gender(request.getParameter("user_gender").equals("man") ? "남자" : "여자");
		user.setUser_email(request.getParameter("user_email"));
		user.setUser_address(request.getParameter("user_address"));
		user.setUser_hp(request.getParameter("user_hp"));
//		System.out.println(user.getUser_hp());
		user.setUser_photo("");
		user.setUser_login_type(Integer.parseInt("0"));
		// 유저 사진 받아온뒤 temp로 일시적으로 보내야함. jstl 문 내부에서 저장 공간으로 보내줘야 함.
		// 사진이 있으면 보내주고 null이면 default사진 출력
		check = u_dao.join(user);


		if (!check) {
			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=UTF-8");
			out.println("<script>");
			out.println("alert('회원가입 실패. 잠시 후 다시 시도해주세요.');");
			out.println("</script>");
			out.close();
		}
		forward.setRedirect(true);
		forward.setPath(request.getContextPath() + "/index.jsp");
		return forward;

	}
}
