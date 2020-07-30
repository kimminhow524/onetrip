package com.onetrip.app.com_apply;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onetrip.action.Action;
import com.onetrip.action.ActionForward;
import com.onetrip.app.com_apply.dao.Com_Apply_DAO;

public class DeleteAcomOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		ActionForward forward = new ActionForward();
		Com_Apply_DAO dao = new Com_Apply_DAO();
		try {
			dao.deleteAcom(Integer.parseInt(request.getParameter("com_apply_num")));
		} catch (Exception e) {
			new RuntimeException(e);
			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=UTF-8");
			out.println("<script>");
			out.println("alert('다시 시도해 주세요.');");
			out.println("</script>");
			out.close();
			return null;
		}
		forward.setRedirect(true);
		forward.setPath(request.getContextPath()+"/app/mypage/mypage.jsp");
		return forward;
	}

}
