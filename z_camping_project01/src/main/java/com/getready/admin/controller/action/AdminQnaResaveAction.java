package com.getready.admin.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.getready.controller.action.Action;
import com.getready.dao.QnaDAO;
import com.getready.dto.QnaVO;

public class AdminQnaResaveAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "GetReadyServlet?command=admin_product_list";
		
		String qnanum = request.getParameter("qnanum").trim();
		String reply = request.getParameter("reply").trim();
		
		QnaVO qnaVO = new QnaVO();
		qnaVO.setQnanum(Integer.parseInt(qnanum));
		qnaVO.setReply(reply);
		
		QnaDAO qnaDAO = QnaDAO.getInstance();
		qnaDAO.updateQna(qnaVO);
		
		response.sendRedirect(url);
		
	}

}
