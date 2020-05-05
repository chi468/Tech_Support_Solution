package com.sol.member.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sol.common.JDBCTemplate;
import com.sol.member.model.service.MemberService;
import com.sol.member.model.vo.Member;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet(name = "Register", urlPatterns = { "/register.do" })
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		Connection conn = JDBCTemplate.getConnection();
		
		System.out.println(conn);
		
		String userName=request.getParameter("registerUsername");
		String email=request.getParameter("registerEmail");
		String password=request.getParameter("registerPassword");
		String phone=request.getParameter("registerPhone");
		String address=request.getParameter("registerAddress");
		String company=request.getParameter("registerCompany");
		
		//협력사이면 company name이 있으므로 typeNo 1
		int typeNo=1;
		
		String memberCompany=null;
		
		//w는 waiting의 약자로 처음 가입후 승인전까지 active가 대기 상태로 가입됨
		if(company==null||company=="") {
			//제조사이면 company name을 받아오지 않으므로 typeNo가 2
			typeNo=2;
			
			company="sol";
		}
		//0은 의미없는 숫자 - 어짜피 nextVal로 memberNo가 들어감
		
		System.out.println("company:" + company);
		
		
		Member m = new Member(0,userName,password, email, phone, typeNo, company, null, "W",0);
		
		//System.out.println(m.getUserName());
		//System.out.println(m.getCompany());
		//System.out.println(typeNo);
		
		int result = new MemberService().insertMember(m);
		
		if(result>0) {
			response.sendRedirect("/index.jsp");
		}else {
			response.sendRedirect("/error.jsp");
		}		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
