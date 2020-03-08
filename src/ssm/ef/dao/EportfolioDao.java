package ssm.ef.dao;

import java.util.List;

import ssm.br.vo.NonprogramVO;
import ssm.cd.vo.CareerdesignVO;
import ssm.cg.vo.OnlineapplicationVO;
import ssm.cm.vo.FamilyLetterVO;
import ssm.mi.vo.SmemberVO;
import ssm.mi.vo.TmemberVO;

public interface EportfolioDao {

	public List<SmemberVO> eflist(TmemberVO tvo);
	public int teacherlogin(TmemberVO tvo);
	public TmemberVO a(TmemberVO tvo);
	public List<CareerdesignVO> cdlist(SmemberVO svo, String year);
	public List<NonprogramVO> brlist(SmemberVO svo, String year);
	public List<OnlineapplicationVO> cglist(SmemberVO svo, String year);
	public SmemberVO mylist(SmemberVO svo);
}
