package ssm.common.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;



public class CodeTable {
	
	//코드번호를 코드네임으로 
	public static String ttAuthorityName(String ttAuthority) {
		System.out.println("ttGender >> : " + ttAuthority);
		String ttAuthorityName="";
		
		if (ttAuthority=="Y"){
			ttAuthorityName = "가입후 권한대기";
		}else if(ttAuthority=="Y"){
			ttAuthorityName = "";
		};	
		
		System.out.println("genderNum>>>>: " +ttAuthorityName);
		return ttAuthorityName;
	}
	
	
	//vrDate
	public static String vrDate(String vrDate) {
		
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd u");
//		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy년 MM월 dd일 EEEE");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd",Locale.KOREAN);
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy년 MM월 dd일 EEEE",Locale.KOREAN);
		
		System.out.println("codeT vrDate<<<<: " + vrDate);
		
		if(vrDate.contains("년")){
			try {
				Date date = sdf2.parse(vrDate);
				vrDate = sdf.format(date);
				System.out.println("codeT vrDate1>>>>: " + vrDate);
			}catch(Exception e){
				e.printStackTrace();
			}		
		}else{
			try {
				Date date = sdf.parse(vrDate);
				System.out.println("date"+date);
				vrDate = sdf2.format(date);
				System.out.println("codeT vrDate2>>>: " + vrDate);
			}catch(Exception e){
				e.printStackTrace();
			}	
		}
		return vrDate;
	}
	
//	public static String vrDay(String vrDayNum){
//		System.out.println("codeT vrDay START>> : " +vrDayNum);
//		String[] week = new String[]{"월", "화", "수", "목", "금"};
//		String vrDay = week[Integer.parseInt(vrDayNum)+1];
//		vrDay = vrDay+"요일";
//		System.out.println("codeT vrDay >> : " +vrDay);
//		return vrDay;
//	}
	
}
