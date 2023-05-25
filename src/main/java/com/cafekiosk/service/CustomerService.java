package com.cafekiosk.service;

import java.util.List;

import com.cafekiosk.model.CartVO;
import com.cafekiosk.model.KioskManageMenuVO;

public interface CustomerService {

	//메뉴 목록
	public List<KioskManageMenuVO> getMenuList(String tabName);

	//장바구니 등록
	public void insertCart(CartVO cart) throws Exception;

	//장바구니 조회
	public List<CartVO> getCartList();

	//장바구니 삭제
	public void deleteCart(int cart_idx);
}
