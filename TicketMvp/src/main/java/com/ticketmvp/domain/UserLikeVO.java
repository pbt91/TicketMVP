package com.ticketmvp.domain;

public class UserLikeVO {
	
	private String userid;				//유저아이디
	private Integer matchid;			//경기아이디
	private String homeclub;			//홈구단
	private String awayclub;			//원정구단
	private String matchdate;			//경기일
	private String matchtime;			//경기시간
	
	public UserLikeVO() {
		super();
	}

	public UserLikeVO(String userid, Integer matchid, String homeclub, String awayclub, String matchdate,
			String matchtime) {
		super();
		this.userid = userid;
		this.matchid = matchid;
		this.homeclub = homeclub;
		this.awayclub = awayclub;
		this.matchdate = matchdate;
		this.matchtime = matchtime;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public Integer getMatchid() {
		return matchid;
	}

	public void setMatchid(Integer matchid) {
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

	@Override
	public String toString() {
		return "UserLikeVO [userid=" + userid + ", matchid=" + matchid + ", homeclub=" + homeclub + ", awayclub="
				+ awayclub + ", matchdate=" + matchdate + ", matchtime=" + matchtime + "]";
	}
	
	
	
}
