package com.ticketmvp.domain;

import lombok.Data;

@Data
public class UserVO {
 
	//유저정보
	private String userid;				// 아이디
	private String temppw;				// 임시비밀번호
	private String userpw;				// 비밀번호
	private String email;				// 이메일
	private boolean joinstatus;			// 가입상태 (정상, 탈퇴)
	private String depositno;			// 무통장입금계좌
	private String name; 				// 이름
	private boolean admin;				// 관리자 권한 여부
	private String phone;				// 전화번호
	
}
