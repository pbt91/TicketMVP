package com.ticketmvp.domain;

import lombok.Data;

@Data
public class UserInquiryVO {
	private Integer helpid;
	private String userid;
	private String helptext;
	private String helptitle;
	private String helpproduct;
	private String helpdate;
	private String replytext;
	private String replydate;

	public UserInquiryVO() {

	}
	
	public UserInquiryVO(Integer helpid, String userid, String helptext, String helptitle, String helpproduct,
			String helpdate, String replytext, String replydate) {
		super();
		this.helpid = helpid;
		this.userid = userid;
		this.helptext = helptext;
		this.helptitle = helptitle;
		this.helpproduct = helpproduct;
		this.helpdate = helpdate;
		this.replytext = replytext;
		this.replydate = replydate;
	}

	public Integer getHelpid() {
		return helpid;
	}

	public void setHelpid(Integer helpid) {
		this.helpid = helpid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getHelptext() {
		return helptext;
	}

	public void setHelptext(String helptext) {
		this.helptext = helptext;
	}

	public String getHelptitle() {
		return helptitle;
	}

	public void setHelptitle(String helptitle) {
		this.helptitle = helptitle;
	}

	public String getHelpproduct() {
		return helpproduct;
	}

	public void setHelpproduct(String helpproduct) {
		this.helpproduct = helpproduct;
	}

	public String getHelpdate() {
		return helpdate;
	}

	public void setHelpdate(String helpdate) {
		this.helpdate = helpdate;
	}

	public String getReplytext() {
		return replytext;
	}

	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}

	public String getReplydate() {
		return replydate;
	}

	public void setReplydate(String replydate) {
		this.replydate = replydate;
	}

	
}
