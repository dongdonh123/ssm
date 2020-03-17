package ssm.np.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ssm.np.service.Non_CenterService;
import ssm.np.vo.Non_CenterVO;



@Controller
@RequestMapping(value="/NonCenter")
public class Non_CenterController {
	Logger logger = Logger.getLogger(Non_CenterController.class);
	
	
	@Autowired
	private Non_CenterService non_CenterService;
	
	
	// 리스트, 지도 불러오기
	@RequestMapping(value="/ncList",method={RequestMethod.GET,RequestMethod.POST})
	public String nCenterList(@ModelAttribute Non_CenterVO ncvo, Model model){
		logger.info("nCenterList Controller >>> ");
		String url = "";
		
		List<Non_CenterVO> list =  non_CenterService.nCenterList(ncvo);
		logger.info(list);
		
		// json객체, 배열 생성
		//JSONObject jObj = new JSONObject();
		//JSONArray jArr = new JSONArray();
		
		//ArrayList<Non_CenterVO> ncList = (ArrayList<Non_CenterVO>)list;
		//Map<String, String> map = new HashMap<String, String>();
		
		//for(int i = 0; i < ncList.size(); i++){
			//map = new JSONObject();
			//map.put("content", ncList.get(i).getNcName());
			//map.put("add", ncList.get(i).getNcAddress());
			//ncList.addAll(map);
		//}
			
		
		model.addAttribute("ncList",list);
		logger.info("nCenterList Controller <<< ");
		
		return "np/nonCenter";
	}
	
//	@RequestMapping(value="/listTMemberY",method={RequestMethod.GET,RequestMethod.POST})
//	public String listTMemberY(@ModelAttribute TMemberVO param, Model model){
//		log.info("START");		
//		List<TMemberVO> list = tmemberService.listTMemberY(param);
//		log.info("list>>> : " + list);
//
//		model.addAttribute("tmemberList",list);
//		return CONTEXT_PATH+"/tMemberY";
//	}
//	
	
	//예약하기팝업
//	@ResponseBody
//	@RequestMapping("/vcSchedulePop")
//	public Map<String, Object>  selectMember (@RequestBody VisitCounsel_RsvVO vcRvo, Model model){
//		logger.info("(log) Controller.vcSechedulePop>>> : ");
//		Map<String, Object> map = new HashMap<String, Object>();
//		logger.info("ttNo >> : " +vcRvo.getTtNo());
//		logger.info("date >> : " +vcRvo.getVrDate());
//		logger.info("vrNo : " + vcRvo.getVrNo());
//		
//		String fulldate = vcRvo.getVrDate();
//		String vrDate = CodeTable.vrDate(fulldate);
//		
//		logger.info("vrDate2 >> : " +vrDate );
//		vcRvo.setVrDate(vrDate);
//		
//		map.put("groupId", vcRvo.getTtNo());
//		map.put("time", vcRvo.getVrTime());
//		map.put("id", vcRvo.getVrNo());
//		map.put("start", vcRvo.getVrDate());
//		String reserved = vcRvo.getVrNo();
//
//			if(reserved.equals("null")){
//				logger.info("일정없어 고고");
//				map.put("alert", "possible");
//			}else{
//				logger.info("일정있자너 안돼 돌아가");
//				map.put("alert", "reserved");			
//			}
//		return map;
//		//return "/";
//	}
	
//	@RequestMapping(value="/getNcLocation", method= {RequestMethod.GET, RequestMethod.POST})
//    @ResponseBody
//    public List<Map<String, String>> getNcLocation() {
//        
//        List<Map<String, String>>container = new ArrayList<>();
//        container = ncLocationSevice.getNcLocation();
//        
//        return container;
//    }

	
}
