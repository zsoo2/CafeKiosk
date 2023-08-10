package com.cafekiosk.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafekiosk.model.ApproveResponse;
import com.cafekiosk.model.CartVO;
import com.cafekiosk.model.KioskManageMenuVO;
import com.cafekiosk.model.OrderNumberVO;
import com.cafekiosk.model.PaymentVO;
import com.cafekiosk.model.ReadyResponse;
import com.cafekiosk.service.CustomerService;
import com.cafekiosk.service.KakaoPayService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CustomerController {

	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	@Autowired
	private CustomerService customerService;
	private KakaoPayService kakaoPayService;
	
	
	//메인 페이지 이동
	@RequestMapping(value="/customer/customer", method = RequestMethod.GET)	
	public String getMainPage() {
		logger.info("customer 페이지 진입");
		
		return "/customer/customer";
	}
	
	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String fileName){
		logger.info("getImage..........");
		File file = new File("c:\\upload\\" + fileName);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	@RequestMapping(value="/customer/menu_1", method = RequestMethod.GET)	
	public String getCoffeePage(Model model) {
		logger.info("customer_coffee 페이지 진입");
		
		
		List<KioskManageMenuVO> menuList = customerService.getMenuList("coffee");
		List<CartVO> cartList = customerService.getCartList();
		model.addAttribute("menuList", menuList);
		model.addAttribute("cartList", cartList);

		int totalSum = 0;
		int totalCnt = 0;
		
		for (int i = 0; i < cartList.size(); i++) {
			totalSum += cartList.get(i).getOption_price();
			totalCnt += cartList.get(i).getCount();
		}		
		DecimalFormat decFormat = new DecimalFormat("###,###");
		String totalSumCom = decFormat.format(totalSum);
		model.addAttribute("totalSumCom", totalSumCom);
		/* model.addAttribute("totalSum", totalSum); */
		model.addAttribute("totalCnt", totalCnt);
		
		return "/customer/menu_1";
	}
	
	@RequestMapping(value="/customer/menu_2", method = RequestMethod.GET)	
	public String getTeaadePage(Model model) {
		logger.info("customer_teaade 페이지 진입");
		List<KioskManageMenuVO> menuList = customerService.getMenuList("teaade");
		List<CartVO> cartList = customerService.getCartList();
		model.addAttribute("menuList", menuList);
		model.addAttribute("cartList", cartList);
		
		int totalSum = 0;
		int totalCnt = 0;
		
		for (int i = 0; i < cartList.size(); i++) {
			totalSum += cartList.get(i).getOption_price();
			totalCnt += cartList.get(i).getCount();
		}		
		DecimalFormat decFormat = new DecimalFormat("###,###");
		String totalSumCom = decFormat.format(totalSum);
		model.addAttribute("totalSumCom", totalSumCom);
		model.addAttribute("totalCnt", totalCnt);
		
		return "/customer/menu_2";
	}
	
	@RequestMapping(value="/customer/menu_3", method = RequestMethod.GET)	
	public String getNoncoffeePage(Model model) {
		logger.info("customer_noncoffee 페이지 진입");
		List<KioskManageMenuVO> menuList = customerService.getMenuList("noncoffee");
		List<CartVO> cartList = customerService.getCartList();
		model.addAttribute("menuList", menuList);
		model.addAttribute("cartList", cartList);

		int totalSum = 0;
		int totalCnt = 0;
		
		for (int i = 0; i < cartList.size(); i++) {
			totalSum += cartList.get(i).getOption_price();
			totalCnt += cartList.get(i).getCount();
		}		
		DecimalFormat decFormat = new DecimalFormat("###,###");
		String totalSumCom = decFormat.format(totalSum);
		model.addAttribute("totalSumCom", totalSumCom);
		model.addAttribute("totalCnt", totalCnt);
		
		return "/customer/menu_3";
	}
	
	@RequestMapping(value="/customer/menu_4", method = RequestMethod.GET)	
	public String getDessertPage(Model model) {
		logger.info("customer_dessert 페이지 진입");
		List<KioskManageMenuVO> menuList = customerService.getMenuList("dessert");
		List<CartVO> cartList = customerService.getCartList();
		model.addAttribute("menuList", menuList);
		model.addAttribute("cartList", cartList);

		int totalSum = 0;
		int totalCnt = 0;
		
		for (int i = 0; i < cartList.size(); i++) {
			totalSum += cartList.get(i).getOption_price();
			totalCnt += cartList.get(i).getCount();
		}		
		
		DecimalFormat decFormat = new DecimalFormat("###,###");
		String totalSumCom = decFormat.format(totalSum);
		model.addAttribute("totalSumCom", totalSumCom);
		model.addAttribute("totalCnt", totalCnt);
		
		return "/customer/menu_4";
	}
	
	//장바구니 메뉴 추가
	@RequestMapping(value="/customer/insertCart", method = RequestMethod.POST)
	public String insertCart(CartVO cart, HttpServletRequest request) throws Exception {
		logger.info("insert Cart 페이지 진입");
	
		int itemCount = cart.getCount();
		int itemPrice = cart.getMenu_price();
		int shot = 500;
		int shotCount = Integer.parseInt(cart.getOption3()) * shot;		
		int totalPrice = itemCount*(itemPrice + shotCount);
		
		cart.setOption_price(totalPrice);
		cart.setActive_YN("Y");
		 
		System.out.println(cart);
		
		customerService.insertCart(cart);
		
		logger.info("insert Cart 성공");
		
		String menu_cate = request.getParameter("menu_cate");
		String addr = "";
		
		if (menu_cate.equals("coffee")) {
			addr = "menu_1";
		} else if(menu_cate.equals("teaade")) {
			addr = "menu_2";
		} else if(menu_cate.equals("noncoffee")) {
			addr = "menu_3";
		} else if(menu_cate.equals("dessert")) {
			addr = "menu_4";
		} else {
			addr = "menu_1";
		}
		
		return "redirect:/customer/" + addr;
	}
	
	//장바구니 메뉴 삭제
	@ResponseBody
	@RequestMapping(value="/customer/deleteCart", method = RequestMethod.POST)
	public String deleteCart(@RequestParam("idx") String cart_idx) {

		customerService.deleteCart(Integer.parseInt(cart_idx));
		logger.info("deleteCart 성공");
		
		return "";
	}
		
	//장바구니 메뉴 수정
	@ResponseBody
	@RequestMapping(value="/customer/editCart", method = RequestMethod.POST)
	public String editCart( @RequestParam("idx") 	String idx, 
							@RequestParam("price") 	String price, 
							@RequestParam("option") String option,
							@RequestParam("cnt")	String cnt ) {
		
		int cart_idx 	= Integer.parseInt(idx);
		int cart_price 	= Integer.parseInt(price);
		int cart_option = Integer.parseInt(option);
		int count	= Integer.parseInt(cnt);
		int option_price = (cart_price + cart_option) * count;
		
		customerService.editCart(cart_idx, count, option_price);
			
		logger.info("editCart 성공");
		
		return "";
	}
	
	@RequestMapping(value="/customer/check_member", method = RequestMethod.GET)
	public void checkMemberPageGet() {
		logger.info("check_member 페이지 진입");
	}

	
	@RequestMapping(value="/customer/join", method = RequestMethod.GET)
	public void joinPageGet() {
		logger.info("join 페이지 진입");
	}
	
	@RequestMapping(value="/customer/join", method = RequestMethod.POST)
	public String joinPage (@RequestParam("user_no") String user_no, Model model) {
		logger.info("join 페이지 진입");
		user_no = user_no.replaceAll("-", "");
		int check_result = customerService.checkMember(user_no);
		
		model.addAttribute("user_no", user_no);
		model.addAttribute("check_result", check_result);
		
		return "/customer/join";
	}
	
	// 비회원 주문
	@RequestMapping(value="/customer/order", method = RequestMethod.GET)
	public String insertOrder(Model model, OrderNumberVO order) {
		
		LocalDateTime now = LocalDateTime.now();
	    String order_no = now.format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"));
	    String user_no = "N";
          
	    List<CartVO> cartList = customerService.getCartList();
		for (int i = 0; i < cartList.size(); i++) {
			int cart_idx 		= cartList.get(i).getCart_idx();
			int menu_idx 		= cartList.get(i).getMenu_idx();
			String menu_name 	= cartList.get(i).getMenu_name();
			int menu_price 		= cartList.get(i).getMenu_price();
			int option_price 	= cartList.get(i).getOption_price();
			
			order.setOrder_no(order_no);
			order.setUser_no(user_no);
			order.setCart_idx(cart_idx);
			order.setMenu_idx(menu_idx);
			order.setMenu_name(menu_name);
			order.setMenu_price(menu_price);
			order.setOption_price(option_price);
			customerService.insertOrder(order);
		}
		
		model.addAttribute("order_no", order_no);
		return "redirect:/customer/payment";
	}
	
	
	// 회원 주문
	@RequestMapping(value="/customer/order", method = RequestMethod.POST)
	public String insertOrder(Model model, OrderNumberVO order,
							  @RequestParam("user_no") 		String user_no,
							  @RequestParam("check_result") int check_result) {
		logger.info("insertOrder 페이지 진입");
	
		if(check_result == 0) { 
			  customerService.insertMember(user_no);	// 새 멤버 등록
		}

	    LocalDateTime now = LocalDateTime.now();
	    String order_no = now.format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"));
          
	    List<CartVO> cartList = customerService.getCartList();
		for (int i = 0; i < cartList.size(); i++) {
			int cart_idx 		= cartList.get(i).getCart_idx();
			int menu_idx 		= cartList.get(i).getMenu_idx();
			String menu_name 	= cartList.get(i).getMenu_name();
			int menu_price 		= cartList.get(i).getMenu_price();
			int option_price 	= cartList.get(i).getOption_price();
	
			order.setOrder_no(order_no);
			order.setUser_no(user_no);
			order.setCart_idx(cart_idx);
			order.setMenu_idx(menu_idx);
			order.setMenu_name(menu_name);
			order.setMenu_price(menu_price);
			order.setOption_price(option_price);
			customerService.insertOrder(order);
		}
		model.addAttribute("order_no", order_no);
		model.addAttribute("user_no", user_no);
		return "redirect:/customer/payment";		  
	}
	
	@RequestMapping(value="/customer/payment", method = RequestMethod.GET)
	public void paymentPageGet(Model model,
							   @RequestParam(value="order_no", required=false) String order_no,
							   @RequestParam(value="user_no", required=false) String user_no) {
		logger.info("payment GET 페이지 진입");
		
		List<CartVO> cartList = customerService.getCartList();

		int total_price = 0;
		if(user_no == "" || user_no == null) {user_no = "N";}	// 비회원 주문
		int check_coupon = customerService.checkCoupon(user_no);
			
		for (int i = 0; i < cartList.size(); i++) {
			total_price += cartList.get(i).getOption_price();
		}	
		
		if(check_coupon > 9) {
			total_price = total_price -2800;
			model.addAttribute("display", "contents");
		} else {
			model.addAttribute("display", "none");
		}
		
		DecimalFormat decFormat = new DecimalFormat("###,###");
		String total_com = decFormat.format(total_price);
		model.addAttribute("total_com", total_com);
		model.addAttribute("total_price", total_price);
		model.addAttribute("cartList", cartList);
		model.addAttribute("order_no", order_no);
		model.addAttribute("user_no", user_no);
	}

		
	@RequestMapping(value="/customer/orderPay", method = RequestMethod.GET)
	public @ResponseBody ReadyResponse payReady(CartVO cart, PaymentVO payment, Model model, HttpServletRequest request,
												@RequestParam(value="order_no", required=false) String order_no,
												@RequestParam(value="user_no", required=false) String user_no, 
												@RequestParam(value="total_price", required=false) String total_price) {
		logger.info("payReady 페이지 진입");
		
		System.out.println(order_no + " order_no");
		System.out.println(user_no + " user_no");
		System.out.println(total_price + " total_price");

		List<CartVO> cartList = customerService.getCartList();
		String item_name = cartList.get(0).getMenu_name() + " 외" + String.valueOf(cartList.size() -1) + " 개";
		int quantity = cartList.size();
		logger.info("quantity : " + quantity);

		ReadyResponse readyResponse = kakaoPayService.payReady(item_name, quantity, order_no, user_no, total_price);
		logger.info("결제고유번호 : " + readyResponse.getTid());
		logger.info("결제요청 URL : " + readyResponse.getNext_redirect_pc_url());
		//model.addAttribute("tid", readyResponse.getTid());
		
		 HttpSession session = request.getSession();
		 String tid = readyResponse.getTid();
		 session.setAttribute("order_no", order_no);
		 session.setAttribute("user_no", user_no);
		 session.setAttribute("tid", tid);

		return readyResponse;
	}
	
	@RequestMapping(value="/customer/payComplete", method = RequestMethod.GET)
	public String payComplete(@RequestParam("pg_token") String pgToken, HttpServletRequest request, PaymentVO payment) {
		
		HttpSession session = request.getSession();
	    String order_no = (String) session.getAttribute("order_no");
	    String user_no = (String) session.getAttribute("user_no");
	    String tid = (String) session.getAttribute("tid");

		ApproveResponse approveResponse = kakaoPayService.payApprove(order_no, user_no, tid, pgToken);	
	
		if(user_no == "" || user_no == null) {user_no = "N";}	// 비회원 주문

		customerService.editOrder(order_no);
		customerService.editCartActive();
		String coupon_YN = "N";
		int final_price = approveResponse.getAmount().getTotal();
		String total_price = Integer.toString(final_price);
		if(!user_no.equals("N")) {
			int coupon_cnt = 0;
			int check_coupon = customerService.checkCoupon(user_no);

			if(check_coupon < 10) {
				coupon_cnt = check_coupon + 1;
			}else {
				coupon_cnt = check_coupon -10 + 1;
				coupon_YN = "Y";
			}
			customerService.editCoupon(user_no, coupon_cnt);	
		}
		
	     payment.setOrder_no(order_no);
	     payment.setUser_no(user_no);
	     payment.setCoupon_YN(coupon_YN);
	     payment.setTotal_price(total_price);
	     
	     customerService.insertPayment(payment);
			
		if(session != null) {
			session.invalidate(); // 세션 삭제
		}
		
		return "redirect:/customer/pay_complete";
    }
    
	@RequestMapping(value="/customer/payCancel", method = RequestMethod.GET)
	public void payCancel() {
	}
    	
	@RequestMapping(value="/customer/payFail", method = RequestMethod.GET)
	public void payFail() {
	}
	
	@RequestMapping(value="/customer/pay_complete", method = RequestMethod.GET)
	public void payCompletePage() {
		logger.info("payCompletePage 페이지 진입");
	}
	
	@RequestMapping(value="/customer/popup_option", method = RequestMethod.GET)
	public void popupOptionPageGet() {
		logger.info("popup_option 페이지 진입");
	}
}
