package ssm.cm.service;

import java.util.List;

import ssm.cm.vo.NoticeBoardVO;
import ssm.cm.vo.SchedulNoticeVO;

public interface SchedulNoticeService {
	public List<SchedulNoticeVO> snlist(SchedulNoticeVO svo);
	public SchedulNoticeVO snChaebun(SchedulNoticeVO svo);
	public int snInsert(SchedulNoticeVO svo);
	public SchedulNoticeVO snDetail(SchedulNoticeVO svo);
	public int pwdConfirm(SchedulNoticeVO svo);
	public int snUpdate(SchedulNoticeVO svo);
	public int snDelete(SchedulNoticeVO svo);
}
