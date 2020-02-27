<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>用户登录</title>
	<link rel="stylesheet" href="/static/customer/css/auth.css">
</head>
<body>
	<div class="lowin lowin-red">
		<div class="lowin-brand">
			<img src="/static/customer/img/kodinger.jpg" alt="logo">
		</div>
		<div class="lowin-wrapper">
			<div class="lowin-box lowin-login">
				<div class="lowin-box-inner">
					<form action="/customer/dologin" method="post">
						<p>用户登录</p>
						<div class="lowin-group">
							<label>账号 <a href="#" class="login-back-link">登录</a></label>
							<input type="text" autocomplete="username" name="username" id="username" class="lowin-input">
						</div>
						<div class="lowin-group password-group">
							<label>密码 <a href="#" class="forgot-link">忘记密码？</a></label>
							<input type="password" name="password" autocomplete="current-password" id="password" class="lowin-input">
						</div>
						<div class="lowin-group">
							<label>验证码</label>
							<input type="text" name="code" id="code" class="lowin-input">
						</div>
<%--						<div class="lowin-group">--%>
<%--							<img id="kaptcha" src="../kaptcha.jpg"/>--%>
<%--							<a href="#" onclick="changeImg()">看不清...</a>--%>
<%--						</div>--%>
<%--						<div class="lowin-group">${msg}</div>--%>
						<input type="submit" class="lowin-btn" id="login_btn" value="登录"/>
						
						<div class="text-foot">
							没有账号？ <a href="" class="register-link">注册</a>
						</div>
					</form>
				</div>
			</div>

			<div class="lowin-box lowin-register">
				<div class="lowin-box-inner">
					<form action="/customer/register" method="post">
						<p>让我们创建你的账号</p>
						<div class="lowin-group">
							<label>姓名</label>
							<input type="text" name="name" autocomplete="name" class="lowin-input">
						</div>
						<div class="lowin-group">
							<label>用户账号</label>
							<input type="text" autocomplete="username" name="username" class="lowin-input">
						</div>
						<div class="lowin-group">
							<label>密码</label>
							<input type="password" name="password" autocomplete="current-password" class="lowin-input">
						</div>
						<input type="submit" class="lowin-btn" value="注册"/>
						<div class="text-foot">
							已有账户? <a href="" class="login-link">登录</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	
		<footer class="lowin-footer">

		</footer>
	</div>

	<script src="/static/customer/js/auth.js"></script>
	<script>
		Auth.init({
			login_url: '/customer/dologin',
			forgot_url: '/customer/register'
		});
	</script>
</body>
</html>