package ssm.ef.dao;

import java.util.List;

import ssm.cm.vo.FamilyLetterVO;
import ssm.mi.vo.TmemberVO;

public interface EportfolioDao {

	public List teacherlist();
	public int teacherlogin(TmemberVO tvo);
}
