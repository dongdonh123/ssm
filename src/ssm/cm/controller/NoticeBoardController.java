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
	
	@RequestMapping(value="nblist")
	public String nblist(@ModelAttribute NoticeBoardVO nvo, Model model){
		
		
		int ListSize = 10; 
		
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
	
	@RequestMapping(value="nbwirteform")
	public String nbwirteform(){
		
		return "nb/nbwirteform";
	}
	

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
			
			System.out.println("받아온 제목>>>:"+ nbTitle);
			System.out.println("받아온 내용>>>:"+ nbContents);
			
			nvo.setTtNo(ttNo);
			nvo.setNbTitle(nbTitle);
			nvo.setNbContents(nbContents);
			nvo.setNbFile(daFileName);
			
			NoticeBoardVO nvo_ =noticeboardservice.nbChaebun(nvo); 
			System.out.println(nvo_.getNbNo());
			String no =nvo_.getNbNo();
			nvo.setNbNo(NoticeBoardChaebun.nbchaebun(no));
			System.out.println(nvo.getNbNo());
			result=noticeboardservice.nbInsert(nvo);
		}catch(Exception e){
		}
		boolean bResult = result > 0;
			
		if(bResult) url="/noticeboard/nblist.ssm";
		System.out.println("url >>>: " + url);		
		return "redirect:"+url;
	}
	
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
	
	@ResponseBody
	@RequestMapping(value="/pwdConfirm")
	public String pwdConfirm(@ModelAttribute NoticeBoardVO nvo,HttpServletRequest request){
		String ttPw =request.getParameter("ttPw");
	
		int result = 0;
		result= noticeboardservice.pwdConfirm(nvo,ttPw);
		
		return result+"";
		
	}
	
	@RequestMapping(value="/nbupdateForm")
	public String updateForm(@ModelAttribute NoticeBoardVO nvo, Model model){
		
		NoticeBoardVO updateData =null;
		updateData= noticeboardservice.nbDetail(nvo);
		
		model.addAttribute("updateData",updateData);
		return "nb/nbupdateform";
		
	}
	
	
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
	
	@RequestMapping(value="/nbDelete")
	public String nbDelete(@ModelAttribute NoticeBoardVO nvo){
		String url="";
		int result = 0;
		
		result= noticeboardservice.nbDelete(nvo);
		
		boolean bResult = result > 0;
		
		if(bResult) url="/noticeboard/nblist.ssm";
		return "redirect:"+url;
		
		
	}
	
	@RequestMapping(value="/nbDownload")
	public String nbDownload(@ModelAttribute NoticeBoardVO nvo,HttpServletRequest request,Model model){
		String filename =(String) request.getParameter("filename");
		System.out.println("filename>>>:"+ filename);
		
		model.addAttribute("filename",filename);
		return "common/download";
		
	}
}
