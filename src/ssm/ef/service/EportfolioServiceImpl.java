package ssm.ef.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssm.cm.dao.FamilyLetterDao;
import ssm.cm.vo.FamilyLetterVO;
import ssm.ef.dao.EportfolioDao;
import ssm.mi.vo.TmemberVO;

@Service
@Transactional
public class EportfolioServiceImpl implements EportfolioService {

	
	@Autowired
	private EportfolioDao eportfoliodao;
	
	@Override
	public List teacherlist() {
		List<FamilyLetterVO> fllist = null;
		fllist =eportfoliodao.teacherlist();
		return fllist;
	}

	@Override
	public int teacherlogin(TmemberVO tvo) {
		// TODO Auto-generated method stub
		int result =0;
		result =eportfoliodao.teacherlogin(tvo);
		return result;
	}

}
