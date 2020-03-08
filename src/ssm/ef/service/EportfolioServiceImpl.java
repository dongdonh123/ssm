package ssm.ef.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssm.br.vo.NonprogramVO;
import ssm.cd.vo.CareerdesignVO;
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
	public int teacherlogin(TmemberVO tvo) {
		// TODO Auto-generated method stub
		int result =0;
		result =eportfoliodao.teacherlogin(tvo);
		return result;
	}

	@Override
	public TmemberVO a(TmemberVO tvo) {
		TmemberVO tvo_ =null;
		tvo_=eportfoliodao.a(tvo);
		return tvo_;
	}

	@Override
	public List<CareerdesignVO> cdlist(SmemberVO svo,String year) {
		List<CareerdesignVO> cdlist = null;
		cdlist =eportfoliodao.cdlist(svo,year);
		return cdlist;
	}

	@Override
	public List<NonprogramVO> brlist(SmemberVO svo,String year) {
		List<NonprogramVO> brlist = null;
		brlist =eportfoliodao.brlist(svo,year);
		return brlist;
	}

	@Override
	public List<OnlineapplicationVO> cglist(SmemberVO svo,String year) {
		List<OnlineapplicationVO> cglist = null;
		cglist =eportfoliodao.cglist(svo,year);
		return cglist;
	}

	@Override
	public SmemberVO mylist(SmemberVO svo) {
		SmemberVO mylist =eportfoliodao.mylist(svo);
		return mylist;
	}

}
