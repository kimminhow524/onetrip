package com.onetrip.app.review_days.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.onetrip.app.destination.dao.DestinationBean;
import com.onetrip.app.review_days_detail.dao.Review_Days_Detail_Bean;
import com.onetrip.app.review_photo.dao.Review_Photo_Bean;
import com.onetrip.mybatis.config.SqlMapConfig;

public class Review_Days_DAO {
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public Review_Days_DAO() {
		sqlsession = sessionf.openSession(true);
	}
	public List<Review_Days_Bean> getReviewDays(int day ,int scheduleNum) {
		HashMap<String, Integer> reviewMap = new HashMap<>();
		reviewMap.put("day", day);
		reviewMap.put("scheduleNum", scheduleNum);
		return sqlsession.selectList("Review.getInfo",reviewMap) ;
	}
	public int getDaysNum(int scheduleNum) {
		return sqlsession.selectOne("Review.getDaysNum",scheduleNum);
	}
	public List<Integer> getDestNumList(int day, int scheduleNum) {
		HashMap<String, Integer> reviewMap = new HashMap<>();
		reviewMap.put("day", day);
		reviewMap.put("scheduleNum", scheduleNum);
		return sqlsession.selectList("Review.getDestNumList",reviewMap);
	}
	public List<Review_Days_Detail_Bean> getDetailBeanList(int day, int scheduleNum) {
		HashMap<String, Integer> reviewMap = new HashMap<>();
		reviewMap.put("day", day);
		reviewMap.put("scheduleNum", scheduleNum);
		return sqlsession.selectList("Review.getDetailBeanList",reviewMap);
	}
	public String getPhoto(int day, int scheduleNum, int d_num) {
		HashMap<String, Integer> reviewMap = new HashMap<>();
		reviewMap.put("day", day);
		reviewMap.put("scheduleNum", scheduleNum);
		reviewMap.put("d_num", d_num);
		return sqlsession.selectOne("Review.getPhoto", reviewMap);
	}
	public String getReviewTitle(int scheduleNum) {
		
		return sqlsession.selectOne("Review.getReviewTitle", scheduleNum);
	}
	public List<Review_Photo_Bean> getPhotoList(int scheduleNum) {
		
		return sqlsession.selectList("Review.getPhotoList",scheduleNum);
	}
	public void deleteReview(int scheduleNum) {
		sqlsession.delete("Review.deleteReview",scheduleNum);
		
	}
	public boolean insertReview(Review_Days_Bean rd_bean) {
		boolean check = false;
		if(sqlsession.insert("Review.insertReview",rd_bean) == 1) {
			check = true;
		}
		return check;
	}
	public void updateRecommend(String user_id, int recommendDestNum) {
		HashMap<String, Object> reviewMap = new HashMap<>();
		reviewMap.put("user_id", user_id);
		reviewMap.put("recommendCityNum", recommendDestNum);
		sqlsession.insert("Review.updateRecommend", reviewMap);
		
	}
	public boolean recommendCheck(String user_id, int recommendDestNum) {
		boolean check =false;
		HashMap<String, Object> reviewMap = new HashMap<>();
		reviewMap.put("user_id", user_id);
		reviewMap.put("recommendCityNum", recommendDestNum);
		if((Integer)sqlsession.selectOne("Review.recommendCheck", reviewMap)==1) {
			check=true;
		}
		return check ;
	}
	public List<Integer> getScheduleList() {
		
		return sqlsession.selectList("Review.getScheduleNumList");
	}
	public List<Integer> getMyScheduleList(String id) {
		
		return sqlsession.selectList("Review.getMyScheduleNumList",id);
	}
	public List<Integer> getMyscheduleWriteList(String id) {
		
		return sqlsession.selectList("Review.getMyscheduleWriteList",id);
	}
	public int checkDup(int i, int day, int scheduleNum) {
		HashMap<String, Object> reviewMap = new HashMap<>();
		reviewMap.put("day", day);
		reviewMap.put("scheduleNum", scheduleNum);
		reviewMap.put("daysNum", i);
		return sqlsession.selectOne("Review.dupCheck", reviewMap);
	}
	public boolean updateReview(Review_Days_Bean rd_bean) {
		boolean check = false;
		if(sqlsession.update("Review.updateReview",rd_bean) == 1) {
			check = true;
		}
		return check;
	}
	public int checkDayexist(int day, int scheduleNum) {
		HashMap<String, Object> reviewMap = new HashMap<>();
		reviewMap.put("day", day);
		reviewMap.put("scheduleNum", scheduleNum);
		return sqlsession.selectOne("Review.checkDayexist", reviewMap);
		
	}
	
	
	
}
