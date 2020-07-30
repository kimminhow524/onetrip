package com.onetrip.app.city;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.onetrip.action.Action;
import com.onetrip.action.ActionForward;
import com.onetrip.app.post.dao.PostBean;
import com.onetrip.app.post.dao.PostDAO;
import com.onetrip.app.post_detail.dao.Post_Detail_Bean;

public class CityPostOkAction implements Action {

	public static boolean check = false;

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		ActionForward forward = null;

		HttpSession session = request.getSession();
		PostDAO p_dao = new PostDAO();
		PostBean p_bean = new PostBean();
		
		
		
		int city_num = Integer.parseInt(request.getParameter("seq"));
		String member_id = (String) session.getAttribute("session_id");
		String post_contents = request.getParameter("comment");
		System.out.println(post_contents);
		if (post_contents!=null) {
			
			p_bean.setPost_user_id(member_id);
			p_bean.setPost_city_num(city_num);
			check = true;

			if (p_dao.insertPost(p_bean,post_contents)) {
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath(request.getContextPath() + "/city/CityView.ci?seq=" + city_num);
			}
		} else {
			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=utf-8");
			out.println("<script>");
			out.println("alert('내용을 입력하세요'); history.back();");
			out.println("</script>");
			out.close();
		}
		return forward;
	}

}
