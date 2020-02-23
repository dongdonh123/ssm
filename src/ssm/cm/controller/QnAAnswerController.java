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
		System.out.println("qa컨트롤러 리스트진입");
		
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
		System.out.println("qa컨트롤러 인서트에왔다");
		
		ResponseEntity<String> entity =null;
		int result = 0;
		String chaebunNum= "";
		
		QnAAnswerVO _qvo = qnaanswerservice.qaChaebun(); // <- 여기서는 채번 쿼리 실행시켜서 vo에 바인딩한다(최대값 숫자만)
		chaebunNum = _qvo.getQaNo();
		System.out.println("chaebunNum >>> : " + chaebunNum);//10 맥스값 나옴
		
		qvo.setQaNo(QnAAnswerChaebun.qachaebun(chaebunNum));// 맥스값 가지고 채번 클라스가서 K000몇 되게 가공 K0009
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
	 * 댓글 수정 구현하기
	 * @return
	 * 참고:REST 방식에서 UPDATE작업은 PUT, PATCH 방식을 이용해서 처리.
	 * 		전체 데이터를 수정하는 경우에는 PUT을 이용하고,
	 * 		일부의 데이터를 수정하는 경우에는 PATCH를 이용
	 * =============================================================================*/
	@RequestMapping(value="/{qaNo}.ssm",method={RequestMethod.PUT,RequestMethod.PATCH})
	public ResponseEntity<String> qaUpdate(@PathVariable("qaNo") String qaNo, @RequestBody QnAAnswerVO qvo){
		System.out.println("qa컨트롤러 업데이트");
		
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
	 * 댓글 삭제 구현하기
	 * 
	 * =============================================================================*/
	@RequestMapping(value="/delete/{qaNo}.ssm",method={RequestMethod.DELETE,RequestMethod.PATCH})
	public ResponseEntity<String> qaDelete(@PathVariable("qaNo") String qaNo){
		System.out.println("컨트롤러 함수 삭제 진입");
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
