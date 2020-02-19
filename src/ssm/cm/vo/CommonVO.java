package ssm.cm.vo;

public class CommonVO {
	
	
	private String page; 
	private String pageSize; 
	private String start_row; 
	private String end_row; 
	
	//조건검색시 사용할 속성
	private String search; 
	private String keyword;
	
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public String getPageSize() {
		return pageSize;
	}
	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}
	public String getStart_row() {
		return start_row;
	}
	public void setStart_row(String start_row) {
		this.start_row = start_row;
	}
	public String getEnd_row() {
		return end_row;
	}
	public void setEnd_row(String end_row) {
		this.end_row = end_row;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	} 
	
	
}
