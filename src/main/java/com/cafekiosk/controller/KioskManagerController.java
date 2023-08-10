package com.cafekiosk.controller;

<<<<<<< HEAD
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
=======
>>>>>>> branch 'develop' of https://github.com/zsoo2/CafeKiosk.git
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collector;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cafekiosk.model.KioskManageMenuVO;
import com.cafekiosk.model.OrderNumberVO;
import com.cafekiosk.model.PagingVO;
import com.cafekiosk.model.PaymentVO;
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
	/*
	 * @RequestMapping(value="/kioskManager/order_list", method =
	 * {RequestMethod.GET, RequestMethod.POST}) public String orderListPageGet(Model
	 * model, HttpServletRequest request,
	 * 
	 * @RequestParam(required=false) String
	 * start_date, @RequestParam(required=false) String end_date){
	 * logger.info("order_list 페이지 진입");
	 * 
	 * request.setAttribute("start_date",request.getParameter("start_date"));
	 * request.setAttribute("end_date", request.getParameter("end_date"));
	 * 
	 * List<OrderNumberVO> orderList = manageMenuService.getOrderList(start_date,
	 * end_date);
	 * 
	 * model.addAttribute("orderList", orderList);
	 * 
	 * return "kioskManager/order_list"; }
	 */
	
	@RequestMapping(value ="/kioskManager/order_list", method = RequestMethod.GET)
	public String getSelectList(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage
			, @RequestParam(required=false) String start_date
			, @RequestParam(required=false) String end_date
	) {
		
		int total = manageMenuService.getListCount(start_date, end_date);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		System.out.println(vo.getStart());
		System.out.println(vo.getEnd());
		model.addAttribute("viewAll", manageMenuService.getSelectList(vo, start_date, end_date));
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
			
		List<PaymentVO> daySales = manageMenuService.getDaySales(this_day);
		List<PaymentVO> daySalesCntSum = manageMenuService.getDaySalesCntSum(this_day);
		
				
		model.addAttribute("daySales", daySales);
		model.addAttribute("daySalesCntSum", daySalesCntSum);
				
		int cnt = daySalesCntSum.get(0).getCnt();
		int sum = Integer.parseInt(daySalesCntSum.get(0).getTotal_price());
		
		DecimalFormat decFormat = new DecimalFormat("###,###");
		
		String dayCnt = decFormat.format(cnt);		
		String daySum = decFormat.format(Math.floor(sum));

		model.addAttribute("dayCnt", dayCnt);		
		model.addAttribute("daySum", daySum);
		
		return "kioskManager/check_sales";
	}
	
	/* 월매출 내역 조회 */
	@RequestMapping(value="/kioskManager/monthly_sales", method = {RequestMethod.GET, RequestMethod.POST})
	public String monthlySalesGet(Model model, HttpServletRequest request, 
									@RequestParam(required=false) String start_date,
									@RequestParam(required=false) String end_date){
		logger.info("monthlySales 페이지 진입");
			
		List<PaymentVO> monthlySales = manageMenuService.getMonthlySales(start_date, end_date);
		List<OrderNumberVO> monthlySalesCntSum = manageMenuService.getMonthlySalesCntSum(start_date, end_date);
		List<PaymentVO> monthlySalesCoupon = manageMenuService.getMonthlySalesCoupon(start_date, end_date);

		int sum = 0;
		
		model.addAttribute("monthlySalesCntSum", monthlySalesCntSum);
		model.addAttribute("monthlySalesCoupon", monthlySalesCoupon);
		
		for (int i = 0; i < monthlySales.size(); i++) {
			String order_no = monthlySales.get(i).getOrder_no().substring(0,8);					//월매출 내역의 주문일
			String order_date = monthlySalesCoupon.get(i).getOrder_no().substring(0,8);			//월매출 쿠폰 사용 여부 내역의 주문일
			//String order_date = monthlySalesCoupon.get(i).getOrder_no().replace("-","");

			//System.out.println(order_no);
			//System.out.println(order_date);
			
			if(order_no .equals(order_date)) {
			 int total_price =
				Integer.parseInt(monthlySales.get(i).getTotal_price()) - monthlySalesCoupon.get(i).getCp_cnt()*2800;
			 	//System.out.println(monthlySalesCoupon.get(i).getCp_cnt());
			 	
			 	String final_price = Integer.toString(total_price);
			 	monthlySales.get(i).setTotal_price(final_price);
			}
			sum += Integer.parseInt(monthlySales.get(i).getTotal_price());
		}

		//System.out.println(sum);
		model.addAttribute("monthlySales", monthlySales);
		
		int cnt = monthlySales.stream().mapToInt(PaymentVO::getTotal_cnt).sum();


		DecimalFormat decFormat = new DecimalFormat("###,###");
		
		String monthCnt = decFormat.format(cnt);
		String monthSum = decFormat.format(sum);

		model.addAttribute("monthCnt", monthCnt);
		model.addAttribute("monthSum", monthSum);

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
	@PostMapping(value="kioskManager/insertMenuAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<KioskManageMenuVO>> uploadAjaxActionPOST(MultipartFile[] uploadFile) {

		logger.info("uploadAjaxActionPOST..........");
<<<<<<< HEAD
		/* 이미지 파일 체크 */
		for(MultipartFile multipartFile: uploadFile) {

			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;
			
			try {
				type = Files.probeContentType(checkfile.toPath());
				logger.info("MIME TYPE : " + type);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			if(!type.startsWith("image")) {
				
				List<KioskManageMenuVO> list = null;
				return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
				
			}
		}
		
		String uploadFolder = "C:\\upload";
=======

		logger.info("파일 이름 : " + uploadFile.getOriginalFilename());
		logger.info("파일 타입 : " + uploadFile.getContentType());
		logger.info("파일 크기 : " + uploadFile.getSize());
>>>>>>> branch 'develop' of https://github.com/zsoo2/CafeKiosk.git


		/* 이미저 정보 담는 객체 */
		List<KioskManageMenuVO> list = new ArrayList();
		
		for(MultipartFile multipartFile : uploadFile) {
			
			/* 이미저 정보 객체 */
			KioskManageMenuVO vo = new KioskManageMenuVO();
			
			/* 파일 이름 */
			String uploadFileName = multipartFile.getOriginalFilename();		
			
			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(uploadFolder, uploadFileName);
			
			/* 파일 저장 */
			try {
				multipartFile.transferTo(saveFile);
				
			} catch (Exception e) {
				
				e.printStackTrace();
			} 
			list.add(vo);
			vo.setMenu_picture(uploadFileName);
			vo.setMenu_path(uploadFolder);
		}
		ResponseEntity<List<KioskManageMenuVO>> result = new ResponseEntity<List<KioskManageMenuVO>>(list, HttpStatus.OK);
		return result;
	}

	// 메뉴 삭제
	@RequestMapping(value = "kioskManager/delete_item", method = RequestMethod.POST)
	public String deleteMenu(@RequestParam("chk_list") List<Integer> idx) throws Exception {
		logger.info("deleteMenu 진입");

		for (Integer menu_idx : idx)
			manageMenuService.deleteMenu(menu_idx);

		return "redirect:/kioskManager/kioskManager";

	}
	
	@RequestMapping(value = "kioskManager/excel_download", method = RequestMethod.POST)
	@ResponseBody
	// 주문내역 엑셀 다운로드
	public void excelDown(@ModelAttribute OrderNumberVO orderNumberVO, HttpServletResponse response, HttpServletRequest request, String start_date, String end_date)
						throws Exception{
		manageMenuService.excelDown(orderNumberVO, response, start_date, end_date);
		logger.info("엑셀 주문내역 성공");
	}
	
	@RequestMapping(value = "kioskManager/excel_download_day", method = RequestMethod.POST)
	@ResponseBody
	// 일매출 엑셀 다운로드
	public void excelDownDay(@ModelAttribute PaymentVO paymentVO, HttpServletResponse response, HttpServletRequest request, String this_day)
						throws Exception{
		manageMenuService.excelDownDay(paymentVO, response, this_day);
		logger.info("엑셀 일매출 성공");
	}
	
	@RequestMapping(value = "kioskManager/excel_download_month", method = RequestMethod.POST)
	@ResponseBody
	// 월매출 엑셀 다운로드
	public void excelDownMonth(Model model,@ModelAttribute PaymentVO paymentVO, HttpServletResponse response, HttpServletRequest request, String start_date, String end_date)
						throws Exception{
		manageMenuService.excelDownMonth(model, paymentVO, response, start_date, end_date);
		logger.info("엑셀 월매출 성공");
	}


}
