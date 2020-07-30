package com.onetrip.app.review_days;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onetrip.action.Action;
import com.onetrip.action.ActionForward;

import com.onetrip.app.destination.dao.DestinationBean;
import com.onetrip.app.destination.dao.DestinationDAO;
import com.onetrip.app.review_days.dao.Review_Days_Bean;
import com.onetrip.app.review_days.dao.Review_Days_DAO;


public class ReviewDetailViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");

		Review_Days_DAO rd_dao = new Review_Days_DAO();
		DestinationDAO d_dao = new DestinationDAO();
		
		int reviewDaysNum ;
		
		
		List<Integer> destinationNumList;
		ArrayList<DestinationBean> destinationBeanList = new ArrayList<>();
		
		
		
		HashMap<Integer,String> reviewphotoMap = new HashMap<>();
		
		int scheduleNum = Integer.parseInt(request.getParameter("seq"));
		int day = Integer.parseInt(request.getParameter("day"));
		
	
		List<Review_Days_Bean> reviewDaysBeanList = rd_dao.getReviewDays(day, scheduleNum);
		reviewDaysNum = rd_dao.getDaysNum(scheduleNum);
		
		destinationNumList = rd_dao.getDestNumList(day,scheduleNum);
		for (Integer destNum : destinationNumList) {
			destinationBeanList.add(d_dao.getDestinationDetail(destNum)); 
			
		}
		
		
		for(Review_Days_Bean rd_Bean : reviewDaysBeanList) {
		
		reviewphotoMap.put(rd_Bean.getReview_days_num(), rd_dao.getPhoto(day,scheduleNum,rd_Bean.getReview_days_num()));
		}
		String scheduleName =rd_dao.getReviewTitle(scheduleNum);
		
	System.out.println(destinationBeanList.size());
		if (reviewDaysBeanList != null) {
			request.setAttribute("seq", scheduleNum);
			request.setAttribute("day", day);
			request.setAttribute("destinationBeanList", destinationBeanList);
			request.setAttribute("reviewDaysNum", reviewDaysNum);
			request.setAttribute("reviewDaysBeanList", reviewDaysBeanList);
			request.setAttribute("reviewPhotoMap", reviewphotoMap);
			request.setAttribute("scheduleName", scheduleName);
			request.setAttribute("id",reviewDaysBeanList.get(0).getReview_days_user_id() );
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/review/review_detail_hong.jsp");
			return forward;
		}

		return null;
	}

}
