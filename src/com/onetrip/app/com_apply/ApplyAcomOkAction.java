package com.onetrip.app.com_apply;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.onetrip.action.Action;
import com.onetrip.action.ActionForward;
import com.onetrip.app.com_apply.dao.Com_Apply_Bean;
import com.onetrip.app.com_apply.dao.Com_Apply_DAO;

public class ApplyAcomOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		Com_Apply_DAO dao= new Com_Apply_DAO();
		Com_Apply_Bean bean= new Com_Apply_Bean();
		
		
		int schedule_num=Integer.parseInt(request.getParameter("schedule_num"));
		bean.setCom_apply_days_n(Integer.parseInt(request.getParameter("daysN")));
		bean.setCom_apply_schedule_num(schedule_num);
		bean.setCom_apply_member_id((String)session.getAttribute("session_id"));
		
		int check=dao.checkAcomDup(bean);
		if(check>1) {
			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=UTF-8");
			out.println("<script>");
			out.println("alert('이미 신청하셨습니다.');");
			out.println("</script>");
			out.close();
			return null;
		}
		
		bean.setCom_apply_host_id(request.getParameter("host"));
		
		try {
			dao.applyAcom(bean);
		} catch (Exception e) {
			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=UTF-8");
			out.println("<script>");
			out.println("alert('동행 신청 실패. 잠시 후 다시 시도해주세요.');");
			out.println("</script>");
			out.close();
			e.printStackTrace();
		}
		
		request.setAttribute("applycheck", "true");
		forward.setRedirect(true);
		forward.setPath(request.getContextPath()+"/app/plan/schedule_detail.jsp?seq="+schedule_num);
		return forward;
	}

}
