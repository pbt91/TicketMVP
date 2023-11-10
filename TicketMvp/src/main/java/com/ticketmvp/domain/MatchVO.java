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
	private String		userid;
	
	// 생성자
	public MatchVO() {
		super();
	}
	
	// 인자 있는
	public MatchVO(int matchid, String homeclub, String awayclub, String matchdate, String matchtime) {
		super();
		this.matchid = matchid;
		this.homeclub = homeclub;
		this.awayclub = awayclub;
		this.matchdate = matchdate;
		this.matchtime = matchtime;
	}
	
	//getter, setter
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
	public String getMatchdate() {
		return matchdate;
	}
	public void setMatchdate(String matchdate) {
		this.matchdate = matchdate;
	}
	public String getMatchtime() {
		return matchtime;
	}
	public void setMatchtime(String matchtime) {
		this.matchtime = matchtime;
	}
	
	

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	@Override
	public String toString() {
		return "MatchVO [matchid=" + matchid + ", homeclub=" + homeclub + ", awayclub=" + awayclub + ", matchdate="
				+ matchdate + ", matchtime=" + matchtime + ", userid=" + userid + "]";
	}


}
