package com.spring.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.spring.dao.bid.Bidding;
import com.spring.dao.sell.SellDao;
import com.spring.dto.bid.BidCreateDto;
import com.spring.dto.bid.BidReadDto;
import com.spring.dto.sell.SellVO;

@Transactional
@Service
public class SellServiceImpl implements SellService {

	@Autowired SellDao dao;
	
	///////////이한동 수정본
	@Autowired Bidding bid;
	///////////이한동 수정본
	
	@Override
	public List<SellVO> sell_readAll(Map<String, Object> para) { return dao.sell_readAll(para); }
	
	///////////이한동 수정본
	@Override
	@Transactional
	public int sell_insert(SellVO vo) { 
		try {
			dao.sell_insert(vo); 
			BidReadDto bidDto = null;
			if ((bidDto = bid.getBidCode(vo)) == null) {
				return 1;
			}
			BidCreateDto bidcreate = new BidCreateDto();
			int diffprice = bidDto.getBid_price() - Integer.parseInt(vo.getSell_price());
			bidcreate.setBid_code(bidDto.getBid_code());
			if (diffprice > 0) {
				bidcreate.setPrice(diffprice);
				bid.insertDiff(bidcreate);
			}
			bidcreate.setSell_code(vo.getSell_code());
			bidcreate.setPrice(Integer.parseInt(vo.getSell_price()));
			bid.insertOrder(bidcreate);
			bid.bidConditionUpdate(bidDto.getBid_code());
			bid.sellConditionUpdate(vo.getSell_code());
			return 1;
		} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().isRollbackOnly();
			e.printStackTrace();
			throw e;
		}
	} 
	///////////이한동 수정본
	
	@Override
	public int sell_update(SellVO vo) { return dao.sell_update(vo); }
	@Override
	public int sell_delete(SellVO vo) { return dao.sell_delete(vo); }
	@Override
	public SellVO sell_read(SellVO vo) { return dao.sell_read(vo); }


	@Override
	public int listcnt() {
		
		return dao.listcnt();
	}
}
