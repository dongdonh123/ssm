package ssm.cm.chaebun;

public class QnAAnswerChaebun {

	private static final String QA_STR = "QA";
	
	public static String qachaebun(String no){
		System.out.println("ä��Ŭ��������");
		System.out.println("���� ������ no >> : " + no);
		
		for(int i=no.length();i<4;i++){//1 ,2,3 3�� 
			no = "0" + no;
		}
		
		no = QA_STR + no;
		
		System.out.println("�ϼ��� no >>> : " + no);
		
		return no;
	}
	
}// end of ChaebunLesson class
