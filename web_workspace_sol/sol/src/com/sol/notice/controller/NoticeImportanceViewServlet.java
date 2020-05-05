package com.sol.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sol.board.model.service.BoardService;
import com.sol.board.model.vo.Board;
import com.sol.board.model.vo.PageBoardData;

/**
 * Servlet implementation class NoticeImportanceViewServlet
 */
@WebServlet(name = "NoticeImportanceView", urlPatterns = { "/noticeImportanceView.do" })
public class NoticeImportanceViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeImportanceViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage;

		// 페이지 번호를 누르고 들어왔으면 그값, 아니면 1
		if (request.getParameter("currentImportancePage") == null || request.getParameter("currentImportancePage") == "")
			currentPage = 1;
		else
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		int recordPerPage=2;
		int naviPerPage=2;
		
		PageBoardData pageBoardDataImportance = new BoardService().boardAllView(1,currentPage,recordPerPage,naviPerPage,"중요");
				
		ArrayList<Board> noticeImportanceList = pageBoardDataImportance.getBoardList();
		
		for (Board board : noticeImportanceList) {
			
			board.setText(board.getText().replaceAll("\r\n", "<br>"));
		}
		request.setAttribute("pageBoardDataImportance", pageBoardDataImportance);
		
		request.setAttribute("currentPage", 1);
		
		RequestDispatcher view = request.getRequestDispatcher("views/notice/noticeImportance.jsp");
		
		view.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
