package com.spring.dto.noticeboard;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Noticeboard_correction_dateVO {
	
	private int noticeboard_code;
	private String noticeboard_correction_date;
}
