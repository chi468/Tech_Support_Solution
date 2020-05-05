package com.sol.comment.model.dao;

import java.lang.reflect.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.sol.comment.model.vo.Comment;
import com.sol.common.JDBCTemplate;

public class CommentDao {

	public ArrayList<Comment> selectCommentList(Connection conn, int boardNo,String createrEmail,String createrName) {
		// TODO Auto-generated method stub
		
		
		String sql = "select * from comment_table where board_no=? order by create_date desc";
		
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rset = null;
		int result=0;
		ArrayList<Comment> commentList = new ArrayList<>();
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Comment comment = new Comment(); 
				
				comment.setCommentNo(rset.getInt("comment_no"));
				
				comment.setCommentText(rset.getString("comment_text"));
				
				comment.setBoard_no(rset.getInt("BOARD_NO"));
				
				comment.setCreateDate(rset.getString("CREATE_DATE"));
				
				comment.setCreaterEmail(rset.getString("comment_creater_email"));
				
				comment.setCreaterName(rset.getString("comment_creater_name"));
				
				commentList.add(comment);
			}
			
			int commentCnt = commentList.size();
			
			String sql2 = "update board set board_comment_no=? where board_no=? ";
			
			pstmt2 = conn.prepareStatement(sql2);
			
			pstmt2.setInt(1, commentCnt);
			pstmt2.setInt(2, boardNo);
			
			result = pstmt2.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt2);
			JDBCTemplate.close(pstmt);
		}
		
		System.out.println("댓글수 업데이트 확인 : " + result);
		
		
		return commentList;
	}

	public int insertComment(Connection conn, String createrEmail, String createrName, int boardNo,String commentText) {
		// TODO Auto-generated method stub
		
		String query = "insert into comment_table values(commentNo.nextval,?,?,sysdate,?,?)";
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		try {
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, commentText);
			
			pstmt.setInt(2, boardNo);
			
			pstmt.setString(3, createrEmail);
			
			pstmt.setString(4, createrName);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
		
	}

	public int deleteComment(Connection conn, int commentNo) {
		// TODO Auto-generated method stub
		
		String sql = "delete from comment_table where comment_no=?";
		
		PreparedStatement pstmt = null;
		
		int result= 0;
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, commentNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int modifyComment(Connection conn, int commentNo,String commentText) {
		// TODO Auto-generated method stub
		
		String sql = "update comment_table set comment_text=? where comment_no=?";
		
		PreparedStatement pstmt = null;
		
		int result= 0;
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1,commentText);
			
			pstmt.setInt(2, commentNo);
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
		
		
		
	}

	public int getNewCommentCount(Connection conn, String memberEmail) {
		// TODO Auto-generated method stub
		
		int count=0;
		
		PreparedStatement pstmt = null;
		
		String sql = "select count(*) as count from comment_table where comment_creater_email=? and create_date+7>sysdate";
		
		ResultSet rset = null;
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberEmail);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		
		return count;
	}

}
