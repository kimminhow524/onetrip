package com.onetrip.app.schedule;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onetrip.action.Action;
import com.onetrip.action.ActionForward;
import com.onetrip.app.days.dao.DaysDAO;
import com.onetrip.app.days_detail.dao.Days_Detail_DAO;
import com.onetrip.app.schedule.dao.ScheduleDAO;

public class ScheduleDeleteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		ScheduleDAO s_dao = new ScheduleDAO();
		DaysDAO d_dao = new DaysDAO();
		Days_Detail_DAO dt_dao= new Days_Detail_DAO();
		
		ActionForward forward = new ActionForward();
		
		int schedule_num = Integer.parseInt(request.getParameter("seq"));
		//삭제 버튼 seq=${scheduleBean.getschedule_num()}
		
		s_dao.deleteSchedule(schedule_num);
		d_dao.deleteDays(schedule_num);// Days db에는 days_schedule_num
		dt_dao.deleteDaysDetail(schedule_num); // Days_detail db에는 days_detail_schedule_num
		
		forward.setRedirect(true);
		forward.setPath(request.getContextPath() + "/schedule/ScheduleMyList.sc");
			
		return forward;
	}

}
