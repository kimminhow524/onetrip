package com.onetrip.app.review_days;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.onetrip.action.Action;
import com.onetrip.action.ActionForward;
import com.onetrip.app.review_days.dao.Review_Days_DAO;
import com.onetrip.app.review_days.dao.Review_PhotoDAO;
import com.onetrip.app.review_photo.dao.Review_Photo_Bean;

public class ReviewDeleteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		Review_Days_DAO rd_dao =new Review_Days_DAO();
		Review_PhotoDAO rp_dao =new Review_PhotoDAO();
		
		ActionForward forward = new ActionForward();
		
		int scheduleNum = Integer.parseInt(request.getParameter("seq"));
		
		String saveFolder = "C:\\web4_1500_hys\\workspace\\onetrip\\WebContent\\appupload";
		for(Review_Photo_Bean photo : rd_dao.getPhotoList(scheduleNum)) {
			File f = new File(saveFolder + "\\" + photo.getReview_photo_name());
			if(f.exists()) {f.delete();}
		}
		rp_dao.deleteFiles(scheduleNum);
		rd_dao.deleteReview(scheduleNum);
		
		
		forward.setRedirect(true);
		forward.setPath(request.getContextPath() + "/index.jsp");
	
		return forward;
	}

}
