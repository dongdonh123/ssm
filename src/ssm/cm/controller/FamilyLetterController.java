package ssm.cm.controller;

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

@Controller
@RequestMapping(value="/familyletter")
public class FamilyLetterController {

	@Autowired
	private FamilyLetterService familyletterservice;
	
	/*전체 조회*/
	@RequestMapping(value="/fllist")
	public String nblist(@ModelAttribute FamilyLetterVO fvo, Model model){
		System.out.println("컨트롤러 왔당");
		
		//검색에 대한 데이터 확인
		System.out.println("fvo.getSearch()>>>: "+ fvo.getSearch());
		System.out.println("fvo.getKeyword()>>>: "+ fvo.getKeyword());
		
		//전체 레코드수
		
		List fllist=familyletterservice.fllist(fvo); 
		
		model.addAttribute("fllist",fllist);
		model.addAttribute("data",fvo);
		return "fl/fllist";
	}
	
	/*글쓰기 폼 출력*/
	@RequestMapping(value="flwirteform")
	public String flwirteform(){
		System.out.println(" flwirteform 컨트롤러 왔당");
		return "fl/flwirteform";
	}
	
	/*글쓰기 구현*/
	@RequestMapping(value="/flwirte")
	public String flinsert(@ModelAttribute FamilyLetterVO fvo, HttpServletRequest req){
		System.out.println("컨트롤러 flwirte왔당");
		String url="";
		String uploadPath=req.getSession().getServletContext().getRealPath("/upload");
		String daFileName="";
		int result=0;
		boolean bval= false;
		int size=10*1024*1024;
		try{
			MultipartRequest multi = new MultipartRequest(req,uploadPath,size,"EUC-KR",new DefaultFileRenamePolicy());
			
			Enumeration files=multi.getFileNames();
			String file=(String)files.nextElement();//입력한 파일명받아오는거
			String fileName=multi.getFilesystemName(file);//멀티파트참조변수로 바꾸는거
			daFileName="../"+"upload"+"/"+fileName;//경로추가해 합치는거
			
			String ttNo=multi.getParameter("ttNo");
			String flTitle=multi.getParameter("flTitle");
			String flContents=multi.getParameter("flContents");
			
			fvo.setTtNo(ttNo);
			fvo.setFlTitle(flTitle);
			fvo.setFlContents(flContents);
			fvo.setFlFile(daFileName);
			
			FamilyLetterVO fvo_ =familyletterservice.flChaebun(fvo); 
			System.out.println(fvo_.getFlNo());
			String no =fvo_.getFlNo();
			fvo.setFlNo(FamilyLetterChaebun.flchaebun(no));
			System.out.println(fvo.getFlNo());
			result=familyletterservice.flInsert(fvo);
		}catch(Exception e){
			System.out.println("에러는 >>>: " + e);
		}
		boolean bResult = result > 0;
			
		if(bResult) url="/familyletter/fllist.ssm";
		System.out.println("url >>>: " + url);		
		return "redirect:"+url;
	}
	
	@RequestMapping(value="/flDetail")
	public String nbDetail(@ModelAttribute FamilyLetterVO fvo, Model model){
		System.out.println("컨트롤러 flDetail왔당");
		System.out.println("no 가져왔니 >>>: "+fvo.getFlNo());
		
		FamilyLetterVO fldetail = null;
		fldetail = familyletterservice.flDetail(fvo);
		
		fldetail.setFlContents(fldetail.getFlContents().toString().replaceAll("\n","<br>"));
		
		model.addAttribute("fldetail",fldetail);
		return "fl/flDetail";
	}
	
	@ResponseBody
	@RequestMapping(value="/pwdConfirm")
	public String pwdConfirm(@ModelAttribute FamilyLetterVO fvo){
		System.out.println("컨트롤러 pwd왔다");
		
		//아래 변수에는 입력 성공에 대한 상태값 저장(1or0)
		int result = 0;
		result= familyletterservice.pwdConfirm(fvo);
		
		System.out.println("result 몇이야>>>" + result);
		return result+"";
		
	}
	
	@RequestMapping(value="/flupdateForm")
	public String updateForm(@ModelAttribute FamilyLetterVO fvo, Model model){
		System.out.println("컨트롤러 flupdateForm왔다");
		System.out.println("no 가져왔니 >>>: "+fvo.getFlNo());
		
		FamilyLetterVO updateData =null;
		updateData= familyletterservice.flDetail(fvo);
		
		model.addAttribute("updateData",updateData);
		return "fl/flupdateform";
		
	}
	
	
	@RequestMapping(value="flupdate")
	public String nbupdate(@ModelAttribute FamilyLetterVO fvo, HttpServletRequest req){
		System.out.println("컨트롤러 flupdate왔당");
		
		String url="";
		String uploadPath=req.getSession().getServletContext().getRealPath("/upload");
		String daFileName="";
		int result=0;
		boolean bval= false;
		int size=10*1024*1024;
		try{
			MultipartRequest multi = new MultipartRequest(req,uploadPath,size,"EUC-KR",new DefaultFileRenamePolicy());
			
			Enumeration files=multi.getFileNames();
			String file=(String)files.nextElement();//입력한 파일명받아오는거
			String fileName=multi.getFilesystemName(file);//멀티파트참조변수로 바꾸는거
			daFileName="../"+"upload"+"/"+fileName;//경로추가해 합치는거
			
			String flTitle=multi.getParameter("flTitle");
			String flContents=multi.getParameter("flContents");
			String flNo=multi.getParameter("flNo");
			
			fvo.setFlTitle(flTitle);
			fvo.setFlContents(flContents);
			fvo.setFlFile(daFileName);
			fvo.setFlNo(flNo);
			
			result=familyletterservice.flUpdate(fvo);
		}catch(Exception e){
			System.out.println("에러는 >>>: " + e);
		}
		boolean bResult = result > 0;
			
		if(bResult) url="/familyletter/fllist.ssm";
		return "redirect:"+url;
	}
	
	@RequestMapping(value="/flDelete")
	public String flDelete(@ModelAttribute FamilyLetterVO fvo){
		System.out.println("컨트롤러 flDelete왔다");
		String url="";
		int result = 0;
		
		result= familyletterservice.flDelete(fvo);
		
		boolean bResult = result > 0;
		
		if(bResult) url="/familyletter/fllist.ssm";
		return "redirect:"+url;
		
		
	}
}
