package ssm.cm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssm.cm.vo.NoticeBoardVO;
import ssm.cm.vo.SchedulNoticeVO;

public class SchedulNoticeDaoImpl implements SchedulNoticeDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<SchedulNoticeVO> snlist(SchedulNoticeVO svo) {
		// TODO Auto-generated method stub
		return session.selectList("snlist");
	}

	@Override
	public SchedulNoticeVO snChaebun(SchedulNoticeVO svo) {
		// TODO Auto-generated method stub
		return session.selectOne("snChaebun");
	}

	@Override
	public int snInsert(SchedulNoticeVO svo) {
		// TODO Auto-generated method stub
		return session.insert("snInsert");
	}

	@Override
	public SchedulNoticeVO snDetail(SchedulNoticeVO svo) {
		// TODO Auto-generated method stub
		return session.selectOne("snDetail");
	}

	@Override
	public int pwdConfirm(SchedulNoticeVO svo) {
		// TODO Auto-generated method stub
		return session.selectOne("pwdConfirm");
	}

	@Override
	public int snUpdate(SchedulNoticeVO svo) {
		// TODO Auto-generated method stub
		return session.update("snUpdate");
	}

	@Override
	public int snDelete(SchedulNoticeVO svo) {
		// TODO Auto-generated method stub
		return session.update("snDelete");
	}


}
