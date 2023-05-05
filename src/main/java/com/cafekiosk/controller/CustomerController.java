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
public class CustomerController {

	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	//메인 페이지 이동
	@RequestMapping(value="/customer/customer", method = RequestMethod.GET)
	public void mainPageGet() {
		logger.info("customer 페이지 진입");
	}
	
	@RequestMapping(value="/customer/check_member", method = RequestMethod.GET)
	public void checkMemberPageGet() {
		logger.info("check_member 페이지 진입");
	}
	
	@RequestMapping(value="/customer/join", method = RequestMethod.GET)
	public void joinPageGet() {
		logger.info("join 페이지 진입");
	}
	
	@RequestMapping(value="/customer/order_number", method = RequestMethod.GET)
	public void orderNumberPageGet() {
		logger.info("order_number 페이지 진입");
	}
	
	@RequestMapping(value="/customer/popup_option", method = RequestMethod.GET)
	public void popupOptionPageGet() {
		logger.info("popup_option 페이지 진입");
	}
	
	@RequestMapping(value="/customer/payment", method = RequestMethod.GET)
	public void paymentPageGet() {
		logger.info("payment 페이지 진입");
	}
	
	
}