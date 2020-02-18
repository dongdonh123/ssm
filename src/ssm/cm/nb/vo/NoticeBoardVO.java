package ssm.cm.nb.vo;

import ssm.cm.common.vo.CommonVO;

public class NoticeBoardVO extends CommonVO{

	private String nbNo;
	private String ttNo;
	private String nbTitle;
	private String nbContents;
	private String nbFile;
	private String nbInsertdate;
	private String nbUpdatedate;
	private String nbDeleteyn;
	private TMEMBERVO tmembervo;
	
	public TMEMBERVO getTmembervo() {
		return tmembervo;
	}
	public void setTmembervo(TMEMBERVO tmembervo) {
		this.tmembervo = tmembervo;
	}	
	public String getNbNo() {
		return nbNo;
	}
	public void setNbNo(String nbNo) {
		this.nbNo = nbNo;
	}
	public String getTtNo() {
		return ttNo;
	}
	public void setTtNo(String ttNo) {
		this.ttNo = ttNo;
	}
	public String getNbTitle() {
		return nbTitle;
	}
	public void setNbTitle(String nbTitle) {
		this.nbTitle = nbTitle;
	}
	public String getNbContents() {
		return nbContents;
	}
	public void setNbContents(String nbContents) {
		this.nbContents = nbContents;
	}
	public String getNbFile() {
		return nbFile;
	}
	public void setNbFile(String nbFile) {
		this.nbFile = nbFile;
	}
	public String getNbInsertdate() {
		return nbInsertdate;
	}
	public void setNbInsertdate(String nbInsertdate) {
		this.nbInsertdate = nbInsertdate;
	}
	public String getNbUpdatedate() {
		return nbUpdatedate;
	}
	public void setNbUpdatedate(String nbUpdatedate) {
		this.nbUpdatedate = nbUpdatedate;
	}
	public String getNbDeleteyn() {
		return nbDeleteyn;
	}
	public void setNbDeleteyn(String nbDeleteyn) {
		this.nbDeleteyn = nbDeleteyn;
	}
	
	
	
}
