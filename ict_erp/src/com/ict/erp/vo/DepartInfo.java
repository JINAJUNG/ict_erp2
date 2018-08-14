package com.ict.erp.vo;

public class DepartInfo {
	//map대신dto구조 사용 이유 : 없는 값이 들어오면 에러가 뜬다 (맵은 에러 안뜸 null),컬럼이 많아질 수록 속도가 좀더 빠름
	private int diNO;
	private String diName;
	private String diDesc;
	private int diCnt;
	
	public DepartInfo() {
		
	}
	public DepartInfo(int diNO, String diName, String diDesc, int diCnt) {
		this.diNO = diNO;
		this.diName = diName;
		this.diDesc = diDesc;
		this.diCnt = diCnt;
	}
	
	public int getDiNO() {
		return diNO;
	}
	public void setDiNO(int diNO) {
		this.diNO = diNO;
	}
	public String getDiName() {
		return diName;
	}
	public void setDiName(String diName) {
		this.diName = diName;
	}
	public String getDiDesc() {
		return diDesc;
	}
	public void setDiDesc(String diDesc) {
		this.diDesc = diDesc;
	}
	public int getDiCnt() {
		return diCnt;
	}
	public void setDiCnt(int diCnt) {
		this.diCnt = diCnt;
	}
	
	@Override
	public String toString() {
		return "DepartInfo [diNO=" + diNO + ", diName=" + diName + ", diDesc=" + diDesc + ", diCnt=" + diCnt + "]";
	}

}
