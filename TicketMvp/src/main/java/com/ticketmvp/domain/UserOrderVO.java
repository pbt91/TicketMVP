package com.ticketmvp.domain;

import lombok.Data;

@Data
public class UserOrderVO {

	private String ticketname;			// 상품명
	private Integer seatid;				// 좌석id
	private Integer ticketprice;		// 개당 가격
	private Integer ticketnum;			// 구매 개수
	private Integer discont;			// 할인율
	private Integer totalpayment;		// 총 결제금액
	private String paydate;				// 결제일
	private String reservestatus;		// 주문상태
}
