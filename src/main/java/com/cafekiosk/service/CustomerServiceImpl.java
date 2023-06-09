package com.cafekiosk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafekiosk.mapper.CustomerMapper;
import com.cafekiosk.model.CartVO;
import com.cafekiosk.model.KioskManageMenuVO;
import com.cafekiosk.model.OrderNumberVO;
import com.cafekiosk.model.PaymentVO;

@Service
public class CustomerServiceImpl implements CustomerService {

	
	@Autowired
	private CustomerMapper customerMapper;
	
	@Override
	public List<KioskManageMenuVO> getMenuList(String tabName) {
		//메뉴 조회
		List<KioskManageMenuVO> menuList = customerMapper.getMenuList(tabName);

		return menuList;
	}
	
	@Override
	public void insertCart(CartVO cart) {
		//장바구니 등록
		customerMapper.insertCart(cart);
	}
	
	@Override
	public List<CartVO> getCartList() {
		//장바구니 조회
		List<CartVO> cartList = customerMapper.getCartList();
		
		return cartList;
	}
	
	@Override
	public void deleteCart(int cart_idx) {
		//장바구니 삭제
		customerMapper.deleteCart(cart_idx);
	}
	
	@Override
	public void editCart(int cart_idx, int count, int option_price) {
		//장바구니 수정
		customerMapper.editCart(cart_idx, count, option_price);
	}
	
	@Override
	public Integer checkMember(String user_no) {
		//멤버 확인
		Integer check_result = customerMapper.checkMember(user_no);

		return check_result;
	}
	
	@Override
	public void insertMember(String user_no) {
		//멤버 등록
		customerMapper.insertMember(user_no);
		
	}
	
	@Override
	public void insertOrder(OrderNumberVO order) {
		//주문 등록
		customerMapper.insertOrder(order);
	}
	
	@Override
	public void editOrder(String order_no) {
		customerMapper.editOrder(order_no);
	}
	
	@Override
	public void editCartActive() {
		customerMapper.editCartActive();
	}
	
	@Override
	public Integer checkCoupon(String user_no) {
		//멤버 확인
		Integer check_coupon = customerMapper.checkCoupon(user_no);

		return check_coupon;
	}
	
	@Override
	public void editCoupon(String user_no, int coupon_cnt) {
		//쿠폰 개수 수정
		customerMapper.editCoupon(user_no, coupon_cnt);
	}
	
	@Override
	public void insertPayment(PaymentVO payment) {
		customerMapper.insertPayment(payment);
	}
}
