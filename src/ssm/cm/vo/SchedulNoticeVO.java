package ssm.cm.vo;

import ssm.cm.vo.CommonVO;
import ssm.mi.vo.TmemberVO;

public class SchedulNoticeVO extends CommonVO{

	private String snNo;
	private String ttNo;
	private String snTitle;
	private String snStartdate;
	private String snEnddate;
	private String snFile;
	private String snInsertdate;
	private String snUpdatedate;
	private String snDeleteyn;
	private TmemberVO tMembervo;
	
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
	public String getSnStartdate() {
		return snStartdate;
	}
	public void setSnStartdate(String snStartdate) {
		this.snStartdate = snStartdate;
	}
	public String getSnEnddate() {
		return snEnddate;
	}
	public void setSnEnddate(String snEnddate) {
		this.snEnddate = snEnddate;
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
	public TmemberVO gettMembervo() {
		return tMembervo;
	}
	public void settMembervo(TmemberVO tMembervo) {
		this.tMembervo = tMembervo;
	}
	public String getSnFile() {
		return snFile;
	}
	public void setSnFile(String snFile) {
		this.snFile = snFile;
	}
	
	
	
	
	
	
	
}
