package com.cafekiosk.mapper;

import java.util.List;

import com.cafekiosk.model.OrderNumberVO;

public interface OrderNumberMapper {
	
	//주문 내역 조회
	public List<OrderNumberVO> getOrderList();
}
