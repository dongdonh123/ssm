package ssm.common.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public abstract class BabySession {

	/**
	* 유저아이디 정보를 관리할 세션이름을 정의.
	* 
	*/
	private static final String USERID  = "USERID";
	private static final String USERNO  = "USERNO";
	private static final String USERAUTHORIRY = "USERAUTHORIRY";
	/***
	* kill Session, 세션에 담긴 정보를 모두 지운다.
	* 
	* @param     req       servlet request.
	* @return    servlet request가 null이면 false를 리턴하고, 
	*            아니면 세션에 담긴 정보를 모두 지우고 true를 리턴.
	* @exception Exception.
	*/
	public static boolean killSession(final HttpServletRequest req) 
		throws Exception
	{
		if (req == null) return false;
		
		try
		{
			HttpSession Session = req.getSession(true);
			Session.invalidate();
		}
		catch(Exception e)
		{
			throw e;
		}
		
		return true;
	}
	
	/***
	* 유저아이디 정보를 세션에 담는다.
	* 
	* @param     ssmReq       servlet request.
	* @param     userID     유저아이디.
	* @return    servlet request가 null이거나, 유저아이디의 값이 없으면 
	*            false를 리턴하고, 아니면 유저아이디 정보를 세션에 담고 true를 리턴.
	* @exception Exception.
	*/
	public static boolean setSession(final HttpServletRequest req,
							         final String userID,final String userNO, final String userAuthority) 
		throws Exception
	{
		System.out.println("BabySesstion setSessiont START>>> ");
		if (req == null) return false;
		if (userID  == null || userID.trim().length() == 0) return false;
		if (userNO  == null || userNO.trim().length() == 0) return false;
		if (userAuthority == null || userAuthority.trim().length() == 0) return false;
		HttpSession session = req.getSession(true);
		
		try
		{	
			
			session.setAttribute(USERID, userID);
			session.setAttribute(USERNO, userNO);
			session.setAttribute(USERAUTHORIRY, userAuthority);
			session.setMaxInactiveInterval(60*60*10);
		}
		catch(Exception e)
		{
			throw e;
		}
		System.out.println("BabySesstion setSessiont END>>> ");
		return true;
	}
	
	/***
	* 유저아이디 정보를 세션에서 가져온다.
	* 
	* @param     hReq       servlet request.
	* @return    servlet request가 null이면 빈 문자열("")을 리턴하고, 
	*            아니면 세션이 가지고 있는 유저아이디를 리턴.
	* @exception Exception.
	*/
	public static String getSessionID(final HttpServletRequest req) 
		throws Exception
	{
		if (req == null) return "";
		String strSessionID;
		
		HttpSession session = req.getSession(false);
		
		try
		{	
			strSessionID = (String)session.getAttribute(USERID);			
		}
		catch(Exception e)
		{
			throw e;
		}
		
		return strSessionID;
	}
	public static String getSessionNO(final HttpServletRequest req) 
			throws Exception
		{
			if (req == null) return "";
			String strSessionNO;
			
			HttpSession session = req.getSession(false);
			
			try
			{	
				strSessionNO = (String)session.getAttribute(USERNO);			
			}
			catch(Exception e)
			{
				throw e;
			}
			
			return strSessionNO;
		}
	public static String getSessionAU(final HttpServletRequest req) 
			throws Exception
		{
			if (req == null) return "";
			String strSessionAU;
			
			HttpSession session = req.getSession(false);
			
			try
			{	
				strSessionAU = (String)session.getAttribute(USERAUTHORIRY);			
			}
			catch(Exception e)
			{
				throw e;
			}
			
			return strSessionAU;
		}
}
