package com.cafekiosk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cafekiosk.model.ManageMenuVO;

@Mapper
public interface CustomerMapper {

	//메뉴 조회
	public List<ManageMenuVO> getMenuList(String tabName);
	
}