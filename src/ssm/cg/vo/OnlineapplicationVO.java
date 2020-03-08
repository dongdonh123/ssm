package ssm.cg.vo;

import ssm.cm.vo.CommonVO;
import ssm.mi.vo.TmemberVO;

public class OnlineapplicationVO extends CommonVO{
	private String oaNo;
	private String oaInsertdate;
	private String oaField;
	private String oaTitle;
	private TmemberVO tMembervo;
	
	public String getOaNo() {
		return oaNo;
	}
	public void setOaNo(String oaNo) {
		this.oaNo = oaNo;
	}
	public String getOaInsertdate() {
		return oaInsertdate;
	}
	public void setOaInsertdate(String oaInsertdate) {
		this.oaInsertdate = oaInsertdate;
	}
	public String getOaField() {
		return oaField;
	}
	public void setOaField(String oaField) {
		this.oaField = oaField;
	}
	public String getOaTitle() {
		return oaTitle;
	}
	public void setOaTitle(String oaTitle) {
		this.oaTitle = oaTitle;
	}
	public TmemberVO gettMembervo() {
		return tMembervo;
	}
	public void settMembervo(TmemberVO tMembervo) {
		this.tMembervo = tMembervo;
	}
	
	
	
}
