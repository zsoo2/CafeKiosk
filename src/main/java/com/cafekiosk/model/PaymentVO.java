package com.cafekiosk.model;

import java.util.Calendar;
import java.util.Date;

public class PaymentVO {

	private String order_no;
	
	private String user_no;
	
	private String coupon_YN;
	
	private String total_price;

	private String pay_status;
	
	private Date order_date;
	
	private int cnt;
	
	private int total_cnt;
	
	private int cp_cnt;
	
	@Override
	public String toString() {
		return "PaymentVO [order_no=" + order_no + ", user_no=" + user_no + ", coupon_YN=" + coupon_YN
				+ ", total_price=" + total_price + ", pay_status=" + pay_status + ", order_date=" + order_date
				+ "]";
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

	public String getCoupon_YN() {
		return coupon_YN;
	}

	public void setCoupon_YN(String coupon_YN) {
		this.coupon_YN = coupon_YN;
	}

	public String getTotal_price() {
		return total_price;
	}

	public void setTotal_price(String total_price) {
		this.total_price = total_price;
	}

	public String getPay_status() {
		return pay_status;
	}

	public void setPay_status(String pay_status) {
		this.pay_status = pay_status;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getTotal_cnt() {
		return total_cnt;
	}

	public void setTotal_cnt(int total_cnt) {
		this.total_cnt = total_cnt;
	}

	public int getCp_cnt() {
		return cp_cnt;
	}

	public void setCp_cnt(int cp_cnt) {
		this.cp_cnt = cp_cnt;
	}

	

}
