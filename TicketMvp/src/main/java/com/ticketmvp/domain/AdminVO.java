package com.ticketmvp.domain;


public class AdminVO {
	
	private String  homeclub ; 
	private String	awayclub ;
	private Integer	matchdate;
	private Integer	matchtime;
	
	
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
	public Integer getMatchdate() {
		return matchdate;
	}
	public void setMatchdate(Integer matchdate) {
		this.matchdate = matchdate;
	}
	public Integer getMatchtime() {
		return matchtime;
	}
	public void setMatchtime(Integer matchtime) {
		this.matchtime = matchtime;
	}


	private Integer ticketid ;
	private Integer	matchid  ;
	private Integer	ticketprice ;
	private Integer	ticketremain ;
	private Integer	ticketall ;
	private String 	ticketname ;
	private String 	ticketdesc ;
	
	
	public Integer getTicketid() {
		return ticketid;
	}
	public void setTicketid(Integer ticketid) {
		this.ticketid = ticketid;
	}
	public Integer getMatchid() {
		return matchid;
	}
	public void setMatchid(Integer matchid) {
		this.matchid = matchid;
	}
	public Integer getTicketprice() {
		return ticketprice;
	}
	public void setTicketprice(Integer ticketprice) {
		this.ticketprice = ticketprice;
	}
	public Integer getTicketremain() {
		return ticketremain;
	}
	public void setTicketremain(Integer ticketremain) {
		this.ticketremain = ticketremain;
	}
	public Integer getTicketall() {
		return ticketall;
	}
	public void setTicketall(Integer ticketall) {
		this.ticketall = ticketall;
	}
	public String getTicketname() {
		return ticketname;
	}
	public void setTicketname(String ticketname) {
		this.ticketname = ticketname;
	}
	public String getTicketdesc() {
		return ticketdesc;
	}
	public void setTicketdesc(String ticketdesc) {
		this.ticketdesc = ticketdesc;
	}


	private String league ; 
	private String stadiumname ; 
	private String clubimgfile ; 
	private String clubimgfilefull ; 
	private Integer clubimgsize ; 
	
	
	public String getLeague() {
		return league;
	}
	public void setLeague(String league) {
		this.league = league;
	}
	public String getStadiumname() {
		return stadiumname;
	}
	public void setStadiumname(String stadiumname) {
		this.stadiumname = stadiumname;
	}
	public String getClubimgfile() {
		return clubimgfile;
	}
	public void setClubimgfile(String clubimgfile) {
		this.clubimgfile = clubimgfile;
	}
	public String getClubimgfilefull() {
		return clubimgfilefull;
	}
	public void setClubimgfilefull(String clubimgfilefull) {
		this.clubimgfilefull = clubimgfilefull;
	}
	public Integer getClubimgsize() {
		return clubimgsize;
	}
	public void setClubimgsize(Integer clubimgsize) {
		this.clubimgsize = clubimgsize;
	}


	private String  athletename;
	private String  club;
	private Integer age;
	private String  career;
	private String  position;
	private Integer backno;
	private String  info;
	private String  athleteimgfile;
	private String  athleteimgfilefull;
	private Integer athleteimgsize;
	
	public String getAthletename() {
		return athletename;
	}
	public void setAthletename(String athletename) {
		this.athletename = athletename;
	}
	public String getClub() {
		return club;
	}
	public void setClub(String club) {
		this.club = club;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public Integer getBackno() {
		return backno;
	}
	public void setBackno(Integer backno) {
		this.backno = backno;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getAthleteimgfile() {
		return athleteimgfile;
	}
	public void setAthleteimgfile(String athleteimgfile) {
		this.athleteimgfile = athleteimgfile;
	}
	public String getAthleteimgfilefull() {
		return athleteimgfilefull;
	}
	public void setAthleteimgfilefull(String athleteimgfilefull) {
		this.athleteimgfilefull = athleteimgfilefull;
	}
	public Integer getAthleteimgsize() {
		return athleteimgsize;
	}
	public void setAthleteimgsize(Integer athleteimgsize) {
		this.athleteimgsize = athleteimgsize;
	}
	public void setJoinstatus(Integer joinstatus) {
		this.joinstatus = joinstatus;
	}
	
	
	private String userid ; 
	private String temppw ; 
	private String userpw ; 
	private String email ; 
	private Integer joinstatus ; 
	private String depositno ; 
	private String name ; 
	private String phone ;
	

	@Override
	public String toString() {
		return "AdminVO [homeclub=" + homeclub + ", awayclub=" + awayclub + ", matchdate=" + matchdate + ", matchtime="
				+ matchtime + ", ticketid=" + ticketid + ", matchid=" + matchid + ", ticketprice=" + ticketprice
				+ ", ticketremain=" + ticketremain + ", ticketall=" + ticketall + ", ticketname=" + ticketname
				+ ", ticketdesc=" + ticketdesc + ", league=" + league + ", stadiumname=" + stadiumname
				+ ", clubimgfile=" + clubimgfile + ", clubimgfilefull=" + clubimgfilefull + ", clubimgsize="
				+ clubimgsize + ", athletename=" + athletename + ", club=" + club + ", age=" + age + ", career="
				+ career + ", position=" + position + ", backno=" + backno + ", info=" + info + ", athleteimgfile="
				+ athleteimgfile + ", athleteimgfilefull=" + athleteimgfilefull + ", athleteimgsize=" + athleteimgsize
				+ ", userid=" + userid + ", temppw=" + temppw + ", userpw=" + userpw + ", email=" + email
				+ ", joinstatus=" + joinstatus + ", depositno=" + depositno + ", name=" + name + ", phone=" + phone
				+ "]";
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getTemppw() {
		return temppw;
	}
	public void setTemppw(String temppw) {
		this.temppw = temppw;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getJoinstatus() {
		return joinstatus;
	}
	public void setJoinstatus(int joinstatus) {
		this.joinstatus = joinstatus;
	}
	public String getDepositno() {
		return depositno;
	}
	public void setDepositno(String depositno) {
		this.depositno = depositno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	} 
	
	

}
