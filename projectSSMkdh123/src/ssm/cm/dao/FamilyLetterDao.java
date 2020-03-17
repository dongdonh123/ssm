package ssm.cm.dao;

import java.util.List;

import ssm.cm.vo.FamilyLetterVO;

public interface FamilyLetterDao {

	public List<FamilyLetterVO> fllist(FamilyLetterVO fvo);
	public FamilyLetterVO flChaebun(FamilyLetterVO fvo);
	public int flInsert(FamilyLetterVO fvo);
	public FamilyLetterVO flDetail(FamilyLetterVO fvo);
	public int pwdConfirm(FamilyLetterVO fvo, String ttPw);
	public int flUpdate(FamilyLetterVO fvo);
	public int flDelete(FamilyLetterVO fvo);
}