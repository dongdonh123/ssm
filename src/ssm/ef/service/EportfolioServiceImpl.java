package ssm.ef.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssm.br.vo.NonprogramVO;
import ssm.cd.vo.CareerdesignVO;
import ssm.cd.vo.ValuesettingVO;
import ssm.cg.vo.OnlineapplicationVO;
import ssm.cm.dao.FamilyLetterDao;
import ssm.cm.vo.FamilyLetterVO;
import ssm.ef.dao.EportfolioDao;
import ssm.mi.vo.SmemberVO;
import ssm.mi.vo.TmemberVO;

@Service
@Transactional
public class EportfolioServiceImpl implements EportfolioService {

	
	@Autowired
	private EportfolioDao eportfoliodao;
	
	@Override
	public List<SmemberVO> eflist(TmemberVO tvo) {
		List<SmemberVO> eflist = null;
		eflist =eportfoliodao.eflist(tvo);
		return eflist;
	}

	@Override
	public List<CareerdesignVO> cdlist(SmemberVO svo) {
		List<CareerdesignVO> cdlist = null;
		cdlist =eportfoliodao.cdlist(svo);
		return cdlist;
	}

	@Override
	public List<NonprogramVO> brlist(SmemberVO svo) {
		List<NonprogramVO> brlist = null;
		brlist =eportfoliodao.brlist(svo);
		return brlist;
	}

	@Override
	public List<OnlineapplicationVO> cglist(SmemberVO svo) {
		List<OnlineapplicationVO> cglist = null;
		cglist =eportfoliodao.cglist(svo);
		return cglist;
	}

	@Override
	public ValuesettingVO vslist(SmemberVO svo) {
		ValuesettingVO vslist = null;
		vslist =eportfoliodao.vslist(svo);
		return vslist;
	}
	
	@Override
	public SmemberVO mylist(SmemberVO svo) {
		SmemberVO mylist =eportfoliodao.mylist(svo);
		return mylist;
	}

}
