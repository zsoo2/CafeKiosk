package com.cafekiosk.service;

import java.util.List;

import com.cafekiosk.model.CartVO;
import com.cafekiosk.model.KioskManageMenuVO;
import com.cafekiosk.model.OrderNumberVO;
import com.cafekiosk.model.PaymentVO;

public interface CustomerService {

	//메뉴 목록
	public List<KioskManageMenuVO> getMenuList(String tabName);

	//장바구니 등록
	public void insertCart(CartVO cart) throws Exception;

	//장바구니 조회
	public List<CartVO> getCartList();

	//장바구니 삭제
	public void deleteCart(int cart_idx);
	
	//장바구니 수정
	public void editCart(int cart_idx, int cart_cnt, int option_price);

	//멤버 화인
	public Integer checkMember(String user_no);

	//멤버 등록
	public void insertMember(String user_no);

	//주문 등록
	public void insertOrder(OrderNumberVO order);

	//order active_YN 변경
	public void editOrder(String order_no);

	//cart active_YN 변경
	public void editCartActive();

	// coupon cnt
	public Integer checkCoupon(String user_no);

	//쿠폰 개수 수정
	public void editCoupon(String user_no, int coupon_cnt);

	//결제 등록
	public void insertPayment(PaymentVO payment);

}
