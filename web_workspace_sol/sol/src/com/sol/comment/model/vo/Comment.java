package com.sol.comment.model.vo;

public class Comment {
	
	int commentNo;
	String commentText;
	int board_no;
	String createDate;
	String createrEmail;
	String createrName;
	
	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Comment(int commentNo, String commentText, int board_no, String createDate, String createrEmail,
			String createrName) {
		super();
		this.commentNo = commentNo;
		this.commentText = commentText;
		this.board_no = board_no;
		this.createDate = createDate;
		this.createrEmail = createrEmail;
		this.createrName = createrName;
	}
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public String getCommentText() {
		return commentText;
	}
	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getCreaterEmail() {
		return createrEmail;
	}
	public void setCreaterEmail(String createrEmail) {
		this.createrEmail = createrEmail;
	}
	public String getCreaterName() {
		return createrName;
	}
	public void setCreaterName(String createrName) {
		this.createrName = createrName;
	}
	
	
	
}