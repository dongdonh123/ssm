package ssm.cm.dao;

import java.util.List;

import ssm.cm.vo.QnABoardVO;

public interface QnABoardDao {

	public List<QnABoardVO> qblist(QnABoardVO nvo);
	public QnABoardVO qbChaebun(QnABoardVO nvo);
	public int qbInsert(QnABoardVO nvo);
	public QnABoardVO qbDetail(QnABoardVO nvo);
	public int pwdConfirm(QnABoardVO nvo);
	public int qbUpdate(QnABoardVO nvo);
	public int qbDelete(QnABoardVO nvo);
}
