package com.sol.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sol.member.model.service.MemberService;
import com.sol.member.model.vo.Member;
import com.sol.member.model.vo.PageMemberData;

/**
 * Servlet implementation class MemberAllViewServlet
 */
@WebServlet(name = "MemberAllView", urlPatterns = { "/memberAllView.do" })
public class MemberAllViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberAllViewServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		Member member = (Member)session.getAttribute("member");
		
		if(member.getTypeNo()==4) {

		int currentPage;

		if (request.getAttribute("currentPage") == null) {

			// 페이지 번호를 누르고 들어왔으면 그값, 아니면 1
			if (request.getParameter("currentPage") == null || request.getParameter("currentPage") == "")
				currentPage = 1;
			else
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		else {
			System.out.println(request.getAttribute("currentPage"));
			
			currentPage = Integer.parseInt((String)request.getAttribute("currentPage"));
			
			
			System.out.println(currentPage);
		}

		int currentNPage;

		if (request.getAttribute("currentNPage") == null) {
			// 페이지 번호를 누르고 들어왔으면 그값, 아니면 1
			if (request.getParameter("currentPage") == null || request.getParameter("currentNPage") == "")
				currentNPage = 1;
			else
				currentNPage = Integer.parseInt(request.getParameter("currentNPage"));
		}
		else {
			
			currentNPage= Integer.parseInt((String)request.getAttribute("currentNPage"));
			
		}

		PageMemberData pageMemberData = new MemberService().selectPageMember("Y", currentPage);

		PageMemberData pageMemberNData = new MemberService().selectPageMember("N", currentNPage);

		RequestDispatcher view = request.getRequestDispatcher("views/admin/memberList.jsp");

		request.setAttribute("pageMemberData", pageMemberData);

		request.setAttribute("pageMemberNData", pageMemberNData);

		view.forward(request, response);
		}
		else {
			response.sendRedirect("/error.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
