package ssm.cm.nb.chaebun;

public class Nbchaebun {

	private static final String NB_STR = "NB";
	
	public static String nbchaebun(String no){
		System.out.println("채번클래스왔음");
		System.out.println("내가 가져온 no >> : " + no);
		
		for(int i=no.length();i<4;i++){//1 ,2,3 3번 
			no = "0" + no;
		}
		
		no = NB_STR + no;
		
		System.out.println("완성된 no >>> : " + no);
		
		return no;
	}
	
}// end of ChaebunLesson class
