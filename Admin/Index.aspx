﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Admin_Index" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Admin/Webascx/Header.ascx" TagName="Header" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title style="text-align: center">管理员，欢迎您！</title>
	<script src="../../Resources/Admin/js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
	<script src="../Resources/Common/js/jquery-1.12.3.min.js" type="text/javascript"></script>
	<script src="../Resources/Common/layui/layui.js" type="text/javascript"></script>
	<link rel="stylesheet" href="../Resources/Common/layui/css/layui.css" />

	<style type="text/css">
		.button {
			cursor: pointer;
			border-radius: 6px;
		}

		.button1 {
			cursor: pointer;
		}

		#test1 {
			display: none;
		}

		#test2 {
			display: none;
		}

		#test3 {
			display: none;
		}

		#test4 {
			display: none;
		}
	</style>

</head>
<body style="margin: auto">
	<form id="form1" runat="server" class="layui-form layui-form-pane">
		<div style="height:28%">
			<uc1:Header ID="Header" runat="server" TagName="Header" TagPrefix="uc1" />
		</div>
		<div style="height: 16%; margin: auto;">
			<ul class="layui-nav layui-bg-cyan" lay-filter="nav">
				<li class="layui-nav-item">
					<asp:Label ID="lbTips" runat="server" Font-Names="华文楷体" Font-Bold="true" ForeColor="white" Font-Size="1.6em"></asp:Label>
				</li>
				<li class="layui-nav-item">
					<asp:LinkButton ID="lbUserManager" runat="server" OnClick="lbUserManager_Click">人员管理</asp:LinkButton>
					<dl class="layui-nav-child">
						<!-- 二级菜单 修改二级菜单至导航栏的距离只要修改 layui.css 文件中的layui-nav-child属性top为42px就好了-->
						<dd><a href="#" onclick="func1()">新增机构</a></dd>
						<dd><a href="#" onclick="func2()">新增部门</a></dd>
						<dd><a href="#" onclick="func3()">新增岗位</a></dd>
						<dd><a href="#" onclick="func4()">新增人员</a></dd>
					</dl>
				</li>
				<li class="layui-nav-item">
					<asp:LinkButton ID="lbCourseManager" runat="server" OnClick="lbCourseManager_Click">课程管理</asp:LinkButton>
					<dl class="layui-nav-child">
						<!-- 二级菜单 -->
						<dd><a href="#">新增课程分类</a></dd>
						<dd><a href="#">新增课程目录</a></dd>
					</dl>
				</li>
			</ul>

			<!--新增机构目录-->
			<div id="test1" class="site-text site-block" style="margin-top: 64px; margin-left: 120px;">
				<label class="layui-form-label" style="text-align: right">机构名称:</label>
				<div class="layui-input-inline">
					<asp:TextBox ID="tbOrgContent" runat="server" required lay-verify="required" placeholder="请输入机构名称" autocomplete="off" CssClass="layui-input"></asp:TextBox>
				</div>
				<div>
					<table>
						<tr>
							<td style="height: 40px;"></td>
						</tr>
					</table>
				</div>
				<div style="margin-right: 100px">
					<div align="center">
						<asp:Button ID="btnSaveOrg" runat="server" Text="保存机构名称" CssClass="layui-btn" lay-submit lay-filter="formDemo1" />&nbsp;&nbsp;
					<%--<asp:Button ID="btnDeleteOrg" runat="server" Text="删&nbsp;&nbsp;&nbsp;&nbsp;除" CssClass="layui-btn layui-btn-primary" OnClick="btnDeleteOrg_Click" />--%>
					</div>
				</div>
			</div>

			<!--新增部门-->
			<div id="test2" class="site-text site-block" style="margin-top: 42px; margin-left: 120px;">
				<div class="layui-form-item">
					<label class="layui-form-label" style="text-align: right">部门名称:</label>
					<div class="layui-input-inline">
						<asp:TextBox ID="tbAddDepartment" runat="server" required lay-verify="required" placeholder="请输入部门名称" autocomplete="off" CssClass="layui-input"></asp:TextBox>
					</div>
				</div>
				<div><table><tr><td style="height: 10px;"></td></tr></table></div>
				<div class="layui-form-item">
					<label class="layui-form-label" style="text-align: right">所属目录:</label>
					<div class="layui-input-inline">
						<asp:DropDownList ID="ddlBOrgContent" runat="server" placeholder="请选择机构名称" AutoPostBack="True">
						</asp:DropDownList>
					</div>
				</div>
				<div><table><tr><td style="height: 40px;"></td></tr></table></div>
				<div style="margin-right: 100px">
					<div align="center">
						<asp:Button ID="btnSaveDe" runat="server" Text="保存部门信息" CssClass="layui-btn" OnClick="btnSaveDe_Click" />&nbsp;&nbsp;
					<%--<asp:Button ID="btnDeleteDe" runat="server" Text="删&nbsp;&nbsp;&nbsp;&nbsp;除" CssClass="layui-btn layui-btn-primary" OnClick="btnDeleteDe_Click" />--%>
					</div>
				</div>
			</div>

			<!--新增岗位-->
			<div id="test3" class="site-text site-block" style="margin-top: 42px; margin-left: 120px;">
				<div class="layui-form-item">
					<label class="layui-form-label" style="text-align: right">岗位名称:</label>
					<div class="layui-input-inline">
						<asp:TextBox ID="tbAddJob" runat="server" required lay-verify="required" placeholder="请输入岗位名称" autocomplete="off" CssClass="layui-input"></asp:TextBox>
					</div>
				</div>
				<div><table><tr><td style="height: 10px;"></td></tr></table></div>
				<div class="layui-form-item">
					<label class="layui-form-label" style="text-align: right">所属部门:</label>
					<div class="layui-input-inline">
						<asp:DropDownList ID="ddlBDepartment" runat="server" placeholder="请选择部门名称" AutoPostBack="True">
						</asp:DropDownList>
					</div>
				</div>
				<div><table><tr><td style="height: 40px;"></td></tr></table></div>
				<div style="margin-right: 100px">
					<div align="center">
						<asp:Button ID="btnSaveJob" runat="server" Text="保存岗位信息" CssClass="layui-btn" OnClick="btnSaveJob_Click" />&nbsp;&nbsp;
					<%--<asp:Button ID="btnDeleteJob" runat="server" Text="删&nbsp;&nbsp;&nbsp;&nbsp;除" CssClass="layui-btn layui-btn-primary" OnClick="btnDeleteJob_Click" />--%>
					</div>
				</div>
			</div>

			<!--新增人员-->
			<div id="test4" class="site-text site-block" style="margin-top: 36px; margin-left: 80px;">
				<table style="width:100%;height:100%;">
					<tr>
						<td style="width:60%">
							<div class="layui-form-item">
								<label class="layui-form-label" style="text-align: right">用户名:</label>
								<div class="layui-input-inline">
									<asp:TextBox ID="tbAddUserName" runat="server" required lay-verify="required" placeholder="请输入用户名" autocomplete="off" CssClass="layui-input"></asp:TextBox>
								</div>
							</div>
						</td>
						<td rowspan="4" style="width:30%; vertical-align:top">
							<fieldset class="layui-elem-field layui-field-title">
								<legend>
									<span style="font-size:11pt">
										用户头像
									</span>
								</legend>
							</fieldset>
							<div class="layui-upload-drag" id="test5" style="margin-left:4%">
								<i class="layui-icon"></i>
								<p>点击上传，或将用户头像拖拽到此处</p>
							</div>
						</td>
						<td style="width:10%"></td>
					</tr>
					<tr>
						<td colspan="3">
							<div>
								<table>
									<tr>
										<td style="height: 10px;"></td>
									</tr>
								</table>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label" style="text-align: right">密码:</label>
								<div class="layui-input-inline">
									<asp:TextBox ID="tbAddPassWord" runat="server" required lay-verify="required" placeholder="请输入密码" autocomplete="off" CssClass="layui-input"></asp:TextBox>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<div>
								<table>
									<tr>
										<td style="height: 10px;"></td>
									</tr>
								</table>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label" style="text-align: right">中文名:</label>
								<div class="layui-input-inline">
									<asp:TextBox ID="tbAddChineseName" runat="server" required lay-verify="required" placeholder="请输入中文名" autocomplete="off" CssClass="layui-input"></asp:TextBox>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<div>
								<table>
									<tr>
										<td style="height: 10px;"></td>
									</tr>
								</table>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label" style="text-align: right">性别:</label>
								<div class="layui-input-block">
									<input type="radio" name="sex" value="0" title="男" checked="checked" />
									<input type="radio" name="sex" value="1" title="女" />
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<div>
								<table>
									<tr>
										<td style="height: 10px;"></td>
									</tr>
								</table>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label" style="text-align: right">角色:</label>
								<div class="layui-input-block">
									<input type="radio" name="role" value="0" title="普通用户" checked="checked" />
									<input type="radio" name="role" value="1" title="教师" />
									<input type="radio" name="role" value="2" title="系统操作员" />
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<div>
								<table>
									<tr>
										<td style="height: 10px;"></td>
									</tr>
								</table>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label" style="text-align: right">学历:</label>
								<div class="layui-input-block">
									<input type="radio" name="education" value="0" title="学士" checked="checked" />
									<input type="radio" name="education" value="1" title="硕士" />
									<input type="radio" name="education" value="2" title="博士" />
									<input type="radio" name="education" value="3" title="其他" />
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<div>
								<table>
									<tr>
										<td style="height: 10px;"></td>
									</tr>
								</table>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label" style="text-align: right">部门:</label>
								<div class="layui-input-inline">
									<asp:DropDownList ID="ddlAddDeartment" runat="server" required placeholder="请选择部门名称" AutoPostBack="True">
									</asp:DropDownList>
								</div>
								<label class="layui-form-label" style="text-align: right">岗位:</label>
								<div class="layui-input-inline">
									<asp:DropDownList ID="ddlAddJob" runat="server" required placeholder="请选择部门名称" AutoPostBack="True">
									</asp:DropDownList>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<div>
								<table>
									<tr>
										<td style="height: 10px;"></td>
									</tr>
								</table>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label" style="text-align: right">联系电话:</label>
								<div class="layui-input-inline">
									<asp:TextBox ID="tbAddContact" runat="server" required lay-verify="required" placeholder="请输入联系电话" autocomplete="off" CssClass="layui-input"></asp:TextBox>
								</div>
								<label class="layui-form-label" style="text-align: right">入职时间:</label>
								<div class="layui-input-inline">
									<asp:TextBox ID="tbAddDatetime" runat="server" required lay-verify="required" placeholder="请输入入职时间" autocomplete="off" CssClass="layui-input"></asp:TextBox>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<div><table><tr><td style="height: 10px;"></td></tr></table></div>
							<div class="layui-form-item">
								<label class="layui-form-label" style="text-align: right">联系地址:</label>
								<div class="layui-input-block" style="width: 69.6%">
									<asp:TextBox ID="tbAddAdress" runat="server" required lay-verify="required" placeholder="请输入您的联系地址" autocomplete="off" CssClass="layui-input"></asp:TextBox>
								</div>
							</div>
						</td>
					</tr>
				</table>
				<div><table><tr><td style="height: 40px;"></td></tr></table></div>
				<div style="margin-right: 100px">
					<div align="center">
						<asp:Button ID="btnSaveAdd" runat="server" Text="保存人员信息" CssClass="layui-btn layui-btn-lg" OnClick="btnSaveAdd_Click" lay-filter="formDemo"/>&nbsp;&nbsp;
					<%--<asp:Button ID="btnResetAdd" runat="server" Text="重&nbsp;&nbsp;&nbsp;&nbsp;置" CssClass="layui-btn layui-btn-primary" OnClick="btnResetAdd_Click" />--%>
					</div>
				</div>
			</div>
		</div>

		<div style="height: 56%">
			<table style="height: 100%; width: 100%">
				<tr>
					<td>
						<asp:MultiView ID="mvPages" runat="server" ActiveViewIndex="0">
							<asp:View ID="vUserManager" runat="server">
								<div style="margin-top: 10px">
									<table>
									</table>
								</div>
								<div>
									<table>
									</table>
								</div>
							</asp:View>
							<asp:View ID="vCourseManager" runat="server">
								<div style="margin-top: 10px">
									<table>
									</table>
								</div>
								<div>
									<table>
									</table>
								</div>
							</asp:View>
						</asp:MultiView>
					</td>
				</tr>
			</table>
		</div>
	</form>

	<script>
		//注意：导航 依赖 element 模块，否则无法进行功能性操作
		layui.use('element', function () {
			var element = layui.element;
		});

		layui.use('layer', function () {
			var layer = layui.layer;
		});

		layui.use('form', function () {
			var form = layui.form();

			form.on('submit(formDemo1)', function (data) {
				layer.msg(JSON.stringify(data.field));
				//console.log(data.form);
				return false;
			});
		});

		layui.use('laydate', function () {
			var laydate = layui.laydate;

			//执行一个laydate实例
			laydate.render({
				elem: '#tbAddDatetime' //指定元素
			});
		});

		//layui.use('upload', function () {
		//	var $ = layui.jquery
		//	, upload = layui.upload;

		//	upload.render({
		//		elem: '#test5'
		//		, url: '/api/upload/'
		//		, done: function (res) {
		//			console.log(res)
		//		}
		//	})
		//});

		function func1() {
			layer.open({
				type: 1 //Page层类型
				, area: ['500px', '300px']
				, title: '新增机构'
				, shade: 0.6 //遮罩透明度
				, maxmin: true //允许全屏最小化
				, content: $('#test1')
			});
		}

		function func2() {
			layer.open({
				type: 1 //Page层类型
				, area: ['500px', '300px']
				, title: '新增部门'
				, shade: 0.6 //遮罩透明度
				, maxmin: true //允许全屏最小化
				, content: $('#test2')
			});
		}

		function func3() {
			layer.open({
				type: 1 //Page层类型
				, area: ['500px', '300px']
				, title: '新增岗位'
				, shade: 0.6 //遮罩透明度
				, maxmin: true //允许全屏最小化
				, content: $('#test3')
			});
		}

		function func4() {
			layer.open({
				type: 1 //Page层类型
				, area: ['800px', '760px']
				, title: '新增人员'
				, shade: 0.6 //遮罩透明度
				, maxmin: true //允许全屏最小化
				, content: $('#test4')
			});
		}
	</script>
</body>
</html>
