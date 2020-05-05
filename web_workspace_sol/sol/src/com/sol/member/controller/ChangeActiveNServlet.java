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
 * Servlet implementation class DeleteOneMemberServlet
 */
@WebServlet(name = "ChangeActiveN", urlPatterns = { "/changeActiveN.do" })
public class ChangeActiveNServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeActiveNServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		
		String email = request.getParameter("email");
		
		//System.out.println(email);
		
		int result = new MemberService().changeActive("N", email);		
		
		if(result>0)
			System.out.println("회원 active N으로 변경완료");		
		
		String currentPage = (String) request.getParameter("changeActive-currentPage");
		String currentNPage = (String) request.getParameter("changeActive-currentNPage");
		
		System.out.println(currentPage);
		System.out.println(currentNPage);
		
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("currentNPage", currentNPage);
		
		RequestDispatcher view = request.getRequestDispatcher("/memberAllView.do");
		
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
