package com.cafekiosk.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cafekiosk.model.KioskManageMenuVO;
import com.cafekiosk.model.OrderNumberVO;
import com.cafekiosk.model.PagingVO;
import com.cafekiosk.model.PaymentVO;

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
	public List<PaymentVO> getDaySales(@Param("this_day") String this_day);
	
	//일매출 내역, 합계 조회
	public List<PaymentVO> getDaySalesCntSum(@Param("this_day") String this_day);
	
	//월매출 내역 조회
	public List<PaymentVO> getMonthlySales(@Param("start_date") String start_date, @Param("end_date") String end_date);
	
	//월매출 내역, 합계 조회
	public List<OrderNumberVO> getMonthlySalesCntSum(@Param("start_date") String start_date, @Param("end_date") String end_date);
	
	//월매출 일자별 쿠폰 개수
	public List<PaymentVO> getMonthlySalesCoupon(@Param("start_date") String start_date, @Param("end_date") String end_date);
		
	//주문내역 엑셀 다운로드
	public List<OrderNumberVO> getExcelList(@Param("start_date") String start_date, @Param("end_date") String end_date);
	
	//주문내역 엑셀 다운로드
	public List<PaymentVO> getExcelListDay(@Param("this_day") String this_day);
	
	//주문내역 엑셀 다운로드
	public List<PaymentVO> getExcelListMonth(@Param("start_date") String start_date, @Param("end_date") String end_date);
	
	//게시글 총 갯수
	public int getListCount(@Param("start_date") String start_date, @Param("end_date") String end_date);
	
	//페이징 처리 게시글 조회
	public List<OrderNumberVO> getSelectList(@Param("vo") PagingVO pagingVO, @Param("start_date") String start_date, @Param("end_date") String end_date); 
}
