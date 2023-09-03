package com.spring.dao.bid;

import java.util.List;

import com.spring.dto.bid.BidUserVO;
import com.spring.dto.bid.ChartParamDto;
import com.spring.dto.bid.ChartResultDto;
import com.spring.dto.bid.ProductDetailVO;
import com.spring.dto.bid.ProductParamVO;
import com.spring.dto.bid.SizePriceVO;
import com.spring.dto.bid.TransactionHistoryVO;

public interface ProductDetail {
	public ProductDetailVO readProduct(int product_code);
	
	public List<TransactionHistoryVO> readTransHistory(ProductParamVO vo);
	
	public List<SizePriceVO> readSizePrice(ProductParamVO vo);
	
	public int getDetailCode(ProductParamVO vo);
	
	public String getsize(int size_code);
	
	public BidUserVO bidUserRead(String user_id);
	
	public List<ChartResultDto> readChart(ChartParamDto dto);
}