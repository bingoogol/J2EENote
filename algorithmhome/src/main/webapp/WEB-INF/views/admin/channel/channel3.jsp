<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/common/inc/head.jsp"></jsp:include>
<title>三级学科管理</title>
</head>
<body>
	<input type="hidden" id="ctx" value="${pageContext.request.contextPath }" />
	<div class="container">
		<ul class="list-inline">
			<li>${loginUser.username }</li>
			<li><a href="${pageContext.request.contextPath }/auth/logout">退出</a></li>
		</ul>
		<div class="row">
			<div class="col-md-2">
				<div id="leftMenu">
					<ul class="nav nav-pills nav-stacked navSelected">
						<h4>学科管理</h4>
						<li><a href="${pageContext.request.contextPath }/channel/admin/channels?cid=-1&level=1">学科管理</a></li>
					</ul>
					<ul class="nav nav-pills nav-stacked">
						<h4>用户管理</h4>
						<li><a href="#">版主管理</a></li>
						<li><a href="#">注册用户管理</a></li>
					</ul>
				</div>
			</div>
			<div class="col-md-10">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title text-center">三级学科管理</h3>
					</div>
					<table class="table table-hover table-bordered table-condensed">
						<tr>
							<th>学科名</th>
							<th>父学科</th>
							<th colspan="2" class="text-center">操作</th>
						</tr>
						<c:forEach items="${list}" var="entry">
							<tr>
								<td>${entry.name }</td>
								<td>${entry.parent }</td>
								<td><button type="button" class="btn btn-warning btn-sm">修改</button></td>
								<td><button type="button" class="btn btn-danger btn-sm">删除</button></td>
							</tr>
						</c:forEach>
					</table>
					<div class="panel-footer">
						<button id="addBtn" class="btn btn-primary" data-toggle="modal" data-target="#addChannelModel">添加</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 添加一级学科 START -->
	<div class="modal fade" id="addChannelModel" tabindex="-1" role="dialog" aria-labelledby="addChannelModelLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="addChannelModelLabel">添加三级学科</h4>
				</div>
				<div class="modal-body">
					<!-- 膜态窗口禁用回车提交表单，否者回重复提交 -->
					<form role="form" class="form-horizontal" id="addChannelForm" onkeydown="if(event.keyCode==13){return false;}">
						<input type="hidden" class="form-control" name="cid" value="${cid }"> <input type="hidden" class="form-control" name="level" value="3">
						<div class="form-group">
							<label for="name" class="col-md-2 col-xs-2 control-label">学科名</label>
							<div class="col-md-9 col-xs-9">
								<input type="text" class="form-control" id="name" name="name">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary" form="addChannelForm">添加</button>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/inc/foot.jsp"></jsp:include>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/admin/js/channel/channel.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#leftMenu").bingoogol_accordion();
		});
	</script>
</body>
</html>
