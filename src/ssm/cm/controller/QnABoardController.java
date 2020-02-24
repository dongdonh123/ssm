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

import ssm.cm.chaebun.NoticeBoardChaebun;
import ssm.cm.chaebun.QnABoardChaebun;
import ssm.cm.service.NoticeBoardService;
import ssm.cm.service.QnABoardService;
import ssm.cm.service.SchedulNoticeService;
import ssm.cm.vo.NoticeBoardVO;
import ssm.cm.vo.QnABoardVO;
import ssm.cm.vo.SchedulNoticeVO;

@Controller
@RequestMapping(value="/qnaboard")
public class QnABoardController {

	@Autowired
	private QnABoardService qnaboardservice;
	
	/*전체 조회*/
	@RequestMapping(value="qblist")
	public String sblist(@ModelAttribute QnABoardVO qvo, Model model){
		System.out.println("컨트롤러 왔당");
		
		//검색에 대한 데이터 확인
		System.out.println("qvo.getSearch()>>>: "+ qvo.getSearch());
		System.out.println("qvo.getKeyword()>>>: "+ qvo.getKeyword());
		
		//글번호 데이터
		List count=qnaboardservice.qbcount(qvo);
		System.out.println("count)>>>: "+ count);
		//글 데이터
		List qblist=qnaboardservice.qblist(qvo); 
		
		
		model.addAttribute("qblist",qblist);
		model.addAttribute("data",qvo);
		return "qb/qblist";
	}
	
	/*글쓰기 폼 출력*/
	@RequestMapping(value="qbwirteform")
	public String qbwirteform(){
		System.out.println(" qbwirteform 컨트롤러 왔당");
		return "qb/qbwirteform";
	}
	
	/*글쓰기 구현*/
	@RequestMapping(value="qbwirte")
	public String qbinsert(@ModelAttribute QnABoardVO qvo){
		System.out.println("컨트롤러 qbwirte왔당");
		System.out.println("qvo.getQbSecretyn()>>>:"+qvo.getQbSecretyn());
		String url="";
		int result=0;
			
		QnABoardVO qvo_ =qnaboardservice.qbChaebun(qvo); 
		String no =qvo_.getQbNo();
		qvo.setQbNo(QnABoardChaebun.qbchaebun(no));
		result=qnaboardservice.qbInsert(qvo);
		boolean bResult = result > 0;
			
		if(bResult) url="/qnaboard/qblist.ssm";
		System.out.println("url >>>: " + url);		
		return "redirect:"+url;
	}
	
	@RequestMapping(value="/qbDetail")
	public String nbDetail(@ModelAttribute QnABoardVO qvo, Model model){
		System.out.println("컨트롤러 qbDetail왔당");
		System.out.println("no 가져왔니 >>>: "+qvo.getQbNo());
		
		QnABoardVO qbdetail = null;
		qbdetail = qnaboardservice.qbDetail(qvo);
		
		qbdetail.setQbContents(qbdetail.getQbContents().toString().replaceAll("\n","<br>"));
		
		model.addAttribute("qbdetail",qbdetail);
		return "qb/qbDetail";
	}
	
	@ResponseBody
	@RequestMapping(value="/pwdConfirm")
	public String pwdConfirm(@ModelAttribute QnABoardVO qvo){
		System.out.println("컨트롤러 pwd왔다");
		
		//아래 변수에는 입력 성공에 대한 상태값 저장(1or0)
		int result = 0;
		result= qnaboardservice.pwdConfirm(qvo);
		
		System.out.println("result 몇이야>>>" + result);
		return result+"";
		
	}
	
	@RequestMapping(value="/qbupdateForm")
	public String updateForm(@ModelAttribute QnABoardVO qvo, Model model){
		System.out.println("컨트롤러 qbupdateForm왔다");
		System.out.println("no 가져왔니 >>>: "+qvo.getQbNo());
		
		QnABoardVO updateData =null;
		updateData= qnaboardservice.qbDetail(qvo);
		
		model.addAttribute("updateData",updateData);
		return "qb/qbupdateform";
		
	}
	
	/*글쓰기 구현*/
	@RequestMapping(value="qbupdate")
	public String nbupdate(@ModelAttribute QnABoardVO qvo){
		System.out.println("컨트롤러 qbupdate왔당");
		
		String url="";
		int result=qnaboardservice.qbUpdate(qvo);
		boolean bResult = result > 0;
			
		if(bResult) url="/qnaboard/qblist.ssm";
		return "redirect:"+url;
	}
	
	@RequestMapping(value="/qbDelete")
	public String nbDelete(@ModelAttribute QnABoardVO qvo){
		System.out.println("컨트롤러 qbDelete왔다");
		String url="";
		int result = 0;
		
		result= qnaboardservice.qbDelete(qvo);
		
		boolean bResult = result > 0;
		
		if(bResult) url="/qnaboard/qblist.ssm";
		return "redirect:"+url;
		
		
	}
}
