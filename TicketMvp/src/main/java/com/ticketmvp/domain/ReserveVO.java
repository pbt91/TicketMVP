package com.ticketmvp.domain;

import java.sql.Date;
import java.sql.Time;

import lombok.Data;

@Data
public class ReserveVO {

	private String ticketname;
	private int ticketprice;
	private int ticketremain;
	private int ticketall;
	private String stadiumimgfile;
	private String stadiumimgfilefull;
	private int stadiumimgsize;
}