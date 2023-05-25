package com.cafekiosk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafekiosk.mapper.CustomerMapper;
import com.cafekiosk.model.CartVO;
import com.cafekiosk.model.KioskManageMenuVO;

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

}
