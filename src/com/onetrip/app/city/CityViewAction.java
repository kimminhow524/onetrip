package com.onetrip.app.city;

import java.util.HashMap;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onetrip.action.Action;
import com.onetrip.action.ActionForward;
import com.onetrip.app.city.dao.CityBean;
import com.onetrip.app.city.dao.CityDAO;
import com.onetrip.app.destination.dao.DestinationBean;
import com.onetrip.app.destination.dao.DestinationDAO;
import com.onetrip.app.post.dao.PostBean;
import com.onetrip.app.post.dao.PostDAO;
import com.onetrip.app.post_detail.dao.Post_Detail_Bean;

public class CityViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");

		CityDAO c_dao = new CityDAO();
		PostDAO p_dao = new PostDAO();
		DestinationDAO d_dao = new DestinationDAO();
		
		
		
		
		
		
		

		
		CityBean c_bean = new CityBean();
		

		int city_num = Integer.parseInt(request.getParameter("seq"));

		c_bean = c_dao.getDetail(city_num);
		List<String> cityPhotoList = c_dao.getCityPhoto(city_num);
		
		List<DestinationBean> destinationBeanList = d_dao.destinationList(city_num);
		HashMap<Integer, Post_Detail_Bean> postDetail = new HashMap<>();
		
		
		
		String temp = request.getParameter("page");
		int page = temp == null ? 1 : Integer.parseInt(temp);
		int pageSize = 10;
		int totalCnt = p_dao.getPostCnt(city_num);
		
		int endRow = page * 10;
		int startRow = endRow - 9;
		
		int startPage = ((page - 1) / pageSize) * pageSize + 1;
		int endPage = startPage + 9;
		int totalPage = (totalCnt - 1) / pageSize + 1;
		
		endPage = endPage > totalPage ? totalPage : endPage;
		List<PostBean> postBeanList = p_dao.postList(city_num,startRow,endRow);
		
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("totalCnt", totalCnt);
		request.setAttribute("nowPage", page);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("postList", postBeanList);
		
		
		for (PostBean postBean : postBeanList) {
			postDetail.put(postBean.getPost_num(), p_dao.getPostDetail(postBean.getPost_num()));
		}
	
		if (c_bean != null) {
	
			request.setAttribute("cityBean", c_bean);
			if (postBeanList != null) {
				
				request.setAttribute("postBeanList", postBeanList);
				if (postDetail != null) {
					
					request.setAttribute("postDetail", postDetail);
				}
			}
			if (cityPhotoList != null) {
				request.setAttribute("cityPhotoList", cityPhotoList);
			}
			if (destinationBeanList != null) {
				request.setAttribute("destinationBeanList", destinationBeanList);
			}
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/destination/city_view_hong.jsp");
			return forward;
		}

		return null;

	}
}
