package ssm.cm.controller;

import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import ssm.cm.chaebun.FamilyLetterChaebun;
import ssm.cm.chaebun.NoticeBoardChaebun;
import ssm.cm.chaebun.QnABoardChaebun;
import ssm.cm.chaebun.SchedulNoticeChaebun;
import ssm.cm.service.NoticeBoardService;
import ssm.cm.service.SchedulNoticeService;
import ssm.cm.vo.FamilyLetterVO;
import ssm.cm.vo.NoticeBoardVO;
import ssm.cm.vo.QnABoardVO;
import ssm.cm.vo.SchedulNoticeVO;
import ssm.mi.vo.SmemberVO;
import ssm.mi.vo.TmemberVO;

@Controller
@RequestMapping(value="/schedulnotice")
public class SchedulNoticeController {

	@Autowired
	private SchedulNoticeService schedulnoticeservice;
	
	@RequestMapping(value="sncalendar")
	public String sncalendar(){
		System.out.println("");

		return "sn/sncalendar";
	}
	
//	@ResponseBody
//	@RequestMapping(value="snwirteajax")
//	public String snwirteajax(@ModelAttribute SchedulNoticeVO svo, HttpServletRequest req){
//		System.out.println("ss >>> "+req.getContentType());
//		
////		System.out.println(">>>:" + new String());
//		try {
////			req.setCharacterEncoding("EUC-KR");
//			System.out.println(">>> getCharacterEncoding : " + req.getCharacterEncoding());
//			System.out.println(">>> snTitle : " + req.getParameter("snTitle"));
//			
//			
//		}catch(Exception e){
//			System.out.println("error > "+e.getMessage());
//			e.printStackTrace();
//		}
//		
//		
//		String sResult ="";
//		
//		SchedulNoticeVO svo_ =schedulnoticeservice.snChaebun(); 
//		String no =svo_.getSnNo();
//		svo.setSnNo(SchedulNoticeChaebun.snchaebun(no));
//		svo.setTtNo("T8180001");
//		
//		String snTitle = req.getParameter("snTitle");
////		new String(ko.getBytes("UTF-8"),"8859_1")
//		String snStartdate = req.getParameter("snStartdate");
//		String snEnddate = req.getParameter("snEnddate");
//		
//		svo.setSnTitle(snTitle);
//		svo.setSnStartdate(snStartdate);
//		svo.setSnEnddate(snEnddate);
//		
//		
//		int result = schedulnoticeservice.snInsert(svo);
//		boolean bResult = result > 0;
//		
//		if(bResult) sResult="OK";
//			
//		return sResult;
//
//	
//	}
	
	@ResponseBody
	@RequestMapping(value="snlistajax")
	public JSONArray snlistajax(@ModelAttribute SchedulNoticeVO svo){
		
		
		List<SchedulNoticeVO> snlist = schedulnoticeservice.snlistajax();
		
		JSONArray jArr = new JSONArray();

		for(int i = 0; i < snlist.size(); i++){
			JSONObject jObj =  new JSONObject();
			
			jObj.put("title", snlist.get(i).getSnTitle());
			jObj.put("start", snlist.get(i).getSnStartdate());
			
			//풀캘린더 사용법 준수에 의해  엔드데이트에 1을 더해서 출력
			String end =snlist.get(i).getSnEnddate();
			String yy = end.substring(0, 4);
			String mm = end.substring(5, 7);
			int dd = Integer.parseInt(end.substring(8), 10)+1;
			String dd_ = Integer.toString(dd);
			if(dd<10){
				dd_ ="0"+dd_;
			}
			end = yy+"-"+mm+"-"+dd_;
			System.out.println("완성된 end>>> : " +end);
			
			jObj.put("end",end);
			jObj.put("no", snlist.get(i).getSnNo());
			
			jArr.add(jObj);
		}
		
		
		for(int i = 0; i < jArr.size(); i++){
			
			System.out.println("(log)JARR : "+jArr.get(i));
		}

		
        return jArr;
	}
	
	@RequestMapping(value="snInsert")
	public String snInsert(@ModelAttribute SchedulNoticeVO svo){
		System.out.println("인서트 왔당 ㅎㅎ");
		
		
		String sResult ="";
		
		SchedulNoticeVO svo_ =schedulnoticeservice.snChaebun(); 
		String no =svo_.getSnNo();
		svo.setSnNo(SchedulNoticeChaebun.snchaebun(no));
		
		System.out.println("svo.getSnNo()>>>:" + svo.getSnNo());		
		System.out.println("svo.getSnTitle();>>>:" + svo.getSnTitle());		
		System.out.println("svo.getSnEnddate()>>>:" + svo.getSnEnddate());		
		System.out.println("svo.getSnStartdate()>>>:" + svo.getSnStartdate());		
		
		int result = schedulnoticeservice.snInsert(svo);
		
		boolean bResult = result > 0;
		
		System.out.println("리절트는 트루인가>>>?" +result );
		if(bResult) sResult="/schedulnotice/sncalendar.ssm";
			
		return "redirect:"+sResult ;

	
	}
	
//	@RequestMapping(value="snInsert")
//	public String snInsert(@ModelAttribute SchedulNoticeVO svo, HttpServletRequest req){
//		System.out.println("인서트 왔당 ㅎㅎ");
//		String url="";
//		String uploadPath=req.getSession().getServletContext().getRealPath("/upload");
//		String daFileName="";
//		int result=0;
//		boolean bval= false;
//		int size=10*1024*1024;
//		try{
//			MultipartRequest multi = new MultipartRequest(req,uploadPath,size,"EUC-KR",new DefaultFileRenamePolicy());
//			
//			Enumeration files=multi.getFileNames();
//			String file=(String)files.nextElement();
//			String fileName=multi.getFilesystemName(file);
//			daFileName="../"+"upload"+"/"+fileName;
//			
//			String snTitle=multi.getParameter("snTitle");
//			String snStartdate=multi.getParameter("snStartdate");
//			String snEnddate=multi.getParameter("snEnddate");
//			
//			System.out.println("받아온 제목>>>:"+ snTitle);
//			System.out.println("받아온 snStartdate>>>:"+ snStartdate);
//			System.out.println("받아온snEnddate>>>:"+ snEnddate);
//			System.out.println("받아온snfile>>>:"+ daFileName);
//			svo.setSnTitle(snTitle);
//			svo.setSnStartdate(snStartdate);
//			svo.setSnEnddate(snEnddate);
//			svo.setSnFile(daFileName);
//			
//			SchedulNoticeVO svo_ =schedulnoticeservice.snChaebun(); 
//			String no =svo_.getSnNo();
//			svo.setSnNo(SchedulNoticeChaebun.snchaebun(no));
//			System.out.println(svo.getSnNo());
//			result=schedulnoticeservice.snInsert(svo);
//			System.out.println("result>>>:"+ result);	
//		}catch(Exception e){
//			System.out.println("에러가>>>:"+ e);
//		}
//		boolean bResult = result > 0;
//		if(bResult) url="/schedulnotice/sncalendar.ssm";
//		return "redirect:"+url;
//	}
	
	@RequestMapping(value="snUpdate")
	public String snUpdate(@ModelAttribute SchedulNoticeVO svo){
		System.out.println("인서트 왔당 ㅎㅎ");
		String url = "";
		
		System.out.println("svo.getSnNo()>>>:" + svo.getSnNo());		
		System.out.println("svo.getSnTitle();>>>:" + svo.getSnTitle());		
		System.out.println("svo.getSnEnddate()>>>:" + svo.getSnEnddate());		
		System.out.println("svo.getSnStartdate()>>>:" + svo.getSnStartdate());		
		
		int result = schedulnoticeservice.snUpdate(svo);
		
		boolean bResult = result > 0;
		
		System.out.println("리절트는 트루인가>>>?" +result );
		if(bResult) url="/schedulnotice/sncalendar.ssm";
			
		return "redirect:/schedulnotice/sncalendar.ssm" ;

	
	}
	
	@RequestMapping(value="snDelete")
	public String snDelete(@ModelAttribute SchedulNoticeVO svo){
		System.out.println("인서트 왔당 ㅎㅎ");
		String url = "";
		
		System.out.println("svo.getSnNo()>>>:" + svo.getSnNo());		
		
		int result = schedulnoticeservice.snDelete(svo);
		
		boolean bResult = result > 0;
		
		System.out.println("리절트는 트루인가>>>?" +result );
		if(bResult) url="/schedulnotice/sncalendar.ssm";
			
		return "redirect:/schedulnotice/sncalendar.ssm" ;

	
	}
	
}
