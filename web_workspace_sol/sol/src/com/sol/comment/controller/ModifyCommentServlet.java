package com.sol.comment.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sol.board.model.service.BoardService;
import com.sol.board.model.vo.Board;
import com.sol.comment.model.service.CommentService;

/**
 * Servlet implementation class ModifyCommentServlet
 */
@WebServlet(name = "ModifyComment", urlPatterns = { "/modifyComment.do" })
public class ModifyCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int commentNo = Integer.parseInt(request.getParameter("commentNo"));
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		Board board = new BoardService().selectOneBoard(boardNo);
		
		String commentText = request.getParameter("commentTextModify");
		
		System.out.println(commentText);
		
		int result= new CommentService().modifyComment(commentNo,commentText);
		
		if(result>0)
			response.sendRedirect("views/comment/commentModifySuccess.jsp?boardNo="+boardNo+"&boardType="+board.getTypeNo());
		else
			response.sendRedirect("error.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
