package com.cafekiosk.service;

import java.util.List;

import com.cafekiosk.model.CartVO;
import com.cafekiosk.model.ManageMenuVO;

public interface CustomerService {

	//메뉴 목록
	public List<ManageMenuVO> getMenuList(String tabName);

	//장바구니 등록
	public void insertCart(CartVO cart) throws Exception;

	//장바구니 목록
	public List<CartVO> getCartList();
}
