	<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit">
<meta content="中租宝，是国内首批众筹网络平台之一，公司注册资金五千零一万元人民币， 是国内首批P2B（微信托）领域的财富投资管理公司。公司集聚了一批国内一线信托公司的精英骨干， 立志在这个全民理财时代，创造一个“公正透明，稳定高效”的财富管理平台" name="description">
<meta content="债权,收益,信托,商券,抵押,信贷,基金,定投,担保,中小贷,微信托,投资人,理财顾问,理财经理,年化收益率,他项权证,余额宝,人人贷,人人投,宜信,陆金所,股权投资,旅居,度假,中租宝,中投汇融,众筹,理财,投资,资产管理,融资,P2B,P2P,私人银行" name="keywords">
<title>投资确认 - 中租宝</title>
<%--  <jsp:include page="/payment/head.jsp"></jsp:include>   --%>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
 <%@ include file="/includes/taglibs.jsp" %> 
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  
<script type="text/javascript">
    var navIndex=3;          

</script>

</head>

<body>
<div class="black_bac"></div>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<div class="clear"></div>
<div class="msg_con">
  <div class="queren_con">
   <div class="con_title"><strong>投资信息确认</strong></div>
   <form id="form" role="form" action="<%=path%>/gate/doTransfer" method="post" target="_blank">
   <ul> 
         <input type="hidden" id="host" name="host">
         <li> <div class="form-group" style="display:none;height:0px;" >
             <!-- <label for="platformNo">platformNo</label><input type="text"
              class="form-control" id="platformNo" name="platformNo" value="10040011137" />  -->
               <label for="platformNo">platformNo</label><input type="text"
                class="form-control" id="platformNo" name="platformNo" value="${f.platformNo}" /> 
             <!--  class="form-control" id="platformNo" name="platformNo" value="10012415118" />  -->
          </div></li>
          <li><div class="form-group" style="display:none;height:0px;" >
            <label for="requestNo">requestNo</label><input type="text"
              class="form-control" id="requestNo" name="requestNo" value="${now}" />
          </div></li>
          <li>
          <div class="form-group" style="display:none;height:0px;" >
            <label for="platformUserNo">platformUserNo</label><input
              type="text" class="form-control" id="platformUserNo"
              name="platformUserNo"  value="${registerYeePay1.platformUserNo}"  />
          </div>
          </li>
          <li>
          <div class="form-group" style="display:none;height:0px;" >
            <label for="orderNo">标的号</label><input type="text"
              class="form-control" id="orderNo" name="orderNo" value="${product.enterpriseName}" />
          </div>
          </li>
          <li>
          <div class="form-group" style="display:none">
            <label for="transferAmount">标的金额</label><input type="text"
              class="form-control jin_font" id="transferAmount" name="transferAmount" value="${product.financingMoney*10000}" />
          </div>
          </li>
          <li>
          <div class="form-group" style="display:none;height:0px;" >
            <label for="targetPlatformUserNo">借款人会员编号</label><input type="text"
              class="form-control" id="targetPlatformUserNo" name="targetPlatformUserNo" value="${targetPlatformUserNo}" />
          </div>
          </li>
          <li>
          <div class="form-group" >
            <label for="projectName">项目名称：</label><span id="protext">${product.projectName}</span>
            <div style="display:none"><input type="text" readonly="readonly" class="form-control" id="projectName" name="projectName" value="${product.projectName}" /></div>
          </div>
          </li>
          <li>
          <div class="form-group" >
            <label for="paymentAmount">投资金额：</label><input type="text"
              class="form-control" id="paymentAmount" name="paymentAmount" value="${buyAmount}" />
          </div>
          </li>
          <li>
          <div class="form-group" style="display:none;height:0px;" >
            <label for="expired">投标过期时间</label><input type="text"
              class="form-control" id="expired" name="expired" value="2016-12-01 22:22:31" />
          </div>
          </li>
          
           <li>
          <div class="form-group"  style="display:none;height:0px;" >
            <label for="enterpriseNumber">项目编号</label><input type="text"
              class="form-control" id="enterpriseNumber" name="enterpriseNumber" value="${product.enterpriseNumber}" />
          </div>
          </li>
                             
          <li>
          <div class="form-group" style="display:none;height:0px;" >
            <label for="notifyUrl">notifyUrl</label><input type="text"
              class="form-control" id="notifyUrl" name="notifyUrl" value="${f.notifyUrl}/gate/transferNotify" />
          </div>
          </li>
          <li>
          <div class="form-group" style="display:none;height:0px;" >
            <label for="callbackUrl">callbackUrl</label><input
              type="text" class="form-control" id="callbackUrl"
               name="callbackUrl" value="${f.callbackUrl}/gate/transferSucceed" />
             <!--  name="callbackUrl" value="http://www.ptobchina.com/spring3/gate/transferSucceed" /> -->
          </div>
          </li>
          <li>
          <!--  <button onclick="onSubmit('http://qa.yeepay.com/member')" class="btn btn-default">QA</button>  --> 
         <!--  <button onclick="onSubmit('https://member.yeepay.com/member')" class="btn btn-default">生产</button> -->


          <div class="que_btn"><a src="javascript:;" onclick="onSubmit('${f.onSubmit}')" id="mysubmit_btn">确定</a></div>

          </li>
          </ul>
          
        </form>
        <div id="dialog01"  style="display:none; height:210px;">
	         <div class="dialog_title">
               <strong>温馨提示</strong>
	           <div class="right_cha"></div>
	         </div>
	         <div class="touzi_text">
	           <p style="background:url('../img/images-2014-11/renzheng01.png') 26px 7px no-repeat">如果您成功投资：<a href="<%=path%>/gate/userProject">查看我的项目</a></p>          
	         </div>
	         <div class="touzi_text">
	           <p style="background:url('../img/images-2014-11/renzheng02.png') 26px 7px no-repeat">如果您投资失败：<a href="<%=path%>/product/allProduct">重新投资</a> | <a  href="<%=path%>/contact.jsp">联系客服</a></p>          
	         </div>	       
        </div>
  </div>        
</div>

<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
<script type="text/javascript">
function onSubmit(host) {


	var a=document.getElementById("paymentAmount").value;
	if(a!=parseInt(a)){alert("投资金额必须为整数！");return false;}
	//if(a%100!=0){alert("投资金额必须为100的整数倍！");return false;}
	//if(a<200){alert("投资金额不能低于200元！");return false;
	document.getElementById("paymentAmount").value=parseInt(a);
  document.getElementById("host").value = host;
  document.getElementById("mysubmit_btn").disabled=true;
  document.getElementById("mysubmit_btn").innerHTML="正在提交...";
  var form = document.getElementById("form");
  $("#dialog01").css("display","block");
  $(".black_bac").css("display","block");
  $(".right_cha").click(function(){
  $("#dialog01").css("display","none");
  $(".black_bac").css("display","none");
  });
  form.submit();
  document.getElementById("que_btn_ok").disabled()
  
}
</script>
</html>