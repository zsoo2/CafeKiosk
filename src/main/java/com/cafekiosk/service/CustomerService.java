package com.cafekiosk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafekiosk.mapper.CustomerMapper;
import com.cafekiosk.model.ManageMenuVO;

@Service
public class CustomerService {
	
	@Autowired
	private CustomerMapper customerMapper;

	public List<ManageMenuVO> getMenuList(String tabName) {

		List<ManageMenuVO> menuList = customerMapper.getMenuList(tabName);

		return menuList;
	}

}
