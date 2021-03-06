<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%@ include file="/includes/taglibs.jsp"%>
<title>充值 - 我的账户 - 中租宝</title>
</head>

<body>
	<!-- top start  -->
	<div class="black_bac"></div>
	<%@ include file="/includes/header.jsp"%>
	<!-- top end  -->
	<div class="clear"></div>


	<div class="user_con">
		<div class="user_left">
			<!-- user_left start -->
			<%@ include file="/includes/user_info_left.jsp"%>
			<!-- user_left end -->
		</div>
		<div class="user_right">
			<div class="zichan_con">
				<div class="pro_con_title" style="margin-top: 5px;">
					<strong>充值</strong>
				</div>
				<div class="fangshi">
					<p>充值方式</p>
					<ul>
						<li></li>
					</ul>
				</div>

				<div class="money">
					<p>
						<span>可用余额</span><span><strong>${account.availableMoney}</strong>元</span>
					</p>
					<p class="position_money" style="display: none">
						<span>充值金额</span><span class="money_text"><input
							type="text" value="100"></input>元</span>
					</p>
				</div>

				<div class="yanzheng" style="display: none">
					<p>
						<a>验证码</a><span><input type="submit" class="sub"
							value="点击获取验证码"></input></span><a></a>
					</p>
					<p>
						<a href=""></a><span><input type="checkbox"> </input>我已阅读并确认下方重要提示信息</span>
					</p>
					<p>
						<a href=""></a><span><a href="javascript:;"
							onclick="onSubmit('https://member.yeepay.com/member')"
							class="chongzhi_btn">立即充值</a></span>
					</p>
				</div>
				<form role="form" action="<%=path%>/gate/doRecharge" method="post"
					id="form" target="_blank">
					<ul class="chong">
						<li style="height: 0px;"><input type="hidden" id="host"
							name="host"></input>
							<div class="form-group" style="display: none; height: 0px;">
								<!-- <label for="platformNo">platformNo</label><input type="text"
              class="form-control" id="platformNo" name="platformNo"
              value="10040011137" /> -->
								<label for="platformNo">platformNo</label><input type="text"
									class="form-control" id="platformNo" name="platformNo"
									value="${f.platformNo}" />
								<!-- value="10012415118" /> -->
							</div>
							<div class="form-group" style="display: none; height: 0px;">
								<label for="requestNo">requestNo</label><input type="text"
									class="form-control" id="requestNo" name="requestNo"
									value="${now}" />
							</div>
							<div class="form-group" style="display: none; height: 0px;">
								<label for="feeMode">feeMode</label><input type="text"
									class="form-control" id="feeMode" name="feeMode"
									value="PLATFORM" />
							</div></li>
						<li class="mar_chong">
							<div class="form-group">
								<span><label for="amount" style="margin: 0px;">充值金额：</label></span>
								<input type="text" class="form-control" id="amount"
									name="amount" value="100" /><label
									style="margin-left: 10px; text-align: left;">元</label>
							</div>
						</li>
						<li>
							<div class="form-group" style="display: none; height: 0px;">
								<label for="notifyUrl">notifyUrl</label><input type="text"
									class="form-control" id="notifyUrl" name="notifyUrl"
									value="${f.notifyUrl}/gate/rechargeNotify" />
							</div>
							<div class="form-group" style="display: none; height: 0px;">
								<label for="callbackUrl">callbackUrl</label><input type="text"
									class="form-control" id="callbackUrl" name="callbackUrl"
									value="${f.callbackUrl}/gate/examRecharge" />
								<!--  value="http://www.ptobchina.com/spring3/gate/examRecharge" /> -->
							</div> 
							<div class="mar_que_top">
							<input type="submit" name="submibtn" id="mysubmit_btn" value="确定" onclick="onSubmit('${f.onSubmit}')" ></input>
							</div>
						</li>
					</ul>
				</form>
				<div class="tishi ai">
					<p>
						<strong>温馨提示</strong>
					</p>
					<ul>
						<li class="tishi_red">您充值的资金若未投资就提现，第三方支付公司会收取您提现金额的0.5%作为转账费用。</li>
						<li>您的账户资金将由第三方平台托管。</li>
						<li>为了您的资金安全，请您在充值前完成手机绑定，身份认证及支付密码设置。</li>
						<li>中租宝严禁信用卡充值、套现等行为，一经发现将予以处罚，包括但不限于：限制收款、冻结账户、永久停止服务，
							并会影响银行征信记录。</li>
						<li>充值过程遇到问题，请联系客服，010-84243099/3199</li>
					</ul>
				</div>
				<!-- class="chong_font" -->
				<div id="dialog01" style="display: none; height: 210px;">
					<div class="dialog_title">
						<strong>温馨提示</strong>
						<div class="right_cha"></div>
					</div>
					<div class="touzi_text">
						<p
							style="background: url('../img/images-2014-11/renzheng01.png') 26px 7px no-repeat">
							如果您成功充值：<a href="<%=path%>/gate/service">查看我的资产</a>
						</p>
					</div>
					<div class="touzi_text">
						<p
							style="background: url('../img/images-2014-11/renzheng02.png') 26px 7px no-repeat">
							如果您充值失败：<a href="<%=path%>/gate/recharge">重新支付</a> | <a
								href="<%=path%>/contact.jsp">联系客服</a>
						</p>
					</div>
				</div>
				<div id="dialog01" style="display: none; height: 170px;"
					class="newye">
					<div class="dialog_title">
						<strong>温馨提示</strong>
						<div class="right_cha"></div>
					</div>
					<div class="touzi_text">
						<p
							style="background: url('../img/images-2014-11/renzheng02.png') 26px 7px no-repeat"
							class="p_font">充值金额不能为0,请重新充值!</p>
					</div>
					<a class="diabtn">确定</a>
				</div>

			</div>
		</div>
	</div>
	<!-- absolute_right start -->
	<%@ include file="/includes/absolute.jsp"%>
	<!-- absolute_right end -->
	<div class="clear"></div>
	<!-- footer start -->
	<%@ include file="/includes/footer.jsp"%>
	<!-- footer end -->

</body>
</html>
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  
<script type="text/javascript" src="/static/js/zhongzubao.js?va=4"></script>
<script type="text/javascript">
	function onSubmit(host) {
		if ($("#amount").val() == 0 || $("#amount").val() == "") {
			/* //alert("充值金额不能为0!"); */
			$(".newye").css("display", "block")
			$(".black_bac").css("display", "block");

			return false;
		}
		document.getElementById("host").value = host;
		var form = document.getElementById("form");
		document.getElementById("mysubmit_btn").disabled = true;
		document.getElementById("mysubmit_btn").value = "正在提交...";
		$(".black_bac").css("display", "block");
		$("#dialog01").css("display", "block");

		form.submit();
	}
</script>
<script type="text/javascript">
	var navIndex = 3;
	var indexs = 1;
	$(document).ready(
			function() {
				$(".u_left_sec:eq(1) li:eq(1)").children("a").css("color",
						"#fc652e");
				$(".nav_big a").eq(2).addClass("bd_btom").siblings()
						.removeClass("bd_btom");
				$(".nav_big a").eq(2).children("p").addClass("headwd_color");
				$(".right_cha").click(function() {
					window.location.reload(true);
				});
				/* 	 $(".u_left_mian").click(function(){    	
				   	  $(this).addClass('u_left_red').parent().siblings().children(".u_left_mian").removeClass("u_left_red");
				   	  $(this).parent().siblings().children(".u_left_sec").slideUp();
				   	  $(this).siblings().slideToggle("slow");
				     }); */
				$(".right_cha").click(function() {
					$(".newye").css("display", "none")
					window.location.reload(true);
				})
				$(".diabtn").click(function() {
					alert("aa")
					$(".newye").css("display", "none")
					window.location.reload(true);
				})

			});
</script>
