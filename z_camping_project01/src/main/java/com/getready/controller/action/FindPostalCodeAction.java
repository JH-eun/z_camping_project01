package com.getready.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.getready.dao.AddressDAO;
import com.getready.dto.AddressVO;

public class FindPostalCodeAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url="member/findPostalCode.jsp";
		
		String gil = request.getParameter("gil");
		
		if(gil!=null && gil.trim().equals("")==false) {
			AddressDAO addressDAO = AddressDAO.getInstance();
			ArrayList<AddressVO> addressList = addressDAO.selectAddressByGil(gil.trim());
			request.setAttribute("addressList", addressList);
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
