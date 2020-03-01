package ssm.ef.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import ssm.mi.vo.TmemberVO;

public class EportfolioDaoImpl implements EportfolioDao {

	
	@Autowired
	private SqlSession session;
	
	@Override
	public List teacherlist() {
		// TODO Auto-generated method stub
		return session.selectList("teacherlist");
	}

	@Override
	public int teacherlogin(TmemberVO tvo) {
		// TODO Auto-generated method stub
		return session.selectOne("teacherlogin");
	}

}
