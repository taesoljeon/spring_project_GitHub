package com.spring.service.bid;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.spring.dao.bid.Wish;
import com.spring.dto.bid.WishDto;
import com.spring.dto.bid.WishReadDto;

@Service("wishService")
public class WishServiceImpl implements WishService{

	@Autowired
	private Wish wish;
	
	@Override
	public void wishCreate(WishDto dto) throws Exception {
		
		try {
			
			Integer wish_code = wish.wishchk(dto);
			
			if(wish_code != null) {
				wish.wishDelete((int)wish_code);
			} else {
				wish.wishCreate(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().isRollbackOnly();
		}
		
	}

	@Override
	public List<WishReadDto> wishReadAll(String user_id) {
		return wish.wishReadAll(user_id);
	}

	@Override
	public int wishDelete(int wish_code) {
		return wish.wishDelete(wish_code);
	}

	@Override
	public Integer wishchk(WishDto dto) {
		return wish.wishchk(dto);
	}
	
	@Override
	public List<Integer> wishsizechk(WishDto dto) {
		return wish.wishsizechk(dto);
	}

}
