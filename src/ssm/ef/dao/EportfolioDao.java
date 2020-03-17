package ssm.ef.dao;

import java.util.List;

import ssm.br.vo.NonprogramVO;
import ssm.cd.vo.CareerdesignVO;
import ssm.cd.vo.ValuesettingVO;
import ssm.cg.vo.OnlineapplicationVO;
import ssm.cm.vo.FamilyLetterVO;
import ssm.mi.vo.SmemberVO;
import ssm.mi.vo.TmemberVO;

public interface EportfolioDao {

	public List<SmemberVO> eflist(TmemberVO tvo);
	public List<CareerdesignVO> cdlist(SmemberVO svo);
	public List<NonprogramVO> brlist(SmemberVO svo);
	public List<OnlineapplicationVO> cglist(SmemberVO svo);
	public ValuesettingVO vslist(SmemberVO svo);
	public SmemberVO mylist(SmemberVO svo);
}
