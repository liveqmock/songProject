
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

 <%@ include file="/includes/taglibs.jsp" %>

<Link href="/favicon.ico" rel="Shortcut Icon">
<title>项目：${product1.projectName} - 我要投资 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />

<link href="<%=path%>/css/jquery-ui.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/jquery-ui.min.css" rel="stylesheet" type="text/css" />
 <script type="text/javascript" src="<%=path%>/js/jquery-1.8.2.js"></script>
 <script type="text/javascript" src="<%=path%>/js/jquery-ui.js"></script>
 <script type="text/javascript" src="<%=path%>/js/jquery-ui.min.js"></script>
 <script type="text/javascript" src="<%=path%>/js/jquery.js"></script>

</head>

<body>

<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<div class="clear"></div>
<input type="hidden" id="now" value="${now}">
<input type="hidden" id="start_time" value="${product1.financeTime}">

<div class="tou_con">
    <div class="con_left">

      <!-- con_left -->
      <%@ include file="/includes/news_list_right.jsp" %>
      <!-- con_left end-->
      <div class="guanggao"></div>
   </div>
   
   <div class="con_right01">
    <p class="bianhao">
     <span class="con_pic01"><strong>项目：${product1.projectName}</strong></span>

     <span class="bianhao_right">项目编号：${product1.enterpriseNumber}  </span>
    </p>
     <div class="pro_msg">
       <div class="pro_pic">${product1.projectPicture}
        <div class="last_time">
                     距离开放购买还有
            <span id="t_d"></span>
            <span id="t_h"></span>
            <span id="t_m"></span>
            <span id="t_s"></span>
        </div>
       </div>
       <div class="pro_con01" style="display:none;">
       
       
       </div>
       <div class="pro_con">
       <ul>
         <li class="pro_title">还款方式：按月付息、到期还款</li>
         <li style="padding-left:15px;">投资周期：${product1.financingPeriod*30}天</li>
         <li><span style="margin-right:0">信用等级：</span>
           <span style="margin-left:0"><img src="<%=path%>/img/images-2014-11/star_${product1.qualityRating}.png" style="margin-bottom:-3px;"></span>

           <span class="pro_r">
             <a class="pro_bac_logo01" href="http://www.sina.com.cn/"></a>
             <a class="pro_bac_logo02" href="http://www.qq.com"></a>
             <a class="pro_bac_logo03" href="http://t.qq.com"></a>
           </span>

           </li>
           <li><span style="width:90px;">融资金额</span><span style="width:90px;">年化收益</span><span style="width:90px;">还款日期</span></li>
           <li class="bac_red_wd">
           <c:if test="${product1.enterpriseNumber=='ZTH011417486977120'}">
              <span style="width:90px;"><strong><i>￥</i>${product1.financingMoney}万元</strong></span>
              <span style="width:90px;"><strong>${product1.yearIncome}%</strong></span>
              <span style="width:90px;"><strong>${currTime}</strong></span>
           </c:if>
           <c:if test="${product1.enterpriseNumber!='ZTH011417486977120'}">
              <span style="width:90px;"><strong><i>￥</i>${product1.financingMoney}万元</strong></span>
              <span style="width:90px;"><strong>${product1.yearIncome}%</strong></span>
              <span style="width:90px;"><strong>${product1.repaymentTime}</strong></span>
           </c:if>
           </li>
           <li>
             <span>融资进度：</span>
             <div class="load_bar">
             <c:if test="${product1.enterpriseNumber!='ZTH011417486977120'}">
               <div style="width:<c:if test='${not empty product1.financingProgress}'>${product1.financingProgress<100?product1.financingProgress:100}</c:if><c:if test='${empty product1.financingProgress}'>0</c:if>%"></div>
             </div>
             <span><c:if test='${not empty product1.financingProgress}'>${product1.financingProgress<100?product1.financingProgress:100}</c:if><c:if test='${empty product1.financingProgress}'>0</c:if>%</span>
             </c:if>
             <c:if test="${product1.enterpriseNumber=='ZTH011417486977120'}">
               <div style="width:100%"></div>
             </div>
             <span>100%</span>
             </c:if>
           </li>
           <li class="pro_msg_bot" style="display:none">
             <div class="gray_bar1"><span>剩余天数</span><span>28</span></div>
             <div class="gray_bar1"><span>参投人数</span><span>20</span></div>
             <div>百分百本息保障,企业生产经营正常,还款正常</div>
           </li>
        </ul>
        
       </div>
       <div class="pro_gress" style="display:none">
       <ul>
          <li>
             <span>融资进度</span>
             <div class="load_bar">
               <div style="width:<c:if test='${not empty product1.financingProgress}'>${product1.financingProgress<100?product1.financingProgress:100}</c:if><c:if test='${empty product1.financingProgress}'>0</c:if>%"></div>
             </div>
             <span>80%</span>
           </li>
           <li class="pro_msg_bot">
             <div class="gray_bar1"><span>剩余天数</span><span>28</span></div>
             <div class="gray_bar1"><span>参投人数</span><span>20</span></div>
             <div>百分百本息保障,企业生产经营正常,还款正常</div>
           </li>
       </ul>
       </div>
       <c:if test="${ empty product1.buyType}"><!-- 线下 -->
       <div class="pro_right">
         <span class="pro_right_title"><strong>投资金额</strong></span>
         <span>可投资金额：${product1.financingMoney-product1.realityMoney}万元
         </span>
         <div class="neirong"></div>         
         <span><a class="red_touzi"  id="dialog-link" href="<%=path%>/xianxia.jsp" style="margin:24px 0 0 30px">立即投资</a></span>
         <span class="pro_right_label">200元起投<i class="label_min"></i></span>
         
       </div>
       </c:if>
       <c:if test="${ not empty product1.buyType&&product1.projectStatus==1}"><!-- 线上 -->
       <div class="pro_right">
         <span class="pro_right_title"><strong>项目即将开放</strong></span>
       </div> 
       </c:if>
       <c:if test="${ not empty product1.buyType&&product1.projectStatus==3}"><!-- 线上 -->
       <div class="pro_right">
         <span class="pro_right_title"><strong>企业正常还款中</strong></span>
       </div> 
       </c:if>
       <c:if test="${ not empty product1.buyType&&product1.projectStatus==4}"><!-- 线上 -->
       <div class="pro_right">
         <span class="pro_right_title"><strong>项目已完成</strong></span>
       </div> 
       </c:if>
       <c:if test="${ not empty product1.buyType&&product1.projectStatus==2}"><!-- 线上  投资中-->
       <form id="form" role="form" action="<%=path%>/gate/transfer" method="post" style="padding:0px;">
       <div class="pro_right">
         <span class="pro_right_title"><strong>投资金额</strong></span>
         <span>可投资金额： ${product1.financingMoney*10000-product1.realityMoney}元
         </span>
         <div class="neirong"></div>
         <span><input type="number" class="text01" value="200" id="buyAmount"  name="buyAmount" min="200"/></span>
         <div class="jin_"><input type="hidden"  value="${product1.enterpriseNumber}" id="enterpriseNumber" name="enterpriseNumber"></input></div>
                	<div class="jin_"><input type="hidden"  value="${product1.projectName}" id="projectName" name="projectName"></input></div>
                	<div class="jin_"><input type="hidden"  value="${product1.financingMoney}" id="financingMoney" name="financingMoney"></input></div>
         
         <span><a class="red_touzi"  id="dialog-link" href="javascript:;" onclick="mysubmit();" >立即投资</a><i class="jisuan"></i></span>
         <span class="pro_right_label">200元起投<i class="label_min"></i></span>
        <a class="chong_link" href="<%=path%>/gate/service">浏览个人资产</a><a class="chong_link" href="<%=path%>/gate/recharge">去充值&nbsp;&nbsp;&nbsp;/</a>
       </div>
       </form>
       </c:if>
      </div>   
 <!--弹出窗口 -->   
 
       <div id="dialog" title="投资金额确认" style="display:none">

        <p class="zijin">您成功投资<strong class="touzi_money">2000</strong>元</p>
    </div>
    <div id="dialog01" title="收益计算器" style="display:none">
        <div class="dialog_title"><strong>收益计算器</strong>
            <div class="right_cha"></div>
        </div>
        <div class="touzi_text">
            <span>投资金额：</span>
            <span class="touz_right"><input type="text" id="preview_amount" value="200"></input></span>
        </div>
        <div class="touzi_text">
            <span>预期收益率：</span>
            <span class="touz_right"><input type="text" value="10%" id="preview_rate"></input></span>
        </div>
        <div class="touzi_text" >
            <span>投资周期：</span>
            <span class="touz_right"><a id="preview_Period">${product1.financingPeriod*30}</a>天</span>
        </div>
        <div class="touzi_text">
            <span>预期总收益：</span>
            <span class="touz_right" id="preview_income">0元</span>
        </div>
        <div class="jisuan_btn">
            <input type="reset" value="重置" class="jisuan_btn_left"></input>
            <input type="submit" value="开始计算" class="jisuan_btn_right"></input>
        </div>
    </div>


    <div class="syl_table" style="clear:both;">
        <table width="100%"  bgcolor="#dedede" align="center" cellspacing="1" cellpadding="2" border="0">
            <tr>
                <td bgcolor="#fff" align="center"><b>阶段起点金额</b></td>
                <td bgcolor="#fff" align="center"><b>起始利率</b></td>
                <td bgcolor="#fff" align="center"><b>投资增幅</b></td>
                <td bgcolor="#fff" align="center"><b>利率增幅</b></td>
                <td bgcolor="#fff" align="center"><b>阶段上限金额</b></td>
            </tr>
            <c:if test="${ not empty li}">
                <c:forEach var="s" items="${li}" varStatus="i">
                    <tr>
                        <td bgcolor="#fff" align="center"><span class="lev_start">${s.startMoney}</span></td>
                        <td bgcolor="#fff" align="center"><span class="lev_rate">${s.startInterestRate}</span></td>
                        <td bgcolor="#fff" align="center"><span class="lev_mi">${s.moneyIncrease}</span></td>
                        <td bgcolor="#fff" align="center"><span class="lev_ri">${s.interestRateIncrease}</span></td>
                        <td bgcolor="#fff" align="center"><span class="lev_max">${s.highestMoney}</span></td>
                    </tr>
                </c:forEach>
            </c:if>
        </table>
    </div>

    <ul class="small_nav">
        <li class="sm_nav_fir">
            <a>投资记录</a>
        </li>
        <li><a>项目描述</a></li>
        <li><a>资金运转</a></li>
        <li><a>企业信息</a></li>
        <li><a>担保机构及意见</a></li>
        <li class="shu"><a>风险控制</a></li>
        <li class="zheng"><a>相关证件</a></li>
    </ul>
    <div class="pro_con_title"><strong>投资记录</strong></div>
    <ul class="table_mag">
        <c:if test="${ empty product1.buyType}"><!-- 线下 -->
        <li><span>投资人</span><span>投资人证件号</span><span>投资金额</span><span>状态</span></li>
        <c:if test="${ not empty listoffline}">
            <c:forEach var="s" items="${listoffline}" varStatus="i">

                <li>
                    <span>${fn:substring(s.investor,0,1)}<c:if test="${fn:length(s.investor)>2}">*</c:if>*</span>
		<span >
			<c:if test="${fn:length(s.identityCard)==18}">${fn:substring(s.identityCard,0,7)}********${fn:substring(s.identityCard,15,18)}
            </c:if>
			<c:if test="${fn:length(s.identityCard)!=18}">-
            </c:if>
		</span>
                    <span >${s.investmentAmount}万元</span>
                    <span>成功</span>
                </li>
            </c:forEach>
        </c:if>
        </c:if>
        <c:if test="${not empty product1.buyType}"><!-- 线上 -->
        <li><span>投资人</span><span>投资金额</span><span>状态</span></li>
        <c:if test="${ not empty listonline}">
            <c:forEach var="s" items="${listonline}" varStatus="i">
                <li>
		<span>${fn:substring(s.platformUserNo,0,1)}<c:forEach var="j" begin="1" end="${fn:length(s.platformUserNo)-2}" step="1">*</c:forEach>${fn:substring(s.platformUserNo,fn:length(s.platformUserNo)-1,fn:length(s.platformUserNo))}
		</span>

		<span >${s.paymentAmount}元</span>
		<span>成功</span>
		</li>
		</c:forEach>
		</c:if>
		</c:if>
		<c:if test="${product1.id==56&&page.pageNo==page.totalPage }">
		<li>
		<span>j***k</span>
		<span >60000元</span>
		<span>成功</span>
		</li>
		<li>
		<span>m***元</span>
		<span >120000元</span>
		<span>成功</span>
		</li>
		<li>
		<span>空*****j</span>
		<span >28000元</span>
		<span>成功</span>
		</li>
		<li>
		<span>r*****k</span>
		<span >60000元</span>
		<span>成功</span>
		</li>
		<li>
		<span>s***e</span>
		<span >9000元</span>
		<span>成功</span>
		</li>
		<li>
		<span>p*k</span>
		<span >300000元</span>
		<span>成功</span>
		</li>
		<li>
		<span>刘****o</span>
		<span >90000元</span>
		<span>成功</span>
		</li>
		<li>
		<span>w***h</span>
		<span >20000元</span>
		<span>成功</span>
		</li>
		<li>
		<span>v****f</span>
		<span >38000元</span>
		<span>成功</span>
		</li>
		</c:if>
		</ul> 
		<div class="clear"></div>    
        	<div class="next_list">
      
             <a href="<%=path %>/product/getProductByid?pageNo=1&id=${product1.id}">首页</a> 
				<c:if test="${page.pageNo > 1}"><a href="<%=path %>/product/getProductByid?pageNo=${page.pageNo-1}&id=${product1.id}">上一页</a>  </c:if> 
				<div class="pageNum"></div>								 
				<c:if test="${page.pageNo < page.totalPage}">  <a href="<%=path %>/product/getProductByid?pageNo=${page.pageNo+1}&id=${product1.id}">下一页</a>  </c:if>  								
		   <a href="<%=path %>/product/getProductByid?pageNo=${page.totalPage}&id=${product1.id}">末页</a>              
        </div>       
        

   <div class="pro_con_title"><strong>项目描述</strong></div>
      <div class="zijin">
        <p class="zijin_msg">${product1.projectIntroduce}</p>        
      </div>
      
      <div class="pro_con_title"><strong>资金运转</strong></div>
      
      <div class="zijin">
         <p>资金用途</p>
         <p class="zijin_msg">${product1.fundUse}</p>

        <!-- <p>查看详情</p> -->
        <div style="display:none;"></div>
        <p>还款来源</p>
        <p class="zijin_msg">${product1.repaymentSource}</p>
    </div>
    <div class="pro_con_title"><strong>企业信息</strong></div>
    <div class="zijin">
        <p>企业背景</p>
        <p class="zijin_msg">${product1.companyProfile}</p>
        <!-- <p>查看详情</p> -->
        <div style="display:none;"></div>
        <p>业务范围</p>
        <p class="zijin_msg">${product1.businessScope}</p>
        <div></div>
        <p>经营状况</p>
        <p class="zijin_msg">${product1.stateOfOperation}</p>
    </div>
    <div class="pro_con_title" id="p_c_t02"><strong>担保机构及担保意见</strong></div>
    <div class="zijin">
        <p>担保机构简介</p>
        <p class="zijin_msg">${product1.guaranteeInstitutionIntroduce}</p>
        <p>担保机构意见</p>
        <p class="zijin_msg">${product1.collateralOpinion}</p>
    </div>
    <div class="pro_con_title"><strong>风险控制</strong></div>
    <div class="zijin">
        <p>担保机构</p>
        <p class="zijin_msg">${product1.guaranteeInstitution}</p>
        <p>抵押物信息</p>
        <p class="zijin_msg">${product1.guarantee}</p>
        <p>风险控制措施</p>
        <p class="zijin_msg">${product1.riskControl}</p>
    </div>

    <div class="pro_con_title"><strong>相关资料</strong></div>
    <div class="ziliao_pic">
        ${product1.enterpriseCertificate}


    </div>
</div>
</div>
<!-- absolute start -->
<%@ include file="/includes/absolute.jsp" %>
<!-- absolute end -->
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->



</body>
<script type="text/javascript">
    var touzi_money=${product1.financingMoney*10000-product1.realityMoney};

    /*提交表单*/

    function mysubmit(){
        if($("#buyAmount").val()==0||$("#buyAmount").val()=="投资金额不低于200元"){
            alert("投资金额不能为空！");
            return false;
        }
        //if($("#buyAmount").val()%100!=0){alert("投资金额必须为100的整数倍！");return false;}

        if($("#buyAmount").val()<200){
            alert("投资金额不能低于200元！");
            return false;
        }

        if($("#buyAmount").val()>touzi_money){
            alert("投资金额不能高于可投资金额！");
            return false;
        }

        $.ajax({url: "/gate/checkPay?id=${product1.enterpriseNumber}&amount="+$("#buyAmount").val(),
            success: function(resp){
                if(resp === "success"){
                    var form = document.getElementById("form");
                    form.submit();
                }else{
                    alert(resp);
                }
            }});
    }


    $(document).ready(function(e) {
        //---------收益计算器------------
        //console.log("-------go-------");
        var rate_lv=$(".lev_start").length;
        calc();
        $("#preview_amount").change(function(e) {
            if($(this).val()<parseInt($(".lev_start").eq(0).html())){
                $(this).val(parseInt($(".lev_start").eq(0).html()));
            }
            if($(this).val()>parseInt($(".lev_max").eq(rate_lv-1).html())){
                $(this).val(parseInt($(".lev_max").eq(rate_lv-1).html()));
            }
            calc();

        });
        function calc(){
            //console.log("-------calc-------");
            var t=parseInt($("#preview_amount").val());
            var r=0;
            var p=parseInt($("#preview_Period").html());
            if(t%100!=0){alert("投资金额必须为100的整数倍！");return false;}
            for(i=0;i<rate_lv;i++){
                if(t>=parseInt($(".lev_start").eq(i).html())&&t<=parseInt($(".lev_max").eq(i).html())){
                    if(parseInt($(".lev_mi").eq(i).html())>0){
                        r=parseFloat($(".lev_rate").eq(i).html())+parseFloat($(".lev_ri").eq(i).html())*parseInt((t-parseInt($(".lev_start").eq(i).html()))/parseInt($(".lev_mi").eq(i).html()));

                    }else{
                        r=parseFloat($(".lev_rate").eq(i).html());
                    }
                    r=r/100;
                    //console.log("-lv:"+i+"-m:"+t+"-r:"+r+"--");
                }
            }
            $("#preview_rate").val(parseFloat(parseInt(r*10000)/100)+"%");
            $("#preview_income").html(parseFloat(parseInt(t*r/365*p*100+0.5)/100)+"元");
            //console.log("|-"+t*r);
        }
        $(".jisuan_btn_left").click(function(){
            $("#preview_amount").val(200);
            $("#preview_income").html(0+"元");


        });


        //---------收益计算器结束-------------

        /*验证输入的投资金额是否正确*/

        $("#buyAmount").keyup(function(){

            var str= /^[0-9]*$/;
            var val=$("#buyAmount").val();
            if(!(str.test(val))){
                $('.neirong').html("您输入的金额不是数字,请重新输入");
                return false;
            }
            $('.neirong').css('display','block');

            if(!(str.test(val))){
                $('.neirong').html("您输入的金额不是数字,请重新输入");
                return false;
            }
            if(val<200){
                $('.neirong').html("您输入的金额小于200元,请重新输入");
                return false;
            }

        }});
}	


 $(document).ready(function(e) { 
	 //---------收益计算器------------
	//console.log("-------go-------");
	    var rate_lv=$(".lev_start").length;
		calc();
		$("#preview_amount").change(function(e) {
			if($(this).val()<parseInt($(".lev_start").eq(0).html())){
				$(this).val(parseInt($(".lev_start").eq(0).html()));
				}
			if($(this).val()>parseInt($(".lev_max").eq(rate_lv-1).html())){
				$(this).val(parseInt($(".lev_max").eq(rate_lv-1).html()));
				}
	        calc();
	        
	    });
		function calc(){
			//console.log("-------calc-------");
			var t=parseInt($("#preview_amount").val());//投资金额
			var r=0;
			var p=parseInt($("#preview_Period").html());//投资周期
			if(t%100!=0){alert("投资金额必须为100的整数倍！");return false;}
			for(i=0;i<rate_lv;i++){ //起点金额 //阶段上限金额
				if(t>=parseInt($(".lev_start").eq(i).html())&&t<=parseInt($(".lev_max").eq(i).html())){
					if(parseInt($(".lev_mi").eq(i).html())>0){// 投资增幅
					r=parseFloat($(".lev_rate").eq(i).html())+parseFloat($(".lev_ri").eq(i).html())*parseInt((t-parseInt($(".lev_start").eq(i).html()))/parseInt($(".lev_mi").eq(i).html()));
					//投资利率  // 投资利率增幅 //起点金额 // 投资增幅
					}else{
						r=parseFloat($(".lev_rate").eq(i).html());
						}
					r=r/100;
					//console.log("-lv:"+i+"-m:"+t+"-r:"+r+"--");
					}
				}
			$("#preview_rate").val(parseFloat(parseInt(r*10000)/100)+"%");	
			$("#preview_income").html(parseFloat(parseInt(t*r/365*p*100+0.5)/100)+"元");
			//console.log("|-"+t*r);
			}
		$(".jisuan_btn_left").click(function(){
			  $("#preview_amount").val(200);
			  $("#preview_income").html(0+"元");
			  
			   
		  });
		
		
		//---------收益计算器结束-------------
		
/*验证输入的投资金额是否正确*/
 
	 $("#buyAmount").keyup(function(){
		  
		    var str= /^[0-9]*$/;
		    var val=$("#buyAmount").val();
		    if(!(str.test(val))){  	   
				   $('.neirong').html("您输入的金额不是数字,请重新输入");
				   return false;
			    }
		    $('.neirong').css('display','block');
	
		    if(!(str.test(val))){  	   
				   $('.neirong').html("您输入的金额不是数字,请重新输入");
				   return false;
			    }
			    if(val<200){
				   $('.neirong').html("您输入的金额小于200元,请重新输入");
				   return false;
			    }
			    if(val>touzi_money){
					   $('.neirong').html("您的投资金额大于可投资投资金额");
					   return false;
				    }
			    if(parseInt(val)%100!=0){	
				  $('.neirong').html("输入的资金必须是100的整数倍");
				  return false;
				   }
			      $('.neirong').html('您要投入的实际金额为:'+val);	   
	 
	 });	
 
	 $(".nav_big a").eq(1).addClass("bd_btom").siblings().removeClass("bd_btom");
	 $(".nav_big a").eq(1).children("p").addClass("headwd_color");
       $(window).on('scroll', function(){
               checkText();
              // alert($(this).scrollTop())
       });

       var nav_height=parseInt($('.small_nav').offset().top);
     
       function checkText(){
           var top = parseInt($(this).scrollTop());
           if(top>nav_height){
              $(".small_nav").addClass("text");
           }else if($(".small_nav").hasClass('text')&&(top!=nav_height)){
              $(".small_nav").removeClass("text");
           }
       }

      $(".small_nav li").click(function(){
           var i=$(this).index();
           var top = parseInt($(this).scrollTop());
           var title_top=parseInt($('.pro_con_title').eq(i).offset().top);
           var small_height=$(".small_nav").height();
           $(".small_nav").addClass("text");
           $(this).addClass('sm_nav_fir').siblings().removeClass('sm_nav_fir');
           $(window).scrollTop(title_top-small_height-50);
      });
      
      var timer=null;
      var num=1;
      timer=setInterval(autoplay,3000);
      function autoplay(nn){
        if(nn!=null)num=nn+num;
        if(num>22){num=0}
        if(num<0){num=22}
        $('.ziliao_pic li').eq(num).hide().fadeIn().siblings().hide();          
        num++; 

        }

        $(".ban_right").click(function(){
            autoplay(0);
            clearInterval(timer);
            timer=setInterval(autoplay,3000);
        });
        $(".ban_left").click(function(){

            var index=$('.ziliao_pic li').index();
            autoplay(-2);
            clearInterval(timer);
            timer=setInterval(autoplay,3000);
        });
        $(".syl_table").hover(function(){
            $(this).css("height","auto");
        },function(){
            $(this).css("height","60px");
        });

        $(".jisuan").click(function(){
            $("#dialog01").css("display","block");


        });
        $(".right_cha").click(function(){
            $("#dialog01").css("display","none");
        });

    });

    /*获取投资额焦点*/
    $("#buyAmount").focus(function(){
        var tixian_val=$("#buyAmount").val();
        $("#buyAmount").val("");
    });


</script>

<script type="text/javascript">
    function getRTime(){
		//new Date(parseInt("600000"))
        var EndTime= new Date('2015/05/1 10:00:00'); //截止时间 前端路上 http://www.51xuediannao.com/qd63/
        var NowTime = new Date();
        var t =EndTime.getTime() - NowTime.getTime();

        var d=Math.floor(t/1000/60/60/24);
        var h=Math.floor(t/1000/60/60%24);
        var m=Math.floor(t/1000/60%60);
        var s=Math.floor(t/1000%60);

        document.getElementById("t_d").innerHTML = d + "天";
        document.getElementById("t_h").innerHTML = h + "时";
        document.getElementById("t_m").innerHTML = m + "分";
        document.getElementById("t_s").innerHTML = s + "秒";
    }
    setInterval(getRTime,1000);
</script>

</html>
