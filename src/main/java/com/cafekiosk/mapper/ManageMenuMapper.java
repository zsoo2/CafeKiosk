package com.cafekiosk.mapper;

import java.util.List;

import com.cafekiosk.model.ManageMenuVO;

public interface ManageMenuMapper {

	//메뉴 등록
	public void insertMenu(ManageMenuVO manageMenu);
	
	//메뉴 조회
	public List<ManageMenuVO> getMenuList();
	
	//메뉴 상세 조회
	public ManageMenuVO getMenuInfo(int menu_idx);

	//메뉴 수정
	public void editMenuInfo(ManageMenuVO menuInfo);
	
	//메뉴 삭제
	public void deleteMenu(int menu_idx);
}
