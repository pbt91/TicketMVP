package com.ticketmvp.domain;

public class UserVO {
 
	private String userid;				// 아이디
	private String temppw;				// 임시비밀번호
	private String userpw;				// 비밀번호
	private String email;				// 이메일
	private boolean joinstatus;			// 가입상태 (정상, 탈퇴)
	private String depositno;			// 무통장입금계좌
	private String name; 				// 이름
	private boolean admin;				// 관리자 권한 여부
	private String phone;				// 전화번호
	
	
	// 인자없는 생성자
	public UserVO() {
		super();
	}
	
	// 인자있는 생성자
	public UserVO(String userid, String temppw, String userpw, String email, boolean joinstatus, String depositno,
			String name, boolean admin, String phone) {
		super();
		this.userid = userid;
		this.temppw = temppw;
		this.userpw = userpw;
		this.email = email;
		this.joinstatus = joinstatus;
		this.depositno = depositno;
		this.name = name;
		this.admin = admin;
		this.phone = phone;
	}

	// setter	
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

	
	// getter
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
	
	// toString
	@Override
	public String toString() {
		return "UserVO [userid=" + userid + ", temppw=" + temppw + ", userpw=" + userpw + ", email=" + email
				+ ", joinstatus=" + joinstatus + ", depositno=" + depositno + ", name=" + name + ", admin=" + admin
				+ ", phone=" + phone + "]";
	}

	
}
