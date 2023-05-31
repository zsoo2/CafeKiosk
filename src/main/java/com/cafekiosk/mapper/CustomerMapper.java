package com.cafekiosk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.cafekiosk.model.CartVO;
import com.cafekiosk.model.KioskManageMenuVO;
import com.cafekiosk.model.OrderNumberVO;
import com.cafekiosk.model.PaymentVO;

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
	public void insertOrder(OrderNumberVO order);

	//active_YN
	public void editOrder(String order_no);

	public void editCartActive();

	//쿠폰 개수
	public Integer checkCoupon(String user_no);

	//쿠폰 개수 수정
	public void editCoupon(@Param("user_no") String user_no, @Param("coupon_cnt") int coupon_cnt);

	//결제 등록
	public void insertPayment(PaymentVO payment);
	
}
