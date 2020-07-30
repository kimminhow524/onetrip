package com.onetrip.app.destination.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.onetrip.mybatis.config.SqlMapConfig;

public class DestinationDAO {
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public DestinationDAO() {
		sqlsession = sessionf.openSession(true);
	}
	public List<DestinationBean> destinationList(int city_num) {
		
		return sqlsession.selectList("Destination.getList",city_num);
	}
	public DestinationBean getDestinationDetail(int destination_num) {
		
		return sqlsession.selectOne("Destination.getDetail",destination_num);
	}

	public List<DestinationBean> destinationSearch(String destination_name){
		String keyword = "%"+destination_name+"%";
		return sqlsession.selectList("Destination.getListName", keyword);
	}
	
	//관광지 상세페이지 
	public DestinationBean getDetail(int destination_num) {
		return sqlsession.selectOne("Destination.getDetail",destination_num);
	}
	
}
