package com.cafekiosk.service;

import java.util.List;

import com.cafekiosk.model.ManageMenuVO;

public interface ManageMenuService {

	//메뉴 등록
	public void insertMenu(ManageMenuVO manageMenu) throws Exception;
	
	//메뉴 전체 조회
	public List<ManageMenuVO> getMenuList();
	
	//메뉴 상세 조회
	public ManageMenuVO getMenuInfo(int menu_idx);
	
	//메뉴 수정
	public void editMenuInfo(ManageMenuVO manageMenu);
	
	//메뉴 삭제
	public void deleteMenu(int menu_idx);
}
