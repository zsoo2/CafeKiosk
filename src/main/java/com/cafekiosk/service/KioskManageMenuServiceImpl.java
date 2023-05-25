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
	public List<OrderNumberVO> getOrderList() {
		List<OrderNumberVO> orderList = manageMenuMapper.getOrderList();
		
		/* 여기서 날짜 바꾸려고 한 흔적..
		 * SimpleDateFormat stringToDate = new SimpleDateFormat("yyyyMMddHHmmss");
		 * //string을 날짜형식으로 변환하기 위해 선언 SimpleDateFormat dateFormat = new
		 * SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 * 
		 * for(int i = 0; i < orderList.size();i++) { String getOrder_no =
		 * orderList.get(i).getOrder_no(); //반복문 돌려서 order_no 가져옴 String setOrder_date =
		 * orderList.set(i, null).getOrder_no(); try { Date formatDate =
		 * stringToDate.parse(getOrder_no); //string을 date형식으로 파싱
		 * 
		 * String order_date = dateFormat.format(formatDate); //원하는 형식으로 date포맷 변환
		 * System.out.println(order_date);
		 * 
		 * 
		 * } catch (ParseException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); }
		 * 
		 * }
		 */

		return orderList;
	}

}
