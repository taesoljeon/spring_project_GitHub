package com.spring.service.bid;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.spring.dao.bid.Bidding;
import com.spring.dto.bid.BidCreateDto;
import com.spring.dto.bid.BidReadDto;
import com.spring.dto.bid.OrderDto;

@Service("biddingService")
public class BiddingServiceImpl implements BiddingService{

	@Autowired
	private Bidding bidding;
	
	@Override
	public int bidCreate(BidCreateDto dto) {
		return bidding.bidCreate(dto);
	}

	@Override
	public List<BidReadDto> bidRead(String user_id) {
		List<BidReadDto> list = bidding.bidRead(user_id);
		list.stream().forEach(a -> a.setBid_creation_date(a.getBid_creation_date().substring(2, a.getBid_creation_date().indexOf(" "))));
		return list;
	}

	@Override
	public int bidUpdate(int bid_code) {
		return bidding.bidUpdate(bid_code);
	}

	@Override
	public List<BidReadDto> bidReadAll() {
		List<BidReadDto> list = bidding.bidReadAll();
		list.stream().forEach(a -> a.setBid_creation_date(a.getBid_creation_date().substring(2, a.getBid_creation_date().indexOf(" "))));
		return list;
	}

	@Override
	public int bidDeleteAll(int bid_code) {
		return bidding.bidDeleteAll(bid_code);
	}
	
	@Override
	@Transactional
	public int transactionNow(BidCreateDto dto) {
		try {
			bidding.bidCreateNow(dto);
			dto.setSell_code(bidding.getSellCode(dto));
			bidding.insertOrder(dto);
			bidding.bidConditionUpdate(dto.getBid_code());
			bidding.sellConditionUpdate(dto.getSell_code());
			return 1;
		} catch(Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().isRollbackOnly();
			throw e;
		}
	}
	
	@Override
	public int bidCancle(int bid_code) {
		return bidding.bidCancle(bid_code);
	}
}
