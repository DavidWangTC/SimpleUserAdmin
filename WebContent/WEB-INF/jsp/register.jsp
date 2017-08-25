<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>会员注册</title>
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
		$("#register").validate({
			rules : {
				username : {
					required : true,
					minlength : 3
				},
				email : {
					required : true,
					email : true
				},
				telephone : {
					required : true,
					minlength : 11
				},
				password : {
					required : true,
					digits : true,
					minlength : 6
				},
				conformpassword : {
					required : true,
					digits : true,
					minlength : 6,
					equalTo : "[name='password']"
				}
			},
			messages : {
				username : {
					required : "用户名不能为空",
					minlength : "用户名不能少于3位"
				},
				email : {
					required : "邮箱不能为空",
					email : "邮箱格式不正确"
				},
				telephone : {
					required : "手机号不能为空",
					minlength : "填入11位手机号码"
				},
				password : {
					required : "密码不能为空",
					digits : "密码必须为数字",
					minlength : "密码不能少于6位"
				},
				conformpassword : {
					required : "不能为空",
					digits : "必须为数字",
					minlength : "最少6位",
					equalTo : "您两次输入的密码不相同"
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
			<div class="col-md-4">
				<!--<img src="./image/login.jpg" width="500" height="330" alt="会员登录" title="会员登录">-->
			</div>

			<div class="col-md-8">
				<div
					style="width: 600px; border: 1px solid #E7E7E7; padding: 27px 0 2px 30px; border-radius: 5px; margin-top: 200px; background: #fff;">
					<font>用户注册</font>USER REGISTER
					<div>&nbsp;</div>
					<form class="form-horizontal"
						action="${pageContext.request.contextPath }/registerSubmit" method="post" id="register">
						
						<div class="form-group">
							<label for="username" class="col-sm-3 control-label">用户名</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="username" placeholder="请输入用户名">
							</div>
						</div>
						
						<div class="form-group">
							<label for="email" class="col-sm-3 control-label">邮箱</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="email" placeholder="请输入邮箱">
							</div>
						</div>

						<div class="form-group">
							<label for="telephone" class="col-sm-3 control-label">电话号码</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="telephone" placeholder="请输入电话号码">
							</div>
						</div>
						
						<div class="form-group">
							<label for="password" class="col-sm-3 control-label">密码</label>
							<div class="col-sm-6">
								<input type="password" class="form-control" name="password" placeholder="请输入密码">
							</div>
						</div>
						
						<div class="form-group">
							<label for="password2" class="col-sm-3 control-label">确认密码</label>
							<div class="col-sm-6">
								<input type="password" class="form-control" name="conformpassword" placeholder="确认密码">
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-offset-4 col-sm-8">
								<input type="submit" width="100" value="注册" name="submit"
									style="background: url('images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); 
									height: 35px; width: 100px; color: white;">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

