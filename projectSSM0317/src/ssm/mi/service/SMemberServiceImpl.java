package ssm.mi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssm.mi.dao.SMemberDao;
import ssm.mi.vo.SMemberGrVO;
import ssm.mi.vo.SMemberVO;
import ssm.mi.vo.TMemberVO;

@Service
@Transactional
public class SMemberServiceImpl implements SMemberService {

	
	@Autowired
	private SMemberDao sMemberDao;
	
	@Override
	public SMemberVO checkInfo(SMemberVO smvo) {
		SMemberVO svo = sMemberDao.checkInfo(smvo);
		return svo;
	}

	@Override
	public SMemberGrVO checkFM_Member(SMemberVO svo) {
		SMemberGrVO sgrvo = sMemberDao.checkFM_Member(svo);
		return sgrvo;
	}

	@Override
	public SMemberGrVO checkJR_Member(SMemberVO svo) {
		SMemberGrVO sgrvo = sMemberDao.checkJR_Member(svo);
		return sgrvo;
	}

	@Override
	public SMemberGrVO checkSR_Member(SMemberVO svo) {
		SMemberGrVO sgrvo = sMemberDao.checkSR_Member(svo);
		return sgrvo;
	}


	@Override
	public int insertInfo(SMemberVO smvo) {
		int i = sMemberDao.insertInfo(smvo);
		return i;
	}

	@Override
	public TMemberVO teacherInfo(SMemberGrVO sgvo) {
		TMemberVO tvo = sMemberDao.teacherInfo(sgvo);
		return tvo;
	}

	@Override
	public int insertGr(SMemberGrVO sgvo) {
		int i = sMemberDao.insertGr(sgvo);
		return i;
	}

	@Override
	public int chaebunGr(SMemberGrVO sgvo) {
		int i = sMemberDao.chaebunGr(sgvo);
		return i;
	}

	@Override
	public List<SMemberVO> smListAll() {
		List<SMemberVO> list = sMemberDao.smListAll();
		return list;
	}

	@Override
	public SMemberVO ajaxIdCheck(SMemberVO svo) {
		SMemberVO smvo = sMemberDao.ajaxIdCheck(svo);
		return smvo;
	}

}
