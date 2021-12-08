package com.getready.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.getready.dao.MemberDAO;
import com.getready.dto.MemberVO;

public class JoinAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "member/login.jsp";
		
		HttpSession session = request.getSession();
		
		MemberVO memberVO = new MemberVO();
		
		memberVO.setId(request.getParameter("id"));
		memberVO.setPwd(request.getParameter("pwd"));
		memberVO.setName(request.getParameter("name"));
		memberVO.setEmail(request.getParameter("email") + "@" + request.getParameter("emails"));
		memberVO.setPostal_code(request.getParameter("addressName")); //postal_code
		memberVO.setAddress(request.getParameter("addressName1") + " " + request.getParameter("addressName2"));
		memberVO.setPhone(request.getParameter("phone"));
		
		session.setAttribute("id", request.getParameter("id"));
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.inserMember(memberVO);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
	
}
