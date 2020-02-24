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
	
	/*��ü ��ȸ*/
	@RequestMapping(value="qblist")
	public String sblist(@ModelAttribute QnABoardVO qvo, Model model){
		System.out.println("��Ʈ�ѷ� �Դ�");
		
		//�˻��� ���� ������ Ȯ��
		System.out.println("qvo.getSearch()>>>: "+ qvo.getSearch());
		System.out.println("qvo.getKeyword()>>>: "+ qvo.getKeyword());
		
		//�۹�ȣ ������
		List count=qnaboardservice.qbcount(qvo);
		System.out.println("count)>>>: "+ count);
		//�� ������
		List qblist=qnaboardservice.qblist(qvo); 
		
		
		model.addAttribute("qblist",qblist);
		model.addAttribute("data",qvo);
		return "qb/qblist";
	}
	
	/*�۾��� �� ���*/
	@RequestMapping(value="qbwirteform")
	public String qbwirteform(){
		System.out.println(" qbwirteform ��Ʈ�ѷ� �Դ�");
		return "qb/qbwirteform";
	}
	
	/*�۾��� ����*/
	@RequestMapping(value="qbwirte")
	public String qbinsert(@ModelAttribute QnABoardVO qvo){
		System.out.println("��Ʈ�ѷ� qbwirte�Դ�");
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
		System.out.println("��Ʈ�ѷ� qbDetail�Դ�");
		System.out.println("no �����Դ� >>>: "+qvo.getQbNo());
		
		QnABoardVO qbdetail = null;
		qbdetail = qnaboardservice.qbDetail(qvo);
		
		qbdetail.setQbContents(qbdetail.getQbContents().toString().replaceAll("\n","<br>"));
		
		model.addAttribute("qbdetail",qbdetail);
		return "qb/qbDetail";
	}
	
	@ResponseBody
	@RequestMapping(value="/pwdConfirm")
	public String pwdConfirm(@ModelAttribute QnABoardVO qvo){
		System.out.println("��Ʈ�ѷ� pwd�Դ�");
		
		//�Ʒ� �������� �Է� ������ ���� ���°� ����(1or0)
		int result = 0;
		result= qnaboardservice.pwdConfirm(qvo);
		
		System.out.println("result ���̾�>>>" + result);
		return result+"";
		
	}
	
	@RequestMapping(value="/qbupdateForm")
	public String updateForm(@ModelAttribute QnABoardVO qvo, Model model){
		System.out.println("��Ʈ�ѷ� qbupdateForm�Դ�");
		System.out.println("no �����Դ� >>>: "+qvo.getQbNo());
		
		QnABoardVO updateData =null;
		updateData= qnaboardservice.qbDetail(qvo);
		
		model.addAttribute("updateData",updateData);
		return "qb/qbupdateform";
		
	}
	
	/*�۾��� ����*/
	@RequestMapping(value="qbupdate")
	public String nbupdate(@ModelAttribute QnABoardVO qvo){
		System.out.println("��Ʈ�ѷ� qbupdate�Դ�");
		
		String url="";
		int result=qnaboardservice.qbUpdate(qvo);
		boolean bResult = result > 0;
			
		if(bResult) url="/qnaboard/qblist.ssm";
		return "redirect:"+url;
	}
	
	@RequestMapping(value="/qbDelete")
	public String nbDelete(@ModelAttribute QnABoardVO qvo){
		System.out.println("��Ʈ�ѷ� qbDelete�Դ�");
		String url="";
		int result = 0;
		
		result= qnaboardservice.qbDelete(qvo);
		
		boolean bResult = result > 0;
		
		if(bResult) url="/qnaboard/qblist.ssm";
		return "redirect:"+url;
		
		
	}
}
