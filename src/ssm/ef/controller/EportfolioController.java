package ssm.ef.controller;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ssm.br.vo.NonprogramVO;
import ssm.cd.vo.CareerdesignVO;
import ssm.cd.vo.ValuesettingVO;
import ssm.cg.vo.OnlineapplicationVO;
import ssm.cm.chaebun.FamilyLetterChaebun;
import ssm.cm.chaebun.NoticeBoardChaebun;
import ssm.cm.service.FamilyLetterService;
import ssm.cm.service.NoticeBoardService;
import ssm.cm.vo.FamilyLetterVO;
import ssm.cm.vo.NoticeBoardVO;
import ssm.ef.service.EportfolioService;
import ssm.mi.vo.SmemberVO;
import ssm.mi.vo.TmemberVO;

@Controller
@RequestMapping(value="/eportfolio")
public class EportfolioController {

	@Autowired
	private EportfolioService eportfolioservice;
	
	@RequestMapping(value="/teacher")
	public String teacherlist(@ModelAttribute TmemberVO tvo, Model model){
		
		//세션적용 jsp에서 받아올것 
		tvo.setTtNo("T8200001");
		List<SmemberVO> eflist=eportfolioservice.eflist(tvo); 
		model.addAttribute("eflist", eflist);
		return "ef/teacher";
	}
	
	 
	@RequestMapping(value="/student")
	public String student(@ModelAttribute SmemberVO svo, Model model){
		
		//세션적용 ssno 를 jsp에서 받아와야함 
		if(svo.getSsNo() == null){
			svo.setSsNo("S7180001");
		}
		
		SmemberVO svo_ =eportfolioservice.mylist(svo);
		
		int listSize = 4; 
		svo.setListSize(listSize+"");
		if(svo.getBrpageNo()==null ){
			svo.setBrpageNo("1");
		}
		if(svo.getCgpageNo()==null){
			svo.setCgpageNo("1");
		}
		
		if(svo.getCdyearNo()==null && svo.getBryearNo()==null && svo.getCdyearNo()==null){
			String year = "20";
			svo.setCdyearNo(year);
			svo.setBryearNo(year);
			svo.setCgyearNo(year);
		}
		
		List<CareerdesignVO> cdlist=eportfolioservice.cdlist(svo);
		List<NonprogramVO> brlist=eportfolioservice.brlist(svo);
		List<OnlineapplicationVO> cglist=eportfolioservice.cglist(svo); 
		ValuesettingVO vslist=eportfolioservice.vslist(svo); 
		
		model.addAttribute("mylist",svo_);
		model.addAttribute("cdlist",cdlist);
		model.addAttribute("brlist",brlist);
		model.addAttribute("cglist",cglist);
		model.addAttribute("vslist",vslist);
		model.addAttribute("listSize",listSize);
		model.addAttribute("pageNo",svo);
		return "ef/student";
	}
	
}
