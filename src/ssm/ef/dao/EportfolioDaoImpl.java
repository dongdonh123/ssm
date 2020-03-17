package ssm.ef.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import ssm.br.vo.NonprogramVO;
import ssm.cd.vo.CareerdesignVO;
import ssm.cd.vo.ValuesettingVO;
import ssm.cg.vo.OnlineapplicationVO;
import ssm.mi.vo.SmemberVO;
import ssm.mi.vo.TmemberVO;

public class EportfolioDaoImpl implements EportfolioDao {

	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<SmemberVO> eflist(TmemberVO tvo) {
		// TODO Auto-generated method stub
		return session.selectList("eflist");
	}

	@Override
	public List<CareerdesignVO> cdlist(SmemberVO svo) {
		// TODO Auto-generated method stub
		return session.selectList("cdlist");
	}

	@Override
	public List<NonprogramVO> brlist(SmemberVO svo) {
		// TODO Auto-generated method stub
		return session.selectList("brlist");
	}

	@Override
	public List<OnlineapplicationVO> cglist(SmemberVO svo) {
		// TODO Auto-generated method stub
		return session.selectList("cglist");
	}

	@Override
	public ValuesettingVO vslist(SmemberVO svo) {
		// TODO Auto-generated method stub
		return session.selectOne("vslist");
	}
	
	@Override
	public SmemberVO mylist(SmemberVO svo) {
		// TODO Auto-generated method stub
		return session.selectOne("mylist");
	}
	

}
