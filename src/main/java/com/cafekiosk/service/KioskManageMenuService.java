package com.cafekiosk.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.cafekiosk.model.KioskManageMenuVO;
import com.cafekiosk.model.OrderNumberVO;

public interface KioskManageMenuService {

	//메뉴 등록
	public void insertMenu(KioskManageMenuVO manageMenu) throws Exception;
	
	//메뉴 전체 조회
	public List<KioskManageMenuVO> getMenuList();
	
	//메뉴 상세 조회
	public KioskManageMenuVO getMenuInfo(int menu_idx);
	
	//메뉴 수정
	public void editMenuInfo(KioskManageMenuVO manageMenu);
	
	//메뉴 삭제
	public void deleteMenu(int menu_idx);
	
	//주문 내역 조회
	public List<OrderNumberVO> getOrderList(String start_date, String end_date);
	
	//주문 내역 삭제
	public void deleteOrder(String order_no);
	
	//일매출 내역 조회
	public List<OrderNumberVO> getDaySales(String this_day);
	
	//월매출 내역 조회
	public List<OrderNumberVO> getMonthlySales(String start_date, String end_date);
}
