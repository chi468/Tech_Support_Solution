package com.sol.member.model.vo;

import java.util.ArrayList;

public class PageMemberData {
	
	private String pageNavi;
	private ArrayList<Member> memberList;
	int memberNo;
	int currentPage;
	
	public PageMemberData() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PageMemberData(String pageNavi, ArrayList<Member> memberList, int memberNo, int currentPage) {
		super();
		this.pageNavi = pageNavi;
		this.memberList = memberList;
		this.memberNo = memberNo;
		this.currentPage = currentPage;
	}

	public String getPageNavi() {
		return pageNavi;
	}

	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}

	public ArrayList<Member> getMemberList() {
		return memberList;
	}

	public void setMemberList(ArrayList<Member> memberList) {
		this.memberList = memberList;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
}