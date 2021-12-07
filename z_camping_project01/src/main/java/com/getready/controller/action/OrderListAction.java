package com.getready.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.getready.dao.OrderDAO;
import com.getready.dto.MemberVO;
import com.getready.dto.OrderVO;

public class OrderListAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "mypage/orderList.jsp";
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if(loginUser == null) {
			url = "GetReadyServlet?command=login_form";
		}else {
			OrderDAO orderDAO = OrderDAO.getInstance();
			
			int onum = Integer.parseInt(request.getParameter("onum"));
			
			ArrayList<OrderVO> orderList = orderDAO.listOrderById(loginUser.getId(), "1", onum);
			
			int totalPrice = 0;
			for(OrderVO orderVO : orderList) {
				totalPrice += orderVO.getPrice2() * orderVO.getQuantity();
			}
			
			request.setAttribute("orderList", orderList);
			request.setAttribute("totalPrice", totalPrice);
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
	
}
