package com.spring.service.bid;

import java.util.List;

import com.spring.dto.bid.BidCreateDto;
import com.spring.dto.bid.BidReadDto;

public interface BiddingService {
	public int bidCreate(BidCreateDto dto);
	public List<BidReadDto> bidRead(String user_id);
	public int bidUpdate(int bid_code);
	
	public int bidCancle(int bid_code);
	public List<BidReadDto> bidReadAll();
	public int bidDeleteAll(int bid_code);
	
	public int transactionNow(BidCreateDto dto);
}
