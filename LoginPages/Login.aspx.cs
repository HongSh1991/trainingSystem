using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LoginPages_Login : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}

	protected void btnLogin_Click(object sender, EventArgs e)
	{
		string userName = tbUserName.Text.Trim();
		string passWord = tbPassword.Text.Trim();
		//SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["conStr"]);
		SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
		con.Open();
		string sqlSelect = "select count(*) from tb_UserInfo where U_UserName = '" + userName + "' and U_Password='" + passWord + "'";
		SqlCommand com = new SqlCommand(sqlSelect, con);
		if(Convert.ToInt32(com.ExecuteScalar())>0) {
			Response.Redirect("../Admin/Index.aspx");
		}
	}

	protected void btnReset_Click(object sender, EventArgs e)
	{
		tbUserName.Text = "";
		tbPassword.Text = "";
	}
}