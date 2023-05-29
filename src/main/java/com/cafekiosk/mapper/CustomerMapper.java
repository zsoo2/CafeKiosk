package com.cafekiosk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.cafekiosk.model.CartVO;
import com.cafekiosk.model.KioskManageMenuVO;

@Mapper
public interface CustomerMapper {

	//메뉴 조회
	public List<KioskManageMenuVO> getMenuList(String tabName);

	//장바구니 등록
	public void insertCart(CartVO cart);

	//장바구니 조회
	public List<CartVO> getCartList();

	//장바구니 삭제
	public void deleteCart(int cart_idx);

	//장바구니 수정
	public void editCart(@Param("cart_idx") int cart_idx, @Param("count") int count, @Param("option_price") int option_price);

	//맴버 확인
	public Integer checkMember(String user_no);

	//멤버 등록
	public void insertMember(String user_no);

	//주문 등록
	public void insertOrder(@Param("order_no") String order_no, @Param("user_no") String user_no, @Param("cart_idx") int cart_idx, @Param("menu_idx") int menu_idx, @Param("menu_name") String menu_name, @Param("menu_price") int menu_price, @Param("option_price") int option_price);
	
}
