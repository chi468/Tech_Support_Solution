package com.sol.file.model.vo;

public class FileData {
	
	String fileName;
	String fileFullPath;
	long fileSize;
	
	public FileData() {
		super();
		// TODO Auto-generated constructor stub
		
	}

	public FileData(String fileName, String fileFullPath, long fileSize) {
		super();
		this.fileName = fileName;
		this.fileFullPath = fileFullPath;
		this.fileSize = fileSize;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileFullPath() {
		return fileFullPath;
	}

	public void setFileFullPath(String fileFullPath) {
		this.fileFullPath = fileFullPath;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
}