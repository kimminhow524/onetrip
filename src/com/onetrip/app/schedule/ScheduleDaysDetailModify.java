package com.onetrip.app.schedule;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onetrip.action.Action;
import com.onetrip.action.ActionForward;
import com.onetrip.app.days.dao.DaysDAO;
import com.onetrip.app.days_detail.dao.Days_Detail_Bean;
import com.onetrip.app.days_detail.dao.Days_Detail_DAO;
import com.onetrip.app.schedule.dao.ScheduleDAO;

public class ScheduleDaysDetailModify implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		ScheduleDAO s_dao = new ScheduleDAO();
		DaysDAO d_dao = new DaysDAO();
		Days_Detail_DAO dt_dao = new Days_Detail_DAO();
		Days_Detail_Bean dt_bean = new Days_Detail_Bean();
		
		ActionForward forward = new ActionForward();
		
		int schedule_num = Integer.parseInt(request.getParameter("seq"));
		//수정 버튼 seq=${scheduleBean.getschedule_num()}
		
		// schedule_num, days_n 가져와서 목적지, 순서 수정 
		
		
		
		return forward;
	}

}
