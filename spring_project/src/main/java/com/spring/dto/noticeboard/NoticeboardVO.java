package com.spring.dto.noticeboard;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NoticeboardVO {
	
	private int noticeboard_code;
	private String noticeboard_title;
	private String noticeboard_content;
	private String noticeboard_creation_date;
	private String noticeboard_ip;
	private String noticeboard_user_id;
	private List<Noticeboard_correction_dateVO> noticeboard_correction_dateList;
}
