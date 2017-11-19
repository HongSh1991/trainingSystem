<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Admin_Index" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title style="text-align: center">管理员，欢迎您！</title>
	<script src="../../Resources/Admin/js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
	<script src="../Resources/Common/js/jquery-3.2.1.min.js" type="text/javascript"></script>
	<script src="../Resources/Common/layui/layui.js" type="text/javascript"></script>
	<link rel="stylesheet" href="../Resources/Common/layui/css/layui.css" />
	<script type="text/javascript">
		
	</script>


	<style type="text/css">
		.button {
			cursor: pointer;
			border-radius: 6px;
		}

		.button1 {
			cursor: pointer;
		}
	</style>

</head>
<body style="margin: auto">
	<form id="form1" runat="server">
		<div style="width: 100%; height: 8%; margin: auto; background-color:black">
			<table style="width: 100%; height: 8%;">
				<tr>
					<td style="width: 80%"></td>
					<td style="width: 18%; height:38px; vertical-align: middle;" align="right" vertical="middle">
						<asp:LinkButton ID="lbExit" runat="server" OnClick="lbExit_Click">
							<span style="font-family:微软雅黑; vertical-align:middle; font-size:12pt; color:white">退出系统</span>
						</asp:LinkButton>
					</td>
					<td style="width: 2%"></td>
				</tr>
			</table>
		</div>
		<div style="height: 20%;  margin:auto;">
			<table style="width: 100%; height: 100%;">
				<tr style="height: 20px; background-color:#70106f">
					<td style="height:20px;" colspan="3"></td>
				</tr>
				<tr style="height:60px; background-color:#70106f ">
					<td style="width: 6%"></td>
					<td style="text-align: center; vertical-align: middle">
						<span style="font-family: 华文楷体; font-size: 5.6em; font-weight: 600; color: white; text-shadow: 4px 6px 6px #080707">煤矿应急救援培训系统</span>&nbsp;&nbsp;
						
					</td>
					<td style="width: 6%; vertical-align: bottom;"></td>
				</tr>
				<tr style="height: 20px; background-color:#70106f">
					<td colspan="3"></td>
				</tr>
			</table>
		</div>
		<div style="height: 16%; margin:auto;">
			<ul class="layui-nav layui-bg-cyan" lay-filter="nav">
				<li class="layui-nav-item">
					<asp:Label ID="lbTips" runat="server" Font-Names="华文楷体" Font-Bold="true" ForeColor="white" Font-Size="1.6em"></asp:Label>
				</li>
				<li class="layui-nav-item">
					<asp:LinkButton ID="lbUserManager" runat="server" OnClick="lbUserManager_Click">人员管理</asp:LinkButton>
					<dl class="layui-nav-child">
						<!-- 二级菜单 -->
						<dd><a href="#">新增目录机构</a></dd>
						<dd><a href="#">新增部门</a></dd>
						<dd><a href="#">新增岗位</a></dd>
						<dd><a href="#">新增人员</a></dd>
					</dl>
				</li>
				<li class="layui-nav-item">
					<asp:LinkButton ID="lbCourseManager" runat="server" OnClick="lbCourseManager_Click">课程管理</asp:LinkButton>
					<dl class="layui-nav-child">
						<!-- 二级菜单 -->
						<dd><a href="#">移动模块</a></dd>
						<dd><a href="#">后台模版</a></dd>
					</dl>
				</li>
			</ul>
		</div>

		<div style="height: 60%">
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

			//…
		});
	</script>
</body>
</html>
