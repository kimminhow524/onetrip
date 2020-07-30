package com.onetrip.app.days.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.onetrip.mybatis.config.SqlMapConfig;

public class DaysDAO {
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;

	public DaysDAO() {
		sqlsession = sessionf.openSession(true);
	}
	
	// days db 입력 
	public boolean insertDays(DaysBean days) {
		boolean check = false;
		if (sqlsession.insert("Days.insertDays", days) == 1) {
			check = true;
		}
		return check;
	}
	
	
	// DAYS_LIST_CHECK: 동행 리스트에 표출 여부 
	// 동행확정여부가 true가 되면 list_check는 false -> 목록에서 보이지 않게
	public boolean listCheck(int days_schedule_num) {
		boolean check = false;
		if (sqlsession.insert("Days.listCheck", days_schedule_num) == 1) {
			check = true;
		}else if(sqlsession.insert("Days.companionCheck", days_schedule_num) == 1) {
			check = true;
		}
		return check;
	}	
	
	// DAYS_COMPANION_CHECK: 동행 확정 여부
	public boolean companionCheck(int days_schedule_num) {
		boolean check = false;
		if (sqlsession.insert("Days.companionCheck", days_schedule_num) == 1) {
			check = true;
		}
		return check;
	}	
	
	// 스케줄 삭제시 days삭제 
	public void deleteDays(int days_schedule_num) {
		sqlsession.delete("Days.deleteDays", days_schedule_num);
	}	
		
	// DAYS_LIST_CHECK 수정
	public void updateListCheck(int days_schedule_num) {
		sqlsession.update("Days.updateListCheck", days_schedule_num);
	}
	
	// DAYS_COMPANION_CHECK 수정
	public void updateCompanionCheck(int days_schedule_num) {
		sqlsession.update("Days.updateCompanionCheck", days_schedule_num);
	}
	
	public int getDaysFirstCity(int num) {
		return sqlsession.selectOne("Days.getDetailBysc", num);
	}

	
}
