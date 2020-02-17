package ssm.cm.nb.chaebun;

public class Nbchaebun {

	private static final String LESSON_STR = "K";
	
	public static String nbchaebun(String lno){
		System.out.println("채번클래스왔음");
		System.out.println("내가 가져온 lno >> : " + lno);
		
		for(int i=lno.length();i<4;i++){//1 ,2,3 3번 
			lno = "0" + lno;
		}
		
		lno = LESSON_STR + lno;
		
		System.out.println("완성된 lno >>> : " + lno);
		
		return lno;
	}
	
}// end of ChaebunLesson class
