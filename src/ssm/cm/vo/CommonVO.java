package ssm.cm.vo;

public class CommonVO {
	
	//글번호 카운트
	private String count;
	
	//조건검색시 사용할 속성
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
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	} 
	
	
}
