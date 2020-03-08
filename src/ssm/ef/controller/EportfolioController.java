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
	
	@RequestMapping(value="/gologin")
	public String gologin(){
		System.out.println("gologin컨트롤러 왔다");
		
		return "ef/login";
	}
	
	@ResponseBody
	@RequestMapping(value="/teacherlogin")
	public String teacherlogin(@ModelAttribute TmemberVO tvo){
		System.out.println("teacherlogin 컨트롤러 왔다");
		
		System.out.println("tvo.getTtId()>>>: " +tvo.getTtId() );
		System.out.println("tvo.getTtPw()>>>: " +tvo.getTtPw() );
		
		int result=eportfolioservice.teacherlogin(tvo); 
		System.out.println("result: " +result );
		
		return result +"";
	}
	
	
	@RequestMapping(value="/teacher")
	public String teacherlist(@ModelAttribute TmemberVO tvo, Model model){
		System.out.println("teacher컨트롤러 왔다");
		
		TmemberVO tvo_ = eportfolioservice.a(tvo);
		List<SmemberVO> eflist=eportfolioservice.eflist(tvo_); 
		model.addAttribute("eflist", eflist);
		return "ef/teacher";
	}
	
	 
	@RequestMapping(value="/student")
	public String aaa(@ModelAttribute SmemberVO svo, Model model){
		System.out.println("★★★★★★★student컨트롤러 왔다");
		System.out.println("no가져왔니? >>>:" + svo.getSsNo());
		System.out.println("가져온 brpageNo >>>:" + svo.getBrpageNo());
		System.out.println("가져온 cgpageNo >>>:" + svo.getCgpageNo());
		
		SmemberVO svo_ =eportfolioservice.mylist(svo);
		String year ="20"; // 1 2 3학년 모두 기본값은 20년도
		
		int listSize = 4; //1페이지당 4건씩 
		svo.setListSize(listSize+"");
		if(svo.getBrpageNo()==null || svo.getBrpageNo()=="" ){
			svo.setBrpageNo("1");
			System.out.println("셋br에 들어옴");
		}
		if(svo.getCgpageNo()==null || svo.getCgpageNo()==""){
			svo.setCgpageNo("1");
			System.out.println("셋cg에 들어옴");
		}
		System.out.println("★★");
		List<CareerdesignVO> cdlist=eportfolioservice.cdlist(svo,year);
		List<NonprogramVO> brlist=eportfolioservice.brlist(svo,year);
		List<OnlineapplicationVO> cglist=eportfolioservice.cglist(svo,year); 
		
		model.addAttribute("mylist",svo_);
		model.addAttribute("cdlist",cdlist);
		model.addAttribute("brlist",brlist);
		model.addAttribute("cglist",cglist);
		model.addAttribute("listSize",listSize);
		model.addAttribute("pageNo",svo);
		return "ef/student";
	}
	
	@ResponseBody
	@RequestMapping(value="/cdgradesearch")
	public List<CareerdesignVO> cdgradesearch(@ModelAttribute SmemberVO svo,HttpServletRequest request){
		System.out.println("cdgradesearch컨트롤러 왔다");
		svo.setSsNo(request.getParameter("ssNo"));
		String year = request.getParameter("yearNo");
		
		 
		List<CareerdesignVO> cdlist=eportfolioservice.cdlist(svo,year); 
		for(int i=0; cdlist.size() > i; i++){
			CareerdesignVO cvo = cdlist.get(i);
			System.out.println("cvo.getCdValue()>>>:"+ cvo.getCdValue());
		}
		
		return cdlist;
	}
	
	@ResponseBody
	@RequestMapping(value="/brgradesearch")
	public List<NonprogramVO> brgradesearch(@ModelAttribute SmemberVO svo,HttpServletRequest request){
		System.out.println("brgradesearch컨트롤러 왔다");
		svo.setSsNo(request.getParameter("ssNo"));
		String year = request.getParameter("yearNo");
		
		 
		List<NonprogramVO> brlist=eportfolioservice.brlist(svo,year); 
		for(int i=0; brlist.size() > i; i++){
			NonprogramVO bvo = brlist.get(i);
			System.out.println("bvo.getNpTitle()>>>:"+ bvo.getNpTitle());
		}
		
		return brlist;
	}
	
	@ResponseBody
	@RequestMapping(value="/cggradesearch")
	public List<OnlineapplicationVO> cggradesearch(@ModelAttribute SmemberVO svo,HttpServletRequest request){
		System.out.println("cggradesearch컨트롤러 왔다");
		svo.setSsNo(request.getParameter("ssNo"));
		String year = request.getParameter("yearNo");
		
		 
		List<OnlineapplicationVO> cglist=eportfolioservice.cglist(svo,year); 
		for(int i=0; cglist.size() > i; i++){
			OnlineapplicationVO ovo = cglist.get(i);
			System.out.println("ovo.getOaInsertdate()>>>:"+ ovo.getOaInsertdate());
		}
		
		return cglist;
	}
}
