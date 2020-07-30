package com.onetrip.app.city.dao;

public class CityBean {

	private int city_num;
	private String city_name; 
	private String country;
	private String weather;
	private String city_eng_name;
	


	public String getCity_eng_name() {
		return city_eng_name;
	}


	public void setCity_eng_name(String city_eng_name) {
		this.city_eng_name = city_eng_name;
	}


	public CityBean() {;}


	public int getCity_num() {
		return city_num;
	}


	public void setCity_num(int city_num) {
		this.city_num = city_num;
	}


	public String getCity_name() {
		return city_name;
	}


	public void setCity_name(String city_name) {
		this.city_name = city_name;
	}


	public String getCountry() {
		return country;
	}


	public void setCountry(String country) {
		this.country = country;
	}


	public String getWeather() {
		return weather;
	}


	public void setWeather(String weather) {
		this.weather = weather;
	}

}
