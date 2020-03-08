package ssm.cm.controller;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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
		System.out.println("★★★★★★★★컨트롤러 list왔다");
		
		System.out.println("가져온 키워드>>>:" +svo.getKeyword());
		System.out.println("가져온  서치>>>:" +svo.getSearch());
		
		int ListSize = 10; 
		
		
		if(svo.getListSize()==null){
			svo.setListSize(ListSize+"");
			svo.setPageNo("1");
		}
		
		List snlist=schedulnoticeservice.snlist(svo); 
		
		
		model.addAttribute("snlist",snlist);
		model.addAttribute("listSize",ListSize);
		model.addAttribute("Searchdata",svo);
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
	@ResponseBody
	@RequestMapping(value="snwirteajax")
	public String snwirteajax(@ModelAttribute SchedulNoticeVO svo, HttpServletRequest request){
		System.out.println("에이작스 왔어 ㅠㅠ");
		System.out.println("일정제목"+ request.getParameter("snTitle"));
		System.out.println("일정 시작날짜"+ request.getParameter("snStartdate"));
		System.out.println("일정 끝 날짜"+ request.getParameter("snEnddate"));
		System.out.println("파일"+ request.getParameter("snFile"));
		
		svo.setSnTitle(request.getParameter("snTitle"));
		svo.setSnStartdate(request.getParameter("snStartdate"));
		svo.setSnEnddate(request.getParameter("snEnddate"));
		svo.setSnFile(request.getParameter("snFile"));
		svo.setTtNo("T8180001");
		int result=0;
		String result_ ="NO";
		
		SchedulNoticeVO svo_ =schedulnoticeservice.snChaebun(); 
		System.out.println("svo_.getSnNo()>>>: "+svo_.getSnNo());
		String no =svo_.getSnNo();
		svo.setSnNo(SchedulNoticeChaebun.snchaebun(no));
		System.out.println("svo.getSnNo()"+svo.getSnNo());
		result=schedulnoticeservice.snInsert(svo);
		
		boolean bResult = result > 0;
			
		if(bResult) result_="OK";
		return result_;
	}
	
	@ResponseBody
	@RequestMapping(value="snlistajax")
	public JSONArray snlistajax(@ModelAttribute SchedulNoticeVO svo){
		System.out.println("에이작스 왔어 snlistajax ㅠㅠ");
		List<SchedulNoticeVO> snlist = schedulnoticeservice.snlistajax();
		
		JSONArray jArr = new JSONArray();

		for(int i = 0; i < snlist.size(); i++){
			JSONObject jObj =  new JSONObject();
			
			jObj.put("title", snlist.get(i).getSnTitle());
			jObj.put("start", snlist.get(i).getSnStartdate());
			jObj.put("end", snlist.get(i).getSnEnddate());
			System.out.println(">>>" + snlist.get(i).getSnFile());
			if(snlist.get(i).getSnFile() !=null){
			jObj.put("url", snlist.get(i).getSnFile());
			}
			jArr.add(jObj);
		}
		
		//jsonArray 로그 확인
		
		for(int i = 0; i < jArr.size(); i++){
			System.out.println("(log)JARR : "+jArr.get(i));
		}

		
        return jArr;
	}
	
	@RequestMapping(value="/snDetail")
	public String snDetail(@ModelAttribute SchedulNoticeVO svo, Model model){
		
		SchedulNoticeVO sndetail = null;
		sndetail = schedulnoticeservice.snDetail(svo);
		
		
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
	
	@RequestMapping(value="sncalendar")
	public String sncalendar(@ModelAttribute NoticeBoardVO nvo, Model model){
		System.out.println("★★★★★★★★컨트롤러 캘린더왔다");

		return "sn/kdh";
	}
	
	@RequestMapping(value="sncalendar2")
	public String sncalendar2(@ModelAttribute NoticeBoardVO nvo, Model model){
		System.out.println("★★★★★★★★컨트롤러 캘린더2왔다");

		return "sn/kdh2";
	}
	
	@ResponseBody
	@RequestMapping(value="/sncalendarajaxlist")
	public List sncalendarajaxlist(@ModelAttribute SchedulNoticeVO svo,HttpServletRequest request){
		System.out.println("에이작스리스트왔엉");
		
		List snlist= null; 
		return snlist;
		
	}
	
	@ResponseBody
	@RequestMapping(value="/sncalendarajaxinsert")
	public String sncalendarajaxinsert(@ModelAttribute SchedulNoticeVO svo,HttpServletRequest request){
		System.out.println("에이작스인서트왔엉");
		System.out.println("에이작스인서트왔엉");
		System.out.println("에이작스인서트왔엉");
		System.out.println("에이작스인서트왔엉");
		System.out.println("에이작스인서트왔엉");
		System.out.println("에이작스인서트왔엉");
		System.out.println("에이작스인서트왔엉");
		System.out.println("에이작스인서트왔엉");
		System.out.println("에이작스인서트왔엉");
		
		int result = 0;
		
		return result+"";
		
	}
	
}
