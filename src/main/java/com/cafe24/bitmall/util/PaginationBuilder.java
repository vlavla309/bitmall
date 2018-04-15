package com.cafe24.bitmall.util;


public class PaginationBuilder {
	private Param params; //리스트 조회 조건
	private long totalItemCount; //총 조회결과 값 (조건 없이)
	private int itemPerPage; //페이지 당 아이템 갯수
	private int paginationPerPage; //페이지 당 페이지번호 갯수
	private int countTotalPage;   // 총 페이지 갯수
	private int countTotalPagination; //총 페기네이션 갯수
	private int paginationNo; //페기네이션 번호
	private int startPageNo;  // 해당 페기네이션에서 시작 페이지 번호
	private int endPageNo;  // 해당 페기네이션에서 끝 페이지 번호
	private boolean hasNextPagination; //다음 페기네이션이 있는지 여부
	private boolean hasPreviousPagination; //이전 페기네이션이 있는지 여부

	public PaginationBuilder(Param params, long totalItemCount, int itemPerPage, int paginationPerPage) {
		this.params = params;
		this.totalItemCount = totalItemCount;
		this.itemPerPage = itemPerPage;
		this.paginationPerPage = paginationPerPage;
		hasNextPagination = false;
		hasPreviousPagination = false;
	}
	public Param getParams() {
		return params;
	}
	public void setParams(Param params) {
		this.params = params;
	}
	public long getTotalItemCount() {
		return totalItemCount;
	}
	public void setTotalItemCount(long totalItemCount) {
		this.totalItemCount = totalItemCount;
	}
	public int getItemPerPage() {
		return itemPerPage;
	}
	public void setItemPerPage(int itemPerPage) {
		this.itemPerPage = itemPerPage;
	}
	public int getPaginationPerPage() {
		return paginationPerPage;
	}
	public void setPaginationPerPage(int paginationPerPage) {
		this.paginationPerPage = paginationPerPage;
	}
	public int getCountTotalPage() {
		return countTotalPage;
	}
	public void setCountTotalPage(int countTotalPage) {
		this.countTotalPage = countTotalPage;
	}
	public int getCountTotalPagination() {
		return countTotalPagination;
	}
	public void setCountTotalPagination(int countTotalPagination) {
		this.countTotalPagination = countTotalPagination;
	}
	public int getPaginationNo() {
		return paginationNo;
	}
	public void setPaginationNo(int paginationNo) {
		this.paginationNo = paginationNo;
	}
	public int getStartPageNo() {
		return startPageNo;
	}
	public void setStartPageNo(int startPageNo) {
		this.startPageNo = startPageNo;
	}
	public int getEndPageNo() {
		return endPageNo;
	}
	public void setEndPageNo(int endPageNo) {
		this.endPageNo = endPageNo;
	}
	public boolean isHasNextPagination() {
		return hasNextPagination;
	}
	public void setHasNextPagination(boolean hasNextPagination) {
		this.hasNextPagination = hasNextPagination;
	}
	public boolean isHasPreviousPagination() {
		return hasPreviousPagination;
	}
	public void setHasPreviousPagination(boolean hasPreviousPagination) {
		this.hasPreviousPagination = hasPreviousPagination;
	}
	public void build() {
		int pageNo=params.getPageNo();

		//총 페이지 번호 갯수
		countTotalPage = (int) Math.ceil((double)totalItemCount/itemPerPage);

		//총 페이지 번호 그룹 갯수
		countTotalPagination = (int) Math.ceil((double)countTotalPage/paginationPerPage);

		//현재 페이지의 페이지 그룹 번호
		paginationNo = (int) Math.ceil(((double)pageNo/paginationPerPage));

		//시작 페이지번호
		startPageNo = ((paginationNo-1)*paginationPerPage)+1; 
		//끝 페이지번호
		endPageNo = startPageNo+paginationPerPage-1; 

		//다음 페이지 그룹이 있는가?
		if(paginationNo < countTotalPagination) {
			hasNextPagination = true;
		}

		//이전 페이지 그룹이 있는가?
		if(paginationNo > 1) {
			hasPreviousPagination = true;
		}
	}

	@Override
	public String toString() {
		return "PaginationBuilder [params=" + params + ", totalItemCount=" + totalItemCount + ", itemPerPage="
				+ itemPerPage + ", paginationPerPage=" + paginationPerPage + ", countTotalPage=" + countTotalPage
				+ ", countTotalPagination=" + countTotalPagination + ", paginationNo=" + paginationNo + ", startPageNo="
				+ startPageNo + ", endPageNo=" + endPageNo + ", hasNextPagination=" + hasNextPagination
				+ ", hasPreviousPagination=" + hasPreviousPagination + "]";
	}
}
