package com.cafekiosk.model;

import java.util.Date;

public class KioskManageMenuVO {

	private int menu_idx;
	
	private String menu_name;
	
	private int menu_price;
	
	private String menu_category;
	
	private String menu_picture;
	
	private String option1_YN;
	
	private String option2_YN;
	
	private String option3_YN;

	private String active_YN;
	
	private String reg_user;
	
	private Date reg_time;
	
	private Date mod_time;
	
	private String menu_path;

	public int getMenu_idx() {
		return menu_idx;
	}

	public void setMenu_idx(int menu_idx) {
		this.menu_idx = menu_idx;
	}

	public String getMenu_name() {
		return menu_name;
	}

	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}

	public int getMenu_price() {
		return menu_price;
	}

	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}

	public String getMenu_category() {
		return menu_category;
	}

	public void setMenu_category(String menu_category) {
		this.menu_category = menu_category;
	}

	public String getMenu_picture() {
		return menu_picture;
	}

	public void setMenu_picture(String menu_picture) {
		this.menu_picture = menu_picture;
	}

	public String getOption1_YN() {
		return option1_YN;
	}

	public void setOption1_YN(String option1_YN) {
		this.option1_YN = option1_YN;
	}

	public String getOption2_YN() {
		return option2_YN;
	}

	public void setOption2_YN(String option2_YN) {
		this.option2_YN = option2_YN;
	}

	public String getOption3_YN() {
		return option3_YN;
	}

	public void setOption3_YN(String option3_YN) {
		this.option3_YN = option3_YN;
	}
	
	public String getActive_YN() {
		return active_YN;
	}
	
	public void setActive_YN(String active_YN) {
		this.active_YN = active_YN;
	}

	public String getReg_user() {
		return reg_user;
	}

	public void setReg_user(String reg_user) {
		this.reg_user = reg_user;
	}

	public Date getReg_time() {
		return reg_time;
	}

	public void setReg_time(Date reg_time) {
		this.reg_time = reg_time;
	}

	public Date getMod_time() {
		return mod_time;
	}

	public void setMod_time(Date mod_time) {
		this.mod_time = mod_time;
	}
	

	public String getMenu_path() {
		return menu_path;
	}

	public void setMenu_path(String menu_path) {
		this.menu_path = menu_path;
	}

	
	
	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	@Override
	public String toString() {
		return "KioskManageMenuVO [menu_idx=" + menu_idx + ", menu_name=" + menu_name + ", menu_price=" + menu_price
				+ ", menu_category=" + menu_category + ", menu_picture=" + menu_picture + ", option1_YN=" + option1_YN
				+ ", option2_YN=" + option2_YN + ", option3_YN=" + option3_YN + ", active_YN=" + active_YN
				+ ", reg_user=" + reg_user + ", reg_time=" + reg_time + ", mod_time=" + mod_time + ", menu_path="
				+ menu_path + "]";
	}


}
