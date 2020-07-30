package com.onetrip.app.plan;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.onetrip.action.Action;
import com.onetrip.action.ActionForward;
import com.onetrip.app.destination.dao.DestinationBean;
import com.onetrip.app.destination.dao.DestinationDAO;

public class SearchDestOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		DestinationDAO d_dao = new DestinationDAO();
		String key = request.getParameter("search");
		List<DestinationBean> datas = d_dao.destinationSearch(key);
		JSONObject result = new JSONObject();
		JSONArray destList = new JSONArray();
		for(DestinationBean data : datas) {
			JSONObject jdata = new JSONObject();
			jdata.put("name", data.getDestination_name());
			jdata.put("long", data.getDestination_longitude());
			jdata.put("lati", data.getDestination_latitude());
			jdata.put("photo", data.getDestination_photo());
			jdata.put("cate", data.getDestination_category_A());
			jdata.put("num", data.getDestination_num());
			destList.add(jdata);
		}
		result.put("list", destList);
		
		out.println(result);
		
		return null; 
	}

}
