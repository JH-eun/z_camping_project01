package com.getready.admin.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.getready.controller.action.Action;
import com.getready.dao.ProductDAO;
import com.getready.dto.ProductVO;

public class AdminProductDetailAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "admin/product/productDetail.jsp";
		
		String pnum = request.getParameter("pnum").trim();
		
		ProductDAO productDAO = ProductDAO.getInstance();
		ProductVO productVO = productDAO.getProduct(pnum);
		
		request.setAttribute("productVO", productVO);
		
		String tpage = "1";
		if(request.getParameter("tpage") != null) {
			tpage = request.getParameter("tpage");
		}
		String kindList[] = {"0", "tent", "tarp", "matt/sleepingBag", "kitchen", "chair/table", "fireFit/BBQ", "etc"};
		request.setAttribute("tpage", tpage);
		int index = Integer.parseInt(productVO.getKind().trim());
		request.setAttribute("kind", kindList[index]);
		
		request.getRequestDispatcher(url).forward(request, response);
		
	}

}
