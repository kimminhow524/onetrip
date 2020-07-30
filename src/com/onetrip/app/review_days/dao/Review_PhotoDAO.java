package com.onetrip.app.review_days.dao;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.onetrip.app.review_photo.dao.Review_Photo_Bean;
import com.onetrip.mybatis.config.SqlMapConfig;
import com.oreilly.servlet.MultipartRequest;

public class Review_PhotoDAO {
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public Review_PhotoDAO(){
		sqlsession = sessionf.openSession(true);
	}
	
	public boolean insertPhoto(MultipartRequest multi, int day, int scheduleNum, int daysNum ) {
		HashMap<String, Object> photoMap = new HashMap<>();
		Enumeration<String> files = multi.getFileNames();
		boolean check = true;
		
		photoMap.put("day", day);
		photoMap.put("scheduleNum", scheduleNum);
		photoMap.put("daysNum", daysNum);
		
		while(files.hasMoreElements()) {
			String data = files.nextElement();
			if(multi.getFilesystemName(data) == null) {continue;}
			photoMap.put("photo_name", multi.getFilesystemName(data));
			if(sqlsession.insert("Review_Photo.insertPhoto", photoMap) != 1) {
				check = false;
				break;
			}
		}
		return check;
	}
	
	
	public void deleteFiles(int scheduleNum) {
		sqlsession.delete("Review_photo.deletePhotos", scheduleNum);
	}

	
	}

