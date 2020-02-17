package ssm.cm.nb.controller;

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

import ssm.cm.nb.chaebun.Nbchaebun;
import ssm.cm.nb.service.NoticeBoardService;
import ssm.cm.nb.vo.NoticeBoardVO;

@Controller
@RequestMapping(value="/noticeboard")
public class NoticeBoardController {

	@Autowired
	private NoticeBoardService noticeboardservice;
	
	/*��ü ��ȸ*/
	@RequestMapping(value="nblist")
	public String nblist(@ModelAttribute NoticeBoardVO nvo, Model model){
		System.out.println("��Ʈ�ѷ� �Դ�");
		
		List nblist=noticeboardservice.nblist(nvo);
		model.addAttribute("nblist",nblist);
		return "nb/nblist";
	}
	
	/*�۾��� �� ���*/
	@RequestMapping(value="nbwirteform")
	public String nbwirteform(){
		System.out.println(" nbwirteform ��Ʈ�ѷ� �Դ�");
		return "nb/nbwirteform";
	}
	
	/*�۾��� ����*/
	@RequestMapping(value="nbwirte")
	public String nbinsert(@ModelAttribute NoticeBoardVO nvo, HttpServletRequest req){
		System.out.println("��Ʈ�ѷ� nbwirte�Դ�");
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
			
			String ttNo=multi.getParameter("ttno");
			String nbTitle=multi.getParameter("nbtitle");
			String nbContents=multi.getParameter("nbcontents");
			
			nvo.setTtNo(ttNo);
			nvo.setNbTitle(nbTitle);
			nvo.setNbContents(nbContents);
			nvo.setNbFile(daFileName);
			
			NoticeBoardVO nvo_ =noticeboardservice.nbChaebun(nvo); 
			System.out.println(nvo_.getNbNo());
			String no =nvo_.getNbNo();
			nvo.setNbNo(Nbchaebun.nbchaebun(no));
			System.out.println(nvo.getNbNo());
			result=noticeboardservice.nbInsert(nvo);
		}catch(Exception e){
			System.out.println("������ >>>: " + e);
		}
		boolean bResult = result > 0;
			
		if(bResult) url="/noticeboard/nblist.ssm";
		System.out.println("url >>>: " + url);		
		return "redirect:"+url;
	}
	
	@RequestMapping(value="/nbDetail")
	public String nbDetail(@ModelAttribute NoticeBoardVO nvo, Model model){
		System.out.println("��Ʈ�ѷ� nbDetail�Դ�");
		System.out.println("no �����Դ� >>>: "+nvo.getNbNo());
		
		NoticeBoardVO nbdetail = null;
		nbdetail = noticeboardservice.nbDetail(nvo);
		
		nbdetail.setNbContents(nbdetail.getNbContents().toString().replaceAll("\n","<br>"));
		
		model.addAttribute("nbdetail",nbdetail);
		return "nb/nbDetail";
	}
	
	@ResponseBody
	@RequestMapping(value="/pwdConfirm")
	public String pwdConfirm(@ModelAttribute NoticeBoardVO nvo){
		System.out.println("��Ʈ�ѷ� pwd�Դ�");
		
		//�Ʒ� �������� �Է� ������ ���� ���°� ����(1or0)
		int result = 0;
		result= noticeboardservice.pwdConfirm(nvo);
		
		String zz = "zzzz";
		
		System.out.println("result ���̾�>>>" + result);
		return result+"";
		
	}
}
