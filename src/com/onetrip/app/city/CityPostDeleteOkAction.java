package com.onetrip.app.city;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.onetrip.action.Action;
import com.onetrip.action.ActionForward;
import com.onetrip.app.post.dao.PostDAO;

public class CityPostDeleteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		PostDAO p_dao = new PostDAO();
		ActionForward forward = new ActionForward();
		
		int city_num = Integer.parseInt(request.getParameter("seq"));
		int post_num = Integer.parseInt(request.getParameter("post_num"));
		
		p_dao.deleteOnePost(post_num);
		
		forward.setRedirect(true);
		forward.setPath(request.getContextPath() + "/city/CityView.ci?seq="+city_num);
		
		return forward;
	}
}
