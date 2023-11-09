package com.ticketmvp.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class UserOrderVO {

	//예약정보
	private String reserveid;			// 예약Id
	private String ticketname;			// 티켓명
	private String ticketprice;			// 티켓가격
	private int totalpayment;			// 결제금액
	private int totalseat;				// 개수 (좌석 개)
	private int discount;				// 할인율 (%)
	private Date paydate;				// 결제일
	private String reservestatus;		// 예약상태
}
