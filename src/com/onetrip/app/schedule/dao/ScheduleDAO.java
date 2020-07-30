package com.onetrip.app.schedule.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.onetrip.mybatis.config.SqlMapConfig;

public class ScheduleDAO {

	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;

	public ScheduleDAO() {
		sqlsession = sessionf.openSession(true);
	}

//	// 내가 작성한 일정보기
//	public List<ScheduleBean> getScheduleList(int startRow, int endRow) {
//		HashMap<String, Integer> pageMap = new HashMap<>();
//		pageMap.put("startRow", startRow);
//		pageMap.put("endRow", endRow);
//		List<ScheduleBean> scheduleList = sqlsession.selectList("Schedule.listAll", pageMap);
//		return scheduleList;
//	}
	
	//내 일정 리스트 보기
	public List<ScheduleBean> getMyScheduleList(int startRow, int endRow) {
		HashMap<String, Integer> pageMap = new HashMap<>();
		pageMap.put("startRow", startRow);
		pageMap.put("endRow", endRow);
		List<ScheduleBean> myList = sqlsession.selectList("Schedule.myScheduleList", pageMap);
		return myList;
	}
	

	// 일정 추가
	public boolean insertSchedule(ScheduleBean schedule) {
		boolean check = false;
		if (sqlsession.insert("Schedule.insertSchedule", schedule) == 1) {
			check = true;
		}
		return check;
	}
	
	
	public int getScheduleSeq() {
		return sqlsession.selectOne("Schedule.getSeq");
	}

	// 일정 수정
	public void updateSchedule(ScheduleBean schedule) {
		sqlsession.update("Schedule.updateSchedule", schedule);
	}

	// 일정 확인, 일정보기
	public ScheduleBean getDetail(int schedule_num) {
		return sqlsession.selectOne("Schedule.getDetail", schedule_num);
	}

	// 일정 삭제
	public void deleteSchedule(int schedule_num) {
		sqlsession.delete("Schedule.deleteSchedule", schedule_num);
	}

	// 일정 조회수
	public void updateReadCount(int schedule_num) {
		sqlsession.update("Schedule.updateReadCount", schedule_num);
	}
	
	public List<ScheduleBean> getScheduleList(){
		return sqlsession.selectList("Schedule.getList");
	}

}
