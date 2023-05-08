package com.cafekiosk.service;

import com.cafekiosk.model.ManageMenuVO;

public interface ManageMenuService {

	//메뉴 등록
	public void insertMenu(ManageMenuVO manageMenu) throws Exception;
}
