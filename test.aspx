<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title></title>
</head>
<body>
	<form id="form1" runat="server">
		<div>
			<div id="test1" style="margin-top: 24px; margin-left: 100px;">
				<div class="layui-form-item">
					<label style="text-align: right">机构名称:</label>
					<div >
						<asp:TextBox ID="tbOrgName" runat="server" required lay-verify="required" placeholder="请输入机构名称" autocomplete="off" ></asp:TextBox>
					</div>
				</div>
				<div >
					<div style="margin-right: 100px">
						<div align="left">
							<asp:Button ID="btnSaveOrgContent" runat="server" Text="保存机构名称" />
						</div>
					</div>
				</div>
				<div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
