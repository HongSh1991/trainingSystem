using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Index : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if(Session["UserName"].ToString() == "admin") {
			lbTips.Text = "系统操作员，欢迎您！";
		}
	}

	protected void btnExit_Click(object sender, EventArgs e)
	{
		Session.Clear();
		Session.Abandon();
		this.Response.Redirect("../LoginPages/Login.aspx");
	}
}