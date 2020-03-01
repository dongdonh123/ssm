package ssm.ef.service;

import java.util.List;

import ssm.mi.vo.TmemberVO;


public interface EportfolioService {
	public List teacherlist();
	public int teacherlogin(TmemberVO tvo);
}
