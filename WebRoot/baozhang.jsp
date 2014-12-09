<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit">
<meta content="中租宝，是国内首批众筹网络平台之一，公司注册资金五千零一万元人民币， 是国内首批P2B（微信托）领域的财富投资管理公司。公司集聚了一批国内一线信托公司的精英骨干， 立志在这个全民理财时代，创造一个“公正透明，稳定高效”的财富管理平台" name="description">
<meta content="债权,收益,信托,商券,抵押,信贷,基金,定投,担保,中小贷,微信托,投资人,理财顾问,理财经理,年化收益率,他项权证,余额宝,人人贷,人人投,宜信,陆金所,股权投资,旅居,度假,中租宝,中投汇融,众筹,理财,投资,资产管理,融资,P2B,P2P,私人银行" name="keywords">
<title>新闻中心 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
<%@ include file="/includes/taglibs.jsp" %>
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
var navIndex=4;
$(document).ready(function(e) {
	 $(".nav_big a").eq(3).addClass("bd_btom").siblings().removeClass("bd_btom");
   $(".news_ul li").click(function(e){
      var index=$(this).index();
      $(this).children("div").addClass("news_wd_color");
      $(this).siblings().children("div").removeClass("news_wd_color");
      $(".news_right ul").eq(index).css("display","block").siblings().css("display","none");
   });
      var news_height= $(".news_right").height();   
      var left_height= $(".news_left").height();
    if(news_height>260){
    	//alert(news_height);
    	$(".user_con_news").css("height",news_height+100);
    }
   
});
</script>
</head>

<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<!-- 
<div class="clear"></div>
<div class="one"></div>
<div class="clear_height"></div>
<div class="frame">
<div class="news_location">当前位置：<a href="<%=path%>/" >首页</a> >> <a href="<%=path%>/guarantee/getchannel">新闻公告</a>
</div>
	<div class="clear_height"></div>
	<div class="bz_left">
    	<!-- <div class="bzl_tit"></div> 
        <div class="bzl_list">
        	<ul>
        	 <c:if test="${ not empty list}">
                <c:forEach var="s" items="${list}" varStatus="i">
            	  <li class="aqbz"><span class="hong"><a href="<%=path%>/guarantee/getlist?id=${s.id}">${s.name}</a></span></li>
            	</c:forEach>
             </c:if>              
            </ul>
        </div>
    </div>
    <div class="bz_right">
    	<div class="bzr_tit">
        	<h1>新闻公告</h1>
        </div>  
        <div class="clear"></div>
        <div class="bzr_nr" style="padding-top:0px;">
        	<ul class="news_list">
        		 <c:if test="${ not empty list1}">
        <c:forEach var="s" items="${list1}" varStatus="i">
            	<li><a href="<%=path%>/guarantee/getTNewsById?id=${s.id}">${s.title}</a><dt>${fn:substring(s.time, 0, 10)}</dt></li>
               	</c:forEach>
        </c:if>
            </ul>
        </div>
    </div>
</div>
<div class="clear_height"></div>
 -->
 <!-- <div class="news_location">当前位置：<a href="<%=path%>/" >首页</a> >> <a href="<%=path%>/guarantee/getNewslist?channel=${news.channel}">${news.channel}</a></div> -->
 <div class="news_location">当前位置：<a href="<%=path%>/" >首页</a> >> <a href="<%=path%>/guarantee/getchannel">新闻中心</a>
</div>
   <div class="user_con_news">
     
       <div class="news_left">
          <div class="n_left_title">新闻中心</div>
           <ul class="news_ul">                   
            <!--  <li><div class="news_wd_color"><a href="getlist?id=7"><span>网站公告</span></a></div></li>
             <li><div><a href="getlist?id=8"><span>还款公告</span></a></div></li>
             <li><div><a href="getlist?id=9"><span>媒体公告</span></a></div></li>   -->   
              <c:if test="${ not empty list}">
                <c:forEach var="s" items="${list}" varStatus="i">
            	  <li><span><a href="<%=path%>/guarantee/getlist?id=${s.id}">${s.name}</a></span></li>
            	</c:forEach>
             </c:if> 
           </ul>   
       </div>   
       <div class="news_right position_top">
           <ul class="webside">
              <c:if test="${ not empty list1}">
                <c:forEach var="s" items="${list1}" varStatus="i">
            	   <li><a href="<%=path%>/guarantee/getTNewsById?id=${s.id}">${s.title}</a></li>
               	</c:forEach>
              </c:if>                    
           </ul>
           <ul class="webside" style="display:none">
                  <c:if test="${ not empty list1}">
                    <c:forEach var="s" items="${list1}" varStatus="i">
            	     <li><a href="<%=path%>/guarantee/getTNewsById?id=${s.id}">${s.title}</a></li>
               	    </c:forEach>
                  </c:if>
           </ul> 
           <ul class="webside" style="display:none">
                  <c:if test="${ not empty list1}">
                    <c:forEach var="s" items="${list1}" varStatus="i">
            	     <li><a href="<%=path%>/guarantee/getTNewsById?id=${s.id}">${s.title}</a></li>
               	    </c:forEach>
                  </c:if>
           </ul>         
       </div>
         <!-- absolute_right start -->
	<%@ include file="/includes/absolute.jsp" %>
	<!-- absolute_right end -->
	
	
   </div>
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>
