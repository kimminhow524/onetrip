package com.onetrip.app.com_apply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onetrip.action.Action;
import com.onetrip.action.ActionForward;
import com.onetrip.app.com_apply.dao.Com_Apply_DAO;

public class AcomHostCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ActionForward forwrad = new ActionForward();
		Com_Apply_DAO dao = new Com_Apply_DAO();
		int acomNum=Integer.parseInt(request.getParameter("acomNum"));
		boolean confirm=request.getParameter("confirm")=="true"?true:false;
		
		dao.checkAcom_ByHost(acomNum, confirm);

		return null;
	}

}
