package com.cafekiosk.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafekiosk.model.CartVO;
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
	public String getCoffeePage(Model model) {
		logger.info("customer_coffee 페이지 진입");
		List<ManageMenuVO> menuList = customerService.getMenuList("coffee");
		model.addAttribute("menuList", menuList);
		
		return "/customer/menu_1";
	}
	
	@RequestMapping(value="/customer/menu_2", method = RequestMethod.GET)	
	public String getTeaadePage(Model model) {
		logger.info("customer_teaade 페이지 진입");
		List<ManageMenuVO> menuList = customerService.getMenuList("teaade");
		model.addAttribute("menuList", menuList);
		
		return "/customer/menu_2";
	}
	
	@RequestMapping(value="/customer/menu_3", method = RequestMethod.GET)	
	public String getNoncoffeePage(Model model) {
		logger.info("customer_noncoffee 페이지 진입");
		List<ManageMenuVO> menuList = customerService.getMenuList("noncoffee");
		model.addAttribute("menuList", menuList);
		
		return "/customer/menu_3";
	}
	
	@RequestMapping(value="/customer/menu_4", method = RequestMethod.GET)	
	public String getDessertPage(Model model) {
		logger.info("customer_dessert 페이지 진입");
		List<ManageMenuVO> menuList = customerService.getMenuList("dessert");
		model.addAttribute("menuList", menuList);
		
		return "/customer/menu_4";
	}
	
	//장바구니 메뉴 추가
	@RequestMapping(value="/customer/menu_1", method = RequestMethod.POST)
	public String insertCart(CartVO cart) throws Exception {
		logger.info("insert Cart 페이지 진입");
	
		int itemCount = cart.getCount();
		int itemPrice = cart.getMenu_price();
		int itemOption = Integer.parseInt(cart.getOption3())*500;		
		int totalPrice = itemCount*(itemPrice + itemOption);
		
		cart.setOption_price(totalPrice);
		cart.setActive_YN("Y");
		 
		System.out.println(cart);
		
		customerService.insertCart(cart);
		
		logger.info("insert Cart 성공");
		
//		String addr = "";
//		if(// 장바구니 등록 메뉴 카테고리별 주소 다르게 ) {
//			addr = "menu_1";
//		}
//		
//		return "redirect:/customer/" + addr ;
		return "redirect:/customer/menu_1";	// 일단 등록 완료하면 menu_1 로 가는걸로 고정
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
