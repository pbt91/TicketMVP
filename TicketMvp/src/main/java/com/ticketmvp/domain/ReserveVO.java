package com.ticketmvp.domain;

import java.sql.Date;
import java.sql.Time;

import lombok.Data;

@Data
public class ReserveVO {

	//티켓 정보
	private int ticketid;
	private String ticketname;
	private int ticketprice;
	private int ticketremain;
	private int ticketall;
	
	//티켓종료
	private String seatid;
	
	//경기 정보
	private int matchid;
	private String homeclub;
	private String awayclub;
	private Date matchdate;
	private Time matchtime;
	private Date canceldate;
	
	//경기장 정보
	private String stadiumname;
	private String stadiumimgfile;
	private String stadiumimgfilefull;
	private int stadiumimgsize;
	
	//예약 정보
	private int reserveid;
	private String userid;
	private String reserveStatus;
	private Date paydate;
	private int totalpayment;
	
	//쿠폰 정보
	private String couponid;
	private int discount;
	private Date issuedate;
	private Date expiredate;
	private String usestatus;
	private Date usedate;
	
}