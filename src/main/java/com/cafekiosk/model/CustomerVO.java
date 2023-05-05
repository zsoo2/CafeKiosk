package com.cafekiosk.model;

public class CustomerVO {

	private String user_no;
	
	private String coupon_cnt;

	public String getUser_no() {
		return user_no;
	}

	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}

	public String getCoupon_cnt() {
		return coupon_cnt;
	}

	public void setCoupon_cnt(String coupon_cnt) {
		this.coupon_cnt = coupon_cnt;
	}

	
	@Override
	public String toString() {
		return "CustomerVO [user_no=" + user_no + ", coupon_cnt=" + coupon_cnt + "]";
	}
	
}
