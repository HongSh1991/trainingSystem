using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class LoginPages_Login : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		
	}

	protected void btnLogin_Click(object sender, EventArgs e)
	{
		string userName = tbUserName.Text.Trim();
		string passWord = tbPassword.Text.Trim();
		if (userName == "")
		{
			Response.Write("<script languge='javascript'>alert('请填写用户名！！！');</script>");
		}
		else if (passWord == "")
		{
			Response.Write("<script languge='javascript'>alert('请填写密码！！！');</script>");
		}
		else if(userName!=""&&passWord!="") {
			//SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["conStr"]);
			SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
			con.Open();
			string sqlSelect = "select count(*) from tb_UserInfo where U_UserName = '" + userName + "' and U_PassWord='" + passWord + "'";
			SqlCommand com = new SqlCommand(sqlSelect, con);
			if (Convert.ToInt32(com.ExecuteScalar()) > 0)
			{
				Session["UserName"] = tbUserName.Text.Trim();
				Session.Timeout = 200;
				Response.Redirect("../Admin/Index.aspx");
			}
			else
			{
				Response.Write("<script languge='javascript'>alert('用户名或密码错误！');</script>");
			}
		}
	}

	protected void btnReset_Click(object sender, EventArgs e)
	{
		tbUserName.Text = "";
		tbPassword.Text = "";
	}
}