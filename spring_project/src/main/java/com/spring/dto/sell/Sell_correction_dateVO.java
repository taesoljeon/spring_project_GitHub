package com.spring.dto.sell;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Sell_correction_dateVO {
	private int sell_code;
	private String sell_correction_date;
}
