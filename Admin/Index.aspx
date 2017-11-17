<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Admin_Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title style="text-align:center">管理员，欢迎您！</title>
	<style type="text/css">
		.button{
			cursor:pointer;
		}
	</style>
</head>
<body style="margin: auto">
	<form id="form1" runat="server">
		<div style="height: 10%; background-color: dodgerblue;">
			<table style="width: 100%;">
				<tr style="height: 20px;"></tr>
				<tr>
					<td style="width: 2%;"></td>
					<td align="left" style="width: 58%; text-align: left; vertical-align: middle">
						<span style="font-family: DengXian; font-size: xx-large; font-weight: 600; color: white">煤矿应急救援培训系统</span>
					</td>
					<td align="right" style="width: 38%;">
						<%--<img alt="" src="../Resources/Admin/images/exit.svg" align="absmiddle" />--%>
						<asp:Button ID="Button1" runat="server" Text="退出系统" BackColor="dodgerblue" Font-Names="DengXian" ForeColor="White" Font-Size="15pt" Font-Bold="true" BorderStyle="Dotted" Height="28" CssClass="button" OnClick="btnExit_Click"/>
					</td>
					<td style="width: 2%;"></td>
				</tr>
				<tr style="height: 20px;"></tr>
			</table>
		</div>
		<div style="height: 6%; background-color:lightgray;">
			<table style="width: 100%;" cellspadding="0" rowspadding="0">
				<tr style="height: 10px;"></tr>
				<tr>
					<td style="width: 6%;"></td>
					<td align="left" style="width: 54%; text-align: left; vertical-align: middle">
						<span style="font-family: DengXian; font-size: x-large; font-weight:bolder; color:saddlebrown">进入培训系统</span>
					</td>
					<td align="right" style="width: 26%;">
						<a href="#" style="text-decoration: none">
							<span style="font-family:DengXian; font-size:15pt; font-weight:600; color:saddlebrown">任务管理</span>
						</a>
					</td>
					<td style="width:1%"></td>
					<td align="left" style="width: 9%;">
						<a href="#" style="text-decoration: none">
							<span style="font-family:DengXian; font-size:15pt; font-weight:600; color:saddlebrown">人员管理</span>
						</a>
					</td>
					<td style="width: 4%;"></td>
				</tr>
				<tr style="height: 10px;"></tr>
			</table>
		</div>
		<div style="height:84%">
			<table style="height:100%;width:100%">
				<tr>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>
