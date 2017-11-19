using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Index : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if(Session["UserName"] == null) {
			Response.Write("<script languge='javascript'>alert('请先登录！');window.location.href='../LoginPages/Login.aspx'</script>");
		}
		else if(Session["UserName"].ToString() == "admin") {
			string chineseName = "select U_ChineseName from tb_UserInfo where U_UserName = @username";
			SqlParameter[] pms = new SqlParameter[] {
				new SqlParameter("@username", Session["UserName"].ToString())
			};
			string name = DBHelper.DBHelper.ExecuteScalar(chineseName, pms).ToString();
			lbTips.Text = name + "，欢迎您！";
		}
	}

	protected void lbExit_Click(object sender, EventArgs e)
	{
		Session.Clear();
		Session.Abandon();
		this.Response.Redirect("../LoginPages/Login.aspx"); // 退出并跳转到登录页
	}

	protected void lbUserManager_Click(object sender, EventArgs e)
	{
		// 显示第一页
		this.mvPages.ActiveViewIndex = 0;
	}

	protected void lbCourseManager_Click(object sender, EventArgs e)
	{
		// 显示第二页
		this.mvPages.ActiveViewIndex = 1;
	}

	protected void btnOrgContent_Click(object sender, EventArgs e)
	{
		
	}

	protected void btnUserInfo_Click(object sender, EventArgs e)
	{
		
	}

	protected void btnSave_Click(object sender, EventArgs e)
	{

	}

	protected void btnCancel_Click(object sender, EventArgs e)
	{

	}
}