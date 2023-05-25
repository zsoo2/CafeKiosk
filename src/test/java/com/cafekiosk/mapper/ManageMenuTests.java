package com.cafekiosk.mapper;

import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cafekiosk.controller.KioskManagerController;
import com.cafekiosk.model.KioskManageMenuVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ManageMenuTests {
	private static final Logger logger = LoggerFactory.getLogger(KioskManagerController.class);
	@Autowired
	private KioskManageMenuMapper manageMenuMapper;  //ManageMenuMapper 인터페이스 의존성 주입
	private OrderNumberMapper orderNumberMapper;	//OrderNumberMappder 인터페이스 의존성 주입
	
	//메뉴 등록 쿼리 테스트 메서드
	@Test
	/*
	 * public void insertMenu() throws Exception{
	 * 
	 * ManageMenuVO manageMenu = new ManageMenuVO();
	 * 
	 * manageMenu.setMenu_name("혜윤"); manageMenu.setMenu_price(1004);
	 * manageMenu.setMenu_category("coffee"); manageMenu.setMenu_picture("test");
	 * manageMenu.setOption1_YN("Y"); manageMenu.setOption2_YN("Y");
	 * manageMenu.setOption3_YN("N");
	 * 
	 * manageMenuMapper.insertMenu(manageMenu);
	 * 
	 * }
	 */
	
    public void testGetList() {
        
        
        List list = manageMenuMapper.getOrderList();
       /* 일반적 for문 */
        for(int i = 0; i < list.size();i++) {
            logger.info("" + list.get(i));
        }
        
    }
}
