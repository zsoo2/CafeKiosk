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
	
}
