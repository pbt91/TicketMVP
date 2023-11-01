package com.ticketmvp.domain;

public class AthleteVO {
	
	private String athletename;    		// 선수명  PK
	private String club;  				//구단명
	private int age; 					//나이
	private String career; 				//경력
	private String position; 			//포지션
	private int backno; 				//등번호
	private String info; 				//선수정보
	private String athleteimgfile;  	//선수이미지파일명
	private String athleteimgfilefull;	//선수이미지풀파일명
	private int athleteimgsize;			//선수이미지사이즈
	
	
	//생성자
	public AthleteVO() {
		super();
	}

	//인자있는
	public AthleteVO(String athletename, String club, int age, String career, String position, int backno, String info,
			String athleteimgfile, String athleteimgfilefull, int athleteimgsize) {
		super();
		this.athletename = athletename;
		this.club = club;
		this.age = age;
		this.career = career;
		this.position = position;
		this.backno = backno;
		this.info = info;
		this.athleteimgfile = athleteimgfile;
		this.athleteimgfilefull = athleteimgfilefull;
		this.athleteimgsize = athleteimgsize;
	}
	
	
	//setter
	public void setAthletename(String athletename) {
		this.athletename = athletename;
	}

	public void setClub(String club) {
		this.club = club;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public void setBackno(int backno) {
		this.backno = backno;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public void setAthleteimgfile(String athleteimgfile) {
		this.athleteimgfile = athleteimgfile;
	}

	public void setAthleteimgfilefull(String athleteimgfilefull) {
		this.athleteimgfilefull = athleteimgfilefull;
	}

	public void setAthleteimgsize(int athleteimgsize) {
		this.athleteimgsize = athleteimgsize;
	}

	
	//getter
	public String getAthletename() {
		return athletename;
	}

	public String getClub() {
		return club;
	}

	public int getAge() {
		return age;
	}

	public String getCareer() {
		return career;
	}

	public String getPosition() {
		return position;
	}

	public int getBackno() {
		return backno;
	}

	public String getInfo() {
		return info;
	}

	public String getAthleteimgfile() {
		return athleteimgfile;
	}

	public String getAthleteimgfilefull() {
		return athleteimgfilefull;
	}

	public int getAthleteimgsize() {
		return athleteimgsize;
	}

	
	//toString
	@Override
	public String toString() {
		return "AthleteVO [athletename=" + athletename + ", club=" + club + ", age=" + age + ", career=" + career
				+ ", position=" + position + ", backno=" + backno + ", info=" + info + ", athleteimgfile="
				+ athleteimgfile + ", athleteimgfilefull=" + athleteimgfilefull + ", athleteimgsize=" + athleteimgsize
				+ "]";
	}
	
	
	
	

}
