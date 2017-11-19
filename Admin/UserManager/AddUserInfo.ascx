<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddUserInfo.ascx.cs" Inherits="Admin_UserManager_AddUserInfo" %>
<script src="../../Resources/Admin/js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>


<div>
	<table style="margin: auto; width: 640px; height: 560px">
		<tr>
			<td colspan="4" style="height: 32px; background-color: lightgrey"><span style="font-family: 华文行楷; font-size: 16pt; color: darkblue">新增人员</span></td>
		</tr>
		<tr>
			<td style="width: 16%; text-align: right">
				<span style="font-family: 楷体; font-size: 15pt; font-weight: 600">用户名:</span>
			</td>
			<td style="width: 54%">
				<asp:TextBox ID="tbUserName" runat="server" Width="180px" Height="24px"></asp:TextBox>
			</td>
			<td rowspan="5" colspan="2" style="width: 60px; height: 180px" align="center">
				<asp:Image ID="imUser" runat="server" Width="180px" Height="180px"/>
			</td>
		</tr>
		<tr>
			<td style="width: 16%; text-align: right">
				<span style="font-family: 楷体; font-size: 15pt; font-weight: 600">密码:</span>
			</td>
			<td>
				<asp:TextBox ID="tbPassWord" runat="server" Width="180px" Height="24px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td style="width: 16%; text-align: right">
				<span style="font-family: 楷体; font-size: 15pt; font-weight: 600">中文名:</span>
			</td>
			<td>
				<asp:TextBox ID="tbChineseName" runat="server" Width="180px" Height="24px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td style="width: 16%; text-align: right">
				<span style="font-family: 楷体; font-size: 15pt; font-weight: 600">性别:</span>
			</td>
			<td>
				<asp:RadioButton ID="rbMan" runat="server" Text="男" Font-Names="楷体" Font-Size="15pt" Font-Bold="true"/>&nbsp;
				<asp:RadioButton ID="rbWoman" runat="server" Text="女" Font-Names="楷体" Font-Size="15pt" Font-Bold="true"/>
			</td>
		</tr>
		<tr>
			<td style="width: 16%; text-align: right">
				<span style="font-family: 楷体; font-size: 15pt; font-weight: 600">角色:</span>
			</td>
			<td>
				<asp:RadioButton ID="rbCommonUser" runat="server" Text="普通用户" Font-Names="楷体" Font-Size="15pt" Font-Bold="true"/>&nbsp;
				<asp:RadioButton ID="rbTeacher" runat="server" Text="教师" Font-Names="楷体" Font-Size="15pt" Font-Bold="true"/>&nbsp;
				<asp:RadioButton ID="rbAdmin" runat="server" Text="系统操作员" Font-Names="楷体" Font-Size="15pt" Font-Bold="true"/>
			</td>
		</tr>
		<tr>
			<td style="width: 16%; text-align: right">
				<span style="font-family: 楷体; font-size: 15pt; font-weight: 600">学历:</span>
			</td>
			<td colspan="3">
				<asp:RadioButton ID="rbXueShi" runat="server" Text="学士" Font-Names="楷体" Font-Size="15pt" Font-Bold="true"/>&nbsp;
				<asp:RadioButton ID="rbShuoShi" runat="server" Text="硕士" Font-Names="楷体" Font-Size="15pt" Font-Bold="true"/>&nbsp;
				<asp:RadioButton ID="rbBoShi" runat="server" Text="博士" Font-Names="楷体" Font-Size="15pt" Font-Bold="true"/>&nbsp;
				<asp:RadioButton ID="rbOthers" runat="server" Text="其他" Font-Names="楷体" Font-Size="15pt" Font-Bold="true"/>&nbsp;
			</td>
		</tr>
		<tr>
			<td style="width: 100%" colspan="4">
				<div style=" height:40px; ">
					<table style="height:100%;">
						<tr>
							<td style="width: 20%; text-align: right">
								<span style="font-family: 楷体; font-size: 15pt; font-weight: 600">部门:</span>
							</td>
							<td style="width: 40%;">
								<asp:DropDownList ID="ddlDepartment" runat="server" Width="180px" Height="40px"></asp:DropDownList>
							</td>
							<td style="width: 20%; text-align: right">
								<span style="font-family: 楷体; font-size: 15pt; font-weight: 600">岗位:</span>
							</td>
							<td style="width: 40%;">
								<asp:DropDownList ID="ddlJob" runat="server" Width="180px" Height="40px"></asp:DropDownList>
							</td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
		<tr>
			<td style="width: 100%" colspan="4">
				<div>
					<table >
						<tr>
							<td style="width: 20%; text-align: right">
								<span style="font-family: 楷体; font-size: 15pt; font-weight: 600">联系电话:</span>
							</td>
							<td style="width: 40%">
								<asp:TextBox ID="tbPhoneNum" runat="server" Width="180px" Height="24px"></asp:TextBox>
							</td>
							<td style="width: 20%; text-align: right">
								<span style="font-family: 楷体; font-size: 15pt; font-weight: 600">入职时间:</span>
							</td>
							<td style="width: 40%">
								<asp:TextBox ID="tbEmployTime" runat="server" Width="180px" Height="24px" OnClick="WdatePicker()"></asp:TextBox>
							</td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
		<tr>
			<td style="text-align:right; width:17%">
				<span style="font-family: 楷体; font-size: 15pt; font-weight: 600">联系地址:</span>
			</td>
			<td colspan="3">
				<asp:TextBox ID="tbContactAdress" runat="server"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td style="width: 100%" colspan="4">
				<div>
					<table style="width:100%">
						<tr>
							<td align="right" style="width: 45%;">
								<asp:Button ID="btnSave" runat="server" Text="保存" BackColor="dodgerblue" Font-Names="DengXian" ForeColor="White" Font-Size="15pt" Font-Bold="true" BorderStyle="None" Height="32px" Width="120px" OnClick="btnSave_Click" />
							</td>
							<td style="width:5%;"></td>
							<td style="width:5%;"></td>
							<td align="left" style="width: 45%;">
								<asp:Button ID="btnCancel" runat="server" Text="取消" BackColor="dodgerblue" Font-Names="DengXian" ForeColor="White" Font-Size="15pt" Font-Bold="true" BorderStyle="None" Height="32px" Width="120px" OnClick="btnCancel_Click" />
							</td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
	</table>
</div>
