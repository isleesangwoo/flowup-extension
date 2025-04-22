package com.spring.app.repository.domain;

public class FileVO {
	
	private String fileNo;				// 파일 고유번호
	private String fileName;			// 파일 이름
	private String fileSize;			// 파일 사이즈
	private String fk_uploadedBy;		// 파일 업로드 사원번호
	private String uploadedAt;			// 파일 업로드 날짜
	private String fk_folderNo; 		// 폴더번홐(파일이 업로드된)
	
	
	
	public String getFileNo() {
		return fileNo;
	}
	public void setFileNo(String fileNo) {
		this.fileNo = fileNo;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileSize() {
		return fileSize;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	public String getFk_uploadedBy() {
		return fk_uploadedBy;
	}
	public void setFk_uploadedBy(String fk_uploadedBy) {
		this.fk_uploadedBy = fk_uploadedBy;
	}
	public String getUploadedAt() {
		return uploadedAt;
	}
	public void setUploadedAt(String uploadedAt) {
		this.uploadedAt = uploadedAt;
	}
	public String getFk_folderNo() {
		return fk_folderNo;
	}
	public void setFk_folderNo(String fk_folderNo) {
		this.fk_folderNo = fk_folderNo;
	}

	
	
}
