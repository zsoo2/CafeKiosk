package com.cafekiosk.model;

public class OrderNumberVO {
	
	private int order_idx;

	private String order_no;
	
	private String user_no;
	
	private int menu_idx;
	
	private String menu_name;

	private int menu_price;
	
	private int option_price;
	
	@Override
	public String toString() {
		return "ManagerVO [order_idx=" + order_idx + ", order_no=" + order_no + ", user_no=" + user_no + ", menu_idx="
				+ menu_idx + ", menu_name=" + menu_name + ", menu_price=" + menu_price + ", option_price="
				+ option_price + "]";
	}
	
	public int getOrder_idx() {
		return order_idx;
	}

	public void setOrder_idx(int order_idx) {
		this.order_idx = order_idx;
	}

	public String getOrder_no() {
		return order_no;
	}

	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}

	public String getUser_no() {
		return user_no;
	}

	public void setUser_no(String user_no) {
		this.user_no = user_no;
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

	public int getOption_price() {
		return option_price;
	}

	public void setOption_price(int option_price) {
		this.option_price = option_price;
	}
}
