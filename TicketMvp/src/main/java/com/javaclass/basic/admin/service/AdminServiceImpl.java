package com.javaclass.basic.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaclass.basic.admin.dao.AdminDAOImpl;
import com.javaclass.basic.admin.domain.AdminVO;


@Service("adminservice")
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDAOImpl adminDAO;
	
	public List<AdminVO> user(AdminVO vo) {
		return adminDAO.user(vo);
	}
	
	public int deleteUser(String uid) {
		return adminDAO.deleteUser(uid);
	}
	public List<AdminVO> athleteManagement(AdminVO vo) {
		return adminDAO.athleteManagement(vo);
	}
	
	public List<AdminVO> clubManagement(AdminVO vo) {
		return adminDAO.clubManagement(vo);
	}
	
	public List<AdminVO> ticket(AdminVO vo) {
		return adminDAO.ticket(vo);
	}
	
}
