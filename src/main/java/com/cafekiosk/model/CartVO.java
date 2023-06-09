package com.cafekiosk.model;

import java.util.Date;

public class CartVO {

	private int cart_idx;

	private int menu_idx;
	
	private String menu_name;
	
	private int menu_price;
	
	private int count;
	
	private String option1;
	
	private String option2;
	
	private String option3;
	
	private int option_price;
	
	private String active_YN;
	
	private Date reg_time;

	

	public int getCart_idx() {
		return cart_idx;
	}



	public void setCart_idx(int cart_idx) {
		this.cart_idx = cart_idx;
	}



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



	public int getCount() {
		return count;
	}



	public void setCount(int count) {
		this.count = count;
	}



	public String getOption1() {
		return option1;
	}



	public void setOption1(String option1) {
		this.option1 = option1;
	}



	public String getOption2() {
		return option2;
	}



	public void setOption2(String option2) {
		this.option2 = option2;
	}



	public String getOption3() {
		return option3;
	}



	public void setOption3(String option3) {
		this.option3 = option3;
	}



	public int getOption_price() {
		return option_price;
	}



	public void setOption_price(int option_price) {
		this.option_price = option_price;
	}



	public String getActive_YN() {
		return active_YN;
	}



	public void setActive_YN(String active_YN) {
		this.active_YN = active_YN;
	}



	public Date getReg_time() {
		return reg_time;
	}



	public void setReg_time(Date reg_time) {
		this.reg_time = reg_time;
	}



	@Override
	public String toString() {
		return "CartVO [cart_idx=" + cart_idx + ", menu_idx=" + menu_idx + ", menu_name=" + menu_name + ", menu_price="
				+ menu_price + ", count=" + count + ", option1=" + option1 + ", option2=" + option2 + ", option3="
				+ option3 + ", option_price=" + option_price + ", active_YN=" + active_YN + ", reg_time=" + reg_time
				+ "]";
	}

}
