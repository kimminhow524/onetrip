package com.onetrip.app.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onetrip.action.Action;
import com.onetrip.action.ActionForward;

//TODO
//컨트롤러 업데이트/action들 path업데이트/사진관련된 것들은 아직 안만들어서 추가 해야됨.
public class UserFrontController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());

		ActionForward forward = null;
		Action action = null;
		
		if (command.equals("/user/UserLogOut.us")) { // 로그아웃
			action = new UserLogOutAction();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				System.out.println(e);
			}}else if (command.equals("/user/UserJoinOk.us")) { // 회원가입
				action = new UserJoinOkAction();
				try {
					forward = action.execute(req, resp);
				} catch (Exception e) {
					System.out.println(e);
				}
			
		} else if (command.equals("/user/UserLogOut.us")) { // 로그아웃
			action = new UserLogOutAction();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				System.out.println(e);
			}
		}else if(command.equals("/user/UserCheckIdOk.us")) { //중복확인 
			action = new UserCheckIdOkAction();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				System.out.println(e);
			}
		}else if (command.equals("/user/Useridentity.us")) { // 본인 인증 
			action = new UserIdentityOkAction();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				System.out.println(e);
			}
		}else if (command.equals("/user/Userinfo.us")) { // 유저정보 보기 
			action = new UserInfoAction();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				System.out.println(e);
			}
			}else if (command.equals("/user/UpdateuserInfo.us")) { // 개인정보 변경 
				action = new UserUpdate_UserInfoOkAction();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				System.out.println(e);
			}
		}else if (command.equals("/user/Deleteuser.us")) { // 회원탈퇴 
			action = new UserDeleteUserAction();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				System.out.println(e);
			}
		}else if(command.equals("/User/KakaojoinOk.us")) {//카카오 회원가입
			action = new KakaojoinOkAction();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				System.out.println(e);
			}
		}else if(command.equals("/User/KakaoLogin.us")) {//카카오 로그인
			action = new KakaoLoginOkAction();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				System.out.println(e);
			}
		}else if(command.equals("/user/UserLoginOkAction.us")) {
			action = new UserLoginOkAction();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				System.out.println(e);
			}
		}else{
			System.err.println("err");
			
		}
		
		

		// 일괄처리
		if (forward != null) {
			if (forward.isRedirect()) {
				resp.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispather = req.getRequestDispatcher(forward.getPath());
				dispather.forward(req, resp);
			}
		}

	}
}
