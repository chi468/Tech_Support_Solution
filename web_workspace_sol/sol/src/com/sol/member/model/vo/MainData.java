package com.sol.member.model.vo;

public class MainData {
	
	
	private int companyMemberCount;//같은회사 가입 인원
	
	private int newSharingCount;//기술공유 게시판 새글
	
	private int newCommentCont;//내 글에 달린 댓글
	
	private int emergencyCount;//긴급 공지
	
	private TechnicalSupportActivity technicalSupportCount;//기술 지원 게시판 현황

	public MainData() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MainData(int companyMemberCount, int newSharingCount, int newCommentCont, int emergencyCount,
			TechnicalSupportActivity technicalSupportCount) {
		super();
		this.companyMemberCount = companyMemberCount;
		this.newSharingCount = newSharingCount;
		this.newCommentCont = newCommentCont;
		this.emergencyCount = emergencyCount;
		this.technicalSupportCount = technicalSupportCount;
	}

	public int getCompanyMemberCount() {
		return companyMemberCount;
	}

	public void setCompanyMemberCount(int companyMemberCount) {
		this.companyMemberCount = companyMemberCount;
	}

	public int getNewSharingCount() {
		return newSharingCount;
	}

	public void setNewSharingCount(int newSharingCount) {
		this.newSharingCount = newSharingCount;
	}

	public int getNewCommentCont() {
		return newCommentCont;
	}

	public void setNewCommentCont(int newCommentCont) {
		this.newCommentCont = newCommentCont;
	}

	public int getEmergencyCount() {
		return emergencyCount;
	}

	public void setEmergencyCount(int emergencyCount) {
		this.emergencyCount = emergencyCount;
	}

	public TechnicalSupportActivity getTechnicalSupportCount() {
		return technicalSupportCount;
	}

	public void setTechnicalSupportCount(TechnicalSupportActivity technicalSupportCount) {
		this.technicalSupportCount = technicalSupportCount;
	}
	
}
