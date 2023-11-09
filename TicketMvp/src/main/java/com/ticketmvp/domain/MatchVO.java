package com.ticketmvp.domain;

import lombok.Data;

@Data
public class MatchVO {
	
	private int 		matchid;  		// 경기id
	private String 		homeclub; 		// 홈구단명
	private String 		awayclub; 		// 원정구단명
	private String		matchdate;		// 경기일
	private String		matchtime;		// 경기시간
	private String		stadiumname; 	// 경기장

}
