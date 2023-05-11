package com.cafekiosk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafekiosk.mapper.ManageMenuMapper;
import com.cafekiosk.model.ManageMenuVO;

@Service  
public class ManageMenuServiceImpl implements ManageMenuService{

	@Autowired
	private ManageMenuMapper manageMenuMapper;

	@Override
	//메뉴 등록
	public void insertMenu(ManageMenuVO manageMenu) throws Exception {
		manageMenuMapper.insertMenu(manageMenu);
	}

	@Override
	//메뉴 전체 조회
	public List<ManageMenuVO> getMenuList() {
		List<ManageMenuVO> menuList = manageMenuMapper.getMenuList();
		return menuList;
	}

	@Override
	//메뉴 상세 조회
	public ManageMenuVO getMenuInfo(int menu_idx) {
		ManageMenuVO menuInfo = manageMenuMapper.getMenuInfo(menu_idx);
		// 객체 이미지 정보 -- 추후 구현
		// menuInfo.setImageList(ManageMenuMapper.getAttachInfo(menu_idx));
		return menuInfo;
	}

	@Override
	//메뉴 수정
	public void editMenuInfo(ManageMenuVO menuInfo) {
		 manageMenuMapper.editMenuInfo(menuInfo);
		
	}
	

}
