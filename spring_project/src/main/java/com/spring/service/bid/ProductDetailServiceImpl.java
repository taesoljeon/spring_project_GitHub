package com.spring.service.bid;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.bid.ProductDetail;
import com.spring.dto.bid.BidUserVO;
import com.spring.dto.bid.ChartParamDto;
import com.spring.dto.bid.ChartResultDto;
import com.spring.dto.bid.OrderDto;
import com.spring.dto.bid.ProductDetailVO;
import com.spring.dto.bid.ProductParamVO;
import com.spring.dto.bid.SizePriceVO;
import com.spring.dto.bid.TransactionHistoryVO;

@Service("productDetailService")
public class ProductDetailServiceImpl implements ProductDetailService{

	@Autowired
	private ProductDetail dao;
	
	@Override
	public ProductDetailVO readProduct(int product_code) {
		return dao.readProduct(product_code);
	}

	@Override
	public List<TransactionHistoryVO> readTransHistory(ProductParamVO vo) {
		List<TransactionHistoryVO> list = dao.readTransHistory(vo);
		list.stream().forEach(a -> a.setOrder_date(a.getOrder_date().substring(2, a.getOrder_date().indexOf(" "))));
		return list;
	}

	@Override
	public List<SizePriceVO> readSizePrice(ProductParamVO vo) {
		return dao.readSizePrice(vo);
	}
	
	@Override
	public int getDetailCode(ProductParamVO vo) {
		return dao.getDetailCode(vo);
	}

	@Override
	public String getsize(int size_code) {
		return dao.getsize(size_code);
	}
	
	@Override
	public BidUserVO bidUserRead(String user_id) {
		return dao.bidUserRead(user_id);
	}
	
	@Override
	public List<ChartResultDto> readChart(ChartParamDto dto) {
		return dao.readChart(dto);
	}
}
