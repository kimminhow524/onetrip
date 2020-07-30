package com.onetrip.app.plan;

import java.io.BufferedReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.onetrip.action.Action;
import com.onetrip.action.ActionForward;
import com.onetrip.app.city.dao.CityBean;
import com.onetrip.app.city.dao.CityDAO;
import com.onetrip.app.days.dao.DaysBean;
import com.onetrip.app.days.dao.DaysDAO;
import com.onetrip.app.days_detail.dao.Days_Detail_Bean;
import com.onetrip.app.days_detail.dao.Days_Detail_DAO;
import com.onetrip.app.destination.dao.DestinationDAO;
import com.onetrip.app.schedule.dao.ScheduleBean;
import com.onetrip.app.schedule.dao.ScheduleDAO;

public class PlanSubmitOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		ScheduleDAO s_dao = new ScheduleDAO();
		DaysDAO d_dao = new DaysDAO();
		CityDAO c_dao = new CityDAO();
		Days_Detail_DAO dd_dao = new Days_Detail_DAO();
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		StringBuffer json = new StringBuffer();
		BufferedReader reader = request.getReader();
		String line = null;
		while((line = reader.readLine()) != null){
			json.append(line);			
		}
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(json.toString());
		JSONObject data = (JSONObject) obj;

		try {
			ScheduleBean s_bean = new ScheduleBean();
			s_bean.setSchedule_name((String)data.get("title"));
			s_bean.setSchedule_city_num(1);
			s_bean.setSchedule_arrival((String)data.get("start"));
			s_bean.setSchedule_departure((String)data.get("end"));
			s_bean.setSchedule_user_id((String)session.getAttribute("session_id"));
			s_bean.setSchedule_term((int)(long)data.get("term"));
			s_dao.insertSchedule(s_bean);
			
			int s_num = s_dao.getScheduleSeq();
			
			JSONArray jarr = (JSONArray) data.get("days");
			int cnt = 0;
			for(int i = 0 ; i<jarr.size(); i++) {
				JSONObject jday = (JSONObject)jarr.get(i);
				if(cnt != (int)(long)jday.get("day")) {
					DaysBean day = new DaysBean();
					List<CityBean> c_list = c_dao.getCityListEQ((String)jday.get("city"));
					day.setDay_city_num(c_list.get(0).getCity_num());
					day.setDays_n((int)(long)jday.get("day"));
					day.setDays_schedule_num(s_num);
					d_dao.insertDays(day);
					cnt++;
				}
				Days_Detail_Bean dd_bean = new Days_Detail_Bean();
				dd_bean.setDays_detail_schedule_num(s_num);
				dd_bean.setDays_detail_order(Integer.parseInt((String)jday.get("order")));
				dd_bean.setDays_detail_destination_num(Integer.parseInt((String)jday.get("num")));
				dd_bean.setDays_detail_n((int)(long)jday.get("day"));
				dd_dao.insertDaysDetail(dd_bean);
			}
		} catch (Exception e) {
			out.println("not-ok");
			System.out.println("스케줄 등록실패");
			System.out.println(e);
		}
		out.println("ok");		
		
		return null;
	}

}
