package com.cafekiosk.model;

import java.util.Calendar;

public class PaymentVO {

	private String order_no;
	
	private String user_no;
	
	private String coupon_YN;
	
	private String total_price;

	private String pay_status;
	
	private Calendar order_date;
	
	private Calendar order_time;
	
	@Override
	public String toString() {
		return "PaymentVO [order_no=" + order_no + ", user_no=" + user_no + ", coupon_YN=" + coupon_YN
				+ ", total_price=" + total_price + ", pay_status=" + pay_status + ", order_date=" + order_date
				+ ", order_time=" + order_time + "]";
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

	public Calendar getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Calendar order_date) {
		this.order_date = order_date;
	}

	public Calendar getOrder_time() {
		return order_time;
	}

	public void setOrder_time(Calendar order_time) {
		this.order_time = order_time;
	}

	

}
