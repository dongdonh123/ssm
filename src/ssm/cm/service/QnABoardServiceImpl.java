package ssm.cm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssm.cm.dao.NoticeBoardDao;
import ssm.cm.dao.QnABoardDao;
import ssm.cm.vo.NoticeBoardVO;
import ssm.cm.vo.QnABoardVO;

@Service
@Transactional
public class QnABoardServiceImpl implements QnABoardService {

	@Autowired
	private QnABoardDao qnaboarddao;
	
	@Override
	public List<QnABoardVO> nblist(QnABoardVO nvo) {
		List<QnABoardVO> nblist = null;
		nblist =qnaboarddao.qblist(nvo);
		return nblist;
	}

	@Override
	public QnABoardVO nbChaebun(QnABoardVO nvo) {
		QnABoardVO nvo_ = null;
		nvo_ =qnaboarddao.qbChaebun(nvo);
		return nvo_;
	}

	@Override
	public int nbInsert(QnABoardVO nvo) {
		int result = 0;
		result=qnaboarddao.qbInsert(nvo);
		return result;
	}

	@Override
	public QnABoardVO nbDetail(QnABoardVO nvo) {
		QnABoardVO nvo_ = null;
		nvo_ =qnaboarddao.qbDetail(nvo);
		return nvo_;
	}

	@Override
	public int pwdConfirm(QnABoardVO nvo) {
		int result = 0;
		result=qnaboarddao.pwdConfirm(nvo);
		return result;
	}

	@Override
	public int nbUpdate(QnABoardVO nvo) {
		int result = 0;
		result=qnaboarddao.qbUpdate(nvo);
		return result;
	}

	@Override
	public int nbDelete(QnABoardVO nvo) {
		int result = 0;
		result=qnaboarddao.qbDelete(nvo);
		return result;
	}

}
