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
<meta content="中汇宝，是北京中投汇融投资管理有限公司旗下的众筹网络平台，公司注册资金五千零一万元人民币， 是国内首批P2B（微信托）领域的财富投资管理公司。公司集聚了一批国内一线信托公司的精英骨干， 立志在这个全民理财时代，创造一个“公正透明，稳定高效”的财富管理平台" name="description">
<meta content="中汇宝,理财,投资,收益,中投汇融,融资,P2B,P2P,商券,众筹,zhonghuibao,信托,债权,抵押,信贷,基金,定投,中小贷,微信托,投资人" name="keywords">
<title>用户中心修改 - 我的账户 - 中汇宝</title>
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  
<script type="text/javascript">
var navIndex=3;
$(document).ready(function(){
	$('.select_nav a').click(function(){
		$(this).siblings().slideToggle('slow')
		}
	);	
	
	$(function(){
	var num=0;
	var timer=null;
	timer=setInterval(function(){
		num++
		$('.red_bar').css('width',num);
		/*$('progress').val(num)
		$('span').html(num)*/
		var zi=$('.view strong').text();
		if(zi=='低' && num==40){
			clearInterval(timer)	
		}
		if(zi=='中' && num==80){
			clearInterval(timer)	
		}
		if(zi=='高' && num==120){
			clearInterval(timer)			
		}
	},20)

	$('.sec li').mouseover(function(e){
		$(this).addClass('bac_org').siblings().removeClass('bac_org');
		});
    });
	
	$('.msg_nav').eq(1).mouseover(function(e){
		$('.bac_change_1').css('background-image','url("<%=path%>/img/tubiao10.png")');
		
		}).mouseout(function(e){
		$('.bac_change_1').css('background-image','url("<%=path%>/img/tubiao9.png")');
		
		});
	
	$('.msg_nav').eq(2).mouseover(function(e){
		$('.bac_change_2').css('background-image','url("<%=path%>/img/tubiao11.png")');
		
		}).mouseout(function(e){
		$('.bac_change_2').css('background-image','url("<%=path%>/img/tubiao12.png")');
		
		});	
	
	$('.msg_nav').eq(3).mouseover(function(e){
		$('.bac_change_3').css('background-image','url("<%=path%>/img/tubiao2.png")');
		
		}).mouseout(function(e){
		$('.bac_change_3').css('background-image','url("<%=path%>/img/tubiao3.png")');
		
		});
	
	$(".box_check").hide();	
	$(".user_check p").mouseover(function(){
		$(this).siblings('.box_check').show();
		$('.box_check').mouseover(function(){
			$(this).show();
			});

	}).mouseout(function(){
		$(this).siblings('.box_check').hide();    
		$('.box_check').mouseout(function(){
			$(this).hide();
			});
		
	    });
	
	});
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
   <div class="msg_left">
      
	  <%@ include file="/includes/user_info_left.jsp" %>
	 
   </div>
   <div class="msg_right">
       <div class="msg_main">
           <div class="msg_title">
             <h2>个人信息</h2>
             <a href="<%=path%>/user/cancelUpdate?name=${user1.name}">取消修改</a>
           </div>
           <div class="user_con">
               <div class="photo">
                   <span></span>
               </div>
               <div class="center">
                   <ul class="user_con_name">
                     <li class="mg_right">用户名</li><li>aaa${user1.name}</li>
                     <li class="mg_right">真实姓名</li><li>aaa${user1.realName}</li>
                     <li class="mg_right">身份证号码</li><li>aaa${user1.identityCard}</li>
                     <li class="mg_right">手机号码</li><li>aaa${user1.phone}</li>
                     <li class="mg_right">邮箱地址</li><li>aaa${user1.email}</li>
                     <li class="mg_right">易宝账号</li><li>aaa${user1.email}</li>
                   </ul>   
               </div>
               <div class="user_right">
                   <ul class="user_check">
                     <li><div class="box_check"><span class="box_left"></span><div class="box_center">用户注册时填写的用户名，不可更改</div><span class="box_right"></span></div><p class="xiangqing">详情</p></li>
                     <li><div class="box_check"><span class="box_left"></span><div class="box_center">您未认证个人实名信息， <a href="<%=path%>/anquanshezhi.jsp">实名认证</a></div><span class="box_right"></span></div><p>未认证</p></li>                  
                     <li><div class="box_check"><span class="box_left"></span><div class="box_center">您未绑定身份证，实名认证即可成功绑定身份证， <a href="<%=path%>/anquanshezhi.jsp">请绑定</a></div><span class="box_right"></span></div><p>未认证</p></li>
                     <li><div class="box_check"><span class="box_left"></span><div class="box_center">您未绑定手机号， <a href="<%=path%>/anquanshezhi.jsp">请绑定</a></div><span class="box_right"></span></div><p>未认证</p></li>
                     <li><div class="box_check"><span class="box_left"></span><div class="box_center">您未绑定邮箱号， <a href="<%=path%>/anquanshezhi.jsp">请绑定</a></div><span class="box_right"></span></div><p>未认证</p></li>            
                     <li><div class="box_check"><span class="box_left"></span><div class="box_center">您未注册易宝账号， <a href="<%=path%>/#">请注册</a></div><span class="box_right"></span></div><p>未注册</p></li> 
                   </ul>
               
               </div>             
           </div>
           <div class="user_con_last">
               <form id="form"  action="<%=path%>/user/update" id="form" method="post" style="width:866px; height:595px; overflow:hidden ">
                 <input type="hidden"  name="id" id="id" value="${user1.id}" />
                 <input type="hidden"  name="name" id="name" value="${user1.name}" />
                 <input type="hidden"  name="password" id="password" value="${user1.password}" />
                 <input type="hidden"  name="realName" id="realName" value="${user1.realName}" />
                 <input type="hidden"  name="identityCard" id="identityCard" value="${user1.identityCard}" />
                 <input type="hidden"  name="phone" id="phone" value="${user1.phone}" />
                 <input type="hidden"  name="email" id="email" value="${user1.email}" />
                <div class="center_last">
                   <ul class="user_con_last_name">
                     <li>性别(不可修改)</li>
                     <li>出生日期(不可修改)</li>
                     <li>最高学历</li>
                     <li>毕业院校</li>
                     <li>婚姻状态</li>
                     <li>居住地址</li>
                     <li>公司行业</li>
                     <li>公司规模</li>
                     <li>职位</li>
                     <li>月收入</li> 
                   </ul>
                   <ul class="user_con_last_mag">
                     <li></li>
                     <li></li>
                     <li> 
                       <select class="select01"  name="educationBackground"   value="${user1.educationBackground}" >
                         <option checked="checked">请选择</option>
                         <option>高中或以下</option>
                         <option>大专</option>
                         <option>大学本科</option>
                         <option>研究生及以上</option> 
                       </select></li>
                     <li><input type="text" class="text01"   name="schoolOfGraduation"  value="${user1.schoolOfGraduation}"   /></li>
                     <li><input type="radio" name="maritalStatus" value="未婚"/>未婚<input type="radio" value="已婚" name="maritalStatus"/>已婚<input type="radio" name="maritalStatus" value="其他"  checked="true" />其他</li>
                     <li><input type="text" class="text01"  name="address" value="${user1.address}"   /></li>
                     <li> 
                       <select class="select01" name="companyIndustry" value="${user1.companyIndustry}"  >
                            <option value="">请选择</option>
                            <option value="制造业">制造业</option>
                            <option value="IT">IT</option>
                            <option value="政府机关">政府机关</option>
                            <option value="媒体/广告">媒体/广告</option>
                            <option value="零售/批发">零售/批发</option>
                            <option value="教育/培训">教育/培训</option>
                            <option value="公共事业">公共事业</option>
                            <option value="交通运输业">交通运输业</option>
                            <option value="房地产业">房地产业</option>
                            <option value="能源业">能源业</option>
                            <option value="金融/法律">金融/法律</option>
                            <option value="餐饮/旅馆业">餐饮/旅馆业</option>
                            <option value="医疗/卫生/保健">医疗/卫生/保健</option>
                            <option value="建筑工程">建筑工程</option>
                            <option value="农业">农业</option>
                            <option value="娱乐服务业">娱乐服务业</option>
                            <option value="体育/艺术">体育/艺术</option>
                            <option value="公益组织">公益组织</option>
                            <option value="其它">其它</option> 
                       </select>
                       </li>
                     <li>
                       <select class="select01"  name="companyScale" value="${user1.companyScale}" >
                            <option value="">请选择</option>
                            <option value="10人以下">10人以下</option>
                            <option value="10-100人">10-100人</option>
                            <option value="100-500人">100-500人</option>
                            <option value="500人以上">500人以上</option> 
                       </select>
                     </li>
                     <li><input type="text" class="text01"  name="position"   value="${user1.position}" /></li>
                     <li>
                       <select class="select01"  name="income" value="${user1.income}">
                            <option value="">请选择</option>
                            <option value="1000元以下">1000元以下</option>
                            <option value="1001-2000元">1001-2000元</option>
                            <option value="2000-5000元"> 2000-5000元</option>
                            <option value="5000-10000元">5000-10000元</option>
                            <option value="10000-20000元">10000-20000元</option>
                            <option value="20000-50000元">20000-50000元</option>
                            <option value="50000元以上">50000元以上</option> 
                       </select>       
                     </li>
                   </ul>    
               </div>
               <div class="clear"></div>
               <div class="use_btn">
                <a href="<%=path%>/user/cancelUpdate?name=${user1.name}"><input type="button" class="submit02" value="取消"/></a>
                <input type="submit" class="submit01" value="保存"/>
               </div>
                </form>
              
           </div>
           <div class="user_bottom">
            <h3>温馨提示:</h3>
            <ol>
              <li>请您根据自身真实情况填写，中汇宝会对用户的所有资料进行严格保密。</li>
              <li>使用过程遇到问题，请联系客服，400-600-4300。 </li>
            </ol>
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