<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="LoginPages_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>用户登录</title>
	<link rel="stylesheet" href='http://fonts.googleapis.com/css?family=PT+Sans:400,700' />
	<link rel="stylesheet" href="../Resources/LoginRe/css/reset.css" />
	<link rel="stylesheet" href="../Resources/LoginRe/css/supersized.css" />
	<link rel="stylesheet" href="../Resources/LoginRe/css/style.css" />
</head>
<body>
	<div class="page-container">
		<h1 style="text-align:center; color:white">用户登录</h1>
		<form id="form1" runat="server" name=".ASPXAUTH">
			<div>
				<asp:TextBox ID="tbUserName" runat="server"></asp:TextBox>
				<asp:TextBox ID="tbPassword" runat="server" TextMode="Password"></asp:TextBox>
			</div>
			<asp:Button ID="btnLogin" runat="server" CssClass="button" Text="登&nbsp;&nbsp;&nbsp;&nbsp;录" Font-Bold="true" Font-Size="Large" OnClick="btnLogin_Click" />
			<asp:Button ID="btnReset" runat="server" CssClass="button" Text="重&nbsp;&nbsp;&nbsp;&nbsp;置" Font-Bold="true" Font-Size="Large" OnClick="btnReset_Click" />
		</form>
	</div>

	<!-- Javascript -->
	<script src="../Resources/LoginRe/js/jquery-1.8.2.min.js"></script>
	<script src="../Resources/LoginRe/js/supersized.3.2.7.min.js"></script>
	<script src="../Resources/LoginRe/js/supersized-init.js"></script>
	<script src="../Resources/LoginRe/js/scripts.js"></script>
</body>
</html>