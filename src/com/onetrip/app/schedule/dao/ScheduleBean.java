package com.onetrip.app.schedule.dao;

public class ScheduleBean {

	private int schedule_num;
	private String schedule_name;
	private String schedule_user_id;
	private int schedule_city_num;
	private String schedule_departure;
	private String schedule_arrival;
	private int schedule_term;
	private char schedule_open_check ='1';
	private int schedule_views;
	
	public ScheduleBean() {;}

	public int getSchedule_num() {
		return schedule_num;
	}

	public void setSchedule_num(int schedule_num) {
		this.schedule_num = schedule_num;
	}

	public String getSchedule_name() {
		return schedule_name;
	}

	public void setSchedule_name(String schedule_name) {
		this.schedule_name = schedule_name;
	}

	public String getSchedule_user_id() {
		return schedule_user_id;
	}

	public void setSchedule_user_id(String schedule_user_id) {
		this.schedule_user_id = schedule_user_id;
	}

	public int getSchedule_city_num() {
		return schedule_city_num;
	}

	public void setSchedule_city_num(int schedule_city_num) {
		this.schedule_city_num = schedule_city_num;
	}

	public String getSchedule_departure() {
		return schedule_departure;
	}

	public void setSchedule_departure(String schedule_departure) {
		this.schedule_departure = schedule_departure;
	}

	public String getSchedule_arrival() {
		return schedule_arrival;
	}

	public void setSchedule_arrival(String schedule_arrival) {
		this.schedule_arrival = schedule_arrival;
	}

	public int getSchedule_term() {
		return schedule_term;
	}

	public void setSchedule_term(int schedule_term) {
		this.schedule_term = schedule_term;
	}

	public char isSchedule_open_check() {
		return schedule_open_check;
	}

	public void setSchedule_open_check(char schedule_open_check) {
		this.schedule_open_check = schedule_open_check;
	}

	public int getSchedule_views() {
		return schedule_views;
	}

	public void setSchedule_views(int schedule_views) {
		this.schedule_views = schedule_views;
	}

	
}
