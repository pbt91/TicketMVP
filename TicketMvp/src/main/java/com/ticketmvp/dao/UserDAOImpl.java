package com.ticketmvp.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Repository;

import com.ticketmvp.domain.UserCouponVO;
import com.ticketmvp.domain.UserInquiryVO;
import com.ticketmvp.domain.UserLikeVO;
import com.ticketmvp.domain.UserOrderVO;
import com.ticketmvp.domain.UserVO;

@Repository("userDAO")
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	@Autowired
	private JavaMailSender mailsender;
	

	// 아이디 중복체크
	public Integer selectIdCkeck(String id) {
		System.out.println("===> Mybatis selectIdCheck() 호출");
		System.out.println(id);
		String userid = mybatis.selectOne("UserDAO.selectidcheck", id);
		System.out.println(userid);
		Integer result;
		if(userid != null) { result = 1; }
		else { result = 0; }
		return result; 
		
	}
	
	// 회원가입
	public void insertUser(UserVO vo) {
		System.out.println("===> Mybatis insertUser() 호출");
		System.out.println(vo.toString());		
		mybatis.insert("UserDAO.insertuser", vo);
	}

	// 로그인 체크
	public UserVO loginCheck(String id, String pw) {
		System.out.println("===> Mybatis loginCheck() 호출1");
		System.out.println("로그인 시도 id:"+id+" pw:"+pw);
		UserVO vo = new UserVO();
		vo.setUserid(id);
		vo.setUserpw(pw);
		UserVO result = mybatis.selectOne("UserDAO.selectlogincheck", vo);
		
		return result;
	}

	// 아이디 찾기
	public String findId(String email) {
		System.out.println("===> Mybatis findId() 호출");
		System.out.println("아이디 찾기 시도 email:"+ email);
		// result에 userid값 들어옴
		String result = mybatis.selectOne("UserDAO.selectfindid",email);
		System.out.println(result);
		return result;
	}
	
	// 비밀번호 찾기 (아이디와 이메일이 매칭되면 인증번호 생성, 인증메일 전송)
	public String findPw(UserVO vo) {
		System.out.println("===> Mybatis findPw() 호출");
		// 아이디와 매칭되는 이메일을 입력한 경우 result에 userid들어옴
		UserVO resultvo = mybatis.selectOne("UserDAO.selectfindpw", vo);
		//System.out.println(resultvo.toString());
		String result = resultvo.getUserid();
		// result에 값이 있으면
		if(resultvo!=null) {
			// 6자리 랜덤수를 뽑아  
			Random random = new Random();
			int randomNum = 0;
			String randomSum = "";
			for(int i=0; i<5; i++) {
				randomNum = random.nextInt(9);
				randomSum += Integer.toString(randomNum);
			}
			//System.out.println("생성된 인증키:"+randomSum);
			// temppw에 넣고
			resultvo.setTemppw(randomSum);
			// 디비에 update하기
			mybatis.update("UserDAO.updatesettemppw",resultvo);
			//System.out.println("name:"+vo.getName()+" userid:"+vo.getUserid()+" email:"+vo.getEmail()+" 인증키:"+vo.getTemppw());
			
			// 메일 보내기
			sendMail(resultvo);

		}
		// 매칭값이 없으면 null, 값이 있으면 userid 들어옴
		System.out.println(resultvo.toString());
		
		return result;
	}

	// 메일 보내기
	public void sendMail(UserVO vo) {
		String mailTitle = "Ticket MVP 인증 이메일 입니다";
		String mailcontent = "<h1> Ticket MVP </h1>"
							+ vo.getName()+"님 저희 사이트를 이용해 주셔서 감사합니다."
							+ "<br/><br/>"
							+ "인증번호는 <strong>["+vo.getTemppw()+"]</strong> 입니다"
							+ "<br/>"
							+ "해당 인증 번호를 인증번호 확인란에 기입하여 주세요";
		try {
			//System.out.println("sendMail 진입 완료");
			MimeMessage message = mailsender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			
			//System.out.println("메일 객체생성 완료");
			
			helper.setFrom("seoungiks@gmail.com");	//from 이메일
			helper.setTo(vo.getEmail());			//to 이메일
			helper.setSubject(mailTitle);			//이메일 제목
			helper.setText(mailcontent, true);		//이메일 내용 (true를 해야 html형식으로 전송됨)
			
			mailsender.send(message);				//메일보내기
			
			//System.out.println("메일 보내기 시도 ");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 비밀번호 찾기 (인증번호 맞게 입력했는지 확인)
	public Integer checkTempPw(UserVO vo) {
		Integer result = mybatis.update("UserDAO.selecttemppw",vo);
		return result;
	}

	// 비밀번호 재설정
	public Integer resetPw(UserVO vo) {
		Integer result = mybatis.update("UserDAO.updatepw",vo);
		return result;
	}

	// 현재비밀번호 확인
	public UserVO checkPw(UserVO vo) {
		UserVO resutl = mybatis.selectOne("UserDAO.selectpw",vo);
		return resutl;
	}

	// 회원정보수정
	public Integer userModify(UserVO vo, boolean exceptpw) {
		
		if(exceptpw) {// true면 userpw는 제외하고 나머지 정보 변경
			return mybatis.update("UserDAO.updatemodify_exceptpw", vo);
		}else {	// false면 모든 정보 변경	
			return mybatis.update("UserDAO.updatemodify_all", vo);			
		}
	}

	// 회원탈퇴
	public Integer userMyElimination(String userid) {
		return mybatis.update("UserDAO.updateelimination",userid);
	}

	// 내 주문목록
	public List<UserOrderVO> userMyOrderList(String userid) {
		return mybatis.selectList("UserDAO.selectmyorder", userid);
	}

	// 예약의 취소 여부 확인
	public Integer checkOrderStatus(String orderid) {
		UserOrderVO result = mybatis.selectOne("UserDAO.checkorderstatus", orderid);
		if (result != null) {
	        return 1; 
	    } else {
	        return -1; 
	    }
	}
	
	// 내 주문목록에서 예매 취소 - 쿠폰 회수
	public void cancelOrderCoupon(String orderid) {
		mybatis.update("UserDAO.cancelordercoupon", orderid);
	}

	// 내 주문목록에서 예매 취소
	public void cancelOrderSeat(String orderid) {
		mybatis.update("UserDAO.cancelorderseat", orderid);
		
	}

	// 주문취소 후 티켓 남은 수량 다시 회복
	public void updateTicket(String totalSeat, String ticketName) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("totalseat", totalSeat);
		param.put("ticketname", ticketName);
		mybatis.update("UserDAO.updateticket", param);
	}

	// 문의하기 리스트
	public List<UserInquiryVO> userMyInquiry(String userid) {
		return mybatis.selectList("UserDAO.selectInquiry", userid);
	}
	
	//문의하기 리스트 내꺼
	public List<UserInquiryVO> userMyInquiryMine(String userid) {
		return mybatis.selectList("UserDAO.selectMyInquiry", userid);
	}

	// 문의하기 작성
	public Integer userMyInquiryInsert(UserInquiryVO vo) {
		return mybatis.insert("UserDAO.insertinquiryinsert", vo);
	}
	
	// 내 주문목록에서 예매 취소
	public int cancelOrderReservation(String orderid) {
		return mybatis.update("UserDAO.cancelorderreservation", orderid);
	}


	// 문의하기 글 상세
	public UserInquiryVO userMyInquiryView(String stringhelpid) {
		Integer helpid = Integer.parseInt(stringhelpid);
		return mybatis.selectOne("UserDAO.selectInquiryview", helpid);
	}
	
	// 문의하기 글 삭제 
	public Integer userMyInquiryDelete(String stringhelpid) {
		Integer helpid = Integer.parseInt(stringhelpid);
		return mybatis.delete("UserDAO.deleteInquiry", helpid);
	}
	
	// 찜목록 
	public List<UserLikeVO> userMyLike(String userid){
		return mybatis.selectList("UserDAO.selectmylike", userid);
	}

	// 쿠폰목록
	public List<UserCouponVO> userMyCoupon(String userid){
		return mybatis.selectList("UserDAO.selectmycoupon", userid);
	}
	
	// 쿠폰 사용자 등록
	public Integer userMyCouponInsert(String userid, String couponid) {
		UserCouponVO vo = new  UserCouponVO();
		vo.setUserid(userid);
		vo.setCouponid(couponid);
		return mybatis.update("UserDAO.updatemycoupon", vo);
	}
	
	//찜 목록에서 찜 삭제
	@Override
    public void removeLike(String userId, Integer matchId) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("userId", userId);
		param.put("matchId", matchId);
        mybatis.delete("com.ticketmvp.dao.AthleteDAO.removeLike", param);
    }

	//문의하기 리스트 페이지 번호
	public List<UserInquiryVO> getUserInquiriesPaginated(String userId, int startRow, int size) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("userId", userId);
		param.put("startRow", startRow);
		param.put("size", size);
		return mybatis.selectList("UserDAO.getUserInquiriesPaginated", param);
	}
	
}
