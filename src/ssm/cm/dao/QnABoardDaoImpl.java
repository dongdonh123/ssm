package ssm.cm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import ssm.cm.vo.QnABoardVO;

public class QnABoardDaoImpl implements QnABoardDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<QnABoardVO> qblist(QnABoardVO nvo) {
		// TODO Auto-generated method stub
		return session.selectList("nblist");
	}

	@Override
	public QnABoardVO qbChaebun(QnABoardVO nvo) {
		// TODO Auto-generated method stub
		return session.selectOne("nbChaebun");
	}

	@Override
	public int qbInsert(QnABoardVO nvo) {
		// TODO Auto-generated method stub
		return session.insert("nbInsert");
	}

	@Override
	public QnABoardVO qbDetail(QnABoardVO nvo) {
		// TODO Auto-generated method stub
		return session.selectOne("nbDetail");
	}

	@Override
	public int pwdConfirm(QnABoardVO nvo) {
		// TODO Auto-generated method stub
		return session.selectOne("pwdConfirm");
	}

	@Override
	public int qbUpdate(QnABoardVO nvo) {
		// TODO Auto-generated method stub
		return session.update("nbUpdate");
	}

	@Override
	public int qbDelete(QnABoardVO nvo) {
		// TODO Auto-generated method stub
		return session.update("nbDelete");
	}


}
