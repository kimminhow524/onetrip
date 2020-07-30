package com.onetrip.app.com_apply;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onetrip.action.Action;
import com.onetrip.action.ActionForward;

public class AcomFrontController extends HttpServlet {
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
		
		//동행목록
		if(command.equals("/app/plan/AcomList.acom")) {
			action= new AcomListAction();
			try {
				forward=action.execute(req, resp);
			}catch(Exception e) {
				System.out.println("AcomList.acom(프론트 컨트롤러) 오류"+ e);
			}
		//동행 목록 내 검색
		} else if(command.equals("/app/plan/AcomListByCity.acom")) {
			action = new AcomList_ByCityAction();
			try {
				forward=action.execute(req, resp);
			}catch(Exception e) {
				System.out.println("AcomListByCity.acom(프론트 컨트롤러) 오류"+e);
			}
		//동행신청
		}else if(command.equals("/app/plan/ApplyAcomOk.acom")) {
			action = new ApplyAcomOkAction();
			try {
				forward=action.execute(req, resp);
			}catch(Exception e) {
				System.out.println("ApplyAcomOk.acom(프론트 컨트롤러) 오류"+e);
			}
		//마이페이지로 이동
		}else if(command.equals("/app/mypage/Mypage.acom")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/mypage/mypage.jsp");
		}else if(command.equals("/app/mypage/DeleteAcomOk.acom")) {
			action=new DeleteAcomOkAction();
			try {
				forward=action.execute(req, resp);
			}catch(Exception e) {
				System.out.println("DeleteAcomOk.acom(프론트 컨트롤러) 오류"+e);
			}
		}else if(command.equals("/app/mypage/CancleAcomOk.acom")) {
			action=new CancleAcomOkAction();
			try {
				forward=action.execute(req, resp);
			}catch(Exception e) {
				System.out.println("CancleAcomOk.acom(프론트 컨트롤러) 오류"+e);
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
