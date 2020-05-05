package com.sol.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.sol.board.model.dao.BoardDao;
import com.sol.board.model.vo.Board;
import com.sol.board.model.vo.PageBoardData;
import com.sol.comment.model.dao.CommentDao;
import com.sol.common.JDBCTemplate;
import com.sol.member.model.vo.MainData;
import com.sol.member.model.vo.TechnicalSupportActivity;
import com.sol.memeber.model.dao.MemberDao;

public class BoardService {

	public int insertBoard(Board board) {
		// TODO Auto-generated method stub
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new BoardDao().insertBoard(conn,board);
		
		if(result>0)
			JDBCTemplate.commit(conn);
		else
			JDBCTemplate.rollback(conn);
		
		JDBCTemplate.close(conn);
		
		return result;
		
	}

	public Board selectOneBoard(int boardNo) {
		// TODO Auto-generated method stub
		
		Connection conn = JDBCTemplate.getConnection();
		
		Board board = new BoardDao().selectOneBoard(conn,boardNo);		
		
		if(board==null)
			JDBCTemplate.rollback(conn);
		else
			JDBCTemplate.commit(conn);
		
		JDBCTemplate.close(conn);
		
		return board;
	}

	public int modifyBoard(Board notice) {
		// TODO Auto-generated method stub
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new BoardDao().modifyBoard(conn,notice);
		
		if(result>0)
			JDBCTemplate.commit(conn);
		else
			JDBCTemplate.rollback(conn);
		
		JDBCTemplate.close(conn);		
		
		return result;
	}

	public int plusBoardViews(int boardNo,int boardHits) {
		// TODO Auto-generated method stub
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new BoardDao().plusBoardViews(conn,boardNo,boardHits);
		
		if(result>0)
			JDBCTemplate.commit(conn);
		else
			JDBCTemplate.rollback(conn);
		
		JDBCTemplate.close(conn);
		
		return result;
		
		
		
	}

	public int changeCommentNo(int boardNo, int commentNo,int variation) {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new BoardDao().changeCommentNo(conn,boardNo,commentNo,variation);
		
		if(result>0)
			JDBCTemplate.commit(conn);
		else
			JDBCTemplate.rollback(conn);
		
		JDBCTemplate.close(conn);
		
		return result;
		
	}

	public PageBoardData boardAllView(int boardTypeNo,int currentPage,int recordPerPage,int naviPerPage,String grade) {
		// TODO Auto-generated method stub
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Board> boardAllList = new BoardDao().boardAllView(conn,boardTypeNo,currentPage,recordPerPage,grade);
		
		PageBoardData pageBoardData = new PageBoardData();
		
		pageBoardData.setBoardList(boardAllList);
		
		String pageNavi = new BoardDao().makePageNavi(conn,boardTypeNo,currentPage,recordPerPage,naviPerPage); 
		
		pageBoardData.setPageNavi(pageNavi);
		
		JDBCTemplate.close(conn);
		
		return pageBoardData;
	}	
	
	
	public PageBoardData techBoardAllView(int boardTypeNo,int currentPage,int recordPerPage,int naviPerPage,String grade,String company) {
		// TODO Auto-generated method stub
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Board> boardAllList = new BoardDao().techBoardAllView(conn,boardTypeNo,currentPage,recordPerPage,grade,company);
		
		PageBoardData pageBoardData = new PageBoardData();
		
		pageBoardData.setBoardList(boardAllList);
		
		String pageNavi = new BoardDao().makeTechPageNavi(conn,boardTypeNo,currentPage,recordPerPage,naviPerPage,company); 
		
		pageBoardData.setPageNavi(pageNavi);
		
		JDBCTemplate.close(conn);
		
		return pageBoardData;
	}

	public int deleteBoard(int boardNo) {
		// TODO Auto-generated method stub
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new BoardDao().deleteBoard(conn,boardNo);
		
		if(result>0)
			JDBCTemplate.commit(conn);
		else
			JDBCTemplate.rollback(conn);
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	//댓글을 채택하는 기능
	public int selectComment(int boardNo, int commentNo) {
		// TODO Auto-generated method stub
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new BoardDao().selectComment(conn,boardNo,commentNo);
		
		if(result>0)
			JDBCTemplate.commit(conn);
		else
			JDBCTemplate.rollback(conn);
		
		return result;
		
	}

	public Board selectActiveBoard() {
		// TODO Auto-generated method stub
		
		Connection conn = JDBCTemplate.getConnection();
		
		Board activeBoard = new BoardDao().selectActiveBoard(conn);
		
		JDBCTemplate.close(conn);
		
		return activeBoard;
	}

	public int loginActiveAllN() {
		// TODO Auto-generated method stub
		
		int result=0;
		
		Connection conn = JDBCTemplate.getConnection();
		
		result = new BoardDao().loginActiveAllN(conn);
		
		if(result>0)
			JDBCTemplate.commit(conn);
		else
			JDBCTemplate.rollback(conn);
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public int manage(int memberNo, int boardNo) {
		// TODO Auto-generated method stub
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result1 = new BoardDao().manage(conn,memberNo, boardNo);
		
		int result2 = new BoardDao().changeState(conn,2,boardNo);
		
		if(result1>0 && result2>0)
			JDBCTemplate.commit(conn);
		else
			JDBCTemplate.rollback(conn);
		
		JDBCTemplate.close(conn);
		
		return result1;
	}

	public int changeState(int boardNo,int stateNo) {
		// TODO Auto-generated method stub
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new BoardDao().changeState(conn, stateNo, boardNo);
		
		if(result>0)
			JDBCTemplate.commit(conn);
		else
			JDBCTemplate.rollback(conn);
		
		return result;
	}

	public PageBoardData searchBoard(int boardTypeNo,int currentPage,int recordPerPage,int naviPerPage,int searchSelect,String searchText,int searchState) {
		// TODO Auto-generated method stub
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Board> boardSearchList = new BoardDao().searchBoard(conn,boardTypeNo,currentPage,recordPerPage,searchSelect,searchText,searchState);
		
		PageBoardData pageBoardData = new PageBoardData();
		
		pageBoardData.setBoardList(boardSearchList);
		
		String pageNavi = new BoardDao().makeSearchPageNavi(conn,boardTypeNo,currentPage,recordPerPage,naviPerPage,searchSelect,searchText,searchState); 
		
		pageBoardData.setPageNavi(pageNavi);
		
		JDBCTemplate.close(conn);
		
		return pageBoardData;
	}

	public PageBoardData techBoardSearch(int boardTypeNo, int currentPage, int recordPerPage, int naviPerPage,
		 int searchSelect, String searchText, int searchState,String company) {

		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Board> boardSearchList = new BoardDao().techBoardSearch(conn,boardTypeNo,currentPage,recordPerPage,searchSelect,searchText,searchState,company);
		
		PageBoardData pageBoardData = new PageBoardData();
		
		pageBoardData.setBoardList(boardSearchList);
		
		String pageNavi = new BoardDao().makeTechSearchPageNavi(conn,boardTypeNo,currentPage,recordPerPage,naviPerPage,searchSelect,searchText,searchState,company); 
		
		pageBoardData.setPageNavi(pageNavi);
		
		JDBCTemplate.close(conn);
		
		return pageBoardData;
	}

	public MainData getMainData(int memberNo, String company,String memberEmail) {
		// TODO Auto-generated method stub
		
		Connection conn = JDBCTemplate.getConnection();
		
		int companyMemberCount = new MemberDao().getCompanyMemberCount(conn,company);
		
		int newSharingCount = new BoardDao().getSharingCount(conn);
		
		int newCommentCount = new CommentDao().getNewCommentCount(conn,memberEmail);
		
		int emergencyCount = new BoardDao().getEmergencyCount(conn);
		
		
		int newRegistration = new BoardDao().getNewTechnicalCount(conn,company,1);
		
		int assignEngineer = new BoardDao().getNewTechnicalCount(conn,company,2);
		
		int analyzing = new BoardDao().getNewTechnicalCount(conn,company,3);
		
		int requestInforation = new BoardDao().getNewTechnicalCount(conn,company,4);
		
		int needFeedBack = new BoardDao().getNewTechnicalCount(conn,company,5);
		
		
		TechnicalSupportActivity technicalSupportCount = new TechnicalSupportActivity(newRegistration, assignEngineer, analyzing, requestInforation, needFeedBack, 0);

		
		MainData mainData = new MainData(companyMemberCount, newSharingCount, newCommentCount, emergencyCount, technicalSupportCount);
		
		
		
		return mainData;
	}
}
