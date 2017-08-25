<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script src="js/jquery-1.8.3.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<script type="text/javascript" src="js/messages_zh.js"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script src="http://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript">
		$(function () {
	  $('[data-toggle="popover"]').popover()
	})
		//改变flag值
		function changeFlag(id){
			$.ajax({
				url:"${pageContext.request.contextPath}/123",
				type:"post",
				data:{"id":id},
				success:function(data){
					 window.location.href="${pageContext.request.contextPath}/search?";
				}
			});
		}
		//删除
		function deleteItem(id){
			$.ajax({
				url:"${pageContext.request.contextPath}/deleteFunction",
				type:"post",
				data:{"id":id},
				success:function(data){
					window.location.reload();
				}
			});
		}
		//进行修改页面跳转显示，跳了几次写的有点繁琐
		function editUSER(id){
			$.ajax({
				url:"${pageContext.request.contextPath}/editFunction",
				type:"post",
				data:{"id":id},
				success:function(data){
					alert("要修改的用戶是："+data.username);
					var idi=data.id;
					 window.location.href="${pageContext.request.contextPath}/editUser?id="+idi;
				}
			});
		}
		//这种方式对于传送json格式字符串有用
 	/* function addUser(){
			var params='{"username"="zhangsan","address"="chengdu","age"=25}'
	 		
			$.ajax({
				url:"${pageContext.request.contextPath}/addUser.action",
				data:params,
				type:"post",
				contentType : "application/json;charset=UTF-8",//发送数据的格式
				success:function(data){
					alert("客户信息更新成功！");
					window.location.reload();
				}
			});
		}   */
		//添加用户，将用户对象以json格式字符传给controller对象
	function addUser() {
			$.post("<%=basePath%>addUser",$("#add_user").serialize(),function(data){
				alert("添加用户成功！");
				window.location.reload();
			}); 
		}
		
</script>
	<title>账户管理</title>
</head>

<body>
	<div class="page-header">
		<h1 align="center">
			用户查询管理<span>&nbsp;&nbsp;</span><small>USER SEARCH/ADMIN</small>
		</h1>
	</div>

	<!-- 导航条 -->
	<div>
		<div class="container-fluid">
			<div class="dropdown" align="right">
					<a id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true"
						class=".dropdown-menu-right"> <small>${loginer.getUsername()}</small><span>&nbsp;&nbsp;</span>

					</a>
					<ul class="dropdown-menu dropdown-menu-right" role="menu"
						aria-labelledby="dLabel">

						<li role="presentation"><a role="menuitem" tabindex="-1"
							href="<%=basePath%>index.jsp">退出登录</a></li>
					</ul>
			</div>
			
			
			<div>
				<div class="container-fluid">
				<!--多条件查询  -->
					<form class="navbar-form navbar-left" id="mqw" action="${pageContext.request.contextPath}/multiSearch" method="post">
						<div class="form-group">
							<label for="customerID">用户ID</label>
							<input type="text" class="form-control" name="id" value="${id}">
						</div>
						&nbsp;&nbsp;&nbsp;
						<div class="form-group">
							<label for="customerName">用户名</label>
							<input type="text" class="form-control" value="${username}" name="username">
						</div>
						&nbsp;&nbsp;&nbsp;
						<div class="form-group">
							<label for="userFrom">国别</label> 
							<input type="text" class="form-control" value="${country}" name="country">
						</div>
						&nbsp;&nbsp;&nbsp;
						<div class="form-group">
							<label for="customerFrom">职业</label> 
							<input type="text" class="form-control" value="${job}" name="job">
						</div>
						&nbsp;&nbsp;&nbsp;
						<button type="submit" class="btn btn-default">查询</button>
					</form>
				</div>
			</div>
		</div>
	
		<div>
		<form id="itemsearch" cellpadding="2px" cellspacing="2px" align="center">
			<table class="table" border=2>
				<thead style="font-weight: bold;">
					<tr>
						<td>用户id</td>
						<td>用户名</td>
						<td>用户电话</td>
						<td>邮箱</td>
						<td>国别</td>
						<td>职业</td>
						<c:if test="${loginer.getFlag()==1}"><td>操作</td></c:if>
					</tr>
				</thead>

				<c:forEach items="${users}" var="item">
					<tr>
						<td>${item.id}</td>
						<td>${item.username}</td>
						<td>${item.telephone}</td>
						<td>${item.email}</td>
						<td>${item.country}</td>
						<td>${item.job}</td>
						<c:if test="${loginer.getFlag() == 1}">
						<td>
							<a href="editUser?id=${item.id}">edit</a>
							<a href="deleteUser?id=${item.id}">delete</a>
						</td>
						</c:if>
					<tr>
				</c:forEach>
			</table>
			
		</form>
		</div>
	</div>
</body>
</html>