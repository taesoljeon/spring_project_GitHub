package com.spring.dto.user;

import lombok.Data;

@Data
public class UserDto {
	private String user_id; // 아이디
	private String user_password; // 패스워드
	private String user_name; // 이름
	private String user_gender; // 성별
	private String user_birth_date; // 생일
	private String user_telephone_number; // 휴대전화
	private String user_address; // 우편번호
	private String user_join_date; // 가입일자
	private String user_ip; // 아이피
	private int user_role_code; // 권한코드 (1-메인관리자, 2-유저, 3-서브관리자)
	private int user_condition_code; // 상태코드 (1-활성화, 2-비활성화)
	private int user_com_code; // 통합코드 (카카오 통합 여부 확인 0-비통합, 1-통합) 
	private User_BankDto user_BankDto; // join - 은행
	private int user_naver_code; // 추가 // 네이버 로그인시 필요 
}

//@Component("userDto")
//@Getter
//@Setter
//@RequiredArgsConstructor
//@ToString
//@EqualsAndHashCode