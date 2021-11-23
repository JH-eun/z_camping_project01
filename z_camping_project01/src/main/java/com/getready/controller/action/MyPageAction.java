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

public class MyPageAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url="mypage/mypage.jsp";
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
	
		if(loginUser == null) {
			url = "GetReadyServlet?command=login_form";
		}else {
			OrderDAO orderDAO = OrderDAO.getInstance();
			ArrayList<Integer> onumList = orderDAO.selectNumOrdering(loginUser.getId());
			ArrayList<OrderVO> orderList = new ArrayList<OrderVO>();
			
			for(int onum : onumList) {
				ArrayList<OrderVO> orderListing = orderDAO.listOrderById(loginUser.getId(), "1", onum);
				OrderVO orderVO = orderListing.get(0);
				orderVO.setPname(orderVO.getPname() + " 외 " + orderListing.size() + "건");
				
				int totalPrice = 0;
				for(OrderVO ovo : orderListing) {
					totalPrice += ovo.getPrice2() * ovo.getQuantity();
				}
				orderVO.setPrice2(totalPrice);
				orderList.add(orderVO);
			}
			request.setAttribute("title", "진행 중인 주문 내역");
			request.setAttribute("orderList", orderList);
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}
