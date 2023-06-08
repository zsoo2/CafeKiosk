package com.cafekiosk.service;

import com.cafekiosk.model.ApproveResponse;
import com.cafekiosk.model.ReadyResponse;

public interface KakaoPayService {

	ReadyResponse payReady(String item_name, int quantity, String order_no, String user_no, String total_price);

	ApproveResponse payApprove(String order_no, String user_no, String tid, String pgToken);
}
