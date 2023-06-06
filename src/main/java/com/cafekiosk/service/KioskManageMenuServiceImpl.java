package com.cafekiosk.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.cafekiosk.mapper.KioskManageMenuMapper;
import com.cafekiosk.model.KioskManageMenuVO;
import com.cafekiosk.model.OrderNumberVO;
import com.cafekiosk.model.PagingVO;
import com.cafekiosk.model.PaymentVO;

@Service
public class KioskManageMenuServiceImpl implements KioskManageMenuService {

	@Autowired
	private KioskManageMenuMapper manageMenuMapper;

	@Override
	// 메뉴 등록
	public void insertMenu(KioskManageMenuVO manageMenu) throws Exception {
		manageMenuMapper.insertMenu(manageMenu);
	}

	@Override
	// 메뉴 전체 조회
	public List<KioskManageMenuVO> getMenuList() {
		List<KioskManageMenuVO> menuList = manageMenuMapper.getMenuList();
		return menuList;
	}

	@Override
	// 메뉴 상세 조회
	public KioskManageMenuVO getMenuInfo(int menu_idx) {
		KioskManageMenuVO menuInfo = manageMenuMapper.getMenuInfo(menu_idx);
		// 객체 이미지 정보 -- 추후 구현
		// menuInfo.setImageList(ManageMenuMapper.getAttachInfo(menu_idx));
		return menuInfo;
	}

	@Override
	// 메뉴 수정
	public void editMenuInfo(KioskManageMenuVO menuInfo) {
		manageMenuMapper.editMenuInfo(menuInfo);
	}

	@Override
	// 메뉴 삭제
	public void deleteMenu(int menu_idx) {
		manageMenuMapper.deleteMenu(menu_idx);
	}

	@Override
	// 주문내역 전체 조회
	public List<OrderNumberVO> getOrderList(String start_date, String end_date) {

		/* System.out.println(start_date); */
		
		 //여기서 날짜 바꾸려고 한 흔적.. 
		Date date = new Date();
		SimpleDateFormat dateStr = new SimpleDateFormat("yyyy-MM-dd"); //string을 날짜형식으로 변환하기 위해 선언
		 
		 if (start_date == null) {
			 start_date = dateStr.format(date);
		 } else {
			 start_date = start_date;
		 }
		 
		if(end_date == null) {
			end_date = dateStr.format(date);
		} else {
			end_date = end_date;
		}
		List<OrderNumberVO> orderList = manageMenuMapper.getOrderList(start_date, end_date);
		return orderList;
	}
	
	@Override
	// 주문내역 삭제
	public void deleteOrder(String order_no) {
		manageMenuMapper.deleteOrder(order_no);
	}
	
	@Override
	// 일매출 내역 조회
	public List<PaymentVO> getDaySales(String this_day) {
		
		 //여기서 날짜 바꾸려고 한 흔적.. 
		Date date = new Date();
		SimpleDateFormat dateStr = new SimpleDateFormat("yyyy-MM-dd"); //string을 날짜형식으로 변환하기 위해 선언
		 
		 if (this_day == null) {
			 this_day = dateStr.format(date);
		 } else {
			 this_day = this_day;
		 }

		List<PaymentVO> daySales = manageMenuMapper.getDaySales(this_day);
		return daySales;
	}

	@Override
	// 일매출 내역, 합계 조회
	public List<PaymentVO> getDaySalesCntSum(String this_day) {
		// TODO Auto-generated method stub
		List<PaymentVO> daySalesCntSum = manageMenuMapper.getDaySalesCntSum(this_day);
		return daySalesCntSum;
	}

	@Override
	// 월매출 전체 조회
	public List<PaymentVO> getMonthlySales(String start_date, String end_date) {

		/* System.out.println(start_date); */
		
		 //여기서 날짜 바꾸려고 한 흔적.. 
		Date date = new Date();
		SimpleDateFormat dateStr = new SimpleDateFormat("yyyy-MM-dd"); //string을 날짜형식으로 변환하기 위해 선언
		 
		 if (start_date == null) {
			 start_date = dateStr.format(date);
		 } else {
			 start_date = start_date;
		 }
		 
		if(end_date == null) {
			end_date = dateStr.format(date);
		} else {
			end_date = end_date;
		}
		List<PaymentVO> monthlySales = manageMenuMapper.getMonthlySales(start_date, end_date);
		return monthlySales;
	}

	@Override
	// 월매출 내역, 합계 조회
	public List<OrderNumberVO> getMonthlySalesCntSum(String start_date, String end_date) {
		// TODO Auto-generated method stub
		List<OrderNumberVO> monthlySalesCntSum = manageMenuMapper.getMonthlySalesCntSum(start_date, end_date);
		return monthlySalesCntSum;
	}
	
	@Override
	// 월매출 일자별 쿠폰 개수
	public List<PaymentVO> getMonthlySalesCoupon(String start_date, String end_date) {
		// TODO Auto-generated method stub
		List<PaymentVO> monthlySalesCoupon = manageMenuMapper.getMonthlySalesCoupon(start_date, end_date);
		return monthlySalesCoupon;
	}

	@Override
	//주문내역 엑셀 다운로드
	public void excelDown(OrderNumberVO orderNumberVO, HttpServletResponse response,String start_date, String end_date) throws Exception {
		// TODO Auto-generated method stub
		List<OrderNumberVO> getExcelList = manageMenuMapper.getExcelList(start_date, end_date);
		
		   try {
		      //Excel Down 시작
		      Workbook workbook = new HSSFWorkbook();
		      
		      //시트생성
		      String excelName = start_date+"_"+end_date;
		      Sheet sheet = workbook.createSheet("sheet1");

		      //행, 열, 열번호

		      Row row = null;
		      Cell cell = null;
		      int rowNo = 0;

		      // 테이블 헤더용 스타일
		      CellStyle headStyle = workbook.createCellStyle();

		      // 가는 경계선을 가집니다.
		      headStyle.setBorderTop(BorderStyle.THIN);
		      headStyle.setBorderBottom(BorderStyle.THIN);
		      headStyle.setBorderLeft(BorderStyle.THIN);
		      headStyle.setBorderRight(BorderStyle.THIN);

		      // 배경색은 노란색입니다.
		      headStyle.setFillForegroundColor(HSSFColorPredefined.GREY_50_PERCENT.getIndex());
		      headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

		      // 데이터용 경계 스타일 테두리만 지정
		      CellStyle bodyStyle = workbook.createCellStyle();
		      bodyStyle.setBorderTop(BorderStyle.THIN);
		      bodyStyle.setBorderBottom(BorderStyle.THIN);
		      bodyStyle.setBorderLeft(BorderStyle.THIN);
		      bodyStyle.setBorderRight(BorderStyle.THIN);
 
		      // 헤더명 설정
		      String[] headerArray = {"No","주문시각","주문번호","주문내역","구매내역","금액"};
		      row = sheet.createRow(rowNo++);
		      for(int i=0; i<headerArray.length; i++) {
			      cell = row.createCell(i);
			      cell.setCellStyle(headStyle);
			      cell.setCellValue(headerArray[i]);
		      }

		      for(OrderNumberVO excelData : getExcelList ) {
			      row = sheet.createRow(rowNo++);
			      
			      cell = row.createCell(0);
			      cell.setCellStyle(bodyStyle);
			      cell.setCellValue(rowNo-1);
		 
			      cell = row.createCell(1);
			      cell.setCellStyle(bodyStyle);
			      cell.setCellValue(excelData.getOrder_date());
			      
			      cell = row.createCell(2);
			      cell.setCellStyle(bodyStyle);
			      cell.setCellValue(excelData.getOrder_no());
		 
			      cell = row.createCell(3);
			      cell.setCellStyle(bodyStyle);
			      cell.setCellValue(excelData.getMenu_name());

			      cell = row.createCell(4);
			      cell.setCellStyle(bodyStyle);
			      cell.setCellValue(excelData.getUser_no());			 
	
			      cell = row.createCell(5);
			      cell.setCellStyle(bodyStyle);
			      cell.setCellValue(excelData.getOption_price());
		      }	 

		      // 컨텐츠 타입과 파일명 지정
		      response.setContentType("ms-vnd/excel");
		      response.setHeader("Content-Disposition", "attachment; filename=" + java.net.URLEncoder.encode(excelName+".xls", "UTF8"));
	 
		      // 엑셀 출력
		      workbook.write(response.getOutputStream());
		      workbook.close();
		      
		   	  }catch (Exception e) {
		   		e.printStackTrace();
		      }

    }

	@Override
	//일매출 엑셀 다운로드
	public void excelDownDay(PaymentVO paymentVO, HttpServletResponse response, String this_day)
			throws Exception {
		// TODO Auto-generated method stub
		List<PaymentVO> getExcelListDay = manageMenuMapper.getExcelListDay(this_day);
		
		   try {
		      //Excel Down 시작
		      Workbook workbook = new HSSFWorkbook();
		      
		      //시트생성
		      String excelName = this_day;
		      Sheet sheet = workbook.createSheet("sheet1");

		      //행, 열, 열번호

		      Row row = null;
		      Cell cell = null;
		      int rowNo = 0;

		      // 테이블 헤더용 스타일
		      CellStyle headStyle = workbook.createCellStyle();

		      // 가는 경계선을 가집니다.
		      headStyle.setBorderTop(BorderStyle.THIN);
		      headStyle.setBorderBottom(BorderStyle.THIN);
		      headStyle.setBorderLeft(BorderStyle.THIN);
		      headStyle.setBorderRight(BorderStyle.THIN);

		      // 배경색은 노란색입니다.
		      headStyle.setFillForegroundColor(HSSFColorPredefined.GREY_50_PERCENT.getIndex());
		      headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

		      // 데이터용 경계 스타일 테두리만 지정
		      CellStyle bodyStyle = workbook.createCellStyle();
		      bodyStyle.setBorderTop(BorderStyle.THIN);
		      bodyStyle.setBorderBottom(BorderStyle.THIN);
		      bodyStyle.setBorderLeft(BorderStyle.THIN);
		      bodyStyle.setBorderRight(BorderStyle.THIN);

		      // 헤더명 설정
		      String[] headerArray = {"No","주문번호","주문날짜","금액"};
		      row = sheet.createRow(rowNo++);
		      for(int i=0; i<headerArray.length; i++) {
			      cell = row.createCell(i);
			      cell.setCellStyle(headStyle);
			      cell.setCellValue(headerArray[i]);
		      }

		      for(PaymentVO excelData : getExcelListDay ) {
			      row = sheet.createRow(rowNo++);
			      
			      cell = row.createCell(0);
			      cell.setCellStyle(bodyStyle);
			      cell.setCellValue(rowNo-1);
		 
			      cell = row.createCell(1);
			      cell.setCellStyle(bodyStyle);
			      cell.setCellValue(excelData.getOrder_no());
			      
			      cell = row.createCell(2);
			      cell.setCellStyle(bodyStyle);
			      cell.setCellValue(excelData.getOrder_date());
	
			      cell = row.createCell(3);
			      cell.setCellStyle(bodyStyle);
			      cell.setCellValue(excelData.getTotal_price());
		      }	 

		      // 컨텐츠 타입과 파일명 지정
		      response.setContentType("ms-vnd/excel");
		      response.setHeader("Content-Disposition", "attachment; filename=" + java.net.URLEncoder.encode(excelName+".xls", "UTF8"));
	 
		      // 엑셀 출력
		      workbook.write(response.getOutputStream());
		      workbook.close();
		      
		   	  }catch (Exception e) {
		   		e.printStackTrace();
		      }		
	}

	@Override
	//월매출 엑셀 다운로드
	public void excelDownMonth(Model model, PaymentVO paymentVO, HttpServletResponse response, String start_date,
			String end_date) throws Exception {
		// TODO Auto-generated method stub
		List<PaymentVO> getExcelListMonth = manageMenuMapper.getExcelListMonth(start_date, end_date);
		List<PaymentVO> monthlySalesCoupon = manageMenuMapper.getMonthlySalesCoupon(start_date, end_date);
		
		int sum = 0;
		
		for (int i = 0; i < getExcelListMonth.size(); i++) {
			String order_no = getExcelListMonth.get(i).getOrder_no().substring(0,8);					//월매출 내역의 주문일
			String order_date = monthlySalesCoupon.get(i).getOrder_no().substring(0,8);			//월매출 쿠폰 사용 여부 내역의 주문일
			//String order_date = monthlySalesCoupon.get(i).getOrder_no().replace("-","");

			//System.out.println(order_no);
			//System.out.println(order_date);
			
			if(order_no .equals(order_date)) {
			 int total_price =
				Integer.parseInt(getExcelListMonth.get(i).getTotal_price()) - monthlySalesCoupon.get(i).getCp_cnt()*2800;
			 	//System.out.println(monthlySalesCoupon.get(i).getCp_cnt());
			 	
			 	String final_price = Integer.toString(total_price);
			 	getExcelListMonth.get(i).setTotal_price(final_price);
			}
			sum += Integer.parseInt(getExcelListMonth.get(i).getTotal_price());
		}

		//System.out.println(sum);
		model.addAttribute("getExcelListMonth", getExcelListMonth);
		
		
		   try {
		      //Excel Down 시작
		      Workbook workbook = new HSSFWorkbook();
		      
		      //시트생성
		      String excelName = start_date+"_"+end_date;
		      Sheet sheet = workbook.createSheet("sheet1");

		      //행, 열, 열번호

		      Row row = null;
		      Cell cell = null;
		      int rowNo = 0;

		      // 테이블 헤더용 스타일
		      CellStyle headStyle = workbook.createCellStyle();

		      // 가는 경계선을 가집니다.
		      headStyle.setBorderTop(BorderStyle.THIN);
		      headStyle.setBorderBottom(BorderStyle.THIN);
		      headStyle.setBorderLeft(BorderStyle.THIN);
		      headStyle.setBorderRight(BorderStyle.THIN);

		      // 배경색은 노란색입니다.
		      headStyle.setFillForegroundColor(HSSFColorPredefined.GREY_50_PERCENT.getIndex());
		      headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

		      // 데이터용 경계 스타일 테두리만 지정
		      CellStyle bodyStyle = workbook.createCellStyle();
		      bodyStyle.setBorderTop(BorderStyle.THIN);
		      bodyStyle.setBorderBottom(BorderStyle.THIN);
		      bodyStyle.setBorderLeft(BorderStyle.THIN);
		      bodyStyle.setBorderRight(BorderStyle.THIN);

		      // 헤더명 설정
		      String[] headerArray = {"No","주문시각","판매건수","금액"};
		      row = sheet.createRow(rowNo++);
		      for(int i=0; i<headerArray.length; i++) {
			      cell = row.createCell(i);
			      cell.setCellStyle(headStyle);
			      cell.setCellValue(headerArray[i]);
		      }

		      for(PaymentVO excelData : getExcelListMonth ) {
	    	  
			      row = sheet.createRow(rowNo++);
			      
			      cell = row.createCell(0);
			      cell.setCellStyle(bodyStyle);
			      cell.setCellValue(rowNo-1);
		 
			      cell = row.createCell(1);
			      cell.setCellStyle(bodyStyle);
			      cell.setCellValue(excelData.getOrder_date());
			      
			      cell = row.createCell(2);
			      cell.setCellStyle(bodyStyle);
			      cell.setCellValue(excelData.getTotal_cnt()+"건");
		 
			      cell = row.createCell(3);
			      cell.setCellStyle(bodyStyle);
			      cell.setCellValue(excelData.getTotal_price());
			      
					/*
					 * cell = row.createCell(4); cell.setCellStyle(bodyStyle); cell.setCellValue();
					 */

		      }	 

		      // 컨텐츠 타입과 파일명 지정
		      response.setContentType("ms-vnd/excel");
		      response.setHeader("Content-Disposition", "attachment; filename=" + java.net.URLEncoder.encode(excelName+".xls", "UTF8"));
	 
		      // 엑셀 출력
		      workbook.write(response.getOutputStream());
		      workbook.close();
		      
		   	  }catch (Exception e) {
		   		e.printStackTrace();
		      }		
	}

	@Override
	//게시글 총 갯수
	public int getListCount(String start_date, String end_date) {
		// TODO Auto-generated method stub
		return manageMenuMapper.getListCount(start_date, end_date);
	}

	@Override
	//페이징 처리 게시글 조회	
	public List<OrderNumberVO> getSelectList(PagingVO pagingVO, String start_date, String end_date) {
		// TODO Auto-generated method stub

		return manageMenuMapper.getSelectList(pagingVO, start_date, end_date);
	}
	
	
	
	
	
	}
