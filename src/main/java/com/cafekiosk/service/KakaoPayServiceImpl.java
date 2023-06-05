package com.cafekiosk.service;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.cafekiosk.model.ApproveResponse;
import com.cafekiosk.model.ReadyResponse;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class KakaoPayServiceImpl {

	public ReadyResponse payReady(String item_name, int quantity, String order_no, String user_no, String total_price) {

		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		parameters.add("cid", "TC0ONETIME");
		parameters.add("partner_order_id", order_no);
		parameters.add("partner_user_id", user_no);	
		parameters.add("item_name", item_name);	
		parameters.add("quantity", String.valueOf(quantity));	
		parameters.add("total_amount", total_price);	
		parameters.add("tax_free_amount", "0");	
//		parameters.add("approval_url", "http://localhost:8082/customer/orderComplete");	
//		parameters.add("cancel_url", "http://localhost:8082/customer/orderCancel");	
//		parameters.add("fail_url", "http://localhost:8082/customer/orderFail");	
		parameters.add("approval_url", "http://hello4018.cafe24.com/customer/orderComplete");	
		parameters.add("cancel_url", "http://hello4018.cafe24.com/customer/orderCancel");	
		parameters.add("fail_url", "http://hello4018.cafe24.com/customer/orderFail");	
		
		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(parameters, this.getHeaders());

		RestTemplate template = new RestTemplate();
		String url = "https://kapi.kakao.com/v1/payment/ready";

		ReadyResponse readyResponse = template.postForObject(url, requestEntity, ReadyResponse.class);

		System.out.println("결재준비 응답객체: " + readyResponse);
		return readyResponse;
	}
	
	
	// 결제 승인요청 메서드
	public ApproveResponse payApprove(String order_no, String user_no, String tid, String pgToken) {

		System.out.println(tid + " service <-------- tid");
		System.out.println(pgToken + " service <-------- pgToken");

		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		parameters.add("cid", "TC0ONETIME");
		parameters.add("tid", tid);
		parameters.add("partner_order_id", order_no); 
		parameters.add("partner_user_id", user_no);
		parameters.add("pg_token", pgToken);
		
		 // 하나의 map안에 header와 parameter값을 담아줌.
		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(parameters, this.getHeaders());
		

		RestTemplate template = new RestTemplate();
		String url = "https://kapi.kakao.com/v1/payment/approve";
        // 보낼 외부 url, 요청 메시지(header,parameter), 처리후 값을 받아올 클래스. 
		ApproveResponse approveResponse = template.postForObject(url, requestEntity, ApproveResponse.class);
		System.out.println("결재승인 응답객체: " + approveResponse);
		
		return approveResponse;
	}
	
	// 요청 헤더 정보
		private HttpHeaders getHeaders() {
			HttpHeaders headers = new HttpHeaders();
			headers.set("Authorization", "KakaoAK bec8650de2709c469225246fd7358713");
			headers.set("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			return headers;
		}
		
}
