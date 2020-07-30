package com.onetrip.app.schedule;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onetrip.action.Action;
import com.onetrip.action.ActionForward;

public class ScheduleFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;
		
		//나의 일정 리스트
		if(command.equals("/schedule/ScheduleMyList.sc")) {
			action = new ScheduleMyListAction();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				System.out.println(e);
			}
			
		//일정 작성(스케줄)
		}else if(command.equals("/schedule/ScheduleWrite.sc")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/schedule/ScheduleWrite.jsp"); 
			//이름 수정(plan)
			
		//일정 작성(Days&Detail) -> Days 작성하는것인가? Detail 만?
		}else if(command.equals("/schedule/ScheduleWrite_Detail.sc")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/schedule/ScheduleWrite_Detail.jsp"); 
			//이름 수정(plan_view)
			
		//스케줄 삭제
		}else if(command.equals("/schedule/ScheduleDeleteOk.sc")) {
			action = new ScheduleDeleteOkAction();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				System.out.println(e);
			}
			
		//스케줄 수정
		}else if(command.equals("/schedule/ScheduleModify.sc")) {
			action = new ScheduleModifyAction();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				System.out.println(e);
			}
			
		//스케줄 수정 OK
		}else if(command.equals("/schedule/ScheduleModifyOk.sc")) {
			action = new ScheduleModifyOkAction();
			try {
				action.execute(req, resp);
			} catch (Exception e) {
				System.out.println(e);
			}
			
		//스케줄 작성 OK
		}else if(command.equals("/schedule/ScheduleWriteOk.sc")) {
			action = new ScheduleWriteOkAction();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				System.out.println(e);
			}
		}else {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/error/404.jsp");
		}
		
		if(forward != null) {
			if(forward.isRedirect()) {
				resp.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispatcher = req.getRequestDispatcher(forward.getPath());
				dispatcher.forward(req, resp);
			}
		}
	}
	
	
}
