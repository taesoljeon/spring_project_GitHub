package com.spring.dto.sell;

import java.util.List;

import com.spring.dto.detail.DetailVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SellVO {
	private List<Sell_correction_dateVO> sell_correction_dateList;
	private List<DetailVO> detail_getProduct_code;
	private int sell_code;
	private String sell_price;
	private int sell_quantity;
	private String sell_creation_date;
	private String sell_user_id;
	private int sell_detail_code;
	private int sell_condition_code;
}
