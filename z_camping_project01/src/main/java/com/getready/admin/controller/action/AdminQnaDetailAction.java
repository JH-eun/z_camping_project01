package com.getready.admin.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.getready.controller.action.Action;
import com.getready.dao.QnaDAO;
import com.getready.dto.QnaVO;

public class AdminQnaDetailAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "admin/qna/qnaDetail.jsp";
		
		String qnanum = request.getParameter("qnanum").trim();
		
		QnaDAO qnaDAO = QnaDAO.getInstance();
		QnaVO qnaVO = qnaDAO.getQna(Integer.parseInt(qnanum));
		
		request.setAttribute("qnaVO", qnaVO);
		
		request.getRequestDispatcher(url).forward(request, response);
		
	}

}
