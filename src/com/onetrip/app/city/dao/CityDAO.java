package com.onetrip.app.city.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.onetrip.mybatis.config.SqlMapConfig;



public class CityDAO {
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public CityDAO() {
		sqlsession = sessionf.openSession(true);
	}
	public int getCityCnt(String keyword) {
		String searchKeyword = "%"+keyword+"%";
		return sqlsession.selectOne("City.cityCnt",searchKeyword);
	}

	public List<CityBean> getCityList(String keyword) {
		String searchKeyword = "%"+keyword+"%";
		List<CityBean> cityList = sqlsession.selectList("City.listAll", searchKeyword);
		return cityList;
	}
	public List<String> getCityPhoto(int city_num) {
		return sqlsession.selectList("City.photoList", city_num);
		 
	}
	public CityBean getDetail(int city_num) {
		
		return sqlsession.selectOne("City.getDetail",city_num) ;
	}

	
	public List<CityBean> getListAll(){
		return sqlsession.selectList("City.getListAll");
	}
	
	public List<CityBean> getCityListEQ(String city_name){
		return sqlsession.selectList("City.getCityNum", city_name);
	}
}
