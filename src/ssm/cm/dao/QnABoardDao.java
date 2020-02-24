package ssm.cm.dao;

import java.util.List;

import ssm.cm.vo.QnABoardVO;

public interface QnABoardDao {

	public List<QnABoardVO> qblist(QnABoardVO qvo);
	public QnABoardVO qbChaebun(QnABoardVO qvo);
	public int qbInsert(QnABoardVO qvo);
	public QnABoardVO qbDetail(QnABoardVO qvo);
	public int pwdConfirm(QnABoardVO qvo);
	public int qbUpdate(QnABoardVO qvo);
	public int qbDelete(QnABoardVO qvo);
	public List<QnABoardVO> qbcount(QnABoardVO qvo);
}
