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

public class KakaojoinOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");

		ActionForward forward = new ActionForward();
		boolean check = false;
		UserDao user_dao = new UserDao();
		UserBean user = new UserBean();
		
		
		String id=request.getParameter("kakao_id");
		String age_range = request.getParameter("age_range");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String nickname = request.getParameter("nickname");
		String profile_image = request.getParameter("profile_image_url");
		profile_image.substring(5, profile_image.length());
		int age = Integer.parseInt(age_range.split("~")[0]);
		
		user.setUser_age(age);
		user.setUser_email(email);
		user.setUser_gender(gender.equals("male") ? "남자" : "여자");
		user.setUser_name(nickname);
		user.setUser_id(id);
		user.setUser_photo(profile_image);
		String en_pw=user_dao.encrypt("1234");
		user.setUser_pw(en_pw);
		user.setUser_address("주소없음");
		user.setUser_hp("00000000000");
		user.setUser_login_type(Integer.parseInt("1"));
		
		if(user_dao.check_Id(id)) {
			forward.setRedirect(true);
			forward.setPath(request.getContextPath() + "/index.jsp?login=false");
			return forward;

		}
		
		check=user_dao.join(user);		

		HttpSession session=request.getSession();
		session.invalidate();
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
