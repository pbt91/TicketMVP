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
	
}