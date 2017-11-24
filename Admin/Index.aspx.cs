using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
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

		if(!IsPostBack)
		{
			Bind();
		}
	}

	protected void lbUserManager_Click(object sender, EventArgs e)
	{
		// 显示第一页
		this.mvPages.ActiveViewIndex = 0;
		this.mvPages1.ActiveViewIndex = 0;
	}

	protected void lbCourseManager_Click(object sender, EventArgs e)
	{
		// 显示第二页
		this.mvPages.ActiveViewIndex = 1;
	}

	protected void lbViewUser_Click(object sender, EventArgs e)
	{
		// 显示第一页
		this.mvPages1.ActiveViewIndex = 0;
	}

	protected void lbDepartInfo_Click(object sender, EventArgs e)
	{
		// 显示第一页
		this.mvPages1.ActiveViewIndex = 1;
	}

	protected void lbUserInfo_Click(object sender, EventArgs e)
	{
		// 显示第二页
		this.mvPages1.ActiveViewIndex = 2;
	}

	public void Bind()
	{
		string dataSearch = "select * from tb_UserInfo";
		gvUser.DataSource = DBHelper.DBHelper.ExecuteDataTable(dataSearch);
		gvUser.DataKeyNames = new string[] { "U_ID" };
		gvUser.DataBind();

		// 绑定部门、岗位
		string departmentName = "select * from tb_Department";
		DataTable dt = DBHelper.DBHelper.ExecuteDataTable(departmentName);
		string postName = "select * from tb_Job";
		DataTable dt1 = DBHelper.DBHelper.ExecuteDataTable(postName);
		if (!((dt.Rows.Count == 0) && (dt1.Rows.Count == 0)))
		{
			string departmentNameBind = "select * from tb_Department";
			ddlAddDepartment.DataSource = DBHelper.DBHelper.ExecuteDataTable(departmentNameBind);
			ddlAddDepartment.DataTextField = "D_DepartmentName";
			ddlAddDepartment.DataValueField = "D_DepID";
			ddlAddDepartment.DataBind();

			ddlAddJob.Items.Clear();
			string postNameBind = "select * from tb_Job where J_DepID = '" + ddlAddDepartment.SelectedValue + "'";
			ddlAddJob.DataSource = DBHelper.DBHelper.ExecuteDataTable(postNameBind);
			ddlAddJob.DataTextField = "J_PostName";
			ddlAddJob.DataValueField = "J_PostID";
			ddlAddJob.DataBind();
		}
	}

	protected void ddlAddDepartment_SelectedIndexChanged(object sender, EventArgs e)
	{
		string DepID = ddlAddDepartment.SelectedValue.Trim();
		if (!string.IsNullOrEmpty(DepID))
		{
			ddlAddJob.Items.Clear();
			string jobSeachDepID = "select * from tb_Job where J_DepID = '" + DepID + "'";
			ddlAddJob.DataSource = DBHelper.DBHelper.ExecuteDataTable(jobSeachDepID);
			ddlAddJob.DataTextField = "J_PostName";
			ddlAddJob.DataValueField = "J_PostID";
			ddlAddJob.DataBind();
		}
	}

	protected void btnSaveAdd_Click(object sender, EventArgs e)
	{

	}

	protected void gvUser_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowIndex != -1)
		{
			//e.Row.Cells[0].Text = (e.Row.RowIndex + 1).ToString();

			//如果使用了分页控件且希望序号在翻页后不重新计算，使用下面方法  
			int indexID = (gvUser.PageIndex) * gvUser.PageSize + e.Row.RowIndex + 1;
			e.Row.Cells[0].Text = indexID.ToString();
		}
	}
	protected void gvUser_RowEditing(object sender, GridViewEditEventArgs e)
	{
		gvUser.EditIndex = e.NewEditIndex;
		Bind();
	}

	protected void gvUser_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
	{
		gvUser.EditIndex = -1;
		Bind();
	}

	protected void gvUser_RowDeleting(object sender, GridViewDeleteEventArgs e)
	{
		string deleteRow = "delete from tb_UserInfo where U_ID='" + gvUser.DataKeys[e.RowIndex].Value.ToString() + "'";
		DBHelper.DBHelper.ExectueNonQuery(deleteRow);
		Bind();
	}

	protected void gvUser_RowUpdating(object sender, GridViewUpdateEventArgs e)
	{
		string updateRow = "update tb_UserInfo set U_UserName='"
			+ ((TextBox)(gvUser.Rows[e.RowIndex].Cells[1].Controls[0])).Text.ToString().Trim() + "' where U_ID= '" + gvUser.DataKeys[e.RowIndex].Value.ToString() + "'";
		DBHelper.DBHelper.ExectueNonQuery(updateRow);
		gvUser.EditIndex = -1;
		Bind();
	}

	protected void gvUser_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{
		gvUser.PageIndex = e.NewPageIndex;
		Bind();
	}
}