package com.onetrip.app.city_photo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.onetrip.mybatis.config.SqlMapConfig;

public class City_Photo_DAO {
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public City_Photo_DAO() {
		sqlsession = sessionf.openSession(true);
	}
	
	public City_Photo_Bean getCityPhoto(int num) {
		return sqlsession.selectOne("City_Photo.getCityPhoto", num);
	}
}
