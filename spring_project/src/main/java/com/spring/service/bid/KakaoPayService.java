package com.spring.service.bid;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.stereotype.Component;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.spring.dto.bid.BidCreateDto;

@Component
public class KakaoPayService {

	public String kakaoPayRead(BidCreateDto dto) {
		String result = "";
		URL address;
		try {
			// 보내기
			address = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection conn = (HttpURLConnection)address.openConnection();
			conn.setRequestMethod("POST");	
			conn.setRequestProperty("Authorization", "KakaoAK 63f44ab9758adbeedd7f30fe6e95d555");
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			
			conn.setDoOutput(true);
			String parameter = "cid=TC0ONETIME"							// 가맹점 코드
					 + "&partner_order_id=partner_order_id"				// 가맹점 주문번호
					 + "&partner_user_id=partner_user_id"				// 가맹점 회원 id
					 + "&item_name=" + dto.getProduct_name()			// 상품명
					 + "&quantity=1"									// 상품 수량
					 + "&total_amount=" + dto.getPrice()				// 상품 총액
					 + "&tax_free_amount=0"								// 상품 비과세 금액
					 + "&approval_url=" + dto.getSuccess_url()			// 결제 성공시 redirect url
					 + "&fail_url=http://3.34.141.136:8080/spring_project/bid/PaymentFail.bid"	// 실패시 URL
					 + "&cancel_url=http://3.34.141.136:8080/spring_project/bid/PaymentCancle.bid";	// 취소시 URL
			
			// 카카오페이DTO = 품명,금액,성공시url 
			
			DataOutputStream dataOut = new DataOutputStream(conn.getOutputStream());
			dataOut.writeBytes(parameter);
			dataOut.close();
			
			// 읽기
			BufferedReader br = null;
			String line = "";
			StringBuffer sb = new StringBuffer();
			
			if(conn.getResponseCode() == 200) {
				br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			
			while ( (line = br.readLine()) != null ) {
				sb.append(line);
			}
			
			result = sb.toString();
			
			JsonParser parser = new JsonParser();
			JsonObject jobj = (JsonObject)parser.parse(result);
			System.out.println("  리다이렉트 값 테스트  "+jobj);
			result = jobj.get("next_redirect_pc_url").getAsString();
			
			
			return result;
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
}
