package ssm.cm.vo;

import ssm.mi.vo.TmemberVO;

public class QnAAnswerVO {

	private String qaNo;
	private String qbNo;
	private String qaContents;
	private String ttNo;
	private String qaDeleteyn;
	private String qaInsertdate;
	private String qaUpdatedate;
	private TmemberVO tMembervo;
	
	public String getQaNo() {
		return qaNo;
	}
	public void setQaNo(String qaNo) {
		this.qaNo = qaNo;
	}
	public String getQbNo() {
		return qbNo;
	}
	public void setQbNo(String qbNo) {
		this.qbNo = qbNo;
	}
	public String getQaContents() {
		return qaContents;
	}
	public void setQaContents(String qaContents) {
		this.qaContents = qaContents;
	}
	public String getTtNo() {
		return ttNo;
	}
	public void setTtNo(String ttNo) {
		this.ttNo = ttNo;
	}
	public String getQaDeleteyn() {
		return qaDeleteyn;
	}
	public void setQaDeleteyn(String qaDeleteyn) {
		this.qaDeleteyn = qaDeleteyn;
	}
	public String getQaInsertdate() {
		return qaInsertdate;
	}
	public void setQaInsertdate(String qaInsertdate) {
		this.qaInsertdate = qaInsertdate;
	}
	public String getQaUpdatedate() {
		return qaUpdatedate;
	}
	public void setQaUpdatedate(String qaUpdatedate) {
		this.qaUpdatedate = qaUpdatedate;
	}
	public TmemberVO gettMembervo() {
		return tMembervo;
	}
	public void settMembervo(TmemberVO tMembervo) {
		this.tMembervo = tMembervo;
	}
	
	
	
}
