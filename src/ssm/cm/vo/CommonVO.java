package ssm.cm.vo;

public class CommonVO {
	
	//����¡
	private String pageNo;
	private String listSize;
	private String totalCount;
	
	//���ǰ˻��� ����� �Ӽ�
	private String search; 
	private String keyword;
	
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
	public String getPageNo() {
		return pageNo;
	}
	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
	}
	public String getListSize() {
		return listSize;
	}
	public void setListSize(String listSize) {
		this.listSize = listSize;
	}
	public String getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(String totalCount) {
		this.totalCount = totalCount;
	}
	
	
}
