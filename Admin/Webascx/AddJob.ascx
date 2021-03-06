﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddJob.ascx.cs" Inherits="Admin_Webascx_AddJob" %>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 32px; margin-left: 16px; margin-right:16px">
	<legend>
		<span style="font-size: 14pt">岗位信息管理</span>
	</legend>
</fieldset>
<!--新增岗位-->
<div id="test3" class="site-text site-block" style="margin-top: 24px; margin-left: 50px; margin-right:50px">
	<div class="layui-form-item">
		<label class="layui-form-label" style="text-align: right">岗位名称:</label>
		<div class="layui-input-inline">
			<asp:TextBox ID="tbAddPost" runat="server" placeholder="请输入岗位名称" autocomplete="off" CssClass="layui-input"></asp:TextBox>
		</div>

		<label class="layui-form-label" style="text-align: right">所属部门:</label>
		<div class="layui-input-inline">
			<asp:DropDownList ID="ddlBDepartment" runat="server" placeholder="请选择部门名称" AutoPostBack="True">
			</asp:DropDownList>
		</div>

		<div align="left">
			<asp:Button ID="btnSaveJob" runat="server" Text="保存岗位信息" CssClass="layui-btn" OnClick="btnSaveJob_Click" />
		</div>
	</div>
	<asp:GridView ID="gvPost" runat="server" OnRowEditing="gvPost_RowEditing" OnRowUpdating="gvPost_RowUpdating" OnRowDeleting="gvPost_RowDeleting" OnRowCancelingEdit="gvPost_RowCancelingEdit" OnPageIndexChanging="gvPost_PageIndexChanging" OnRowDataBound="gvPost_RowDataBound" AutoGenerateColumns="False" AllowPaging="true" PageSize="5" CssClass="layui-table">
		<Columns>
			<asp:BoundField DataField="J_PostID" HeaderText="序号" ItemStyle-Width="32px" />
			<asp:BoundField DataField="J_PostName" HeaderText="岗位名称" />
			<asp:BoundField DataField="D_DepartmentName" HeaderText="部门名称" />
			<asp:CommandField HeaderText="编辑" ControlStyle-CssClass="layui-btn layui-btn-sm" ShowEditButton="true" />
			<asp:CommandField HeaderText="删除" ControlStyle-CssClass="layui-btn layui-btn-danger layui-btn-sm" ShowDeleteButton="true" />
		</Columns>
		<HeaderStyle HorizontalAlign="Center" BackColor="LightGray" />
		<RowStyle HorizontalAlign="Center" />
	</asp:GridView>
</div>