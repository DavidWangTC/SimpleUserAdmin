<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>会员登录</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script src="js/jquery-1.8.3.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<script type="text/javascript" src="js/messages_zh.js"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<style>
body {
	margin-top: 20px;
	margin: 0 auto;
}

.carousel-inner .item img {
	width: 100%;
	height: 300px;
}

.container .row div {
	/* position:relative;
				 float:left; */
	
}

font {
	color: #666;
	font-size: 22px;
	font-weight: normal;
	padding-right: 17px;
}
</style>
<script>
	$(function() {
		$("#login").validate({
			rules : {
				username1 : {
					required : true,
					minlength : 3
				},
				password1 : {
					required : true,
					digits : true,
					minlength : 6
				},

			},
			messages1 : {
				username : {
					required : "用户名不能为空",
					minlength : "用户名不能少于3位"
				},

				password1 : {
					required : "密码不能为空",
					digits : "密码必须为数字",
					minlength : "密码不能少于6位"
				},

				errorElement : "label", //用来创建错误提示信息标签,validate插件默认的就是label
				success : function(label) { //验证成功后的执行的回调函数
					//label指向上面那个错误提示信息标签label
					label.text(" ") //清空错误提示消息
					.addClass("success"); //加上自定义的success类
				}

			}
		});

	});
</script>
</head>

<body>
	<div class="container"
		style="width: 100%; height: 900px; background: #FF2C4C url('images/login_bg.jpg') no-repeat;">
		<div class="row">
			<div class="col-md-8">
				<div
					style="width: 600px; border: 1px solid #E7E7E7; padding: 27px 0 2px 30px; border-radius: 5px; margin-top: 300px; background: #fff;">
					<font>用户登录</font>USER LOGIN

					<div>&nbsp;</div>

					<form class="form-horizontal" action="${pageContext.request.contextPath}/loginSubmit"
						method="post" id="userLogin" >
						<div class="form-group">
							<label for="username" class="col-sm-3 control-label">用户名</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="username"
									placeholder="请输入用户名">
							</div>
						</div>

						<div class="form-group">
							<label for="inputPassword3" class="col-sm-3 control-label">密码</label>
							<div class="col-sm-6">
								<input type="password" class="form-control" name="password"
									placeholder="请输入密码">
							</div>
						</div>

						<div class="form-group"></div>
						<div class="col-sm-offset-4 col-sm-10">
							<input type="submit" width="100" value="登录" name="submit"
								style="background: url('images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
