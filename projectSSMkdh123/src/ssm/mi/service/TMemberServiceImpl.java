package ssm.mi.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssm.mi.dao.TMemberDao;
import ssm.mi.vo.TMemberVO;


@Service("tMemberService")
@Transactional
public class TMemberServiceImpl implements TMemberService{

	
	@Autowired
	private TMemberDao tMemberDao;
	


	@Override
	public TMemberVO ajaxIdCheck(TMemberVO tvo) {
		TMemberVO tmvo = tMemberDao.ajaxIdCheck(tvo);
		return tmvo;
	}


	@Override
	public int joinTMember(TMemberVO param) {
		System.out.println("ServiceImpl_joinTMember START");
		int i = tMemberDao.joinTMember(param);
		System.out.println("ServiceImpl_joinTMember i>>> :" +i);
		System.out.println("ServiceImpl_joinTMember END");
		return i;
	}

	@Override
	public TMemberVO joinTMemberCheck(TMemberVO param) {
		System.out.println("joinTMCheck Service");
		System.out.println("Service param>>> :" +param);
		System.out.println("Service param.getTtName()>>> :" +param.getTtName());
		TMemberVO tmvo = tMemberDao.joinTMemberCheck(param);
		System.out.println("Service tmvo>>> :" +tmvo);
		return tmvo;
	}


}
