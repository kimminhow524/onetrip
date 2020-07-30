package com.onetrip.mybatis.config;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig {
	private static SqlSessionFactory sqlsession;
	
	//클래스 초기화 블럭(클래스가 처음 로딩될 때 한번만 수행)
	
	static {
		
		try {
		String resource ="./com/onetrip/mybatis/config/config.xml";  //설정파일 
		Reader reader = Resources.getResourceAsReader(resource);
		sqlsession = new SqlSessionFactoryBuilder().build(reader);
		} catch(IOException e) {
			System.out.println("초기화 문제 발생:" + e);
		}
	}
	
	public static SqlSessionFactory getSqlMapInstance() {
		
		return sqlsession;
	}
	
	
	
	
	
}
