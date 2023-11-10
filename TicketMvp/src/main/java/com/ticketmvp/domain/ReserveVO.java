package com.ticketmvp.domain;

import java.sql.Date;
import java.sql.Time;

import lombok.Data;

@Data
public class ReserveVO {


	//티켓 정보
	private int ticketid;					//티켓아이디
	private String ticketname;				//티켓명
	private int ticketprice;				//티켓가격
	private int ticketremain;				//남은수량
	private int ticketall;					//전체수량
	
	//티켓종료
	private String seatid;					//좌석아이디
	
	//경기 정보
	private int matchid;					//경기아이디
	private String homeclub;				//홈구단
	private String awayclub;				//원정구단
	private Date matchdate;					//경기일
	private Time matchtime;					//경기시간
	private Date canceldate;				//취소일
	
	//경기장 정보
	private String stadiumname;				//경기장이름
	private String stadiumimgfile;			//경기장이미지 파일 뒷부분
	private String stadiumimgfilefull;		//경기장이미지명 파일 앞부분
	private int stadiumimgsize;				//경기장이미지 파일 크기
	
	//예약 정보
	private int reserveid;					//예약아이디
	private String userid;					//유저아이디
	private String reserveStatus;			//예약상태 (예약완료, 예약취소)
	private Date paydate;					//결제일
	private int totalpayment;				//총 결제 금액
	
	//쿠폰 정보
	private String couponid;				//쿠폰아이디
	private int discount;					//할일
	private Date issuedate;					//쿠폰발행일
	private Date expiredate;				//쿠폰만료일
	private String usestatus;				//사용상태
	private Date usedate;					//사용일
	public int getTicketid() {
		return ticketid;
	}
	public void setTicketid(int ticketid) {
		this.ticketid = ticketid;
	}
	public String getTicketname() {
		return ticketname;
	}
	public void setTicketname(String ticketname) {
		this.ticketname = ticketname;
	}
	public int getTicketprice() {
		return ticketprice;
	}
	public void setTicketprice(int ticketprice) {
		this.ticketprice = ticketprice;
	}
	public int getTicketremain() {
		return ticketremain;
	}
	public void setTicketremain(int ticketremain) {
		this.ticketremain = ticketremain;
	}
	public int getTicketall() {
		return ticketall;
	}
	public void setTicketall(int ticketall) {
		this.ticketall = ticketall;
	}
	public String getSeatid() {
		return seatid;
	}
	public void setSeatid(String seatid) {
		this.seatid = seatid;
	}
	public int getMatchid() {
		return matchid;
	}
	public void setMatchid(int matchid) {
		this.matchid = matchid;
	}
	public String getHomeclub() {
		return homeclub;
	}
	public void setHomeclub(String homeclub) {
		this.homeclub = homeclub;
	}
	public String getAwayclub() {
		return awayclub;
	}
	public void setAwayclub(String awayclub) {
		this.awayclub = awayclub;
	}
	public Date getMatchdate() {
		return matchdate;
	}
	public void setMatchdate(Date matchdate) {
		this.matchdate = matchdate;
	}
	public Time getMatchtime() {
		return matchtime;
	}
	public void setMatchtime(Time matchtime) {
		this.matchtime = matchtime;
	}
	public Date getCanceldate() {
		return canceldate;
	}
	public void setCanceldate(Date canceldate) {
		this.canceldate = canceldate;
	}
	public String getStadiumname() {
		return stadiumname;
	}
	public void setStadiumname(String stadiumname) {
		this.stadiumname = stadiumname;
	}
	public String getStadiumimgfile() {
		return stadiumimgfile;
	}
	public void setStadiumimgfile(String stadiumimgfile) {
		this.stadiumimgfile = stadiumimgfile;
	}
	public String getStadiumimgfilefull() {
		return stadiumimgfilefull;
	}
	public void setStadiumimgfilefull(String stadiumimgfilefull) {
		this.stadiumimgfilefull = stadiumimgfilefull;
	}
	public int getStadiumimgsize() {
		return stadiumimgsize;
	}
	public void setStadiumimgsize(int stadiumimgsize) {
		this.stadiumimgsize = stadiumimgsize;
	}
	public int getReserveid() {
		return reserveid;
	}
	public void setReserveid(int reserveid) {
		this.reserveid = reserveid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getReserveStatus() {
		return reserveStatus;
	}
	public void setReserveStatus(String reserveStatus) {
		this.reserveStatus = reserveStatus;
	}
	public Date getPaydate() {
		return paydate;
	}
	public void setPaydate(Date paydate) {
		this.paydate = paydate;
	}
	public int getTotalpayment() {
		return totalpayment;
	}
	public void setTotalpayment(int totalpayment) {
		this.totalpayment = totalpayment;
	}
	public String getCouponid() {
		return couponid;
	}
	public void setCouponid(String couponid) {
		this.couponid = couponid;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public Date getIssuedate() {
		return issuedate;
	}
	public void setIssuedate(Date issuedate) {
		this.issuedate = issuedate;
	}
	public Date getExpiredate() {
		return expiredate;
	}
	public void setExpiredate(Date expiredate) {
		this.expiredate = expiredate;
	}
	public String getUsestatus() {
		return usestatus;
	}
	public void setUsestatus(String usestatus) {
		this.usestatus = usestatus;
	}
	public Date getUsedate() {
		return usedate;
	}
	public void setUsedate(Date usedate) {
		this.usedate = usedate;
	}
	
	@Override
	public String toString() {
		return "ReserveVO [ticketid=" + ticketid + ", ticketname=" + ticketname + ", ticketprice=" + ticketprice
				+ ", ticketremain=" + ticketremain + ", ticketall=" + ticketall + ", seatid=" + seatid + ", matchid="
				+ matchid + ", homeclub=" + homeclub + ", awayclub=" + awayclub + ", matchdate=" + matchdate
				+ ", matchtime=" + matchtime + ", canceldate=" + canceldate + ", stadiumname=" + stadiumname
				+ ", stadiumimgfile=" + stadiumimgfile + ", stadiumimgfilefull=" + stadiumimgfilefull
				+ ", stadiumimgsize=" + stadiumimgsize + ", reserveid=" + reserveid + ", userid=" + userid
				+ ", reserveStatus=" + reserveStatus + ", paydate=" + paydate + ", totalpayment=" + totalpayment
				+ ", couponid=" + couponid + ", discount=" + discount + ", issuedate=" + issuedate + ", expiredate="
				+ expiredate + ", usestatus=" + usestatus + ", usedate=" + usedate + "]";
	}
}