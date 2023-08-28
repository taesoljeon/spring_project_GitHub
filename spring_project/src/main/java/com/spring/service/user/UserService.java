package com.spring.service.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.dto.user.TotalDto;
import com.spring.dto.user.UserDto;
import com.spring.dto.user.User_BankDto;
import com.spring.dto.user.sns_infoDto;

public interface UserService {
	
	// 태솔 추가
	public Integer sns_getNaver_code(String sns_id);
	public Integer user_getNaver_code(int sns_naver_code);
	public int sns_infoInsert(sns_infoDto dto);
	public int user_insert_naver(UserDto dto);
	public String user_getID(int user_naver_code);
	//
	public UserDto user_login(UserDto dto); // 로그인 (일반)
	public UserDto user_login_kakao(UserDto dto); // 로그인 (카카오)
	public int user_insert(UserDto dto); // 회원가입 (유저)
	public int user_insert_kakao(UserDto dto); // 회원가입 (유저)
	public int user_bank_insert(User_BankDto dto); // 회원가입 (유저)
	public String user_id_check_ajax(String id); // 아이디 중복 검사 (ajax)
	public String user_telephone_check_ajax(String telephone); // 휴대폰번호 중복 검사 (ajax)
	public UserDto user_find_id(UserDto dto); // 아이디 찾기
	public UserDto user_find_password(UserDto dto); // 비밀번호 찾기
	public UserDto user_mydetail(String id); // 내 정보 조회 / 해당 정보 상세보기
	public int user_change_password(UserDto dto); // 비밀번호 변경
	public int user_change_name(UserDto dto); // 이름 변경
	public int user_change_telephone(UserDto dto); // 휴대폰번호 변경
	public int user_change_address(UserDto dto); // 주소 변경
	public int user_change_bank(User_BankDto dto); // 주소 변경
	public int user_delete_user(UserDto dto); // 회원 탈퇴 (비활성화)
	public int user_yes_user(UserDto dto); // 관리자, 회원 활성화 변경
	public int user_no_user(UserDto dto); // 관리자, 회원 비활성화 변경	
	public int user_insert_sub(UserDto dto); // 서브관리자 등록
	public List<UserDto> user_read_admin(Map<String, Integer> para); // 관리자 관리 (등급순) - paging
	public List<UserDto> user_read_admin_id_ajax(Map<String, Integer> para); // 관리자 관리 (아이디순) ajax - paging
	public List<UserDto> user_read_admin_name_ajax(Map<String, Integer> para); // 관리자 관리 (이름순) ajax - paging
	public int admin_listcnt(); // 어드민 전용 페이징
	public List<UserDto> user_read_user(Map<String, Integer> para); // 회원 관리 (생성일자순) - paging
	public List<UserDto> user_read_user_id_ajax(Map<String, Integer> para); // 회원 관리 (아이디순) ajax - paging
	public List<UserDto> user_read_user_name_ajax(Map<String, Integer> para); // 회원 관리 (이름순) ajax - paging
	public int user_listcnt(); // 회원 전용 페이징
	public int user_delete_user_out(UserDto dto); // 회원 및 관리자 삭제
	public int role_check(String check); // 컨트롤러 - 등급 체크
	public int condition_check(String check); // 컨트롤러 - 등급 체크
	public List<TotalDto> total_check(); // 매출 현황
}