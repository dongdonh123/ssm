package ssm.cm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssm.cm.dao.NoticeBoardDao;
import ssm.cm.dao.SchedulNoticeDao;
import ssm.cm.vo.NoticeBoardVO;
import ssm.cm.vo.SchedulNoticeVO;

@Service
@Transactional
public class SchedulNoticeServiceImpl implements SchedulNoticeService {

	@Autowired
	private SchedulNoticeDao schedulnoticedao;
	
	@Override
	public List<SchedulNoticeVO> snlist(SchedulNoticeVO svo) {
		List<SchedulNoticeVO> snlist = null;
		snlist =schedulnoticedao.snlist(svo);
		return snlist;
	}

	@Override
	public SchedulNoticeVO snChaebun() {
		SchedulNoticeVO svo_ = null;
		svo_ =schedulnoticedao.snChaebun();
		return svo_;
	}

	@Override
	public int snInsert(SchedulNoticeVO svo) {
		int result = 0;
		try {
//			System.out.println("서비스 >>> : " + svo.getSnTitle());
//			svo.setSnTitle(new String(svo.getSnTitle().getBytes("EUC-KR"), "MS949"));
//			System.out.println("서비스 변환 이후 >>> : " + svo.getSnTitle());
			result=schedulnoticedao.snInsert(svo);	
		}catch(Exception e){}
		return result;
	}

	@Override
	public SchedulNoticeVO snDetail(SchedulNoticeVO svo) {
		SchedulNoticeVO svo_ = null;
		svo_ =schedulnoticedao.snDetail(svo);
		return svo_;
	}

	@Override
	public int pwdConfirm(SchedulNoticeVO svo, String ttPw) {
		int result = 0;
		result=schedulnoticedao.pwdConfirm(svo,ttPw);
		return result;
	}

	@Override
	public int snUpdate(SchedulNoticeVO svo) {
		int result = 0;
		result=schedulnoticedao.snUpdate(svo);
		return result;
	}

	@Override
	public int snDelete(SchedulNoticeVO svo) {
		int result = 0;
		result=schedulnoticedao.snDelete(svo);
		return result;
	}

	@Override
	public List<SchedulNoticeVO> snlistajax() {
		List<SchedulNoticeVO> snlist = null;
		snlist =schedulnoticedao.snlistajax();
		return snlist;
	}


}
