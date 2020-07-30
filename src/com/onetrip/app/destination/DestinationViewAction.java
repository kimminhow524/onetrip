package com.onetrip.app.destination;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onetrip.action.Action;
import com.onetrip.action.ActionForward;
import com.onetrip.app.destination.dao.DestinationBean;
import com.onetrip.app.destination.dao.DestinationDAO;

public class DestinationViewAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		DestinationDAO d_dao = new DestinationDAO();
		DestinationBean d_bean = new DestinationBean();
		
		int destination_num = Integer.parseInt(request.getParameter("seq"));
		
		d_bean = d_dao.getDetail(destination_num);
		
		
		if(d_bean != null) {
			request.setAttribute("DestinationBean", d_bean);
		
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/destination/destination_detail.jsp");
			return forward;
		}
		
		return null;
	}

}

