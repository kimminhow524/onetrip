package com.onetrip.app.review_days;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onetrip.action.Action;
import com.onetrip.action.ActionForward;


public class ReviewFrontController extends HttpServlet {
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

		if (command.equals("/review/ReviewDetailView.re")) {

			action = new ReviewDetailViewAction();

			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				System.out.println(e);
			}

		} else if (command.equals("/review/ReviewWrite.re")) {
			action = new ReviewWriteAction();

			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				System.out.println(e);
			}

		} else if (command.equals("/review/ReviewWriteOk.re")) {

			action = new ReviewWriteOkAction();
			
			try {
				forward = action.execute(req, resp);
				
			} catch (Exception e) {
				System.out.println(e);
			}
//
	/*	} else if (command.equals("/city/CityView.ci")) {

			action = new CityViewAction();

			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				System.out.println(e);
			}

		} else if (command.equals("/city/CityDestinationView.ci")) {
			action = new CityDestinationViewAction();
			try {
				forward=action.execute(req, resp);
			} catch (Exception e) {
				System.out.println(e);
			}
		} else if (command.equals("/city/CityPostOk.ci")) {
			action = new CityPostOkAction();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				System.out.println(e);
			}
		} else if (command.equals("/city/CityPostDeleteOk.ci")) {
			action = new CityPostDeleteOkAction();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				System.out.println(e);
			}*/
//		} else if (command.equals("/board/BoardDeleteOk.bo")) {
////			action = new BoardDeleteOkAction();
//			try {
//				forward = action.execute(req, resp);
//			} catch (Exception e) {
//				System.out.println(e);
//			}
//		} else if (command.equals("/board/BoardModify.bo")) {
////			action = new BoardModifyAction();
//			try {
//				forward = action.execute(req, resp);
//			} catch (Exception e) {
//				System.out.println(e);
//			}
//		} else if (command.equals("/board/BoardModifyOk.bo")) {
////			action = new BoardModifyOkAction();
//			try {
//				forward = action.execute(req, resp);
//			} catch (Exception e) {
//				System.out.println(e);
//			}
	/*	} else if (command.equals("/city/CityPostModifyOk.bo")) {
			action = new CityPostModifyOkAction();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				System.out.println(e);
			}*/
		} else {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/error/404.jsp");
		}
		
		if (forward != null) {
			if (forward.isRedirect()) {
			
				resp.sendRedirect(forward.getPath());
			} else {
				
				RequestDispatcher dispatcher = req.getRequestDispatcher(forward.getPath());
				dispatcher.forward(req, resp);
			}
		}
	}
}
