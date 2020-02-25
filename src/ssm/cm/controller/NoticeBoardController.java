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
	
	/*전체 조회*/
	@RequestMapping(value="nblist")
	public String nblist(@ModelAttribute NoticeBoardVO nvo, Model model){
		System.out.println("컨트롤러 왔당");
		
		//검색에 대한 데이터 확인
		System.out.println("nvo.getSearch()>>>: "+ nvo.getSearch());
		System.out.println("nvo.getKeyword()>>>: "+ nvo.getKeyword());
		
		//전체 레코드수
		
		List nblist=noticeboardservice.nblist(nvo); 
		
		
		model.addAttribute("nblist",nblist);
		model.addAttribute("data",nvo);
		return "nb/nblist";
	}
	
	/*글쓰기 폼 출력*/
	@RequestMapping(value="nbwirteform")
	public String nbwirteform(){
		System.out.println(" nbwirteform 컨트롤러 왔당");
		return "nb/nbwirteform";
	}
	
	/*글쓰기 구현*/
	@RequestMapping(value="nbwirte")
	public String nbinsert(@ModelAttribute NoticeBoardVO nvo, HttpServletRequest req){
		System.out.println("컨트롤러 nbwirte왔당");
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
			String nbTitle=multi.getParameter("nbTitle");
			String nbContents=multi.getParameter("nbContents");
			
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
			System.out.println("에러는 >>>: " + e);
		}
		boolean bResult = result > 0;
			
		if(bResult) url="/noticeboard/nblist.ssm";
		System.out.println("url >>>: " + url);		
		return "redirect:"+url;
	}
	
	@RequestMapping(value="/nbDetail")
	public String nbDetail(@ModelAttribute NoticeBoardVO nvo, Model model){
		System.out.println("컨트롤러 nbDetail왔당");
		System.out.println("no 가져왔니 >>>: "+nvo.getNbNo());
		
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
	public String pwdConfirm(@ModelAttribute NoticeBoardVO nvo){
		System.out.println("컨트롤러 pwd왔다");
		
		//아래 변수에는 입력 성공에 대한 상태값 저장(1or0)
		int result = 0;
		result= noticeboardservice.pwdConfirm(nvo);
		
		System.out.println("result 몇이야>>>" + result);
		return result+"";
		
	}
	
	@RequestMapping(value="/nbupdateForm")
	public String updateForm(@ModelAttribute NoticeBoardVO nvo, Model model){
		System.out.println("컨트롤러 nbupdateForm왔다");
		System.out.println("no 가져왔니 >>>: "+nvo.getNbNo());
		
		NoticeBoardVO updateData =null;
		updateData= noticeboardservice.nbDetail(nvo);
		
		model.addAttribute("updateData",updateData);
		return "nb/nbupdateform";
		
	}
	
	/*글쓰기 구현*/
	@RequestMapping(value="nbupdate")
	public String nbupdate(@ModelAttribute NoticeBoardVO nvo, HttpServletRequest req){
		System.out.println("컨트롤러 nbupdate왔당");
		
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
			
			String nbTitle=multi.getParameter("nbTitle");
			String nbContents=multi.getParameter("nbContents");
			String nbNo=multi.getParameter("nbNo");
			
			nvo.setNbTitle(nbTitle);
			nvo.setNbContents(nbContents);
			nvo.setNbFile(daFileName);
			nvo.setNbNo(nbNo);
			
			System.out.println("no담겼지?" + nvo.getNbNo());
			System.out.println("no담겼지?" + nvo.getNbTitle());
			System.out.println("no담겼지?" + nvo.getNbContents());
			System.out.println("no담겼지?" + nvo.getNbFile());
			result=noticeboardservice.nbUpdate(nvo);
		}catch(Exception e){
			System.out.println("에러는 >>>: " + e);
		}
		boolean bResult = result > 0;
			
		if(bResult) url="/noticeboard/nblist.ssm";
		return "redirect:"+url;
	}
	
	@RequestMapping(value="/nbDelete")
	public String nbDelete(@ModelAttribute NoticeBoardVO nvo){
		System.out.println("컨트롤러 nbDelete왔다");
		String url="";
		int result = 0;
		
		result= noticeboardservice.nbDelete(nvo);
		
		boolean bResult = result > 0;
		
		if(bResult) url="/noticeboard/nblist.ssm";
		return "redirect:"+url;
		
		
	}
	
	@RequestMapping(value="/nbDownload")
	public String nbDownload(@ModelAttribute NoticeBoardVO nvo,HttpServletRequest request,Model model){
		System.out.println("컨트롤러 nbDownload왔다");
		String filename =(String) request.getParameter("filename");
		System.out.println("filename>>>:"+ filename);
		
		model.addAttribute("filename",filename);
		return "common/download";
		
	}
}
