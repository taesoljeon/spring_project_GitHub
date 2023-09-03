package com.spring.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.dao.bid.Bidding;
import com.spring.dto.sell.SellVO;
import com.spring.service.bid.BiddingService;
import com.spring.service.bid.ProductDetailService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class Test01010 {
	
	@Autowired
	ProductDetailService product;
	
	@Autowired
	Bidding bid;
	
//	@Autowired
//	ProductDetail product;
	
	@Test
	public void test() {
		SellVO vo = new SellVO();
		vo.setSell_price("980000");
		vo.setSell_user_id("zxc");
		vo.setSell_detail_code(51);
		
		System.out.println(bid.getBidCode(vo));
	}
	
//	@Test
//	public void test() {
//		
//		System.out.println(product.readProduct(14));
//	}
	
}
