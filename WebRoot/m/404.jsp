
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

 <%@ include file="/includes/taglibs.jsp" %> 
 <meta http-equiv="refresh" content="3;URL=/?404" />

<title>出错啦！ - 中租宝</title>
<link href="/css/style-2014-11.css?v=${sessionScope.version}" rel="stylesheet" type="text/css" />
</head>
<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<div class="error_con">
   <span class="back_fang"></span>
   <span class="e_con_right">
      <a class="error_title"></a>
      <a class="title_sec01">您访问的页面已经删除或者不存在</a>
      <a href="/">您可以回到<label style="color:#f1a627; text-decoration:underline">首页</label></a>
   </span>
</div>
</body> 
</html>