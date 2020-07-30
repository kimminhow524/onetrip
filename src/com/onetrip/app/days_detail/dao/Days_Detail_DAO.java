package com.onetrip.app.days_detail.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.onetrip.mybatis.config.SqlMapConfig;

public class Days_Detail_DAO {
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public Days_Detail_DAO() {
		sqlsession = sessionf.openSession(true);
	}
	
	//days_detail 입력
	public boolean insertDaysDetail(Days_Detail_Bean daysdetail) {
		boolean check = false;
		if (sqlsession.insert("Days_Detail.insertDaysDetail", daysdetail) == 1) {
			check = true;
		}
		return check;
	}
	
	// 목적지 수정
	public void updateDaysDetailDestination(int days_detail_schedule_num) {
		sqlsession.update("DaysDetail.updateDaysDetailDestination", days_detail_schedule_num);
	}
	
	// order 수정
	public void updateDaysDetailOrder(int days_detail_schedule_num) {
		sqlsession.update("DaysDetail.updateDaysDetailOrder", days_detail_schedule_num);
	}
	
	// days_detail (스케줄)삭제
	public void deleteDaysDetail(int days_detail_schedule_num) {
		sqlsession.delete("DaysDetail.deleteDaysDetail", days_detail_schedule_num);
	}
	
}
