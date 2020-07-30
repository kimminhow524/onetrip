package com.onetrip.app.plan;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onetrip.action.Action;
import com.onetrip.action.ActionForward;
import com.onetrip.app.city.dao.CityBean;
import com.onetrip.app.city.dao.CityDAO;
import com.onetrip.app.destination.dao.DestinationDAO;

public class PlanViewDetailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		DestinationDAO d_dao = new DestinationDAO();
		CityDAO c_dao = new CityDAO();
		ActionForward forward = new ActionForward();
		String[] names = request.getParameter("plan_value").split(",");	
		String[] days = request.getParameter("plan_value2").split(",");
		String trip_name = request.getParameter("trip_name");
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date start_date = format.parse((String)request.getParameter("start_date"));
		Calendar cal = Calendar.getInstance();
		
		ArrayList<String> cityDays = new ArrayList<>();
		//일자에 따른 도시이름 생성
		for (int i = 0; i < days.length; i++) {
			int dayLen = Integer.parseInt(days[i].replace("일", ""));
			for(int j = 0; j< dayLen;j++) {
				cityDays.add(names[i]);
			}
		}
		
		request.setAttribute("dayList", cityDays);
		request.setAttribute("trip_name", trip_name);
		request.setAttribute("start_date", new java.sql.Date(start_date.getTime()));
		cal.setTime(start_date);
		cal.add(Calendar.DATE, cityDays.size());
		Date end_date = cal.getTime();
		request.setAttribute("end_date", new java.sql.Date(end_date.getTime()));
		
		List<CityBean> list = c_dao.getCityList(names[0]);
		int[] cityNums = new int[list.size()];
		int cnt = 0;
		for(CityBean data : list) {
			cityNums[cnt++] = data.getCity_num();
		}
		request.setAttribute("dest_list", d_dao.destinationList(cityNums[0]));
		
		forward.setRedirect(false);
		forward.setPath("/app/plan/plan_view.jsp");
		return forward;
	}

}
