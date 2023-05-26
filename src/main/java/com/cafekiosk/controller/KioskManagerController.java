package com.cafekiosk.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cafekiosk.model.KioskManageMenuVO;
import com.cafekiosk.model.OrderNumberVO;
import com.cafekiosk.service.KioskManageMenuService;
import com.cafekiosk.service.OrderNumberService;

import lombok.extern.log4j.Log4j;

// 이 클래스가 컨트롤러 역할한다고 스프링에 선언
@Controller
@Log4j
public class KioskManagerController {

	private static final Logger logger = LoggerFactory.getLogger(KioskManagerController.class);

	@Autowired
	private KioskManageMenuService manageMenuService;
	private OrderNumberService orderNumberService;

	// 메인 페이지 이동
	@RequestMapping(value = "/kioskManager/kioskManager", method = RequestMethod.GET)
	public void mainPageGet(Model model) {
		logger.info("manager 페이지 진입");

		List<KioskManageMenuVO> menuList = manageMenuService.getMenuList();

		model.addAttribute("menuList", menuList);
	}

	/* 메뉴 상세 */
	@RequestMapping("/kioskManager/edit_item")
	public String getMenuInfo(@RequestParam("menu_idx") int menu_idx, Model model) {

		logger.info("getMenuInfo()..........");

		model.addAttribute("menuInfo", manageMenuService.getMenuInfo(menu_idx));

		return "/kioskManager/edit_item";
	}

	/* 메뉴 수정 */
	@RequestMapping(value = "kioskManager/edit_item", method = RequestMethod.POST)
	public String editMenuInfo(KioskManageMenuVO manageMenu) throws Exception {
		logger.info("editMenuInfo()...");

		// 메뉴 수정 서비스 실행
		manageMenuService.editMenuInfo(manageMenu);

		logger.info("editMenuInfo 성공");
		return "redirect:/kioskManager/kioskManager";
	}

	@RequestMapping(value = "/kioskManager/insert_item", method = RequestMethod.GET)
	public void insertItemPageGet() {
		logger.info("insert_item 페이지 진입1");
	}

	/* 주문 내역 조회 */
	@RequestMapping(value="/kioskManager/order_list", method = {RequestMethod.GET, RequestMethod.POST})
	public String orderListPageGet(Model model, HttpServletRequest request,
									@RequestParam(required=false) String start_date, @RequestParam(required=false) String end_date){
		logger.info("order_list 페이지 진입");
		
		/*
		 * if(start_date != null) {
		 * request.setAttribute("start_date",request.getParameter("start_date")); } else
		 * { request.setAttribute("start_date",""); }
		 */
			
		 request.setAttribute("start_date",request.getParameter("start_date"));
		 request.setAttribute("end_date", request.getParameter("end_date"));
		 
			/*
			 * System.out.println(start_date); System.out.println(end_date);
			 */
		
		List<OrderNumberVO> orderList = manageMenuService.getOrderList(start_date, end_date);
		
		model.addAttribute("orderList", orderList);
		
		return "kioskManager/order_list";
	}
	
	/* 주문 내역 삭제 */
	@RequestMapping(value="/kioskManager/deleteOrder", method = RequestMethod.POST)
	public String deleteOrder(@RequestParam("order_no") String order_no) {
		
		manageMenuService.deleteOrder(order_no);
				
		return "redirect:/kioskManager/order_list";
	}

	@RequestMapping(value = "/kioskManager/check_sales", method = RequestMethod.GET)
	public void checkSalesPageGet() {
		logger.info("check_sales 페이지 진입");
	}
	
	/* 일매출 내역 조회 */
	@RequestMapping(value="/kioskManager/day_sales", method = {RequestMethod.GET, RequestMethod.POST})
	public String daySalesGet(Model model, HttpServletRequest request, @RequestParam(required=false) String this_day){
		logger.info("daySales 페이지 진입");
			
		/*
		 * request.setAttribute("start_date",request.getParameter("start_date"));
		 * request.setAttribute("end_date", request.getParameter("end_date"));
		 */

		List<OrderNumberVO> daySales = manageMenuService.getDaySales(this_day);
		
		model.addAttribute("daySales", daySales);
		
		return "kioskManager/check_sales";
	}
	
	/* 월매출 내역 조회 */
	@RequestMapping(value="/kioskManager/monthly_sales", method = {RequestMethod.GET, RequestMethod.POST})
	public String monthlySalesGet(Model model, HttpServletRequest request, 
									@RequestParam(required=false) String start_date,
									@RequestParam(required=false) String end_date){
		logger.info("monthlySales 페이지 진입");
			
		/*
		 * request.setAttribute("start_date",request.getParameter("start_date"));
		 * request.setAttribute("end_date", request.getParameter("end_date"));
		 */

		List<OrderNumberVO> monthlySales = manageMenuService.getMonthlySales(start_date, end_date);
		
		model.addAttribute("monthlySales", monthlySales);
		
		return "kioskManager/check_sales";
	}
	

	// 메뉴 등록
	@RequestMapping(value = "kioskManager/insert_item", method = RequestMethod.POST)
	public String insertMenu(KioskManageMenuVO manageMenu) throws Exception {
		logger.info("insert Menu 진입");

		// 메뉴등록 서비스 실행
		manageMenuService.insertMenu(manageMenu);

		logger.info("insertMenu 성공");
		return "redirect:/kioskManager/insert_item";
	}

	// 메뉴 등록 - 사진 첨부
	@PostMapping("kioskManager/insertMenuAjaxAction")
	public void uploadAjaxActionPOST(MultipartFile uploadFile) {

		logger.info("uploadAjaxActionPOST..........");

		logger.info("파일 이름 : " + uploadFile.getOriginalFilename());
		logger.info("파일 타입 : " + uploadFile.getContentType());
		logger.info("파일 크기 : " + uploadFile.getSize());

	}

	// 메뉴 삭제
	@RequestMapping(value = "kioskManager/delete_item", method = RequestMethod.POST)
	public String deleteMenu(@RequestParam("chk_list") List<Integer> idx) throws Exception {
		logger.info("deleteMenu 진입");

		for (Integer menu_idx : idx)
			manageMenuService.deleteMenu(menu_idx);

		return "redirect:/kioskManager/kioskManager";

	}

}
