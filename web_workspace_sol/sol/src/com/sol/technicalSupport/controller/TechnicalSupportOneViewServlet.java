package com.sol.technicalSupport.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sol.board.model.service.BoardService;
import com.sol.board.model.vo.Board;
import com.sol.comment.model.service.CommentService;
import com.sol.comment.model.vo.Comment;
import com.sol.member.model.service.MemberService;
import com.sol.member.model.vo.Member;

/**
 * Servlet implementation class TechnicalSupportOneViewServlet
 */
@WebServlet(name = "TechnicalSupportOneView", urlPatterns = { "/technicalSupportOneView.do" })
public class TechnicalSupportOneViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TechnicalSupportOneViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		Board board = new BoardService().selectOneBoard(boardNo);
		
		board.setText(board.getText().replaceAll("\r\n", "<br>"));
		
		RequestDispatcher view = request.getRequestDispatcher("views/technicalSupport/technicalSupportView.jsp");
		
		HttpSession session = request.getSession();
		
		Member member = (Member) session.getAttribute("member");
		
		String createrEmail = member.getEmail();
		String createrName = member.getUserName();
		
		ArrayList<Comment> commentList= new CommentService().selectCommentList(boardNo,createrEmail,createrName);
		
		if(commentList.isEmpty())
			request.setAttribute("commentIsEmpty", true);
		else
			request.setAttribute("commentList", commentList);
		
		
		//선택된 게시글 따로 전송
		Comment selectedComment = null;
		
		if(board.getSelectedComment()>0) {
		
			selectedComment = new CommentService().selectOneComment(board.getSelectedComment());
		}
		
		request.setAttribute("selectedComment", selectedComment);
		
		int result = new BoardService().plusBoardViews(boardNo,board.getHits());
		
		if(result>0)			
			;
		
		System.out.println(board.getStateNo());
		
		Member creater = new MemberService().selectOneMember(board.getCreaterNo());
		
		System.out.println("관리자 번호 : " + board.getManagerNo());
		if(board.getManagerNo()>0) {		
			Member manager = new MemberService().selectOneMember(board.getManagerNo());
			request.setAttribute("manager", manager);
		}
		
		ArrayList<Member> manuEngineerList = new MemberService().selectEngineerList();
		
		ArrayList<Integer> manuEngineerCountList = new MemberService().manageCountList();
		
		request.setAttribute("manuEngineerList", manuEngineerList);
		
		request.setAttribute("manuEngineerCountList", manuEngineerCountList);
		
		request.setAttribute("creater", creater);

		request.setAttribute("board", board);
		
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
