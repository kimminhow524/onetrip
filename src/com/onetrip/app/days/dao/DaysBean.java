package com.onetrip.app.days.dao;

public class DaysBean {
	private int days_n;
	private int days_schedule_num;
	private int days_list_check;
	private int day_city_num;

	private int days_companion_check;
	
	public DaysBean() {;}

	public int getDay_city_num() {
		return day_city_num;
	}
	
	public void setDay_city_num(int day_city_num) {
		this.day_city_num = day_city_num;
	}
	public int getDays_n() {
		return days_n;
	}

	public void setDays_n(int days_n) {
		this.days_n = days_n;
	}

	public int getDays_schedule_num() {
		return days_schedule_num;
	}

	public void setDays_schedule_num(int days_schedule_num) {
		this.days_schedule_num = days_schedule_num;
	}

	public int getDays_list_check() {
		return days_list_check;
	}

	public void setDays_list_check(int days_list_check) {
		this.days_list_check = days_list_check;
	}

	public int getDays_companion_check() {
		return days_companion_check;
	}

	public void setDays_companion_check(int days_companion_check) {
		this.days_companion_check = days_companion_check;
	}


	
}
