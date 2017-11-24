<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Admin_Index" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Admin/Webascx/Header.ascx" TagName="Header" TagPrefix="uc1" %>
<%@ Register Src="~/Admin/Webascx/AddOrgContent.ascx" TagName="AddOrgContent" TagPrefix="uc2" %>
<%@ Register Src="~/Admin/Webascx/AddDepartment.ascx" TagName="AddDepartment" TagPrefix="uc3" %>
<%@ Register Src="~/Admin/Webascx/AddJob.ascx" TagName="AddJob" TagPrefix="uc4" %>
<%--<%@ Register Src="~/Admin/Webascx/AddUserInfo.ascx" TagName="AddUserInfo" TagPrefix="uc5" %>--%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title style="text-align: center">管理员，欢迎您！</title>
	<script src="../../Resources/Admin/js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
	<script src="../Resources/Common/js/jquery-1.12.3.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="../layui/css/layui.css" />

	<style type="text/css">
		.button {
			cursor: pointer;
			border-radius: 6px;
		}

		.button1 {
			cursor: pointer;
		}

		* {
			padding: 0;
			margin: 0;
			border: none;
		}

		aside {
			position: absolute;
			top: 21.7%;
			left: 8%;
			bottom: 0;
		}

		#main {
			position: absolute;
			left: 24.2%;
			top: 21.7%;
			right: 8%;
			bottom: 0;
			overflow: hidden;
		}
	</style>

</head>
<body style="margin: auto">
	<form id="form1" runat="server" class="layui-form layui-form-pane">
		<div style="height: 28%;">
			<uc1:Header ID="Header" runat="server"/>
		</div>
		<ul class="layui-nav layui-bg-cyan" lay-filter="nav">
			<li class="layui-nav-item">
				<asp:Label ID="lbTips" runat="server" Font-Names="华文楷体" Font-Bold="true" ForeColor="white" Font-Size="1.6em"></asp:Label>
			</li>
			<li class="layui-nav-item">
				<asp:LinkButton ID="lbUserManager" runat="server" OnClick="lbUserManager_Click">人员管理</asp:LinkButton>
				<dl class="layui-nav-child">
					<!-- 二级菜单 修改二级菜单至导航栏的距离只要修改 layui.css 文件中的layui-nav-child属性top为42px就好了-->
					<%--<dd><asp:LinkButton ID="lbViewUser" runat="server" OnClick="lbViewUser_Click">查看人员</asp:LinkButton></dd>--%>
					<dd><asp:LinkButton ID="lbDepartInfo" runat="server" OnClick="lbDepartInfo_Click">部门信息管理</asp:LinkButton></dd>
					<dd><asp:LinkButton ID="lbUserInfo" runat="server" OnClick="lbUserInfo_Click">人员信息管理</asp:LinkButton></dd>
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

		<div style="height: 56%">
			<table style="height: 100%; width: 100%">
				<tr>
					<td>
						<asp:MultiView ID="mvPages" runat="server" ActiveViewIndex="0">
							<asp:View ID="vUserManager" runat="server">
								<aside style="background-color:aquamarine; width: 16%">
								</aside>
								<div id="main" style="overflow-y:auto; overflow-x:auto;">
									<table style="height: 100%; width: 100%">
										<tr>
											<td style="height: 100%; width: 100%; vertical-align:top">
												<asp:MultiView ID="mvPages1" runat="server" ActiveViewIndex="0">
													<asp:View ID="vDataTable" runat="server">
														<fieldset class="layui-elem-field layui-field-title" style="margin-top: 32px; margin-left: 16px; margin-right: 16px">
															<legend>
																<span style="font-size: 14pt">人员信息管理</span>
															</legend>
														</fieldset>
														<div style="margin-top: 24px; margin-left: 50px; margin-right:50px">
															<asp:GridView ID="gvUser" runat="server" OnRowEditing="gvUser_RowEditing" OnRowUpdating="gvUser_RowUpdating" OnRowDeleting="gvUser_RowDeleting" OnRowCancelingEdit="gvUser_RowCancelingEdit" OnPageIndexChanging="gvUser_PageIndexChanging" OnRowDataBound="gvUser_RowDataBound" AutoGenerateColumns="False" AllowPaging="true" PageSize="5" CssClass="layui-table">
																<Columns>
																	<asp:TemplateField HeaderText="序号" ItemStyle-Width="32px">
																		<ItemStyle HorizontalAlign="Center" />
																		<HeaderStyle HorizontalAlign="Center" Width="32px" />
																	</asp:TemplateField>
																	<asp:BoundField DataField="U_UserName" HeaderText="用户名" />
																	<asp:BoundField DataField="U_ChineseName" HeaderText="姓名" />
																	<asp:BoundField DataField="U_Sex" HeaderText="性别" ItemStyle-Width="32px" />
																	<asp:BoundField DataField="U_Department" HeaderText="部门" />
																	<asp:BoundField DataField="U_Role" HeaderText="角色" ItemStyle-Width="80px" />
																	<asp:BoundField DataField="U_PhoneNum" ItemStyle-Width="100px" HeaderText="电话" />
																	<asp:CommandField HeaderText="编辑" ControlStyle-CssClass="layui-btn layui-btn-sm" ShowEditButton="true" />
																	<asp:CommandField HeaderText="删除" ControlStyle-CssClass="layui-btn layui-btn-danger layui-btn-sm" ShowDeleteButton="true" />
																</Columns>
																<HeaderStyle HorizontalAlign="Center" BackColor="LightGray" />
																<RowStyle HorizontalAlign="Center" />
															</asp:GridView>
														</div>
													</asp:View>
													<asp:View ID="vDepartment" runat="server">
														<table style="height: 100%; width: 100%">
															<tr style="height: 30%; width:100%">
																<td style="width: 100%; vertical-align:top">
																	<uc2:AddOrgContent ID="AddOrgContent" runat="server" />
																</td>
															</tr>
															<tr style="height: 30%; ">
																<td style="width: 100%">
																	<uc3:AddDepartment ID="AddDepartment" runat="server" />
																</td>
															</tr>
															<tr style="height: 40%; ">
																<td style="width: 100%">
																	<uc4:AddJob ID="AddJob" runat="server" />
																</td>
															</tr>
														</table>
													</asp:View>
													<asp:View ID="vUserInfo" runat="server">
														<fieldset class="layui-elem-field layui-field-title" style="margin:32px 60px 0 60px;">
															<legend>
																<span style="font-size: 14pt">人员信息管理</span>
															</legend>
														</fieldset>
														<table style="height: 100%; width: 100%">
															<tr style="height: 100%; width:100%">
																<td style="width: 100%; vertical-align: top; margin: 0 120px 0 0;">
																	<!--新增人员-->
																	<div id="test4" class="site-text site-block" style="margin-top: 24px; margin-left: 100px;">
																		<table style="width: 100%; height: 100%;" align="center">
																			<tr>
																				<td style="width: 40%">
																					<div class="layui-form-item">
																						<label class="layui-form-label" style="text-align: right">用户名:</label>
																						<div class="layui-input-inline">
																							<asp:TextBox ID="tbAddUserName" runat="server" required lay-verify="required" placeholder="请输入用户名" autocomplete="off" CssClass="layui-input"></asp:TextBox>
																						</div>
																					</div>
																				</td>
																				<td rowspan="4" style="width: 20%; vertical-align: top">
																					<fieldset class="layui-elem-field layui-field-title">
																						<legend>
																							<span style="font-size: 11pt">用户头像
																							</span>
																						</legend>
																					</fieldset>
																					<div class="layui-upload-drag" id="test5" style="margin-left: 4%">
																						<i class="layui-icon"></i>
																						<p>点击上传，或将用户头像拖拽到此处</p>
																					</div>
																				</td>
																				<td style="width: 40%"></td>
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
																							<asp:DropDownList ID="ddlAddDepartment" runat="server" placeholder="请选择部门名称" OnSelectedIndexChanged="ddlAddDepartment_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
																						</div>
																						<label class="layui-form-label" style="text-align: right">岗位:</label>
																						<div class="layui-input-inline">
																							<asp:DropDownList ID="ddlAddJob" runat="server" placeholder="请选择部门名称"></asp:DropDownList>
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
																							<asp:TextBox ID="tbAddContact" runat="server" placeholder="请输入联系电话" autocomplete="off" CssClass="layui-input"></asp:TextBox>
																						</div>
																						<label class="layui-form-label" style="text-align: right">入职时间:</label>
																						<div class="layui-input-inline">
																							<asp:TextBox ID="tbAddDatetime" runat="server" placeholder="请输入入职时间" autocomplete="off" CssClass="layui-input"></asp:TextBox>
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
																						<label class="layui-form-label" style="text-align: right">联系地址:</label>
																						<div class="layui-input-block" style="width: 42.1%">
																							<asp:TextBox ID="tbAddAdress" runat="server" lay-verify="required" placeholder="请输入您的联系地址" autocomplete="off" CssClass="layui-input"></asp:TextBox>
																						</div>
																					</div>
																				</td>
																			</tr>
																		</table>
																		<div>
																			<table>
																				<tr>
																					<td style="height: 40px;"></td>
																				</tr>
																			</table>
																		</div>
																		<div style="margin-right: 100px">
																			<div align="center">
																				<asp:Button ID="btnSaveAdd" runat="server" Text="保存人员信息" CssClass="layui-btn layui-btn-lg" OnClick="btnSaveAdd_Click" />
																			</div>
																		</div>
																	</div>
																</td>
															</tr>
														</table>
													</asp:View>
												</asp:MultiView>
											</td>
										</tr>
									</table>
								</div>
							</asp:View>
							<asp:View ID="vCourseManager" runat="server">
								<div>
									<table>
										<tr>
											<td></td>
										</tr>
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

	<script src="../layui/layui.js"></script>
	<script>
		layui.use(['layer', 'form', 'element', 'laydate'], function () {
			var layer = layui.layer,
				form = layui.form,
				element = layui.element,
				laydate = layui.laydate;

			laydate.render({
				elem: '#tbAddDatetime'
			});
		});
	</script>
</body>
</html>
