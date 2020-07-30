package com.onetrip.app.city;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.onetrip.action.Action;
import com.onetrip.action.ActionForward;
import com.onetrip.app.post.dao.PostDAO;

public class CityPostModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		PostDAO p_dao = new PostDAO();
		ActionForward forward = new ActionForward();
		
		int post_num = Integer.parseInt(request.getParameter("post_num"));
		int city_num = Integer.parseInt(request.getParameter("seq"));
		String post_contents = request.getParameter("post_contents");
		
		p_dao.updatePost(post_num, post_contents);
		forward.setRedirect(true);
		forward.setPath(request.getContextPath() + "/city/CityView.ci?seq="+city_num);
		
		return forward;
	}

}
