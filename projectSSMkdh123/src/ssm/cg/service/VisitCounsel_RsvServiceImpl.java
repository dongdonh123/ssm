package ssm.cg.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssm.cg.dao.VisitCounsel_RsvMapper;
import ssm.cg.vo.VisitCounsel_RsvVO;



@Service
public class VisitCounsel_RsvServiceImpl implements VisitCounsel_RsvService {

	@Autowired
	private VisitCounsel_RsvMapper visitCounsel_RsvMapper;
	
	@Override
	public List<VisitCounsel_RsvVO> vcMineList(VisitCounsel_RsvVO vcRvo) {
		List<VisitCounsel_RsvVO> vcMineList = visitCounsel_RsvMapper.vcMineList(vcRvo);
		return vcMineList;
	}

	@Override
	public List vcRsvList(VisitCounsel_RsvVO vcRvo) {
		
		System.out.println("(log)Service.vcRsvList() start >>>");
		System.out.println("serviceImpl >>> : " +vcRvo.getTtNo() );
		List<VisitCounsel_RsvVO> timeList = visitCounsel_RsvMapper.vcRsvList(vcRvo);
		System.out.println("serviceImpl <<< : " + timeList);
		System.out.println("(log)Service.vcRsvList() end <<<");
		// TODO Auto-generated method stub
		return timeList;
	}

	@Override
	public int insertVC(VisitCounsel_RsvVO vcRvo) {
		int vcvo = visitCounsel_RsvMapper.insertVC(vcRvo);
		return vcvo;
	}

	@Override
	public VisitCounsel_RsvVO vrChaebun(VisitCounsel_RsvVO vcRvo) {
		VisitCounsel_RsvVO vcvo = visitCounsel_RsvMapper.vrChaebun(vcRvo);
		return vcvo;
	}

	@Override
	public String userGrade(String ssNo) {
		String userGrade = visitCounsel_RsvMapper.userGrade(ssNo);
		return userGrade;
	}

	@Override
	public VisitCounsel_RsvVO ssNoInfo(String ssNo) {
		VisitCounsel_RsvVO mm=visitCounsel_RsvMapper.ssNoInfo(ssNo);
		return mm;
	}

	@Override
	public int cancelBooking(VisitCounsel_RsvVO vcRvo) {
		int result = visitCounsel_RsvMapper.cancelBooking(vcRvo);
		return result;
	}




//	@Override
//	public VisitCounsel_RsvVO vcRsvIform(VisitCounsel_RsvVO vcRvo) {
//		VisitCounsel_RsvVO vcvo = visitCounsel_RsvMapper.vcRsvIform(vcRvo);
//		return vcvo;
//	}


} // VisitCounsel_RsvSerivceImpl
