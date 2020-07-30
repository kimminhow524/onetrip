package com.onetrip.app.com_apply.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.onetrip.app.days.dao.DaysBean;
import com.onetrip.mybatis.config.SqlMapConfig;

public class Com_Apply_DAO {
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession =null;
	
	public Com_Apply_DAO() {sqlsession=sessionf.openSession(true);}
	
//Common
	public DaysBean checkAcomStatus(int schedule_num, int days_n) {
		HashMap<String, Integer> data = new HashMap<String, Integer>();
		data.put("schedule_num", schedule_num);
		data.put("days_n", days_n);
		return sqlsession.selectOne("Com_Apply.checkAcomStatus", data);
	}
		
//Member
	//동행 기본 목록 받아오기
	//R, SCHEDULE_NAME, SCHEDULE_NUM, SCHEDULE_USER_ID, SCHEDULE_CITY_NUM,SCHEDULE_DEPARTURE, CITY_PHOTO_NAME, CITY_NUM
	public List<HashMap<String, Object>> getAcomList(int startRow, int endRow) {
		HashMap<String, Integer> pageMap = new HashMap<>();
		pageMap.put("startRow", startRow);
		pageMap.put("endRow", endRow);
		List<HashMap<String, Object>> acomDatas = sqlsession.selectList("Com_Apply.getAcomList", pageMap);
		return acomDatas;
	}
	//동행 검색 by city
	public List<HashMap<String, Object>> getAcomByCity(int startRow, int endRow, int city_num) {
		HashMap<String, Integer> pageMap = new HashMap<>();
		pageMap.put("startRow", startRow);
		pageMap.put("endRow", endRow);
		pageMap.put("city_num", city_num);
		List<HashMap<String, Object>> acomDatas = sqlsession.selectList("Com_Apply.getAcomByCity", pageMap);
		return acomDatas;
	}

	public int getListCnt() {
		return sqlsession.selectOne("Com_Apply.getListCnt");
	}
	
	public int getSearchListCnt(int city_num) {
		return sqlsession.selectOne("Com_Apply.getSearchListCnt",city_num);
	}
	public List<Integer> checkCityNum(String search) {
		return sqlsession.selectList("Com_Apply.checkCityNum", search);
	}
	//동행 중복신청 확인
	public int checkAcomDup(Com_Apply_Bean bean) {
		return sqlsession.selectOne("Com_Apply.checkAcomDup", bean);
	}
	
	//동행신청
	public void applyAcom(Com_Apply_Bean bean) {
		sqlsession.insert("Com_Apply.applyAcom", bean);
	}
	
	//동행 신청 내역 삭제
	public void deleteAcom(int acomNum) {
		sqlsession.delete("Com_Apply.deleteAcom", acomNum);
	}
	//동행취소
	public void cancelAcom(int com_apply_num) {
		sqlsession.update("Com_Apply.cancelAcom", com_apply_num);
	}
	//
	public List<HashMap<String, String>> getMemberAcomList(String session_id) {
		return sqlsession.selectList("Com_Apply.getMemberAcomList",session_id);
	}
	//신청자 현황(수)
	public int getAcomCnt() {
		return 1;
	}
	

//Host
	//수락(status 1) 거절 (status -1)
	public void checkAcom_ByHost(int acomNum, boolean confirm)	 {
		HashMap<String, Integer> data = new HashMap<String, Integer>();
		data.put("acomNum", acomNum);
		data.put("status", confirm?1:-1);
		sqlsession.update("Com_Apply.checkAcom_ByHost", data);
	}

}
