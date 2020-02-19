package ssm.cm.service;

import java.util.List;

import ssm.cm.vo.NoticeBoardVO;
import ssm.cm.vo.QnABoardVO;

public interface QnABoardService {
	public List<QnABoardVO> nblist(QnABoardVO nvo);
	public QnABoardVO nbChaebun(QnABoardVO nvo);
	public int nbInsert(QnABoardVO nvo);
	public QnABoardVO nbDetail(QnABoardVO nvo);
	public int pwdConfirm(QnABoardVO nvo);
	public int nbUpdate(QnABoardVO nvo);
	public int nbDelete(QnABoardVO nvo);
}
