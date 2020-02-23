package ssm.cm.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ssm.cm.chaebun.QnAAnswerChaebun;
import ssm.cm.service.QnAAnswerService;
import ssm.cm.vo.QnAAnswerVO;




@Controller
@RequestMapping(value="/qnaanswer")
public class QnAAnswerController {
	
	@Autowired
	private QnAAnswerService qnaanswerservice;
	
	@ResponseBody
	@RequestMapping(value="/all/{qbNo}.ssm")
	public ResponseEntity<List<QnAAnswerVO>> list(@PathVariable("qbNo") String qbNo){
		System.out.println("qa��Ʈ�ѷ� ����Ʈ����");
		
		ResponseEntity<List<QnAAnswerVO>> entity=null;
		try{
			entity= new ResponseEntity<>(qnaanswerservice.qaList(qbNo), HttpStatus.OK);
			System.out.println("1");
			System.out.println("qbNo>>>:"+ qbNo);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			System.out.println("2");
		}
		System.out.println("3");
		return entity;
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="/qaInsert")
	public ResponseEntity<String> qaInsert(@RequestBody QnAAnswerVO qvo){
		System.out.println("qa��Ʈ�ѷ� �μ�Ʈ���Դ�");
		
		ResponseEntity<String> entity =null;
		int result = 0;
		String chaebunNum= "";
		
		QnAAnswerVO _qvo = qnaanswerservice.qaChaebun(); // <- ���⼭�� ä�� ���� ������Ѽ� vo�� ���ε��Ѵ�(�ִ밪 ���ڸ�)
		chaebunNum = _qvo.getQaNo();
		System.out.println("chaebunNum >>> : " + chaebunNum);//10 �ƽ��� ����
		
		qvo.setQaNo(QnAAnswerChaebun.qachaebun(chaebunNum));// �ƽ��� ������ ä�� Ŭ�󽺰��� K000�� �ǰ� ���� K0009
		try{
			result = qnaanswerservice.qaInsert(qvo);
			if(result==1){
				entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			}
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	/*=============================================================================
	 * ��� ���� �����ϱ�
	 * @return
	 * ����:REST ��Ŀ��� UPDATE�۾��� PUT, PATCH ����� �̿��ؼ� ó��.
	 * 		��ü �����͸� �����ϴ� ��쿡�� PUT�� �̿��ϰ�,
	 * 		�Ϻ��� �����͸� �����ϴ� ��쿡�� PATCH�� �̿�
	 * =============================================================================*/
	@RequestMapping(value="/{qaNo}.ssm",method={RequestMethod.PUT,RequestMethod.PATCH})
	public ResponseEntity<String> qaUpdate(@PathVariable("qaNo") String qaNo, @RequestBody QnAAnswerVO qvo){
		System.out.println("qa��Ʈ�ѷ� ������Ʈ");
		
		ResponseEntity<String> entity =null;
		int result =0;
		System.out.println("qaNo>>>:" + qaNo);
		System.out.println("rvo.getQaContents()>>>:" + qvo.getQaContents());
		try{
			qvo.setQaNo(qaNo);
			result = qnaanswerservice.qaUpdate(qvo);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		
		return entity;
	}
	
	/*=============================================================================
	 * ��� ���� �����ϱ�
	 * 
	 * =============================================================================*/
	@RequestMapping(value="/delete/{qaNo}.ssm",method={RequestMethod.DELETE,RequestMethod.PATCH})
	public ResponseEntity<String> qaDelete(@PathVariable("qaNo") String qaNo){
		System.out.println("��Ʈ�ѷ� �Լ� ���� ����");
		ResponseEntity<String> entity =null;
		int result = 0;
		try{
			
			result = qnaanswerservice.qaDelete(qaNo);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		
		return entity;
	}	
	
	
}
