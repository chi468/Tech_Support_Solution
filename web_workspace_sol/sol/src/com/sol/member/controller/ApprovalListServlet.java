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

import com.google.gson.Gson;
import com.sol.member.model.service.MemberService;
import com.sol.member.model.vo.Member;

/**
 * Servlet implementation class ApprovalListServlet
 */
@WebServlet(name = "ApprovalList", urlPatterns = { "/approvalList.do" })
public class ApprovalListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApprovalListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session =  request.getSession();
		
		Member member = (Member)session.getAttribute("member");
		
		if(member.getTypeNo()==4) {
		
		ArrayList<Member> memberList = new ArrayList<>();
		
		String state = request.getParameter("state"); 
		
		System.out.println(state);
		
		memberList = new MemberService().selectAllMember(state);
		
		response.setContentType("application/json");
		
		response.setCharacterEncoding("UTF-8");
		
		new Gson().toJson(memberList,response.getWriter());
		}
		
		else
			response.sendRedirect("/error.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
