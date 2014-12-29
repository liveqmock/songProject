<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%@ include file="/includes/taglibs.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<title>提现 - 我的账户 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  

</head>

<body>
<div class="black_bac"></div>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->

<div class="user_con">
    <div class="user_left">
      <!-- user_left start -->
           <%@ include file="/includes/user_info_left.jsp" %>
         <!-- user_left end -->
    </div>
    <div class="user_right">
        <div class="zichan_con">
            <div class="pro_con_title" style="margin-top: 5px;">
                <strong>绑定银行卡</strong>
            </div>

            <div class="add_postcar" style='${yeepay.cardStatus==null?"display:none":""}' height: 130px;">
                <p>银行卡信息</p>
                <ul class="postcar_msg">
                    <li><span>开户行名称：</span>
                        <div>${yeepay.bank}</div></li>
                    <li><span>银行卡账号：</span>
                        <div>${yeepay.cardNo}</div></li>
                    <li><span>银行卡状态：</span>
                        <div>${yeepay.cardStatus == "VERIFIED"?"已认证":"认证中"}</div></li>
                </ul>
            </div>
            <form id="form-card" role="form" style='${yeepay.cardStatus==null?"":"display:none"}' action="<%=path%>/gate/dobinding"
                  method="post" target="_blank">
                    <input
                        type="hidden" class="form-control" id="platformUserNo"
                        name="platformUserNo" value="${name}" />
                <input type="hidden"
                                                                   class="form-control" id="notifyUrl" name="notifyUrl"
                                                                   value="${f.notifyUrl}/gate/bindingNotify" />
                <input type="hidden" class="form-control" id="callbackUrl" name="callbackUrl" value="${f.callbackUrl}/gate/bindingSucceed" />

                <button onclick='document.getElementById("form-card").submit();'
                        class="btn btn-default mar_btn">绑定银行卡</button>
            </form>
        </div>

    </div>
      <div class="user_right" style="${yeepay.cardStatus == "VERIFIED" ?"":"display:none"}">
        <div class="zichan_con">        
          <div class="pro_con_title" style="margin-top:5px;"><strong>提现</strong></div>
             <div class="form-group" style="margin-top:50px; dislplay:none">
              <label for="plat">可提现金金额</label>

              <div class="form-control ame" style="width:300px; text-align:left;"><strong class="wd_org">${account.availableMoney}</strong>元</div>
             </div>
        <form id="form" role="form" action="<%=path%>/gate/dodrawMoney" method="post" target="_blank">
            <input
              type="hidden" class="form-control" id="feeMode"
              name="feeMode"  value="${feeMode}"  />
            <input
                    type="hidden" class="form-control" id="platformUserNo"
                    name="platformUserNo" value="${name}" />
             <div class="form-group" >
            <label for="amount">提现金额</label><input
              type="text" class="form-control tixian_money" id="amount"
              name="amount"  value="提现金额不能为0"  style="color:#ccc"/>
          </div>
           <input type="hidden"
              class="form-control" id="notifyUrl" name="notifyUrl" value="${f.notifyUrl}/gate/drawMoneyNotify" />

            <input
              type="hidden" class="form-control" id="callbackUrl"
              name="callbackUrl" value="${f.callbackUrl}/gate/drawMoneySucceed" />


          <div class="mar_que_top"><a onclick="onSubmit('${f.onSubmit}')" class="btn mar_btn" id="mysubmit_btn" style="color:#fff;" >确认</a></div>
        </form>

          <div class="tishi ai" style="margin-top:50px;">
            <p><strong>温馨提示</strong></p>
            <ol>
              <li class="tishi_red">您充值的资金在24小时内不允许提现。</li>
              <li class="tishi_red">您充值的资金若未投资就提现，第三方支付公司会收取您提现金额的0.5%作为转账费用。</li>
              <li>您的账户资金将由第三方平台托管。</li>
              <li>为了您的资金安全，请您在充值前完成手机绑定，身份认证及支付密码设置。</li>
              <li>中租宝严禁信用卡充值、套现等行为，一经发现将予以处罚，包括但不限于：限制收款、冻结账户、永久停止服务， 并会影响银行征信记录。</li>
              <li>充值过程遇到问题，请联系客服，010-84243099/3199</li>
            </ol>          
          </div> 
          <div id="dialog01"  style="display:none; height:210px;">
	         <div class="dialog_title">
               <strong>温馨提示</strong>
	           <div class="right_cha"></div>
	         </div>
	         <div class="touzi_text">
	           <p style="background:url('../img/images-2014-11/renzheng01.png') 26px 7px no-repeat">如果您成功提现：<a href="<%=path%>/gate/service">查看我的资产</a></p>          
	         </div>
	         <div class="touzi_text">
	           <p style="background:url('../img/images-2014-11/renzheng02.png') 26px 7px no-repeat">如果您提现失败：<a href="<%=path%>/gate/drawMoney">重新提现</a> | <a  href="<%=path%>/contact.jsp">联系客服</a></p>          
	         </div>	       
            </div>                      
          </div> 
        </div>
      </div>
<!-- absolute_right start -->
	<%@ include file="/includes/absolute.jsp" %>
<!-- absolute_right end -->      
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
<div class="black_bac"></div>
</body>
<script type="text/javascript">

function onSubmit(host) {
	if(!checkval()){return false}
	  var form = document.getElementById("form");
	  document.getElementById("mysubmit_btn").disabled=true;

	    	var tixian_val=parseInt($(".tixian_money").val());
		    var old_amount=parseInt($(".wd_org").text());

	    	if(tixian_val=="提现金额不能为0" || tixian_val==""){
	    		alert("您输入的金额为空,请重新输入");	    	    		
	    	}    	
	    	 if(tixian_val>old_amount){
	    		alert("您提现的金额不能超出可提现金额");
	    		return false;	    		
	    	}else{
	    		  $("#dialog01").css("display","block");
	    		  $(".black_bac").css("display","block");
	    		  document.getElementById("mysubmit_btn").innerHTML="正在提交...";
	    		  form.submit();
	    	}		
}

function checkval(){
	if($(".tixian_money").val()==0||$(".tixian_money").val()=="提现金额不能为0"||$(".tixian_money").val()==""){
		alert("提现金额不能为空!!");
		return false;
		}
	return true;
}
    var navIndex=3; 
    var indexs=1;
    $(document).ready(function(){
    	
    	$(".u_left_sec:eq(1) li:eq(2)").children("a").css("color","#fc652e");
    	$(".nav_big a").eq(2).addClass("bd_btom").siblings().removeClass("bd_btom");   
    	$(".nav_big a").eq(2).children("p").addClass("headwd_color");
    	$(".tixian_money").focus(function(){ 
    		var tixian_val=$(".tixian_money").val();
    		if(tixian_val=="提现金额不能为0");
    		  $(".tixian_money").val("");

    		
    	});
    	
    	$(".right_cha").click(function(){		  
    		 window.location.reload(true);  		  
    	});
    	

	    
	    
	    
	    
});

</script>
</html>