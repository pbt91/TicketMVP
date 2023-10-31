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
	
	//경기 정보
	private int matchid;
	private String homeclub;
	private String awayclub;
	private Date matchdate;
	private Time matchtime;
	
	//경기장 정보
	private String stadiumname;
	private String stadiumimgfile;
	private String stadiumimgfilefull;
	private int stadiumimgsize;
	
	
}