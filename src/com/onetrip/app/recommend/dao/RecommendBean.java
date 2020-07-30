package com.onetrip.app.recommend.dao;

public class RecommendBean {
	private String recommend_user_id;
	private int recommend_destination_num;
	
	public RecommendBean() {;}

	public String getRecommend_user_id() {
		return recommend_user_id;
	}

	public void setRecommend_user_id(String recommend_user_id) {
		this.recommend_user_id = recommend_user_id;
	}

	public int getRecommend_destination_num() {
		return recommend_destination_num;
	}

	public void setRecommend_destination_num(int recommend_destination_num) {
		this.recommend_destination_num = recommend_destination_num;
	}
	
	
	
}
