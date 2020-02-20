package ssm.cm.vo;

import ssm.cm.vo.CommonVO;
import ssm.mi.vo.SmemberVO;

public class QnABoardVO extends CommonVO{

	private String qbNo;
	private String ssNo;
	private String qbTitle;
	private String qbContents;
	private String qbFile;
	private String qbInsertdate;
	private String qbUpdatedate;
	private String qbDeleteyn;
	private SmemberVO sMembervo;
	
	public SmemberVO getsMembervo() {
		return sMembervo;
	}
	public void setsMembervo(SmemberVO sMembervo) {
		this.sMembervo = sMembervo;
	}
	
	public String getQbNo() {
		return qbNo;
	}
	public void setQbNo(String qbNo) {
		this.qbNo = qbNo;
	}
	public String getSsNo() {
		return ssNo;
	}
	public void setSsNo(String ssNo) {
		this.ssNo = ssNo;
	}
	public String getQbTitle() {
		return qbTitle;
	}
	public void setQbTitle(String qbTitle) {
		this.qbTitle = qbTitle;
	}
	public String getQbContents() {
		return qbContents;
	}
	public void setQbContents(String qbContents) {
		this.qbContents = qbContents;
	}
	public String getQbInsertdate() {
		return qbInsertdate;
	}
	public void setQbInsertdate(String qbInsertdate) {
		this.qbInsertdate = qbInsertdate;
	}
	public String getQbUpdatedate() {
		return qbUpdatedate;
	}
	public void setQbUpdatedate(String qbUpdatedate) {
		this.qbUpdatedate = qbUpdatedate;
	}
	public String getQbDeleteyn() {
		return qbDeleteyn;
	}
	public void setQbDeleteyn(String qbDeleteyn) {
		this.qbDeleteyn = qbDeleteyn;
	}
	public String getQbFile() {
		return qbFile;
	}
	public void setQbFile(String qbFile) {
		this.qbFile = qbFile;
	}
	
	
	
	
	
}
