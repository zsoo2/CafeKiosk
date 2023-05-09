package com.cafekiosk.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.cafekiosk.model.ManageMenuVO;
import com.cafekiosk.service.ManageMenuService;

import lombok.extern.log4j.Log4j;

// 이 클래스가 컨트롤러 역할한다고 스프링에 선언
@Controller
@Log4j
public class ManagerController {

	private static final Logger logger = LoggerFactory.getLogger(ManagerController.class);
	
	@Autowired
	private ManageMenuService manageMenuService;
	
	//메인 페이지 이동
	@RequestMapping(value="/manager/manager", method = RequestMethod.GET)
	public void mainPageGet() {
		logger.info("manager 페이지 진입");
	}
	
	@RequestMapping(value="/manager/edit_item", method = RequestMethod.GET)
	public void editItemPageGet() {
		logger.info("edit_item 페이지 진입");
	}
	
	@RequestMapping(value="/manager/insert_item", method = RequestMethod.GET)
	public void insertItemPageGet() {
		logger.info("insert_item 페이지 진입");
	}
	
	@RequestMapping(value="/manager/order_list", method = RequestMethod.GET)
	public void orderListPageGet() {
		logger.info("order_list 페이지 진입");
	}
	
	@RequestMapping(value="/manager/check_sales", method = RequestMethod.GET)
	public void checkSalesPageGet() {
		logger.info("check_sales 페이지 진입");
	}
	
	//메뉴 등록
	@RequestMapping(value="manager/insert_item", method = RequestMethod.POST)
	public String insertMenu(ManageMenuVO manageMenu) throws Exception{
		logger.info("insert Menu 진입");
		
		//메뉴등록 서비스 실행
		manageMenuService.insertMenu(manageMenu);
		
		logger.info("insertMenu 성공");
		return "redirect:/manager/insert_item";
	}
	
	//메뉴 등록 - 사진 첨부 
	@PostMapping("manager/insertMenuAjaxAction")
	public void uploadAjaxActionPOST(MultipartFile uploadFile) {
		
		logger.info("uploadAjaxActionPOST..........");
		
		logger.info("파일 이름 : " + uploadFile.getOriginalFilename());
		logger.info("파일 타입 : " + uploadFile.getContentType());
		logger.info("파일 크기 : " + uploadFile.getSize());
		
	}
	
	

}
