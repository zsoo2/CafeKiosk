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
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	//메인 페이지 이동
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String mainPageGet() {
		logger.info("메인 페이지 진입");
		
		return "main";
	}
}
