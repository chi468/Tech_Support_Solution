package com.sol.member.model.vo;

public class SharingActivity {
	
	private int totalSharingCount; 		//올린 게시글 수
	private int selectedSharingCount;	//답변 채택 완료 게시글 수
	private int unselectedSharingCount;	//답변 채택 완료 게시글 수
	private int totalCommentCount;		//내가 단 총 댓글 수
	private int score;					//전체 값의 합
	
	public SharingActivity() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SharingActivity(int totalSharingCount, int selectedSharingCount, int unselectedSharingCount,
			int totalCommentCount) {
		super();
		this.totalSharingCount = totalSharingCount;
		this.selectedSharingCount = selectedSharingCount;
		this.unselectedSharingCount = unselectedSharingCount;
		this.totalCommentCount = totalCommentCount;
	}
	public int getTotalSharingCount() {
		return totalSharingCount;
	}
	public void setTotalSharingCount(int totalSharingCount) {
		this.totalSharingCount = totalSharingCount;
	}
	public int getSelectedSharingCount() {
		return selectedSharingCount;
	}
	public void setSelectedSharingCount(int selectedSharingCount) {
		this.selectedSharingCount = selectedSharingCount;
	}
	public int getUnselectedSharingCount() {
		return unselectedSharingCount;
	}
	public void setUnselectedSharingCount(int unselectedSharingCount) {
		this.unselectedSharingCount = unselectedSharingCount;
	}
	public int getTotalCommentCount() {
		return totalCommentCount;
	}
	public void setTotalCommentCount(int totalCommentCount) {
		this.totalCommentCount = totalCommentCount;
	}
	
	public void setScore() {
		this.score = this.selectedSharingCount + this.unselectedSharingCount + this.totalCommentCount;
	}
	
	public int getScore() {
		return score;
	}
}
