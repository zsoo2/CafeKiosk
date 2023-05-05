package com.cafekiosk.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

// 이 클래스가 컨트롤러 역할한다고 스프링에 선언
@Controller
@Log4j
public class ManagerController {

	private static final Logger logger = LoggerFactory.getLogger(ManagerController.class);
	//메인 페이지 이동
	@RequestMapping(value="/manager/manager", method = RequestMethod.GET)
	public void mainPageGet() {
		logger.info("manager 페이지 진입");
	}
	
	@RequestMapping(value="/manager/edit_item", method = RequestMethod.GET)
	public void editItemPageGet() {
		logger.info("edit_item 페이지 진입");
	}
	
	@RequestMapping(value="/manager/order_list", method = RequestMethod.GET)
	public void orderListPageGet() {
		logger.info("order_list 페이지 진입");
	}
	
	@RequestMapping(value="/manager/check_sales", method = RequestMethod.GET)
	public void checkSalesPageGet() {
		logger.info("check_sales 페이지 진입");
	}
}
