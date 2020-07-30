package com.onetrip.app.city;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.onetrip.action.Action;
import com.onetrip.action.ActionForward;
import com.onetrip.app.city.dao.CityBean;
import com.onetrip.app.city.dao.CityDAO;

public class CityListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		CityDAO c_dao = new CityDAO();


		String keyword = request.getParameter("query");
		String temp = request.getParameter("temp");
		int page = temp == null ? 1 : Integer.parseInt(temp);
		int pageSize = 10;
	

	
		

		int startPage = ((page - 1) / pageSize) * pageSize + 1;
		int endPage = startPage + 9;
	

		
		List<CityBean> cityList = c_dao.getCityList(keyword);
		HashMap<Integer, List<String>> cityPhoto = new HashMap<>();
		for (CityBean cityBean : cityList) {
			List<String>cityPhotoList = c_dao.getCityPhoto(cityBean.getCity_num());
			
		
			if(cityPhotoList != null) {
			cityPhoto.put(cityBean.getCity_num(), cityPhotoList);
			}
			
		}
	
		
		request.setAttribute("nowPage", page);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("cityList", cityList);
		request.setAttribute("cityPhoto", cityPhoto);

		forward.setRedirect(false);
		
		forward.setPath("/app/destination/citysearch_hong.jsp");
		
		
		return forward;
	}

}
