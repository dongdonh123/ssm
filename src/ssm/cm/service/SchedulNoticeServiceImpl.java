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
	public List<SchedulNoticeVO> snlist(SchedulNoticeVO nvo) {
		List<SchedulNoticeVO> nblist = null;
		nblist =schedulnoticedao.snlist(nvo);
		return nblist;
	}

	@Override
	public SchedulNoticeVO snChaebun(SchedulNoticeVO nvo) {
		SchedulNoticeVO nvo_ = null;
		nvo_ =schedulnoticedao.snChaebun(nvo);
		return nvo_;
	}

	@Override
	public int snInsert(SchedulNoticeVO nvo) {
		int result = 0;
		result=schedulnoticedao.snInsert(nvo);
		return result;
	}

	@Override
	public SchedulNoticeVO snDetail(SchedulNoticeVO nvo) {
		SchedulNoticeVO nvo_ = null;
		nvo_ =schedulnoticedao.snDetail(nvo);
		return nvo_;
	}

	@Override
	public int pwdConfirm(SchedulNoticeVO nvo) {
		int result = 0;
		result=schedulnoticedao.pwdConfirm(nvo);
		return result;
	}

	@Override
	public int snUpdate(SchedulNoticeVO nvo) {
		int result = 0;
		result=schedulnoticedao.snUpdate(nvo);
		return result;
	}

	@Override
	public int snDelete(SchedulNoticeVO nvo) {
		int result = 0;
		result=schedulnoticedao.snDelete(nvo);
		return result;
	}

}
