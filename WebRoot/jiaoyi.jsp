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
<meta content="中租宝，是北京中投汇融投资管理有限公司旗下的众筹网络平台，公司注册资金五千零一万元人民币， 是国内首批P2B（微信托）领域的财富投资管理公司。公司集聚了一批国内一线信托公司的精英骨干， 立志在这个全民理财时代，创造一个“公正透明，稳定高效”的财富管理平台" name="description">
<meta content="债权,收益,信托,商券,抵押,信贷,基金,定投,担保,中小贷,微信托,投资人,理财顾问,理财经理,年化收益率,他项权证,余额宝,人人贷,人人投,宜信,陆金所,股权投资,旅居,度假,中租宝,中投汇融,众筹,理财,投资,资产管理,融资,P2B,P2P,私人银行" name="keywords">
<title>提现 - 我的账户 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  
<script type="text/javascript">
    var navIndex=3;    
    $(document).ready(function(){
    	  $(".label_sec li").click(function(){
    	        $(this).addClass('label_bak').siblings().removeClass('label_bak');
    	   });
    	    $(".u_left_mian").click(function(){
    	          $(this).siblings().slideToggle("slow");
    	        });
});
 
    
    var myFilter=new Array();

function filterChange(){
	var filterIndex= new Array();
	switch (myFilter[0]){
	case 10:
		filterIndex[0]=1;
		break;
	case 15:
		filterIndex[0]=2;
		break;
	case 20:
		filterIndex[0]=3;
		break;
		break;
	default:
		filterIndex[0]=0;
	}
	switch (myFilter[1]){
	case 3:
		filterIndex[1]=1;
		break;
	case 6:
		filterIndex[1]=2;
		break;
	case 12:
		filterIndex[1]=3;
		break;
	case 24:
		filterIndex[1]=4;
		break;	
	default:
		filterIndex[1]=0;
	}
	switch (myFilter[2]){
	case 200:
		filterIndex[2]=1;
		break;
	case 500:
		filterIndex[2]=2;
		break;
	case 1000:
		filterIndex[2]=3;
		break;
	case 2000:
		filterIndex[2]=4;
		break;
	default:
		filterIndex[2]=0;
	}
	switch (myFilter[3]){
	case 50:
		filterIndex[3]=1;
		break;
	case 80:
		filterIndex[3]=2;
		break;
	case 100:
		filterIndex[3]=3;
		break;
	default:
		filterIndex[3]=0;
	}

	switch (myFilter[4]){
	case 2:
		filterIndex[4]=1;
		break;
	case 3:
		filterIndex[4]=2;
		break;
	case 4:
		filterIndex[4]=3;
		break;
	default:
		filterIndex[4]=0;
	}
	$(".filter li").removeClass("dq");
	for(i=0;i<5;i++){
		$(".filter").eq(i).children("li").eq(filterIndex[i]).addClass("dq");
	}
}

function pa(clicked){
	myFilter[clicked.parent().index(".filter")]=clicked.attr("value");
	$("#yearIncome").val(myFilter[0]);
	$("#financingPeriod").val(myFilter[1]);
	$("#financingMoney").val(myFilter[2]);
	$("#financingProgress").val(myFilter[3]);
	$("#projectStatus").val(myFilter[4]);
	$("#pageNo").val(1);
	console.log(myFilter);
	//alert("avd");	
	$("#form" ).submit();
}


function jumpPage(pag){
	   
	$('#pageNo').val(pag); 	    	    
	$("#yearIncome").val(myFilter[0]);
	$("#financingPeriod").val(myFilter[1]);
	$("#financingMoney").val(myFilter[2]);
	$("#financingProgress").val(myFilter[3]);
	$("#projectStatus").val(myFilter[4]);	    
	$("#form" ).submit(); 

 }
    
    
    
    
</script>

</head>

<body>
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
          <div class="pro_con_title" style="margin-top:5px;"><strong>交易记录</strong>
          </div>
               <div class="con_list">
                  <ul class="list_label">
                    <li>
                      <ul class="label_sec">
                        <li class="label_bak">最近七天</li>
                        <li><a href="<%=path%>/transRecord/queryTransRecord?time_type=onemonth_all">一个月</a></li>
                        <li><a href="<%=path%>/transRecord/queryTransRecord?time_type=threemonth_all">三个月</a></li>
                        <li><a href="<%=path%>/transRecord/queryTransRecord?time_type=all_all">全部</a></li>
                      </ul>
                    </li>
                    <li>
                      <ul class="label_sec">
                        <li class="label_bak"><a href="<%=path%>/transRecord/queryTransRecord?time_type=all_all">全部</a></li>
                        <li><a href="<%=path%>/transRecord/queryTransRecord?time_type=recharge_all">充值</a></li>
                        <li><a href="<%=path%>/transRecord/queryTransRecord?time_type=drawmoney_all">提现</a></li>
                        <li><a href="<%=path%>/transRecord/queryTransRecord?time_type=transferinfo_all">投资</a></li>
                        <li>收益</li>
                        <li>回收本金</li>
                      </ul>
                    </li>
                    <li><ul class="label_third">
                        <li>订单编号</li>
                        <li>时间</li>
                        <li>交易类型</li>
                        <li>交易详情</li>
                        <li id="bord_right">金额</li>
                      </ul></li>
                    
                      <c:if test="${userinfo.name!=null}">
                      <c:if test="${ not empty list11}">
                      <c:forEach var="t" items="${list11 }">
                      <ul class="jiaoyi_msg">
                            <li>${t.orderNo}</li>
                            <li>${t.transDate }</li>
                            <li>投资</li>
                            <li>${t.projectName }</li>
                            <li>${t.transferAmount }</li>
                            
                      </ul>  
                      </c:forEach>    
                      </c:if>  
                      
                   <!--    提现的交易列表         -->
                      <c:if test="${ not empty list22}">
                      <c:forEach var="t" items="${list22}">
                      <ul class="jiaoyi_msg">
                            <li>${t.requestNo}</li>
                            <li>${t.transDate }</li>
                            <li>提现</li>
                            <li></li>
                            <li>${t.amount }</li>
                            
                      </ul>  
                      </c:forEach>    
                      </c:if>          
                    
                                      
                   <!--    充值的交易列表         -->
                      <c:if test="${ not empty list33}">
                      <c:forEach var="t" items="${list33}">
                      <ul class="jiaoyi_msg">
                            <li>${t.requestNo}</li>
                            <li>${t.time }</li>
                            <li>充值</li>
                            <li></li>
                            <li>${t.amount }</li>
                            
                      </ul>  
                      </c:forEach>    
                      </c:if>          
                      </c:if>          
                                      
                  </ul>
                  
                <%--   <c:if test="${empty list11}">
                  <div class="charge">
                    <p>暂无交易记录</p>
                  </div>
                  </c:if>
                   <c:if test="${empty list22}">
                  <div class="charge">
                    <p>暂无交易记录</p>
                  </div>
                  </c:if>
                   <c:if test="${empty list33}">
                  <div class="charge">
                    <p>暂无交易记录</p>
                  </div>
                  </c:if> --%>
               </div>
               
            <div class="clear"></div>    
        	<div class="next_list">
      
           
           <a href="javascript:jumpPage(1)">首页</a> 
				<c:if test=""></c:if>								 
				<c:if test="${page.pageNo > 1}"><a href="javascript:jumpPage(${page.pageNo-1})">上一页</a>  </c:if> 
				<div class="pageNum"></div>								 
				<c:if test="${page.pageNo < page.totalPage}">  <a href="javascript:jumpPage(${page.pageNo+1})">下一页</a>  </c:if>  								
		   <a href="javascript:jumpPage(${page.totalPage})">末页</a>                   
        </div>       
      </div>   
    </div>
</div>
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>