package com.ticketmvp.domain;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class AdminVO {
	private String league;
	private String stadiumname;
	private String athleteimgfilefull ; // 선수 전체 파일명
	private long athleteimgsize ;		// 선수 파일 사이즈
	private String athleteimgfile ;		// 선수 파일명
	private String clubimgfile ;		// 클럽 파일명
	private String clubimgfilefull ;	// 클럽 전체 파일명
	private long clubimgsize ;			// 클럽 파일 사이즈
	private String stadiumimgfile ;		// 경기장 이미지 파일명
	private String stadiumimgfilefull ; // 경기장 전체 파일명
	private long stadiumimgsize ;		// 경기장 이미지 사이즈 
	
	private String  homeclub ; 
	private String	awayclub ;
	private String	matchdate;
	private String	matchtime;


	private Integer ticketid ;
	private Integer	matchid  ;
	private Integer	ticketprice ;
	private Integer	ticketremain ;
	private Integer	ticketall ;
	private String 	ticketname ;
	private String 	ticketdesc ;


	private String  athletename;
	private String  club;
	private Integer age;
	private String  career;
	private String  position;
	private Integer backno;
	private String  info;
	
	private String userid ; 
	private String temppw ; 
	private String userpw ; 
	private String email ; 
	private Integer joinstatus ; 
	private String depositno ; 
	private String name ; 
	private String phone ;
	
	
	
	
	// 경기장 파일 넣기 위한 기본 설정
	MultipartFile stadiumImg ; // input 태그에 type='file' name과 동일
	public MultipartFile getStadiumImg() {
		return stadiumImg ;
	}
	
	public void setStadiumImg(MultipartFile stadiumImg) {
		this.stadiumImg = stadiumImg ;
		//업로드 파일이 있는 경우
		if( !stadiumImg.isEmpty() ) {
			this.stadiumimgfile = stadiumImg.getOriginalFilename();
			this.stadiumimgsize = stadiumImg.getSize();
			
			// 실제 저장된 파일명 만들기 
			UUID uuid = UUID.randomUUID();
			this.stadiumimgfilefull = uuid.toString() ;
			
			// 실제파일 저장 
			// 추후에 웹서버 경로를 찾아서 수정 작업
			File f = new File("C:\\Users\\ICT03-01\\git\\TicketMvp\\src\\main\\webapp\\resources\\images\\stadium_images\\" + stadiumimgfilefull+"_"+stadiumimgfile);
			
			try {
				stadiumImg.transferTo(f);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	// 클럽 파일 넣기 위한 기본 설정
	MultipartFile clubImg ; // input 태그에 type='file' name과 동일
	public MultipartFile getClubImg() {
		return clubImg ;
	}
	
	public void setClubImg(MultipartFile clubImg) {
		this.clubImg = clubImg ;
		//업로드 파일이 있는 경우
		if( !clubImg.isEmpty() ) {
			this.clubimgfile = clubImg.getOriginalFilename();
			this.clubimgsize = clubImg.getSize();
			
			// 실제 저장된 파일명 만들기 
			UUID uuid = UUID.randomUUID();
			this.clubimgfilefull = uuid.toString() ;
			
			// 실제파일 저장 
			// 추후에 웹서버 경로를 찾아서 수정 작업
			File f = new File("C:\\Users\\ICT03-01\\git\\TicketMvp\\src\\main\\webapp\\resources\\images\\club_images\\" + clubimgfilefull+"_"+clubimgfile);

			
			try {
				clubImg.transferTo(f);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	// 선수 파일 넣기 위한 기본 설정
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
			File f = new File("C:\\Users\\ICT03-01\\git\\TicketMvp\\src\\main\\webapp\\resources\\images\\member_images\\" + athleteimgfilefull+"_"+athleteimgfile);
			
			try {
				athleteImg.transferTo(f);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
		


}
