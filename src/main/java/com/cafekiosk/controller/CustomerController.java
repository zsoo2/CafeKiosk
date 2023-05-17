package com.cafekiosk.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafekiosk.model.ManageMenuVO;
import com.cafekiosk.service.CustomerService;

import lombok.extern.log4j.Log4j;

// 이 클래스가 컨트롤러 역할한다고 스프링에 선언
@Controller
@Log4j
public class CustomerController {

	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	@Autowired
	private CustomerService customerService;
	
	
	//메인 페이지 이동
	@RequestMapping(value="/customer/customer", method = RequestMethod.GET)	
	public String getMainPage() {
		logger.info("customer 페이지 진입");
		
		return "/customer/customer";
	}
	@RequestMapping(value="/customer/menu_1", method = RequestMethod.GET)	
	public String getCoffeePage() {
		logger.info("customer_coffee 페이지 진입");
		
		return "/customer/menu_1";
	}
	@RequestMapping(value="/customer/menu_2", method = RequestMethod.GET)	
	public String getTeaadePage() {
		logger.info("customer_teaade 페이지 진입");
		
		return "/customer/menu_2";
	}
	@RequestMapping(value="/customer/menu_3", method = RequestMethod.GET)	
	public String getNoncoffeePage() {
		logger.info("customer_noncoffee 페이지 진입");
		
		return "/customer/menu_3";
	}
	@RequestMapping(value="/customer/menu_4", method = RequestMethod.GET)	
	public String getDessertPage() {
		logger.info("customer_dessert 페이지 진입");
		
		return "/customer/menu_4";
	}
	
	//메뉴 목록 ajax
	@RequestMapping(value="/menuListAjax", method = RequestMethod.GET)
	@ResponseBody
	public List<ManageMenuVO> getMenuList(@RequestParam(required=false, defaultValue="tabName") String tabName) {
		logger.info("getMenuList");
		List<ManageMenuVO> menuList = customerService.getMenuList(tabName);
		
		//log.info("메뉴목록---------------------------------------" + menuList);
		return menuList;
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
