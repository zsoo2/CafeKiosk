package com.cafekiosk.mapper;

import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cafekiosk.model.ManageMenuVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ManageMenuTests {

	@Autowired
	private ManageMenuMapper manageMenuMapper;  //ManageMenuMapper 인터페이스 의존성 주입
	
	//메뉴 등록 쿼리 테스트 메서드
	@Test
	public void insertMenu() throws Exception{
        
		ManageMenuVO manageMenu = new ManageMenuVO();
		
		manageMenu.setMenu_name("혜윤");
		manageMenu.setMenu_price(1004);
		manageMenu.setMenu_category("coffee");
		manageMenu.setMenu_picture("test");
		manageMenu.setOption1_YN("Y");
		manageMenu.setOption2_YN("Y");
		manageMenu.setOption3_YN("N");
		manageMenu.setReg_user("혜윤");
		
		manageMenuMapper.insertMenu(manageMenu);
		
	}
}
