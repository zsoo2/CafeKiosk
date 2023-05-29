package com.cafekiosk.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

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
	public List<OrderNumberVO> getOrderList(@Param("start_date") String start_date, @Param("end_date") String end_date);
	
	//주문 내역 삭제
	public void deleteOrder(String order_no);
	
	//일매출 내역 조회
	public List<OrderNumberVO> getDaySales(@Param("this_day") String this_day);
	
	//월매출 내역 조회
	public List<OrderNumberVO> getMonthlySales(@Param("start_date") String start_date, @Param("end_date") String end_date);
	
	//주문내역 엑셀 다운로드
	public List<OrderNumberVO> getExcelList(@Param("start_date") String start_date, @Param("end_date") String end_date);
	
	//주문내역 엑셀 다운로드
	public List<OrderNumberVO> getExcelListDay(@Param("this_day") String this_day);
	
	//주문내역 엑셀 다운로드
	public List<OrderNumberVO> getExcelListMonth(@Param("start_date") String start_date, @Param("end_date") String end_date);
}
