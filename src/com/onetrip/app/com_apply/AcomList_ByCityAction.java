package com.onetrip.app.com_apply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.onetrip.action.Action;
import com.onetrip.action.ActionForward;
import com.onetrip.app.com_apply.dao.Com_Apply_DAO;

public class AcomList_ByCityAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		ActionForward forward = new ActionForward();
		Com_Apply_DAO acom_dao = new Com_Apply_DAO();

		HttpSession session = request.getSession();

		int city_num;
		System.out.println(request.getParameter("query"));
		try {
			if(request.getParameter("query")==null) {
				city_num=(int)session.getAttribute("search");
			}else {
				//검색결과가 없을 경우 IndexOfBounds exception 발생
				city_num = acom_dao.checkCityNum(request.getParameter("query")).get(0);
				session.setAttribute("search", city_num);
			}
		} catch (Exception e) {
			request.setAttribute("boardList",null);
			forward.setRedirect(false);
			forward.setPath("/app/plan/companionListByCity.jsp");
			return forward;
		}

		String temp = request.getParameter("page");
		int page = temp == null ? 1 : Integer.parseInt(temp);
		
		int pageSize=12;
		int totalCnt=acom_dao.getSearchListCnt(city_num);
		
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
		
		request.setAttribute("boardList",acom_dao.getAcomByCity(startRow, endRow, city_num));
		
		forward.setRedirect(false);
		forward.setPath("/app/plan/companionListByCity.jsp");
		
		return forward;
	}

}
