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
import ssm.cm.chaebun.SchedulNoticeChaebun;
import ssm.cm.service.NoticeBoardService;
import ssm.cm.service.SchedulNoticeService;
import ssm.cm.vo.NoticeBoardVO;
import ssm.cm.vo.SchedulNoticeVO;

@Controller
@RequestMapping(value="/schedulnotice")
public class SchedulNoticeController {

	@Autowired
	private SchedulNoticeService schedulnoticeservice;
	
	/*��ü ��ȸ*/
	@RequestMapping(value="snlist")
	public String sblist(@ModelAttribute SchedulNoticeVO svo, Model model){
		System.out.println("��Ʈ�ѷ� �Դ�");
		
		//�˻��� ���� ������ Ȯ��
		System.out.println("svo.getSearch()>>>: "+ svo.getSearch());
		System.out.println("svo.getKeyword()>>>: "+ svo.getKeyword());
		
		//��ü ���ڵ��
		
		List snlist=schedulnoticeservice.snlist(svo); 
		
		
		model.addAttribute("snlist",snlist);
		model.addAttribute("data",svo);
		return "sn/snlist";
	}
	
	/*�۾��� �� ���*/
	@RequestMapping(value="snwirteform")
	public String snwirteform(){
		System.out.println(" snwirteform ��Ʈ�ѷ� �Դ�");
		return "sn/snwirteform";
	}
	
	/*�۾��� ����*/
	@RequestMapping(value="snwirte")
	public String nbinsert(@ModelAttribute SchedulNoticeVO svo, HttpServletRequest req){
		System.out.println("��Ʈ�ѷ� snwirte�Դ�");
		String url="";
		String uploadPath=req.getSession().getServletContext().getRealPath("/upload");
		String daFileName="";
		int result=0;
		boolean bval= false;
		int size=10*1024*1024;
		try{
			MultipartRequest multi = new MultipartRequest(req,uploadPath,size,"EUC-KR",new DefaultFileRenamePolicy());
			
			Enumeration files=multi.getFileNames();
			String file=(String)files.nextElement();//�Է��� ���ϸ�޾ƿ��°�
			String fileName=multi.getFilesystemName(file);//��Ƽ��Ʈ���������� �ٲٴ°�
			daFileName="../"+"upload"+"/"+fileName;//����߰��� ��ġ�°�
			
			String ttNo=multi.getParameter("ttNo");
			String snTitle=multi.getParameter("snTitle");
			String snContents=multi.getParameter("snContents");
			
			svo.setTtNo(ttNo);
			svo.setSnTitle(snTitle);
			svo.setSnContents(snContents);
			
			SchedulNoticeVO svo_ =schedulnoticeservice.snChaebun(svo); 
			System.out.println(svo_.getSnNo());
			String no =svo_.getSnNo();
			svo.setSnNo(SchedulNoticeChaebun.snchaebun(no));
			System.out.println(svo.getSnNo());
			result=schedulnoticeservice.snInsert(svo);
		}catch(Exception e){
			System.out.println("������ >>>: " + e);
		}
		boolean bResult = result > 0;
			
		if(bResult) url="/schedulnotice/snlist.ssm";
		System.out.println("url >>>: " + url);		
		return "redirect:"+url;
	}
	
	@RequestMapping(value="/snDetail")
	public String nbDetail(@ModelAttribute SchedulNoticeVO svo, Model model){
		System.out.println("��Ʈ�ѷ� snDetail�Դ�");
		System.out.println("no �����Դ� >>>: "+svo.getSnNo());
		
		SchedulNoticeVO sndetail = null;
		sndetail = schedulnoticeservice.snDetail(svo);
		
		sndetail.setSnContents(sndetail.getSnContents().toString().replaceAll("\n","<br>"));
		
		model.addAttribute("sndetail",sndetail);
		return "sn/snDetail";
	}
	
	@ResponseBody
	@RequestMapping(value="/pwdConfirm")
	public String pwdConfirm(@ModelAttribute SchedulNoticeVO svo){
		System.out.println("��Ʈ�ѷ� pwd�Դ�");
		
		//�Ʒ� �������� �Է� ������ ���� ���°� ����(1or0)
		int result = 0;
		result= schedulnoticeservice.pwdConfirm(svo);
		
		System.out.println("result ���̾�>>>" + result);
		return result+"";
		
	}
	
	@RequestMapping(value="/snupdateForm")
	public String updateForm(@ModelAttribute SchedulNoticeVO svo, Model model){
		System.out.println("��Ʈ�ѷ� snupdateForm�Դ�");
		System.out.println("no �����Դ� >>>: "+svo.getSnNo());
		
		SchedulNoticeVO updateData =null;
		updateData= schedulnoticeservice.snDetail(svo);
		
		model.addAttribute("updateData",updateData);
		return "sn/snupdateform";
		
	}
	
	/*�۾��� ����*/
	@RequestMapping(value="snupdate")
	public String nbupdate(@ModelAttribute SchedulNoticeVO svo, HttpServletRequest req){
		System.out.println("��Ʈ�ѷ� snupdate�Դ�");
		
		String url="";
		String uploadPath=req.getSession().getServletContext().getRealPath("/upload");
		String daFileName="";
		int result=0;
		boolean bval= false;
		int size=10*1024*1024;
		try{
			MultipartRequest multi = new MultipartRequest(req,uploadPath,size,"EUC-KR",new DefaultFileRenamePolicy());
			
			Enumeration files=multi.getFileNames();
			String file=(String)files.nextElement();//�Է��� ���ϸ�޾ƿ��°�
			String fileName=multi.getFilesystemName(file);//��Ƽ��Ʈ���������� �ٲٴ°�
			daFileName="../"+"upload"+"/"+fileName;//����߰��� ��ġ�°�
			
			String snTitle=multi.getParameter("snTitle");
			String snContents=multi.getParameter("snContents");
			String snNo=multi.getParameter("snNo");
			
			svo.setSnTitle(snTitle);
			svo.setSnContents(snContents);
			svo.setSnNo(snNo);
			
			result=schedulnoticeservice.snUpdate(svo);
		}catch(Exception e){
			System.out.println("������ >>>: " + e);
		}
		boolean bResult = result > 0;
			
		if(bResult) url="/schedulnotice/snlist.ssm";
		return "redirect:"+url;
	}
	
	@RequestMapping(value="/snDelete")
	public String nbDelete(@ModelAttribute SchedulNoticeVO svo){
		System.out.println("��Ʈ�ѷ� snDelete�Դ�");
		String url="";
		int result = 0;
		
		result= schedulnoticeservice.snDelete(svo);
		
		boolean bResult = result > 0;
		
		if(bResult) url="/schedulnotice/snlist.ssm";
		return "redirect:"+url;
		
		
	}
}
