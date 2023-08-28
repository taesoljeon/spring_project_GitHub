package com.spring.dao.bid;

import java.util.List;

import com.spring.dto.bid.BidCreateDto;
import com.spring.dto.bid.BidReadDto;
import com.spring.dto.sell.SellVO;

public interface Bidding {
	public int bidCreate(BidCreateDto dto);
	public List<BidReadDto> bidRead(String user_id);
	public int bidUpdate(int bid_code);
	
	public List<BidReadDto> bidReadAll();
	public int bidDeleteAll(int bid_code);
	public int bidCancle(int bid_code);
	
	public void bidCreateNow(BidCreateDto dto);
	public int getSellCode(BidCreateDto dto);
	public int insertOrder(BidCreateDto dto);
	public int bidConditionUpdate(int bid_code);
	public int sellConditionUpdate(int sell_code);
	
	public BidReadDto getBidCode(SellVO vo);
	public int insertDiff(BidCreateDto dto);
}
