package com.getready.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.getready.dao.CartDAO;

public class CartDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "GetReadyServlet?command=cart_list";
		
		String[] cnumArr = request.getParameterValues("cnum");
		
		for(String cnum : cnumArr) {
			System.out.println(cnum);
			CartDAO cartDAO = CartDAO.getInstance();
			cartDAO.deleteCart(Integer.parseInt(cnum));
		}
		request.getRequestDispatcher(url).forward(request, response);
		
	}
	
}
