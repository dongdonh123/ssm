package ssm.mi.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssm.mi.dao.AdminDao;
import ssm.mi.vo.TMemberVO;

@Service("adminService")
@Transactional
public class AdminServiceImpl implements AdminService {
	
	
	@Autowired
	private AdminDao adminDao;
	
	@Override
	public List<TMemberVO> listTMemberAll(TMemberVO param) {
		List<TMemberVO> list = new ArrayList<TMemberVO>();
		list = adminDao.listTMemberAll(param);
		return list;
	}
	@Override
	public List<TMemberVO> listTMemberN(TMemberVO param) {
		
		List<TMemberVO> list = new ArrayList<TMemberVO>();
		list = adminDao.listTMemberN(param);
		return list;
	}

	@Override
	public TMemberVO selectChaebun(String tvo) {
		System.out.println("ServiceImpl_Chaebun START");
		TMemberVO ttvo = adminDao.selectChaebun(tvo);
		System.out.println(">>> chaebun >>>>: " +ttvo);
		System.out.println("ServiceImpl_Chaebun END");
		return ttvo;
	}

	@Override
	public int tMemberInsert(TMemberVO tvo) {
		System.out.println("ServiceImpl_tMemberInsert START");
		System.out.println("ServiceImpl_tMemberInsert param>> : " +tvo.getTtNo());
		System.out.println("ServiceImpl_tMemberInsert param>> : " +tvo.getTtName());
		int i = adminDao.tMemberInsert(tvo);
		System.out.println("ServiceImpl_tmemberMapper.tMemberInsert(tvo) >>>> " + i);
		System.out.println("ServiceImpl_tMemberInsert END");
		return i;
	}
	
	@Override
	public List<TMemberVO> listTMemberY(TMemberVO param) {
		List<TMemberVO> list = new ArrayList<TMemberVO>();
		list = adminDao.listTMemberY(param);
		return list;
	}

	@Override
	public int tMemberYUpdate(TMemberVO tvo) {
		int i = adminDao.tMemberYUpdate(tvo);
		System.out.println("i SERVICE>> : " +i);
		return i;
	}
	@Override
	public TMemberVO tMemberDetail(TMemberVO tvo) {
		TMemberVO tmvo = adminDao.tMemberDetail(tvo);
		return tmvo;
	}
	@Override
	public int ttUpdate(TMemberVO tvo) {
		System.out.println("service ttno>>>"+tvo.getTtNo());
		int result = adminDao.ttUpdate(tvo);
		return result;
	}
	@Override
	public int ttDelete(TMemberVO tvo) {
		System.out.println("service ttno>>>"+tvo.getTtNo());
		int result = adminDao.ttDelete(tvo);
		return result;
	}

	
}
