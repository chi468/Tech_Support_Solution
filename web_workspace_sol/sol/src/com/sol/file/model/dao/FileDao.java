package com.sol.file.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.sol.common.JDBCTemplate;
import com.sol.file.model.vo.FileData;

public class FileDao {

	public FileData downLoadFile(Connection conn, int boardNo) {
		// TODO Auto-generated method stub
		
		FileData fd = null;
		
		PreparedStatement pstmt = null;
		
		String sql  = "select * from board where board_No = ?";
		
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			

			if(rset.next()) {
				fd=new FileData();
				
				fd.setFileName(rset.getString("file_name"));
				fd.setFileSize(rset.getInt("file_size"));
				fd.setFileFullPath(rset.getString("file_full_path"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return fd;
	}

}
