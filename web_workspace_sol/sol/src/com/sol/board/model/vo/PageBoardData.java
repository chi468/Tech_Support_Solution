package com.sol.board.model.vo;

import java.util.ArrayList;

public class PageBoardData {
	
	ArrayList<Board> boardList;
	String pageNavi;
	
	public PageBoardData() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PageBoardData(ArrayList<Board> boardList, String pageNavi) {
		super();
		this.boardList = boardList;
		this.pageNavi = pageNavi;
	}

	public ArrayList<Board> getBoardList() {
		return boardList;
	}

	public void setBoardList(ArrayList<Board> boardList) {
		this.boardList = boardList;
	}

	public String getPageNavi() {
		return pageNavi;
	}

	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
	
	

}
