package com.onetrip.app.main;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.onetrip.action.Action;
import com.onetrip.action.ActionForward;
import com.onetrip.app.city.dao.CityBean;
import com.onetrip.app.city.dao.CityDAO;
import com.onetrip.app.city_photo.dao.City_Photo_Bean;
import com.onetrip.app.city_photo.dao.City_Photo_DAO;
import com.onetrip.app.days.dao.DaysDAO;
import com.onetrip.app.days_detail.dao.Days_Detail_DAO;
import com.onetrip.app.review_days.dao.Review_Days_DAO;
import com.onetrip.app.schedule.dao.ScheduleBean;
import com.onetrip.app.schedule.dao.ScheduleDAO;

public class MainReviewOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		ScheduleDAO s_dao = new ScheduleDAO();
		PrintWriter out = response.getWriter();
		CityDAO c_dao = new CityDAO();
		DaysDAO d_dao = new DaysDAO();
		City_Photo_DAO cp_dao = new City_Photo_DAO();
		List<ScheduleBean> datas = s_dao.getScheduleList();
		List<CityBean> c_datas = c_dao.getListAll();
		JSONObject result = new JSONObject();
		JSONArray schList = new JSONArray();
		JSONArray cityList = new JSONArray();
		for(ScheduleBean data : datas) {
			int cityNum = d_dao.getDaysFirstCity(data.getSchedule_num());
			JSONObject jdata = new JSONObject();
			jdata.put("title",data.getSchedule_name());
			jdata.put("photo",c_dao.getCityPhoto(cityNum));
			schList.add(jdata);
			System.out.println(cityNum);
		}
		
		for(CityBean city :c_datas) {
			JSONObject jdata = new JSONObject();
			City_Photo_Bean photo = cp_dao.getCityPhoto(city.getCity_num());
			jdata.put("name", city.getCity_name());
			jdata.put("photo", photo.getCity_photo_name());
			jdata.put("num", city.getCity_num());
			cityList.add(jdata);
		}
		
		result.put("list", schList);
		result.put("city", cityList);
		System.out.println("json11111");
		out.println(result);
		
		return null;
	}

}
