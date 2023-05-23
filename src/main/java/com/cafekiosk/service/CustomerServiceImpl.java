package com.cafekiosk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafekiosk.mapper.CustomerMapper;
import com.cafekiosk.model.CartVO;
import com.cafekiosk.model.ManageMenuVO;

@Service
public class CustomerServiceImpl implements CustomerService {

	
	@Autowired
	private CustomerMapper customerMapper;
	
	@Override
	public List<ManageMenuVO> getMenuList(String tabName) {
		//메뉴 조회
		List<ManageMenuVO> menuList = customerMapper.getMenuList(tabName);

		return menuList;
	}
	
	@Override
	//메뉴 등록
	public void insertCart(CartVO cart) {
		customerMapper.insertCart(cart);
	}

}
