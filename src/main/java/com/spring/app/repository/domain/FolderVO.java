package com.spring.app.repository.domain;

public class FolderVO {
	     
	private String folderNo;   			// 폴더 고유번호  
	private String fk_repositoryNo;  	// 자료실 고유번호(fk)
	private String folderName;   		// 폴더명
	private String fk_parentFolderNo;   // 부모폴더 번호 0이면 루트(최상위폴더)
	private String createdBy;   		//   
	private String createdAt;   		//  
	
	
	
	public String getFolderNo() {
		return folderNo;
	}
	public void setFolderNo(String folderNo) {
		this.folderNo = folderNo;
	}
	public String getFk_repositoryNo() {
		return fk_repositoryNo;
	}
	public void setFk_repositoryNo(String fk_repositoryNo) {
		this.fk_repositoryNo = fk_repositoryNo;
	}
	public String getFolderName() {
		return folderName;
	}
	public void setFolderName(String folderName) {
		this.folderName = folderName;
	}
	public String getFk_parentFolderNo() {
		return fk_parentFolderNo;
	}
	public void setFk_parentFolderNo(String fk_parentFolderNo) {
		this.fk_parentFolderNo = fk_parentFolderNo;
	}
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
}
