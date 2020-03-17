package ssm.cm.controller;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.GenericServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ssm.cm.chaebun.NoticeBoardChaebun;
import ssm.cm.service.NoticeBoardService;
import ssm.cm.vo.NoticeBoardVO;

import java.io.*;
@Controller
@RequestMapping(value="/noticeboard")
public class NoticeBoardController {

	@Autowired
	private NoticeBoardService noticeboardservice;
	
	//글조회
	@RequestMapping(value="nblist")
	public String nblist(@ModelAttribute NoticeBoardVO nvo, Model model){
		System.out.println("nblist왔음>>>:");
		
		int ListSize = 10; 
		
		//페이징 초기설정
		if(nvo.getListSize()==null){
			nvo.setListSize(ListSize+"");
			nvo.setPageNo("1");
		}
		
		
		List nblist=noticeboardservice.nblist(nvo); 
		
		model.addAttribute("nblist",nblist);
		model.addAttribute("listSize",ListSize);
		model.addAttribute("Searchdata",nvo);
		
		return "nb/nblist";
	}
	
	//글작성페이지 이동
	@RequestMapping(value="nbwirteform")
	public String nbwirteform(){
		
		return "nb/nbwirteform";
	}
	
	//글작성
	@RequestMapping(value="nbwirte")
	public String nbinsert(@ModelAttribute NoticeBoardVO nvo, HttpServletRequest req){
		
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
			String nbTitle=multi.getParameter("nbTitle");
			String nbContents=multi.getParameter("nbContents");
			
			nvo.setTtNo(ttNo);
			nvo.setNbTitle(nbTitle);
			nvo.setNbContents(nbContents);
			nvo.setNbFile(daFileName);
			
			//채번감
			NoticeBoardVO nvo_ =noticeboardservice.nbChaebun(nvo); 
			String no =nvo_.getNbNo();
			nvo.setNbNo(NoticeBoardChaebun.nbchaebun(no));
			
			//쿼리감
			result=noticeboardservice.nbInsert(nvo);
		}catch(Exception e){
			System.out.println("에러가 >>>: " + e);	
		}
		boolean bResult = result > 0;
			
		if(bResult) url="/noticeboard/nblist.ssm";
		System.out.println("url >>>: " + url);		
		return "redirect:"+url;
	}
	
	//글상세페이지 이동
	@RequestMapping(value="/nbDetail")
	public String nbDetail(@ModelAttribute NoticeBoardVO nvo, Model model){
		
		
		NoticeBoardVO nbdetail = null;
		nbdetail = noticeboardservice.nbDetail(nvo);
		
		nbdetail.setNbContents(nbdetail.getNbContents().toString().replaceAll("\n","<br>"));
		NoticeBoardVO nvo_ =(NoticeBoardVO)nbdetail;
		
		System.out.println("nvo_.getNbFile() >>>: "+nvo_.getNbFile());
		
		model.addAttribute("nbdetail",nbdetail);
		return "nb/nbDetail";
	}
	
	//글 수정이나 삭제시 글작성자의 비밀번호검색 ajax
	@ResponseBody
	@RequestMapping(value="/pwdConfirm")
	public String pwdConfirm(@ModelAttribute NoticeBoardVO nvo,HttpServletRequest request){
		String ttPw =request.getParameter("ttPw");
	
		int result = 0;
		result= noticeboardservice.pwdConfirm(nvo,ttPw);
		
		return result+"";
		
	}
	
	//글수정페이지 이동
	@RequestMapping(value="/nbupdateForm")
	public String updateForm(@ModelAttribute NoticeBoardVO nvo, Model model){
		
		NoticeBoardVO updateData =null;
		updateData= noticeboardservice.nbDetail(nvo);
		
		model.addAttribute("updateData",updateData);
		return "nb/nbupdateform";
		
	}
	
	//글수정
	@RequestMapping(value="nbupdate")
	public String nbupdate(@ModelAttribute NoticeBoardVO nvo, HttpServletRequest req){
		
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
			
			String nbTitle=multi.getParameter("nbTitle");
			String nbContents=multi.getParameter("nbContents");
			String nbNo=multi.getParameter("nbNo");
			
			nvo.setNbTitle(nbTitle);
			nvo.setNbContents(nbContents);
			nvo.setNbFile(daFileName);
			nvo.setNbNo(nbNo);
			
			result=noticeboardservice.nbUpdate(nvo);
		}catch(Exception e){
		}
		boolean bResult = result > 0;
			
		if(bResult) url="/noticeboard/nblist.ssm";
		return "redirect:"+url;
	}
	
	//글삭제
	@RequestMapping(value="/nbDelete")
	public String nbDelete(@ModelAttribute NoticeBoardVO nvo){
		String url="";
		int result = 0;
		
		result= noticeboardservice.nbDelete(nvo);
		
		boolean bResult = result > 0;
		
		if(bResult) url="/noticeboard/nblist.ssm";
		return "redirect:"+url;
		
		
	}
	
	//다운로드
	@RequestMapping(value="/nbDownload")
	public String nbDownload(@ModelAttribute NoticeBoardVO nvo,HttpServletRequest request,Model model){
		String filename =(String) request.getParameter("filename");
		System.out.println("filename>>>:"+ filename);
		
		model.addAttribute("filename",filename);
		return "common/download";
		
	}
}
