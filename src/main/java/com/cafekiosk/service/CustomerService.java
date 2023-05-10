package com.cafekiosk.service;

import java.util.List;

import com.cafekiosk.model.ManageMenuVO;

public interface CustomerService {

	public List<ManageMenuVO> getMenuList(String tabName);

}
