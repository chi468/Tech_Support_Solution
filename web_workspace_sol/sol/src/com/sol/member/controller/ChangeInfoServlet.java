package com.sol.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sol.member.model.service.MemberService;
import com.sol.member.model.vo.Member;

/**
 * Servlet implementation class ChangeInfoServlet
 */
@WebServlet(name = "changeInfo", urlPatterns = { "/changeInfo.do" })
public class ChangeInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String password = request.getParameter("password");
		
		String phone = request.getParameter("phone");
		
		String email = request.getParameter("email");
		
/*		System.out.println(password);
		
		System.out.println(phone);
		*/		
		
		int result = new MemberService().changeInfo(password,phone, email);
		
		
		
		if(result>0) {
			
			HttpSession session = request.getSession();			
			
			Member m = new MemberService().selectOneMember(email);
			
			session.setAttribute("member",m);
			
			response.sendRedirect("/views/myPage/myInfoSuccess.jsp");
		}
		else
			response.sendRedirect("/views/myPage/myInfoFail.jsp");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
