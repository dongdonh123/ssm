package ssm.cm.vo;

import ssm.cm.vo.CommonVO;
import ssm.mi.vo.SmemberVO;

public class SchedulNoticeVO extends CommonVO{

	private String snNo;
	private String ttNo;
	private String snTitle;
	private String snContents;
	private String snDate;
	private String snInsertdate;
	private String snUpdatedate;
	private String snDeleteyn;
	private SmemberVO tMembervo;
	
	public SmemberVO gettMembervo() {
		return tMembervo;
	}
	public void settMembervo(SmemberVO tMembervo) {
		this.tMembervo = tMembervo;
	}
	
	public String getSnNo() {
		return snNo;
	}
	public void setSnNo(String snNo) {
		this.snNo = snNo;
	}
	public String getTtNo() {
		return ttNo;
	}
	public void setTtNo(String ttNo) {
		this.ttNo = ttNo;
	}
	public String getSnTitle() {
		return snTitle;
	}
	public void setSnTitle(String snTitle) {
		this.snTitle = snTitle;
	}
	public String getSnContents() {
		return snContents;
	}
	public void setSnContents(String snContents) {
		this.snContents = snContents;
	}
	public String getSnDate() {
		return snDate;
	}
	public void setSnDate(String snDate) {
		this.snDate = snDate;
	}
	public String getSnInsertdate() {
		return snInsertdate;
	}
	public void setSnInsertdate(String snInsertdate) {
		this.snInsertdate = snInsertdate;
	}
	public String getSnUpdatedate() {
		return snUpdatedate;
	}
	public void setSnUpdatedate(String snUpdatedate) {
		this.snUpdatedate = snUpdatedate;
	}
	public String getSnDeleteyn() {
		return snDeleteyn;
	}
	public void setSnDeleteyn(String snDeleteyn) {
		this.snDeleteyn = snDeleteyn;
	}
	
	
	
	
	
}
