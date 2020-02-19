package ssm.cm.dao;

import java.util.List;

import ssm.cm.vo.SchedulNoticeVO;

public interface SchedulNoticeDao {

	public List<SchedulNoticeVO> snlist(SchedulNoticeVO nvo);
	public SchedulNoticeVO snChaebun(SchedulNoticeVO nvo);
	public int snInsert(SchedulNoticeVO nvo);
	public SchedulNoticeVO snDetail(SchedulNoticeVO nvo);
	public int pwdConfirm(SchedulNoticeVO nvo);
	public int snUpdate(SchedulNoticeVO nvo);
	public int snDelete(SchedulNoticeVO nvo);
}
