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
		
		//��ü ���ڵ��
		
		List qblist=qnaboardservice.qblist(qvo); 
		
		
		model.addAttribute("qblist",qblist);
		model.addAttribute("data",qvo);
		return "qb/qblist";
	}
	
//	/*�۾��� �� ���*/
//	@RequestMapping(value="nbwirteform")
//	public String nbwirteform(){
//		System.out.println(" nbwirteform ��Ʈ�ѷ� �Դ�");
//		return "nb/nbwirteform";
//	}
//	
//	/*�۾��� ����*/
//	@RequestMapping(value="nbwirte")
//	public String nbinsert(@ModelAttribute NoticeBoardVO nvo, HttpServletRequest req){
//		System.out.println("��Ʈ�ѷ� nbwirte�Դ�");
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
//			String file=(String)files.nextElement();//�Է��� ���ϸ�޾ƿ��°�
//			String fileName=multi.getFilesystemName(file);//��Ƽ��Ʈ���������� �ٲٴ°�
//			daFileName="../"+"upload"+"/"+fileName;//����߰��� ��ġ�°�
//			
//			String ttNo=multi.getParameter("ttNo");
//			String nbTitle=multi.getParameter("nbTitle");
//			String nbContents=multi.getParameter("nbContents");
//			
//			nvo.setTtNo(ttNo);
//			nvo.setNbTitle(nbTitle);
//			nvo.setNbContents(nbContents);
//			nvo.setNbFile(daFileName);
//			
//			NoticeBoardVO nvo_ =noticeboardservice.nbChaebun(nvo); 
//			System.out.println(nvo_.getNbNo());
//			String no =nvo_.getNbNo();
//			nvo.setNbNo(NoticeBoardChaebun.nbchaebun(no));
//			System.out.println(nvo.getNbNo());
//			result=noticeboardservice.nbInsert(nvo);
//		}catch(Exception e){
//			System.out.println("������ >>>: " + e);
//		}
//		boolean bResult = result > 0;
//			
//		if(bResult) url="/noticeboard/nblist.ssm";
//		System.out.println("url >>>: " + url);		
//		return "redirect:"+url;
//	}
//	
//	@RequestMapping(value="/nbDetail")
//	public String nbDetail(@ModelAttribute NoticeBoardVO nvo, Model model){
//		System.out.println("��Ʈ�ѷ� nbDetail�Դ�");
//		System.out.println("no �����Դ� >>>: "+nvo.getNbNo());
//		
//		NoticeBoardVO nbdetail = null;
//		nbdetail = noticeboardservice.nbDetail(nvo);
//		
//		nbdetail.setNbContents(nbdetail.getNbContents().toString().replaceAll("\n","<br>"));
//		
//		model.addAttribute("nbdetail",nbdetail);
//		return "nb/nbDetail";
//	}
//	
//	@ResponseBody
//	@RequestMapping(value="/pwdConfirm")
//	public String pwdConfirm(@ModelAttribute NoticeBoardVO nvo){
//		System.out.println("��Ʈ�ѷ� pwd�Դ�");
//		
//		//�Ʒ� �������� �Է� ������ ���� ���°� ����(1or0)
//		int result = 0;
//		result= noticeboardservice.pwdConfirm(nvo);
//		
//		System.out.println("result ���̾�>>>" + result);
//		return result+"";
//		
//	}
//	
//	@RequestMapping(value="/nbupdateForm")
//	public String updateForm(@ModelAttribute NoticeBoardVO nvo, Model model){
//		System.out.println("��Ʈ�ѷ� nbupdateForm�Դ�");
//		System.out.println("no �����Դ� >>>: "+nvo.getNbNo());
//		
//		NoticeBoardVO updateData =null;
//		updateData= noticeboardservice.nbDetail(nvo);
//		
//		model.addAttribute("updateData",updateData);
//		return "nb/nbupdateform";
//		
//	}
//	
//	/*�۾��� ����*/
//	@RequestMapping(value="nbupdate")
//	public String nbupdate(@ModelAttribute NoticeBoardVO nvo, HttpServletRequest req){
//		System.out.println("��Ʈ�ѷ� nbupdate�Դ�");
//		
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
//			String file=(String)files.nextElement();//�Է��� ���ϸ�޾ƿ��°�
//			String fileName=multi.getFilesystemName(file);//��Ƽ��Ʈ���������� �ٲٴ°�
//			daFileName="../"+"upload"+"/"+fileName;//����߰��� ��ġ�°�
//			
//			String nbTitle=multi.getParameter("nbTitle");
//			String nbContents=multi.getParameter("nbContents");
//			String nbNo=multi.getParameter("nbNo");
//			
//			nvo.setNbTitle(nbTitle);
//			nvo.setNbContents(nbContents);
//			nvo.setNbFile(daFileName);
//			nvo.setNbNo(nbNo);
//			
//			System.out.println("no�����?" + nvo.getNbNo());
//			System.out.println("no�����?" + nvo.getNbTitle());
//			System.out.println("no�����?" + nvo.getNbContents());
//			System.out.println("no�����?" + nvo.getNbFile());
//			result=noticeboardservice.nbUpdate(nvo);
//		}catch(Exception e){
//			System.out.println("������ >>>: " + e);
//		}
//		boolean bResult = result > 0;
//			
//		if(bResult) url="/noticeboard/nblist.ssm";
//		return "redirect:"+url;
//	}
//	
//	@RequestMapping(value="/nbDelete")
//	public String nbDelete(@ModelAttribute NoticeBoardVO nvo){
//		System.out.println("��Ʈ�ѷ� nbDelete�Դ�");
//		String url="";
//		int result = 0;
//		
//		result= noticeboardservice.nbDelete(nvo);
//		
//		boolean bResult = result > 0;
//		
//		if(bResult) url="/noticeboard/nblist.ssm";
//		return "redirect:"+url;
//		
//		
//	}
}
