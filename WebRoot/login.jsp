<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/includes/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的账户</title>
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />


<script type="text/javascript" >


function query(){
	alert("ccccccccccc");
 
	
    if($('#name').val() != ''){
    	if($('#password').val() != ''){
            $.ajax({
                type: 'POST',
                url: '<c:url value="/welcome/login"/>',
                data: 'name='+$('#name').val()+'&password='+$('#password').val(),
                dataType: 'text',
                success: function(data) {
                	alert("dd"+data+'"success"');
                    if(data == '"success"') {
                    	alert("登陆成功");
                    	$('#form').submit();
                        /* window.open('<c:url value="/welcome/session"/>', '_self'); */
                    } else {
                    	$('#password').val('');
                       alert('用户名或密码错误！');
                    }
                }
            });
        }else{
             alert('请输入密码！ ');
        }
     }else{
     	alert('请输入用户名！');
     }   
}


window.onload=function(){
	var myblur= document.getElementById('name')
	var myblur01= document.getElementById('password')
	      myblur.onfocus=function(){
		  if(myblur.value=="请输入姓名"){
			  myblur.value="";
			  myblur.style.color="#000"	 
			  } 	  
			 }  
		  myblur.onblur=function(){
			  
			 if(myblur.value==""){
			   myblur.value="请输入姓名"
			   myblur.style.color="#ccc"	 
			   }	 		  
 
	}
		  
		  myblur01.onfocus=function(){
			  if(myblur01.value=="请输入密码"){
				  myblur01.value="";
				  myblur01.style.color="#000"	 
				  }  
			  
		  }	 
		  
		  myblur01.onblur=function(){
			  
				 if(myblur01.value==""){
				   myblur01.value="请输入密码"
				   myblur01.style.color="#ccc"	 
				   }	 		  
	 
		}
}  
                
           

</script>

</head>


<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<!-- <div class="clear"></div> -->
<!-- banner start -->
<%-- <%@ include file="/includes/banner.jsp" %> --%>
<!-- banner end  -->
<div class="clear"></div>
<div class="one"></div>
<div class="clear_height"></div>


 <form action="<%=path%>/welcome/session"  id="form" method="post">
<div class="zh">
	<div class="zh_fra">
    	<div class="zh_left"><img src="<%=path%>/images/dl_09.jpg"></div>
    	 
        <div class="zh_right">
        	<div><input name="name"  id="name" type="text" class="zh_wby" value="请输入姓名"/></div>
            <div><input name="password" id="password"  type="password" class="zh_wby" value="请输入密码"/></div>
            <div class="zh_bot"><input name="imgbtn"  id="imgbtn"   type="button" onclick="query()" class="btn_login" >　<a href="<%=path%>/reg.jsp"><img src="images/dl01_05.jpg" /></a>
            </div>
        </div>
         
    </div>
</div>
</form>


<div class="clear_height"></div>

<!-- links start -->
<%@ include file="/includes/links.jsp" %>
<!-- links end -->
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>
