<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page import="java.io.*" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  	request.setCharacterEncoding("utf-8"); // 
  	
    String filename = request.getParameter("filename");
    System.out.println(filename);
    
    String         savepath = "upload";
    ServletContext context  = this.getServletContext();
    String sDownloadPath    = context.getRealPath(savepath);
    String sFilePath        = sDownloadPath + "\\" + filename;
    
    byte [] b = new byte[4096];
    File oFile = new File(sFilePath);
    
    FileInputStream fis = new FileInputStream(oFile);
    
    String sMimeType = getServletContext().getMimeType(sFilePath);
    System.out.println("MimeType: " +  sMimeType); 
    
    if( sMimeType == null ) sMimeType = "application/octet-stream";
    response.setContentType(sMimeType);
    
 
    String sEncoding = new String(filename.getBytes("utf-8"), "8859_1");
    response.setHeader("Content-Disposition", 
        "attachment; filename=" + sEncoding);
    out.clear();

    out=pageContext.pushBody(); 

    ServletOutputStream out2 = response.getOutputStream();
    int numRead;
    
    while((numRead = fis.read(b, 0, b.length))!= -1) {
        out2.write(b, 0, numRead);
    }
  
    out2.flush();
    out2.close();
    fis.close();    
%>
