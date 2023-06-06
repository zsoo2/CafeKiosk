package com.cafekiosk.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cafekiosk.model.KioskManageMenuVO;
import com.cafekiosk.model.OrderNumberVO;
import com.cafekiosk.model.PagingVO;
import com.cafekiosk.model.PaymentVO;

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
	public List<PaymentVO> getDaySales(String this_day);
	
	//일매출 내역,합계 조회
	public List<PaymentVO> getDaySalesCntSum(String this_day);
	
	//월매출 내역 조회
	public List<PaymentVO> getMonthlySales(String start_date, String end_date);

	//월매출 내역, 합계 조회
	public List<OrderNumberVO> getMonthlySalesCntSum(String start_date, String end_date);
	
	//월매출 일자별 쿠폰 개수
	public List<PaymentVO> getMonthlySalesCoupon(String start_date, String end_date);
	
	//주문내역 엑셀 다운로드
	public void excelDown(OrderNumberVO orderNumberVO, HttpServletResponse response, String start_date, String end_date) throws Exception;
	
	//일매출 엑셀 다운로드
	public void excelDownDay(PaymentVO paymentVO, HttpServletResponse response, String this_day) throws Exception;
		
	//월매출 엑셀 다운로드
	public void excelDownMonth(PaymentVO paymentVO, HttpServletResponse response, String start_date, String end_date) throws Exception;
	
	//게시글 총 갯수
	public int getListCount(String start_date, String end_date);
	
	//페이징 처리 게시글 조회
	public List<OrderNumberVO> getSelectList(PagingVO pagingVO, String start_date, String end_date); 
}
