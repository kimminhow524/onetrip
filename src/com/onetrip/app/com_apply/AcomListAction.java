package com.onetrip.app.com_apply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.onetrip.action.Action;
import com.onetrip.action.ActionForward;
import com.onetrip.app.com_apply.dao.Com_Apply_DAO;

public class AcomListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		ActionForward forward = new ActionForward();
		Com_Apply_DAO acom_dao = new Com_Apply_DAO();

		String temp = request.getParameter("page");
		int page = temp == null ? 1 : Integer.parseInt(temp);
		int pageSize=12;

		int totalCnt=acom_dao.getListCnt();
		
		int endRow = page*pageSize;
		int startRow = endRow-pageSize+1;
		
		int startPage = ((page - 1) / pageSize) * pageSize + 1;
		int endPage = startPage + 9;
		int totalPage = (totalCnt - 1) / pageSize + 1;
		
		endPage = endPage > totalPage ? totalPage : endPage;
		
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("totalCnt", totalCnt);
		request.setAttribute("nowPage", page);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("boardList",acom_dao.getAcomList(startRow, endRow));
		
		forward.setRedirect(false);
		forward.setPath("/app/plan/companionList.jsp");
		
		return forward;
	}

}
