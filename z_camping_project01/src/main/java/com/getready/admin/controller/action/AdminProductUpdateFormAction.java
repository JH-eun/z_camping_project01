package com.getready.admin.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.getready.controller.action.Action;
import com.getready.dao.ProductDAO;
import com.getready.dto.ProductVO;

public class AdminProductUpdateFormAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "admin/product/productUpdate.jsp";
		
		String pnum = request.getParameter("pnum").trim();
		
		ProductDAO productDAO = ProductDAO.getInstance();
		ProductVO productVO = productDAO.getProduct(pnum);
		
		request.setAttribute("productVO", productVO);
		
		String tpage = "1";
		if(request.getParameter("tpage") != null) {
			tpage = request.getParameter("tpage");
		}
		request.setAttribute("tpage", tpage);
		
		String kindList[] = {"tent", "tarp", "matt/sleepingBag", "kitchen", "chair/table", "fireFit/BBQ", "etc"};
		request.setAttribute("kindList", kindList);
		
		request.getRequestDispatcher(url).forward(request, response);
		
	}

}
