package com.getready.admin.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.getready.controller.action.Action;
import com.getready.dao.OrderDAO;

public class AdminOrderSaveAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "GetReadyServlet?command=admin_order_list";
		
		String[] resultArr = request.getParameterValues("result");
		
		for(String onum:resultArr) {
			System.out.println(onum);
			OrderDAO orderDAO = OrderDAO.getInstance();
			orderDAO.updateOrderResult(onum);
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
