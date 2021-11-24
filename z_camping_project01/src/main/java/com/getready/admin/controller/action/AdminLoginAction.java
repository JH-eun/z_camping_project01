package com.getready.admin.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.getready.controller.action.Action;
import com.getready.dao.WorkerDAO;

public class AdminLoginAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "GetReadyServlet?command=admin_login_form";
		String msg = "";
		String workerId = request.getParameter("workerId").trim();
		String workerPwd = request.getParameter("workerPwd").trim();
		
		WorkerDAO workerDAO = WorkerDAO.getInstance();
		
		int result = workerDAO.workerCheck(workerId, workerPwd);
		
		if(result == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("workerId", workerId);
			url = "GetReadyServlet?command=admin_product_list";
		}else if(result == 0) {
			msg = "비밀번호를 확인하세요.";
		}else if(result == -1) {
			msg = "아아디를 확인하세요.";
		}
		request.setAttribute("message", msg);
		request.getRequestDispatcher(url).forward(request, response);
	}

}
