package com.onetrip.app.plan;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onetrip.action.Action;
import com.onetrip.action.ActionForward;
import com.onetrip.app.city.dao.CityBean;
import com.onetrip.app.city.dao.CityDAO;
import com.onetrip.app.city_photo.dao.City_Photo_Bean;
import com.onetrip.app.city_photo.dao.City_Photo_DAO;

public class PlanViewAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		
		CityDAO c_dao = new CityDAO();
		City_Photo_DAO p_dao = new City_Photo_DAO();
		List<CityBean> datas = c_dao.getListAll();
		ArrayList<City_Photo_Bean> p_datas = new ArrayList<>();
		for(CityBean data : datas) {
			p_datas.add(p_dao.getCityPhoto(data.getCity_num()));
		}
		request.setAttribute("cityList", datas);
		request.setAttribute("photoList", p_datas);
		forward.setRedirect(false);
		forward.setPath("/app/plan/plan.jsp");
		return forward;
	}

}
