package com.ticketmvp.domain;

public class UserCouponVO {
	private String couponid;
	private String userid;
	private Integer reserveid;
	private String couponname;
	private Integer discount;
	private String issuedate;
	private String expiredate;
	private boolean usestatus;
	private String usedate;
	private boolean inputresult;		// 등록 성공했는지 
	
	
	public UserCouponVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UserCouponVO(String couponid, String userid, Integer reserveid, String couponname, Integer discount,
			String issuedate, String expiredate, boolean usestatus, String usedate) {
		super();
		this.couponid = couponid;
		this.userid = userid;
		this.reserveid = reserveid;
		this.couponname = couponname;
		this.discount = discount;
		this.issuedate = issuedate;
		this.expiredate = expiredate;
		this.usestatus = usestatus;
		this.usedate = usedate;
		this.inputresult = inputresult;
	}

	public String getCouponid() {
		return couponid;
	}

	public void setCouponid(String couponid) {
		this.couponid = couponid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public Integer getReserveid() {
		return reserveid;
	}

	public void setReserveid(Integer reserveid) {
		this.reserveid = reserveid;
	}

	public String getCouponname() {
		return couponname;
	}

	public void setCouponname(String couponname) {
		this.couponname = couponname;
	}

	public Integer getDiscount() {
		return discount;
	}

	public void setDiscount(Integer discount) {
		this.discount = discount;
	}

	public String getIssuedate() {
		return issuedate;
	}

	public void setIssuedate(String issuedate) {
		this.issuedate = issuedate;
	}

	public String getExpiredate() {
		return expiredate;
	}

	public void setExpiredate(String expiredate) {
		this.expiredate = expiredate;
	}

	public boolean isUsestatus() {
		return usestatus;
	}

	public void setUsestatus(boolean usestatus) {
		this.usestatus = usestatus;
	}

	public String getUsedate() {
		return usedate;
	}

	public void setUsedate(String usedate) {
		this.usedate = usedate;
	}

	public boolean inputresult() {
		return usestatus;
	}

	public void inputresult(boolean inputresult) {
		this.usestatus = usestatus;
	}
	
	@Override
	public String toString() {
		return "UserCouponVO [couponid=" + couponid + ", userid=" + userid + ", reserveid=" + reserveid
				+ ", couponname=" + couponname + ", discount=" + discount + ", issuedate=" + issuedate + ", expiredate="
				+ expiredate + ", usestatus=" + usestatus + ", usedate=" + usedate +", inputresult="+inputresult+ "]";
	} 
	
	
}
