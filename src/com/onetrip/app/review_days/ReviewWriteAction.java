package com.onetrip.app.review_days;

import java.io.PrintWriter;
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

public class ReviewWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		Review_Days_DAO rd_dao = new Review_Days_DAO();
		DestinationDAO d_dao = new DestinationDAO();
		
		int reviewDaysNum ;
		
		
		List<Integer> destinationNumList;
		ArrayList<DestinationBean> destinationBeanList = new ArrayList<>();
		
		
		HashMap<Integer,String> reviewphotoMap = new HashMap<>();
		
		int scheduleNum = Integer.parseInt(request.getParameter("seq"));
		int day = Integer.parseInt(request.getParameter("day"));
		
		if(rd_dao.checkDayexist(day,scheduleNum)!=1) {
			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=UTF-8");
			out.println("<script>");
			out.println("alert('세부 일정이 존재하지 않는 일정입니다 일정을 확인해 주세요.');");
			out.println("</script>");
			out.close();
			
			return null;
			
		}
		
		List<Review_Days_Bean> reviewDaysBeanList = rd_dao.getReviewDays(day, scheduleNum);
		reviewDaysNum = rd_dao.getDaysNum(scheduleNum);
		
		destinationNumList = rd_dao.getDestNumList(day,scheduleNum);
		for (Integer destNum : destinationNumList) {
			destinationBeanList.add(d_dao.getDestinationDetail(destNum)); 
			
		}
	
		
		for(Review_Days_Bean rd_Bean : reviewDaysBeanList) {
		
		reviewphotoMap.put(rd_Bean.getReview_days_num(), rd_dao.getPhoto(day,scheduleNum,rd_Bean.getReview_days_num()));
		}
		
	
		if (reviewDaysBeanList != null) {
			request.setAttribute("seq", scheduleNum);
			request.setAttribute("day", day);
			request.setAttribute("destinationBeanList", destinationBeanList);
			request.setAttribute("reviewDaysNum", reviewDaysNum);
			request.setAttribute("reviewDaysBeanList", reviewDaysBeanList);
			request.setAttribute("reviewPhotoMap", reviewphotoMap);
			
			
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/review/review_write_hong.jsp");
			return forward;
		}

		return null;
	}

}
