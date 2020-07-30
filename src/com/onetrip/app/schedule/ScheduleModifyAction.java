package com.onetrip.app.schedule;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onetrip.action.Action;
import com.onetrip.action.ActionForward;
import com.onetrip.app.schedule.dao.ScheduleBean;
import com.onetrip.app.schedule.dao.ScheduleDAO;

public class ScheduleModifyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		ScheduleDAO s_dao = new ScheduleDAO();
		ScheduleBean s_bean = new ScheduleBean();
				
		ActionForward forward = new ActionForward();
		
		int schedule_num = Integer.parseInt(request.getParameter("seq"));
		//수정 버튼 seq=${scheduleBean.getschedule_num()}
		
		s_bean = s_dao.getDetail(schedule_num);
		request.setAttribute("scheduleBean", s_bean);
		
		forward.setRedirect(false);
		forward.setPath("/app/schedule/scheduleModify.jsp");
		//이름 수정 필요 (plan)
		
		return forward;
	}

}
