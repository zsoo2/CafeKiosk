package com.cafekiosk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafekiosk.mapper.OrderNumberMapper;
import com.cafekiosk.model.OrderNumberVO;

@Service  
public class OrderNumberServiceImpl implements OrderNumberService{

	@Autowired
	private OrderNumberMapper orderNumberMapper;

	@Override
	//주문내역 전체 조회
	public List<OrderNumberVO> getOrderList() {
		List<OrderNumberVO> orderList = orderNumberMapper.getOrderList();
		return orderList;
	}


}
