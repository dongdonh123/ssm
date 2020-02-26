package ssm.cm.controller;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ssm.cm.chaebun.NoticeBoardChaebun;
import ssm.cm.chaebun.SchedulNoticeChaebun;
import ssm.cm.service.NoticeBoardService;
import ssm.cm.service.SchedulNoticeService;
import ssm.cm.vo.NoticeBoardVO;
import ssm.cm.vo.SchedulNoticeVO;
import ssm.mi.vo.SmemberVO;
import ssm.mi.vo.TmemberVO;

@Controller
@RequestMapping(value="/schedulnotice")
public class SchedulNoticeController {

	@Autowired
	private SchedulNoticeService schedulnoticeservice;
	
	@RequestMapping(value="snlist")
	public String sblist(@ModelAttribute SchedulNoticeVO svo, Model model){
		
		int ListSize = 10; 
		
		
		if(svo.getListSize()==null){
			svo.setListSize(ListSize+"");
			svo.setPageNo("1");
		}
		
		List snlist=schedulnoticeservice.snlist(svo); 
		
		
		model.addAttribute("snlist",snlist);
		model.addAttribute("listSize",ListSize);
		return "sn/snlist";
	}
	
	@RequestMapping(value="snwirteform")
	public String snwirteform(){
		
		return "sn/snwirteform";
	}
	
	@RequestMapping(value="snwirte")
	public String sninsert(@ModelAttribute SchedulNoticeVO svo){
		String url="";
		int result=0;
		boolean bval= false;
		
		SchedulNoticeVO svo_ =schedulnoticeservice.snChaebun(); 
		System.out.println("svo_.getSnNo()>>>: "+svo_.getSnNo());
		String no =svo_.getSnNo();
		svo.setSnNo(SchedulNoticeChaebun.snchaebun(no));
		System.out.println("svo.getSnNo()"+svo.getSnNo());
		result=schedulnoticeservice.snInsert(svo);
		
		boolean bResult = result > 0;
			
		if(bResult) url="sn/snresult";
		System.out.println("url >>>: " + url);		
		return url;
	}
	
	@RequestMapping(value="/snDetail")
	public String snDetail(@ModelAttribute SchedulNoticeVO svo, Model model){
		
		SchedulNoticeVO sndetail = null;
		sndetail = schedulnoticeservice.snDetail(svo);
		
		sndetail.setSnContents(sndetail.getSnContents().toString().replaceAll("\n","<br>"));
		
		model.addAttribute("sndetail",sndetail);
		return "sn/snDetail";
	}
	
	@ResponseBody
	@RequestMapping(value="/pwdConfirm")
	public String pwdConfirm(@ModelAttribute SchedulNoticeVO svo,HttpServletRequest request){
		
		String ttPw =request.getParameter("ttPw");
	
		int result = 0;
		result= schedulnoticeservice.pwdConfirm(svo,ttPw);
		
		return result+"";
		
	}
	
	@RequestMapping(value="/snupdateForm")
	public String sndateForm(@ModelAttribute SchedulNoticeVO svo, Model model){
		
		SchedulNoticeVO updateData =null;
		updateData= schedulnoticeservice.snDetail(svo);
		
		model.addAttribute("updateData",updateData);
		return "sn/snupdateform";
		
	}
	
	/*�۾��� ����*/
	@RequestMapping(value="snupdate")
	public String snupdate(@ModelAttribute SchedulNoticeVO svo){
		
		String url="";
		int result=0;
			
		result=schedulnoticeservice.snUpdate(svo);
		boolean bResult = result > 0;
			
		if(bResult) url="sn/snresult";
		return url;
	}
	
	@RequestMapping(value="/snDelete")
	public String snDelete(@ModelAttribute SchedulNoticeVO svo){
		
		String url="";
		int result = 0;
		
		result= schedulnoticeservice.snDelete(svo);
		
		boolean bResult = result > 0;
		
		if(bResult) url="/schedulnotice/snlist.ssm";
		return "redirect:"+url;
		
		
	}
	
	
	
}
