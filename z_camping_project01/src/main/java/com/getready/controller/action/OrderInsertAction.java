package com.getready.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.getready.dao.CartDAO;
import com.getready.dao.OrderDAO;
import com.getready.dto.CartVO;
import com.getready.dto.MemberVO;

public class OrderInsertAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "GetReadyServlet?command=order_list";
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if(loginUser == null) {
			url = "GetReadyServlet?command=login_form";
		}else {
			CartDAO cartDAO = CartDAO.getInstance();
			ArrayList<CartVO> cartList = cartDAO.listCart(loginUser.getId());
			
			OrderDAO orderDAO = OrderDAO.getInstance();
			
			int maxOnum = orderDAO.insertOrder(cartList, loginUser.getId());
			url = "GetReadyServlet?command=order_list&onum="+maxOnum;
		}
		response.sendRedirect(url);
	}
	
}
