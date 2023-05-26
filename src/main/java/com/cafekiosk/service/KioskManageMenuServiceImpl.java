package com.cafekiosk.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafekiosk.mapper.KioskManageMenuMapper;
import com.cafekiosk.model.KioskManageMenuVO;
import com.cafekiosk.model.OrderNumberVO;

@Service
public class KioskManageMenuServiceImpl implements KioskManageMenuService {

	@Autowired
	private KioskManageMenuMapper manageMenuMapper;

	@Override
	// 메뉴 등록
	public void insertMenu(KioskManageMenuVO manageMenu) throws Exception {
		manageMenuMapper.insertMenu(manageMenu);
	}

	@Override
	// 메뉴 전체 조회
	public List<KioskManageMenuVO> getMenuList() {
		List<KioskManageMenuVO> menuList = manageMenuMapper.getMenuList();
		return menuList;
	}

	@Override
	// 메뉴 상세 조회
	public KioskManageMenuVO getMenuInfo(int menu_idx) {
		KioskManageMenuVO menuInfo = manageMenuMapper.getMenuInfo(menu_idx);
		// 객체 이미지 정보 -- 추후 구현
		// menuInfo.setImageList(ManageMenuMapper.getAttachInfo(menu_idx));
		return menuInfo;
	}

	@Override
	// 메뉴 수정
	public void editMenuInfo(KioskManageMenuVO menuInfo) {
		manageMenuMapper.editMenuInfo(menuInfo);
	}

	@Override
	// 메뉴 삭제
	public void deleteMenu(int menu_idx) {
		manageMenuMapper.deleteMenu(menu_idx);
	}

	@Override
	// 주문내역 전체 조회
	public List<OrderNumberVO> getOrderList(String start_date, String end_date) {

		/* System.out.println(start_date); */
		
		 //여기서 날짜 바꾸려고 한 흔적.. 
		Date date = new Date();
		SimpleDateFormat dateStr = new SimpleDateFormat("yyyy-MM-dd"); //string을 날짜형식으로 변환하기 위해 선언
		 
		 if (start_date == null) {
			 start_date = dateStr.format(date);
		 } else {
			 start_date = start_date;
		 }
		 
		if(end_date == null) {
			end_date = dateStr.format(date);
		} else {
			end_date = end_date;
		}
		List<OrderNumberVO> orderList = manageMenuMapper.getOrderList(start_date, end_date);
		return orderList;
	}
	
	@Override
	// 주문내역 삭제
	public void deleteOrder(String order_no) {
		manageMenuMapper.deleteOrder(order_no);
	}
	
	@Override
	// 일매출 내역 조회
	public List<OrderNumberVO> getDaySales(String this_day) {
		
		 //여기서 날짜 바꾸려고 한 흔적.. 
		Date date = new Date();
		SimpleDateFormat dateStr = new SimpleDateFormat("yyyy-MM-dd"); //string을 날짜형식으로 변환하기 위해 선언
		 
		 if (this_day == null) {
			 this_day = dateStr.format(date);
		 } else {
			 this_day = this_day;
		 }

		List<OrderNumberVO> daySales = manageMenuMapper.getDaySales(this_day);
		return daySales;
	}
	
	@Override
	// 월매출 전체 조회
	public List<OrderNumberVO> getMonthlySales(String start_date, String end_date) {

		/* System.out.println(start_date); */
		
		 //여기서 날짜 바꾸려고 한 흔적.. 
		Date date = new Date();
		SimpleDateFormat dateStr = new SimpleDateFormat("yyyy-MM-dd"); //string을 날짜형식으로 변환하기 위해 선언
		 
		 if (start_date == null) {
			 start_date = dateStr.format(date);
		 } else {
			 start_date = start_date;
		 }
		 
		if(end_date == null) {
			end_date = dateStr.format(date);
		} else {
			end_date = end_date;
		}
		List<OrderNumberVO> monthlySales = manageMenuMapper.getMonthlySales(start_date, end_date);
		return monthlySales;
	}
}
