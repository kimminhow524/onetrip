package com.onetrip.app.post.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.onetrip.app.city.CityPostOkAction;
import com.onetrip.app.post_detail.dao.Post_Detail_Bean;
import com.onetrip.mybatis.config.SqlMapConfig;
import com.sun.javafx.collections.MappingChange.Map;

public class PostDAO {
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;

	public PostDAO() {
		sqlsession = sessionf.openSession(true);
	}

	public List<PostBean> postList(int city_num, int startRow, int endRow) {
		HashMap<String, Integer> pageMap = new HashMap<>();
		pageMap.put("startRow",startRow);
		pageMap.put("endRow", endRow);
		pageMap.put("city_num", city_num);
		return sqlsession.selectList("Post.listAll", pageMap);
	}

	public Post_Detail_Bean getPostDetail(int post_num) {

		return sqlsession.selectOne("Post.getDetail", post_num);

	}

	public boolean insertPost(PostBean p_bean, String post_contents) {
		boolean check = false;
		if (sqlsession.insert("Post.insertPost", p_bean) == 1 && sqlsession.insert("Post.insertPostDetail", post_contents)==1) {
			check =true;
			CityPostOkAction.check =false;
		}
		return check;
	}

	public int getPostCnt(int post_city_num) {
		return sqlsession.selectOne("Post.postCnt",post_city_num);
	}

	public boolean deleteOnePost(int post_num) {
		boolean check =false;
		if(sqlsession.delete("Post.deleteOnePost", post_num)==1) {
			if(sqlsession.delete("Post.deleteOnePostDetail", post_num)==1) {
				check =true;
			}
		}
		return check;
	}

	public void updatePost(int post_num, String post_contents) {
		HashMap<String, Object> postMap = new HashMap<>();
		postMap.put("post_num", post_num);
		postMap.put("post_contents", post_contents);
		sqlsession.update("Post.updatePost", postMap);
	}
	
}
