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
<title>法律声明 - 帮助中心 - 中租宝</title>
<link href="<%=path%>/css/style-2014-11.css" rel="stylesheet" type="text/css" />
<%@ include file="/includes/taglibs.jsp" %>
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
var navIndex=5;
var index=3;
$(document).ready(function(e) {
	$(".nav_big a").eq(4).addClass("bd_btom").siblings().removeClass("bd_btom");
	$(".news_ul a").eq(3).addClass("aqbz").siblings().removeClass("aqbz");
	});
</script>
</head>
<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<div class="news_location">当前位置：<a href="<%=path%>/index.jsp" >首页</a> >> <a href="<%=path%>/help_con.jsp" >帮助中心</a> >> <a href="<%=path%>/notice.jsp" >法律声明</a></div>
     <div class="user_con_news">
       <div class="news_left">
          <!-- left menu -->
           <%@ include file="/includes/left_help.jsp" %>
          <!-- left end -->
       </div>
       <div class="right_news_con">   
        	<dl>
        	   <dt></dt>
        	   <dd>本网站属于公司网站，任何组织和个人不得非法复制、抄袭，或为任何未经允许的商业目的使用本网站及其内容。如果本网站所有者确定用户行为违法或有损网站利益，
        	             则将保留采取相关法律行为的权利。
               </dd>
               <dd>本网站努力确保本网站自身发布的信息、资料等内容的真实性和准确性， 本网站可能通过网页上的链接向用户提供来自其它网站的内容及服务。本网站对这些网站及其内容不进行控制，
                                  也不负任何责任。请用户在使用该类网站所提供的服 务时注意浏览这些网站的相关规定，并自行判断可能带来的结果和风险，以决定是否使用这些网站提供的内容或服务。
               </dd>
               <p>1.用户信息</p>
               <dd>当用户浏览本网站时，本网站的系统将自动收集用户的IP地址及网站浏览信息。这些信息有助于我们在整体基础上评估我们的网站浏览者以及用户如何使用、浏览 我们的网站，
                                  包括浏览者和用户对每一网页的访问次数、频率和浏览时间。通过收集上述信息，我们将进行流量统计，从而改进网站的管理和服务。
               </dd>
               <div class="text_anquan">
               <p>信息安全</p>
               <div>本网站将对用户所提供的资料进行严格的管理及保护，并将使用相应的技术措施（例如设置服务器备份数据和对用户密码加密等），防止用户的个人资料丢失、被盗 用或遭窜改。
                                    如因不可抗力或计算机病毒感染、黑客攻击等特殊原因，导致用户信息被破坏、泄密并受到损失的，本网站将采取必要措施尽力减少用户的损失，但本 网站对此不承担任何责任。</div>
               <p>用户权利</p>
               <div>用户可通过本网站的相关网页查看、更新并修改提供给本网站的个人信息，也可以要求本网站删除该信息。</div>
               </div>
               <p>2.免责</p>
               <dd>本网站所发布的信息中可能没有包含与北京传诚信及其业务有关的最新信息，对于本网站所发布的信息，本公司不声明或保证其内容之正确性或 完整性；
                                  本网站转载的相关文章、资料中表述或暗示的观点不代表北京传诚信的观点。本网站对本网站上所有由第三方提供的信息、内容和服 务，不提供明示或暗示的担保；本网站对使用上述信息、内容和服务所造成的任何损失不承担责任，包括直接损失和间接损失。
               </dd>
               <p>3.适用法律</p>
               <dd>网站<a href="http://www.ptobchina.com">（http://www.ptobchina.com/）</a>由中租宝运营和控制，适用中华人民共和国法律。我们保留随时更改我们的网站和上述免责及条款的权利。
        	   </dd>
        	</dl>
        	   	
        </div>
    </div>
<!-- right end -->
</div>
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>
