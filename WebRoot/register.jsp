<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

 <%-- <%@ include file="/includes/taglibs.jsp" %>  --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <title注册易宝账户 - 用户中心 - 中租宝/></title>
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
 <%-- <jsp:include page="/payment/head.jsp"></jsp:include>   --%>
<%-- <script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  --%> 
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script> 
<script type="text/javascript">
	function allcheck(){
		var chkNickName=$("#nickName").val();
		if(chkNickName==""){alert("用户昵称不能为空！");return false}
		var chkRealName=$("#realName").val();
		if(chkRealName==""){{alert("真实姓名不能为空！");return false}
		}
		var chkIdCardNo=$("#idCardNo").val();
		var regId = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;  
	   if(regId.test(chkIdCardNo) == false)  
	   {  
		   alert("身份证输入不合法！");  
		   return  false;  
	   } 
	   var regMobile=/^0?(13[0-9]|15[012356789]|18[0236789]|14[57])[0-9]{8}$/;
	   var chkMobile=$("#mobile").val();
	   if(regMobile.test(chkMobile)){
		   alert("手机号输入不合法！");  
		   return  false;  
		   }
	
	}
   function onSubmit(host) {
	  if(!allcheck){return false};
	  document.getElementById("host").value = host;
	  var form = document.getElementById("form");
	  form.submit();
	}
</script>
 
<script type="text/javascript">
    var navIndex=3;          

</script>
</head>

<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<div class="clear"></div>
<div class="one"></div>
<div class="clear_height"></div>
<div class="msg_con">
       

   <div class="msg_right">
       <div class="msg_main" id="msg_new">
           <div class="msg_title">
             <h2>注册第三方支付平台——易宝</h2>
           </div>        
   <div class="user_con01">                 
      <div class="container">
        <form id="form" role="form" action="<%=path%>/gate/doRegister" method="post" target="_blank" style="padding:0px;">
          <input type="hidden" id="host" name="host"/>
          <div class="form-group" style="display:none;height:0px;">
            <label for="platformNo">platformNo</label>
             <input type="text"class="form-control" id="platformNo" 
                   name="platformNo" value="10012415118" /> 
           <!--  <input type="text"class="form-control" id="platformNo" 
                   name="platformNo" value="10040011137" /> -->
          </div>
          <div class="form-group" style="display:none;height:0px;" >
            <label for="requestNo">requestNo</label><input type="text"
              class="form-control" id="requestNo" name="requestNo" value="${now}"  />
          </div>
          <div class="form-group" style="display:none;height:0px;" >
            <label for="platformUserNo">platformUserNo</label><input
              type="text" class="form-control" id="platformUserNo"
              name="platformUserNo"  value="${user.name}"    />
          </div>
          <div class="form-group">
            <label for="nickName">　用户名：</label><input type="text"
              class="form-control" id="nickName" name="nickName" value="" />
          </div>
          <div class="form-group">
            <label for="realName">真实姓名：</label><input type="text"
              class="form-control" id="realName" name="realName" value="" />
          </div>
          <div class="form-group"  style="display:none;height:0px;" >
            <label for="idCardType">idCardType</label><input type="text"
              class="form-control" id="idCardType" name="idCardType" value="G2_IDCARD"   />
          </div>
          <div class="form-group">
            <label for="idCardNo">　身份证：</label><input type="text"
              class="form-control" id="idCardNo" name="idCardNo" value="" />
          </div>
          <div class="form-group">
            <label for="mobile">　手机号：</label><input type="text"
              class="form-control" id="mobile" name="mobile" value="" />
          </div>
          <div class="form-group" style="display:none;height:0px;" >
            <label for="email">电子邮箱：</label><input type="text"
              class="form-control" id="email" name="email" value="${user.email}"  />
          </div>
          <div class="form-group" style="display:none;height:0px;" >
            <label for="notifyUrl">notifyUrl</label><input type="text"
              class="form-control" id="notifyUrl" name="notifyUrl" value="${host}${context}/gate/exam"   />
          </div>
          <div class="form-group" style="display:none;height:0px;" >
            <label for="callbackUrl">callbackUrl</label><input
              type="text" class="form-control" id="callbackUrl"
              name="callbackUrl" value="http://192.168.1.207:8080/spring3/gate/exam"   />
          </div>

          <div class="jin_input" style="padding-left:200px;"><a href="javascript:;" title="立即注册" onclick="onSubmit('https://member.yeepay.com/member')">立即注册</a></div>
          <!-- <button onclick="onSubmit('http://qa.yeepay.com/member')" class="btn-default">OA</button>
          <button onclick="onSubmit('https://member.yeepay.com/member')" class="bt">生产</button> -->


        </form>
        <div class="clear"></div> 
        <div class="user_bottom" style="width:auto;">
            <h3>温馨提示:</h3>
            <ol>
              <li>根据国家有关规定，中租宝将所有资金委托第三方支付平台“易宝支付”进行管理。</li>
              <li>为保证交易的规范化，您在进行充值、投资等行为前需要同步注册“易宝支付”账户。</li>
              <li>为确保您交易的安全性，请您如实填写以上信息！</li>
            </ol>
           </div>
     </div>
      
       </div>
   </div>    
</div>
</div>

<div class="clear"></div>
<div class="one"></div>
<div class="clear"></div>


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