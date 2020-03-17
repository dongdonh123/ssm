package ssm.cm.vo;

import ssm.common.vo.CommonVO;
import ssm.mi.vo.TmemberVO;

public class FamilyLetterVO extends CommonVO{

	private String flNo;
	private String ttNo;
	private String flTitle;
	private String flContents;
	private String flFile;
	private String flInsertdate;
	private String flUpdatedate;
	private String flDeleteyn;
	private TmemberVO tMembervo;
	
	public TmemberVO gettMembervo() {
		return tMembervo;
	}
	public void settMembervo(TmemberVO tMembervo) {
		this.tMembervo = tMembervo;
	}
	
	public String getFlNo() {
		return flNo;
	}
	public void setFlNo(String flNo) {
		this.flNo = flNo;
	}
	public String getTtNo() {
		return ttNo;
	}
	public void setTtNo(String ttNo) {
		this.ttNo = ttNo;
	}
	public String getFlTitle() {
		return flTitle;
	}
	public void setFlTitle(String flTitle) {
		this.flTitle = flTitle;
	}
	public String getFlContents() {
		return flContents;
	}
	public void setFlContents(String flContents) {
		this.flContents = flContents;
	}
	public String getFlFile() {
		return flFile;
	}
	public void setFlFile(String flFile) {
		this.flFile = flFile;
	}
	public String getFlInsertdate() {
		return flInsertdate;
	}
	public void setFlInsertdate(String flInsertdate) {
		this.flInsertdate = flInsertdate;
	}
	public String getFlUpdatedate() {
		return flUpdatedate;
	}
	public void setFlUpdatedate(String flUpdatedate) {
		this.flUpdatedate = flUpdatedate;
	}
	public String getFlDeleteyn() {
		return flDeleteyn;
	}
	public void setFlDeleteyn(String flDeleteyn) {
		this.flDeleteyn = flDeleteyn;
	}
	
	
	
}
