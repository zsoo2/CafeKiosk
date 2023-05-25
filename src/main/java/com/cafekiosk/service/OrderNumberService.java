package com.cafekiosk.service;

import java.util.List;

import com.cafekiosk.model.OrderNumberVO;

public interface OrderNumberService {

	//주문 내역 조회
	public List<OrderNumberVO> getOrderList();

}
