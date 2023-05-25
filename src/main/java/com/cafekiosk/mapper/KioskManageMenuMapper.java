package com.cafekiosk.mapper;

import java.util.List;

import com.cafekiosk.model.KioskManageMenuVO;
import com.cafekiosk.model.OrderNumberVO;

public interface KioskManageMenuMapper {

	//메뉴 등록
	public void insertMenu(KioskManageMenuVO manageMenu);
	
	//메뉴 조회
	public List<KioskManageMenuVO> getMenuList();
	
	//메뉴 상세 조회
	public KioskManageMenuVO getMenuInfo(int menu_idx);

	//메뉴 수정
	public void editMenuInfo(KioskManageMenuVO menuInfo);
	
	//메뉴 삭제
	public void deleteMenu(int menu_idx);
	
	//주문 내역 조회
	public List<OrderNumberVO> getOrderList();
}
