package com.spring.app.repository.domain;

public class RepositoryVO {
	
	private String repositoryNo;   //  저장소 고유번호     
	private String repositoryType; //  전사자료실인지, 개인자료실인지 'CORPORATE' or 'PERSONAL'
	private String fk_employeeNo;  //  개인 자료실일 경우만 사용
	private String createdAt;      //  생성날짜
	
	

	public String getRepositoryNo() {
		return repositoryNo;
	}
	public void setRepositoryNo(String repositoryNo) {
		this.repositoryNo = repositoryNo;
	}
	public String getRepositoryType() {
		return repositoryType;
	}
	public void setRepositoryType(String repositoryType) {
		this.repositoryType = repositoryType;
	}
	public String getFk_employeeNo() {
		return fk_employeeNo;
	}
	public void setFk_employeeNo(String fk_employeeNo) {
		this.fk_employeeNo = fk_employeeNo;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
}
