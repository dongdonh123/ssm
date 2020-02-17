package ssm.cm.nb.service;

import java.util.List;

import ssm.cm.nb.vo.NoticeBoardVO;

public interface NoticeBoardService {
	public List<NoticeBoardVO> nblist(NoticeBoardVO nvo);
	public NoticeBoardVO nbChaebun(NoticeBoardVO nvo);
	public int nbInsert(NoticeBoardVO nvo);
	public NoticeBoardVO nbDetail(NoticeBoardVO nvo);
	public int pwdConfirm(NoticeBoardVO nvo);
	public int nbUpdate(NoticeBoardVO nvo);
	public int nbDelete(NoticeBoardVO nvo);
}
