package com.onetrip.app.user.dao;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.onetrip.mybatis.config.SqlMapConfig;

public class UserDao {
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	private final int KEY = 3;

	public UserDao() {
		sqlsession = sessionf.openSession(true);
	}

	// 회원가입
	public boolean join(UserBean user) {
		boolean check = false;
		if (sqlsession.insert("User.join", user) == 1) {
			check = true;
		}
		return check;
	}

	// 로그인
	public Map<String, String> login(String id, String pw) {
		HashMap<String, String> datas = new HashMap<>();
		
		datas.put("user_id", id);
		datas.put("user_pw", pw);
		
		System.out.println("다오 들어옴");
		Map<String, String> loginDatas = sqlsession.selectOne("User.login", datas);
		return loginDatas;
	}

	// 아이디 중복 확인
	public boolean check_Id(String user_id) {
		boolean result = false;
	
		if ((Integer)sqlsession.selectOne("User.check_id", user_id) == 1) {
			result = true;
		}
		return result;
	}

	// 본인 확인(개인 정보 관련)
	public String user_Identity(String user_pw,String user_id) {
	HashMap<String, String> datas = new HashMap<>();
		
		datas.put("user_pw", user_pw);
		datas.put("user_id", user_id);
		
		String result= sqlsession.selectOne("User.user_identity", datas);
		 
		 return result;
	}

	// 개인정보 출력(설정중)
	public UserBean myinfo(String id) {
		String user_id = id;
		UserBean infoList = sqlsession.selectOne("User.select_myInfo", user_id);

		return infoList;
	}

	// 내 정보 수정
	public boolean update_userInfo(UserBean bean) {
		boolean check = false;

		if (sqlsession.insert("User.update_userInfo", bean) == 1) {
			check = true;
		}

		return check;
	}

	// 회원 탈퇴(회원 탈퇴전 정말 회원을 탈퇴하시겠습니까? 라고 묻는 과정을 실행하여야함)
	public void delete_user(String id) {
		String User_id = id;
		sqlsession.selectOne("User.delete_user", User_id);
	}

	// 암호화
	public String encrypt(String pw) {
		String en_pw = "";
		for (int i = 0; i < pw.length(); i++) {
			en_pw += (char) (pw.charAt(i) + KEY);
		}
		return en_pw;
	}

	// 복호화
	public String decrypt(String en_pw) {
		String de_pw = "";
		for (int i = 0; i < en_pw.length(); i++) {
			de_pw += (char) (en_pw.charAt(i) - KEY);
		}
		return de_pw;
	}

	// 파일명 변경
	public String renameFile(String path, String filename, String newFilename) {
		File file = new File(path+"\\"+filename);
		File fileNew = new File(path+"\\"+newFilename+".jpg");
		if (file.exists()) {
			file.renameTo(fileNew);
			return fileNew.getName();
		}
		return null;
		
		
	}
	
	//파일 삭제
	public boolean delfile(String path,String filename) {
		File file = new File(path+"\\"+filename); 
		
		if(file.exists()) {
            // 파일을 삭제합니다.
            file.delete(); 
            System.out.println("파일삭제 완료");
            return true;
        }else {return false;} 
		
	}

	
	

}
