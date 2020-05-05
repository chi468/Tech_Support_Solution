package com.sol.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sol.board.model.service.BoardService;
import com.sol.board.model.vo.Board;
import com.sol.member.model.vo.MainData;
import com.sol.member.model.vo.Member;

/**
 * Servlet implementation class MainNoticeServlet
 */
@WebServlet(name = "MainNotice", urlPatterns = { "/mainNotice.do" })
public class MainNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Board activeNotice = new BoardService().selectActiveBoard();
		
		HttpSession session = request.getSession();
		
		Member m = (Member)session.getAttribute("member");
		
		MainData mainData = new BoardService().getMainData(m.getMemberNo(),m.getCompany(),m.getEmail());
		
		RequestDispatcher view = request.getRequestDispatcher("views/main.jsp");	
		
		request.setAttribute("board", activeNotice);
		request.setAttribute("mainData", mainData);
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
