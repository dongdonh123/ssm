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

import ssm.cm.chaebun.FamilyLetterChaebun;
import ssm.cm.chaebun.NoticeBoardChaebun;
import ssm.cm.service.FamilyLetterService;
import ssm.cm.service.NoticeBoardService;
import ssm.cm.vo.FamilyLetterVO;
import ssm.cm.vo.NoticeBoardVO;
import ssm.ef.service.EportfolioService;
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
	
	@RequestMapping(value="/teacherlogin")
	public String teacherlogin(@ModelAttribute TmemberVO tvo){
		System.out.println("teacherlogin 컨트롤러 왔다");
		String url ="";
		
		int result=eportfolioservice.teacherlogin(tvo); 
		
		boolean bResult =  result >0;
		
		if(bResult) url ="/eportfolio/teacherlist.ssm";
		
		return "redirect:"+url;
	}
	
	
	@RequestMapping(value="/teacherlist")
	public String teacherlist(Model model){
		System.out.println("teacherlist컨트롤러 왔다");
		
		List eflist=eportfolioservice.teacherlist(); 
		System.out.println("다오까지 다녀왔다");
		
		return "ef/teacher";
	}
	
	
}
