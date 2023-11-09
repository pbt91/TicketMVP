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
	
	
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public void setTemppw(String temppw) {
		this.temppw = temppw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setJoinstatus(boolean joinstatus) {
		this.joinstatus = joinstatus;
	}
	public void setDepositno(String depositno) {
		this.depositno = depositno;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setAdmin(boolean admin) {
		this.admin = admin;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getUserid() {
		return userid;
	}
	public String getTemppw() {
		return temppw;
	}
	public String getUserpw() {
		return userpw;
	}
	public String getEmail() {
		return email;
	}
	public boolean isJoinstatus() {
		return joinstatus;
	}
	public String getDepositno() {
		return depositno;
	}
	public String getName() {
		return name;
	}
	public boolean isAdmin() {
		return admin;
	}
	public String getPhone() {
		return phone;
	}
	
}
