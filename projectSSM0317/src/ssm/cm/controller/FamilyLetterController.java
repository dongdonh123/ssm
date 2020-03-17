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
	
	//글 목록 조회
	@RequestMapping(value="/fllist")
	public String nblist(@ModelAttribute FamilyLetterVO fvo, Model model){
		
		int listSize = 10; 
		
		//초기페이지 설정
		if(fvo.getListSize()==null){
			fvo.setListSize(listSize+"");
			fvo.setPageNo("1");
		}
		
		List fllist=familyletterservice.fllist(fvo); 
		
		model.addAttribute("fllist",fllist);
		model.addAttribute("listSize",listSize);
		model.addAttribute("Searchdata",fvo);
		
		return "fl/fllist";
	}
	
	@RequestMapping(value="flwirteform")
	public String flwirteform(){
		
		return "fl/flwirteform";
	}
	
	@RequestMapping(value="/flwirte")
	public String flinsert(@ModelAttribute FamilyLetterVO fvo, HttpServletRequest req){
		String url="";
		String uploadPath=req.getSession().getServletContext().getRealPath("/upload");
		String daFileName="";
		int result=0;
		boolean bval= false;
		int size=10*1024*1024;
		try{
			MultipartRequest multi = new MultipartRequest(req,uploadPath,size,"EUC-KR",new DefaultFileRenamePolicy());
			
			Enumeration files=multi.getFileNames();
			String file=(String)files.nextElement();
			String fileName=multi.getFilesystemName(file);
			daFileName="../"+"upload"+"/"+fileName;
			
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
		}
		boolean bResult = result > 0;
			
		if(bResult) url="/familyletter/fllist.ssm";
		System.out.println("url >>>: " + url);		
		return "redirect:"+url;
	}
	
	@RequestMapping(value="/flDetail")
	public String nbDetail(@ModelAttribute FamilyLetterVO fvo, Model model){
		
		FamilyLetterVO fldetail = null;
		fldetail = familyletterservice.flDetail(fvo);
		
		fldetail.setFlContents(fldetail.getFlContents().toString().replaceAll("\n","<br>"));
		
		model.addAttribute("fldetail",fldetail);
		return "fl/flDetail";
	}
	
	@ResponseBody
	@RequestMapping(value="/pwdConfirm")
	public String pwdConfirm(@ModelAttribute FamilyLetterVO fvo,HttpServletRequest request){
		String ttPw =request.getParameter("ttPw");
		
		int result = 0;
		result= familyletterservice.pwdConfirm(fvo,ttPw);
		
		System.out.println("result >>>" + result);
		return result+"";
		
	}
	
	@RequestMapping(value="/flupdateForm")
	public String updateForm(@ModelAttribute FamilyLetterVO fvo, Model model){
		
		FamilyLetterVO updateData =null;
		updateData= familyletterservice.flDetail(fvo);
		
		model.addAttribute("updateData",updateData);
		return "fl/flupdateform";
		
	}
	
	
	@RequestMapping(value="flupdate")
	public String nbupdate(@ModelAttribute FamilyLetterVO fvo, HttpServletRequest req){
		
		String url="";
		String uploadPath=req.getSession().getServletContext().getRealPath("/upload");
		String daFileName="";
		int result=0;
		boolean bval= false;
		int size=10*1024*1024;
		try{
			MultipartRequest multi = new MultipartRequest(req,uploadPath,size,"EUC-KR",new DefaultFileRenamePolicy());
			
			Enumeration files=multi.getFileNames();
			String file=(String)files.nextElement();
			String fileName=multi.getFilesystemName(file);
			daFileName="../"+"upload"+"/"+fileName;
			
			String flTitle=multi.getParameter("flTitle");
			String flContents=multi.getParameter("flContents");
			String flNo=multi.getParameter("flNo");
			
			fvo.setFlTitle(flTitle);
			fvo.setFlContents(flContents);
			fvo.setFlFile(daFileName);
			fvo.setFlNo(flNo);
			
			result=familyletterservice.flUpdate(fvo);
		}catch(Exception e){
		}
		boolean bResult = result > 0;
			
		if(bResult) url="/familyletter/fllist.ssm";
		return "redirect:"+url;
	}
	
	@RequestMapping(value="/flDelete")
	public String flDelete(@ModelAttribute FamilyLetterVO fvo){
		String url="";
		int result = 0;
		
		result= familyletterservice.flDelete(fvo);
		
		boolean bResult = result > 0;
		
		if(bResult) url="/familyletter/fllist.ssm";
		return "redirect:"+url;
		
		
	}
	
	@RequestMapping(value="/flDownload")
	public String flDownload(@ModelAttribute FamilyLetterVO fvo,HttpServletRequest request,Model model){
		String filename =(String) request.getParameter("filename");
		System.out.println("filename>>>:"+ filename);
		
		model.addAttribute("filename",filename);
		return "common/download";
		
	}
}
