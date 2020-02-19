package ssm.cm.chaebun;

public class QnABoardChaebun {

	private static final String QB_STR = "QB";
	
	public static String nbchaebun(String no){
		System.out.println("채번클래스왔음");
		System.out.println("내가 가져온 no >> : " + no);
		
		for(int i=no.length();i<4;i++){//1 ,2,3 3번 
			no = "0" + no;
		}
		
		no = QB_STR + no;
		
		System.out.println("완성된 no >>> : " + no);
		
		return no;
	}
	
}// end of ChaebunLesson class
