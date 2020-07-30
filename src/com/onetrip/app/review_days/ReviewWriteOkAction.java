package com.onetrip.app.review_days;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.onetrip.action.Action;
import com.onetrip.action.ActionForward;
import com.onetrip.app.city.dao.CityDAO;
import com.onetrip.app.destination.dao.DestinationBean;
import com.onetrip.app.destination.dao.DestinationDAO;
import com.onetrip.app.review_days.dao.Review_Days_Bean;
import com.onetrip.app.review_days.dao.Review_Days_DAO;
import com.onetrip.app.review_days.dao.Review_PhotoDAO;
import com.onetrip.app.review_photo.dao.Review_Photo_Bean;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ReviewWriteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		
		
		ActionForward forward = new ActionForward();
		
//		servlet.com/cos : 파일 업로드 라이브러리
//		requset.getServletContext().getRealPath("/") : 서버 경로
		String saveFolder = "C:\\web4_1500_hys\\workspace\\onetrip\\WebContent\\appupload";
		int fileSize = 5 * 1024 * 1024;	//5M
		boolean b_result = false;
		boolean f_result = false;
		boolean dupCheck = false;
		
		Review_PhotoDAO rp_dao =new Review_PhotoDAO();
		Review_Days_DAO rd_dao = new Review_Days_DAO();
		DestinationDAO d_dao =new DestinationDAO();
		
		try {
			MultipartRequest multi = null;
			
			multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
			int daysNum=Integer.parseInt(multi.getParameter("daysnum"));
			int day = Integer.parseInt(multi.getParameter("day"));
			int recommendCnt =Integer.parseInt(multi.getParameter("recommendCnt"));
			String user_id =multi.getParameter("user_id");
			for(int i =1; i<=recommendCnt; i++) {
				int recommendDestNum = Integer.parseInt(multi.getParameter("destRecommend"+i));
				if(rd_dao.recommendCheck(user_id,recommendDestNum)) {
					DestinationBean destination = new DestinationBean();
					destination = d_dao.getDestinationDetail(recommendDestNum);
					String destinationName = destination.getDestination_name();
					PrintWriter out = response.getWriter();
					response.setContentType("text/html;charset=UTF-8");
					out.println("<script>");
					out.println("alert('이미 추천하신 관광지 입니다 :"+destinationName+" ');");
					out.println("</script>");
					out.close();
				}else {
				rd_dao.updateRecommend(user_id,recommendDestNum);
				d_dao.updateRecommendCnt(recommendDestNum);
				}
			}
			
			int scheduleNum =Integer.parseInt(multi.getParameter("seq"));
			
			for (int i = 1; i <= daysNum ; i++) {
				dupCheck = dupCheckAction(i,day,scheduleNum);
				Review_Days_Bean rd_bean = new Review_Days_Bean();
				
				rd_bean.setReview_days_content((String)multi.getParameter("demo-message"+i));
				rd_bean.setReview_days_n(day);
				rd_bean.setReview_days_num(i);
				rd_bean.setReview_days_open_check(Integer.parseInt(multi.getParameter("demo-priority")));
				rd_bean.setReview_days_schedule_num(scheduleNum);
				rd_bean.setReview_days_title((String)multi.getParameter("demo-name"+i));
				rd_bean.setReview_days_user_id((String)user_id);
				if(dupCheck) {
				b_result = rd_dao.updateReview(rd_bean);
				}else {
				b_result = rd_dao.insertReview(rd_bean);
				}
				f_result = rp_dao.insertPhoto(multi,day,scheduleNum,i);
				
			
			
			
			}
		
			System.out.println("forwarding");
			forward.setRedirect(true);
			forward.setPath(request.getContextPath() + "/review/ReviewWrite.re?seq="+scheduleNum+"&day="+day);
			return forward;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

	private boolean dupCheckAction(int i, int day, int scheduleNum) {
		Review_Days_DAO rd_dao = new Review_Days_DAO();
		int count = rd_dao.checkDup(i,day,scheduleNum);
		if(count ==1) {
		return true;
		}
		return false;
	}

}
