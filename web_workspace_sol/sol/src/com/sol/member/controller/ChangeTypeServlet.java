package com.sol.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sol.member.model.service.MemberService;
import com.sol.member.model.vo.Member;

/**
 * Servlet implementation class ChangeTypeServlet
 */
@WebServlet(name = "ChangeType", urlPatterns = { "/changeType.do" })
public class ChangeTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeTypeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String emailType = request.getParameter("emailType");
		
		String email = emailType.substring(0,emailType.length()-1);
		
		char type=emailType.charAt(emailType.length()-1);
		
		int typeNo=type-'0';
		
		if(typeNo==2)
			typeNo=3;
		else
			typeNo=2;
		
		int result = new MemberService().changeType(typeNo, email);
		
		if(result>0)
			//System.out.println("회원 타입 변경 완료");
			;
		else
			System.out.println("회원 타입 변경 실패");
		
		String currentPage = (String) request.getParameter("changeType-currentPage");
		String currentNPage = (String) request.getParameter("changeType-currentNPage");
		
		System.out.println(currentPage);
		System.out.println(currentNPage);
		
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("currentNPage", currentNPage);
		
		RequestDispatcher view = request.getRequestDispatcher("/memberAllView.do");
		
		Object obj = 1;
		
		view.forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
