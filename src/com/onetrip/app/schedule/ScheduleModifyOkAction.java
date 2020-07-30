package com.onetrip.app.schedule;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onetrip.action.Action;
import com.onetrip.action.ActionForward;
import com.onetrip.app.schedule.dao.ScheduleBean;
import com.onetrip.app.schedule.dao.ScheduleDAO;

public class ScheduleModifyOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		ScheduleDAO s_dao = new ScheduleDAO();
		ScheduleBean s_bean = new ScheduleBean();
				
		ActionForward forward = new ActionForward();
		
		//int schedule_num = Integer.parseInt(request.getParameter("seq"));
		//수정 버튼 seq=${scheduleBean.getschedule_num()}
		
		String schedule_name = request.getParameter("schedule_name");
		int schedule_city_num = Integer.parseInt(request.getParameter("schedule_city_num"));
		String schedule_departure = request.getParameter("schedule_departure");
		String schedule_arrival = request.getParameter("schedule_arrival");
		int schedule_term = Integer.parseInt(request.getParameter("schedule_term"));
		boolean schedule_open_check = Boolean.parseBoolean(request.getParameter("schedule_open_check"));
		char check='a';
		if(schedule_open_check) {
			check='0';
		}else {check='1';}
			
		s_bean.setSchedule_name(schedule_name);
		s_bean.setSchedule_city_num(schedule_city_num);
		s_bean.setSchedule_departure(schedule_departure);
		s_bean.setSchedule_arrival(schedule_arrival);
		s_bean.setSchedule_term(schedule_term);
		s_bean.setSchedule_open_check(check);
		
		s_dao.updateSchedule(s_bean);

		forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath(request.getContextPath() + "/schedule/ScheduleMyList.sc");
			
		return forward;
	}

}
