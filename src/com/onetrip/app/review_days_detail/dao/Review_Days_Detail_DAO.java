package com.onetrip.app.review_days_detail.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.onetrip.mybatis.config.SqlMapConfig;

public class Review_Days_Detail_DAO {
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession =null;
	
	public Review_Days_Detail_DAO() {sqlsession=sessionf.openSession(true);}
}
