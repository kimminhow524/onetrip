package com.onetrip.app.city;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onetrip.action.Action;
import com.onetrip.action.ActionForward;

import com.onetrip.app.destination.dao.DestinationBean;
import com.onetrip.app.destination.dao.DestinationDAO;


public class CityDestinationViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");

		DestinationDAO d_dao = new DestinationDAO();
		
		DestinationBean d_bean = new DestinationBean();
		
		System.out.println("seq 못 받아옴");
		System.out.println(request.getParameter("seq"));
		int destination_num = Integer.parseInt(request.getParameter("seq"));
		System.out.println("seq 받아옴");
		d_bean = d_dao.getDestinationDetail(destination_num);
		
		if (d_bean != null) {
	
			request.setAttribute("destinationBean", d_bean);
			
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/destination/destination_detail_hong.jsp");
			return forward;
		}

		return null;

	}

}
