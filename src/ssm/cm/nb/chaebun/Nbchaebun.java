package ssm.cm.nb.chaebun;

public class Nbchaebun {

	private static final String LESSON_STR = "K";
	
	public static String nbchaebun(String lno){
		System.out.println("ä��Ŭ��������");
		System.out.println("���� ������ lno >> : " + lno);
		
		for(int i=lno.length();i<4;i++){//1 ,2,3 3�� 
			lno = "0" + lno;
		}
		
		lno = LESSON_STR + lno;
		
		System.out.println("�ϼ��� lno >>> : " + lno);
		
		return lno;
	}
	
}// end of ChaebunLesson class
