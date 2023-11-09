package com.ticketmvp.domain;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class AdminVO {
	
	private String athleteimgfilefull ; // 선수 전체 파일명
	private long athleteimgsize ;		// 선수 파일 사이즈
	private String athleteimgfile ;		// 선수 파일명
	private String clubimgfile ;		// 클럽 파일명
	private String clubimgfilefull ;	// 클럽 전체 파일명
	private long clubimgsize ;			// 클럽 파일 사이즈
	private String stadiumimgfile ;		// 경기장 이미지 파일명
	private String stadiumimgfilefull ; // 경기장 전체 파일명
	private long stadiumimgsize ;		// 경기장 이미지 사이즈 
	
	MultipartFile athleteImg ; // input 태그에 type='file' name과 동일
	public MultipartFile getAthleteImg() {
		return athleteImg ;
	}
	
	public void setAthleteImg(MultipartFile athleteImg) {
		this.athleteImg = athleteImg ;
		//업로드 파일이 있는 경우
		if( !athleteImg.isEmpty() ) {
			this.athleteimgfile = athleteImg.getOriginalFilename();
			this.athleteimgsize = athleteImg.getSize();
			
			// 실제 저장된 파일명 만들기 
			UUID uuid = UUID.randomUUID();
			this.athleteimgfilefull = uuid.toString() ;
			
			// 실제파일 저장 
			// 추후에 웹서버 경로를 찾아서 수정 작업
			File f = new File("C:\\Users\\ICT03-20\\git\\TicketMVP\\TicketMvp\\src\\main\\webapp\\resources\\images\\member_images\\" + athleteimgfilefull+"_"+athleteimgfile);
			
			try {
				athleteImg.transferTo(f);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
		
	
	
	public long getAthleteimgsize() {
		return athleteimgsize;
	}
	public void setAthleteimgsize(long athleteimgsize) {
		this.athleteimgsize = athleteimgsize;
	}
	public long getClubimgsize() {
		return clubimgsize;
	}
	public void setClubimgsize(long clubimgsize) {
		this.clubimgsize = clubimgsize;
	}
	public long getStadiumimgsize() {
		return stadiumimgsize;
	}
	public void setStadiumimgsize(long stadiumimgsize) {
		this.stadiumimgsize = stadiumimgsize;
	}


	public String getAthleteimgfilefull() {
		return athleteimgfilefull;
	}

	public void setAthleteimgfilefull(String athleteimgfilefull) {
		this.athleteimgfilefull = athleteimgfilefull;
	}

	public String getAthleteimgfile() {
		return athleteimgfile;
	}

	public void setAthleteimgfile(String athleteimgfile) {
		this.athleteimgfile = athleteimgfile;
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

	public String getStadiumimgfile() {
		return stadiumimgfile;
	}

	public void setStadiumimgfile(String stadiumimgfile) {
		this.stadiumimgfile = stadiumimgfile;
	}

	public String getStadiumimgfilefull() {
		return stadiumimgfilefull;
	}

	public void setStadiumimgfilefull(String stadiumimgfilefull) {
		this.stadiumimgfilefull = stadiumimgfilefull;
	}


	private String  homeclub ; 
	private String	awayclub ;
	private String	matchdate;
	private String	matchtime;
	
	
	
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



	private String  athletename;
	private String  club;
	private Integer age;
	private String  career;
	private String  position;
	private Integer backno;
	private String  info;

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
				+ clubimgsize + ", areaimgfile=" + stadiumimgfile + ", stadiumimgfilefull=" + stadiumimgfilefull
				+ ", stadiumimgsize=" + stadiumimgsize + ", athletename=" + athletename + ", club=" + club + ", age="
				+ age + ", career=" + career + ", position=" + position + ", backno=" + backno + ", info=" + info
				+ ", athleteimgfile=" + athleteimgfile + ", athleteimgfilefull=" + athleteimgfilefull
				+ ", athleteimgsize=" + athleteimgsize + ", userid=" + userid + ", temppw=" + temppw + ", userpw="
				+ userpw + ", email=" + email + ", joinstatus=" + joinstatus + ", depositno=" + depositno + ", name="
				+ name + ", phone=" + phone + "]";
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
