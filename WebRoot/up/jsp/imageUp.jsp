    <%@ page language="java" contentType="text/html; charset=utf-8"
             pageEncoding="utf-8"%>
         <%@ page import="com.mftour.spring.util.Uploader" %>

            <% 
            
          
    request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
    Uploader up = new Uploader(request);
    up.setSavePath("upload");
    String[] fileType = {".gif" , ".png" , ".jpg" , ".jpeg" , ".bmp"};
    up.setAllowFiles(fileType);
    up.setMaxSize(10000); //单位KB
    up.upload();
     System.out.println("ddddddddddddddddddddddddd");
     System.out.println("eeeeeeeeeeee"+up.getUrl());
     
     
    String callback = request.getParameter("callback");

    String result = "{\"name\":\""+ up.getFileName() +"\", \"originalName\": \""+ up.getOriginalName() +"\", \"size\": "+ up.getSize() +", \"state\": \""+ up.getState() +"\", \"type\": \""+ up.getType() +"\", \"url\": \""+ up.getUrl() +"\"}";

    result = result.replaceAll( "\\\\", "\\\\" );
    
    System.out.println("cccccccccc"+result);
    System.out.println("cccccccccc"+callback);

    if( callback == null ){
        response.getWriter().print( result );
    }else{
        response.getWriter().print("<script>"+ callback +"(" + result + ")</script>");
    }
    %>