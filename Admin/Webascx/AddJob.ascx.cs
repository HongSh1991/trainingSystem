﻿using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Webascx_AddJob : System.Web.UI.UserControl
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if(!IsPostBack) {
			string departmentName = "select * from tb_Department";
			ddlBDepartment.DataSource = DBHelper.DBHelper.ExecuteDataTable(departmentName);
			ddlBDepartment.DataTextField = "D_DepartmentName";
			ddlBDepartment.DataValueField = "D_DepID";
			ddlBDepartment.DataBind();

			Bind();
		}
	}

	protected void btnSaveJob_Click(object sender, EventArgs e)
	{
		string postName = tbAddPost.Text.Trim().ToString();
		string ddlDepartment = ddlBDepartment.SelectedValue;
		string sqlInsertPost = "insert into tb_Job (J_PostName, J_DepID)values('" + postName + "', '" + ddlDepartment + "')";
		DBHelper.DBHelper.ExectueNonQuery(sqlInsertPost);
		Response.Write("<script>alert('岗位名称保存成功！');window.location=''</script>");
		//string jpostName = "select J_PostName from tb_Job where J_DepartmentName = @department";
		//SqlParameter[] pms = new SqlParameter[] {
		//	new SqlParameter("@department", ddlDepartment)
		//};
		//string testName = DBHelper.DBHelper.ExecuteScalar(jpostName, pms).ToString();
		//if(postName == testName) {
		//	Response.Write("<script>alert('岗位名称已存在！');window.location=''</script>");
		//}
		//else {
			
		//}
	}

	public void Bind()
	{
		string postSearch = "select * from tb_Job a, tb_Department b where a.J_DepID=b.D_DepID";
		gvPost.DataSource = DBHelper.DBHelper.ExecuteDataTable(postSearch);
		gvPost.DataKeyNames = new string[] { "J_PostID" };
		gvPost.DataBind();
	}

	protected void gvPost_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowIndex != -1)
		{
			//e.Row.Cells[0].Text = (e.Row.RowIndex + 1).ToString();

			//如果使用了分页控件且希望序号在翻页后不重新计算，使用下面方法  
			int indexID = (gvPost.PageIndex) * gvPost.PageSize + e.Row.RowIndex + 1;
			e.Row.Cells[0].Text = indexID.ToString();
		}
	}

	protected void gvPost_RowEditing(object sender, GridViewEditEventArgs e)
	{
		gvPost.EditIndex = e.NewEditIndex;
		Bind();
	}

	protected void gvPost_RowUpdating(object sender, GridViewUpdateEventArgs e)
	{
		string updateRow = "update tb_Job set J_PostName='"
			+ ((TextBox)(gvPost.Rows[e.RowIndex].Cells[1].Controls[0])).Text.ToString().Trim() + "' where J_PostID= '" + gvPost.DataKeys[e.RowIndex].Value.ToString() + "'";
		DBHelper.DBHelper.ExectueNonQuery(updateRow);
		gvPost.EditIndex = -1;
		Bind();
	}

	protected void gvPost_RowDeleting(object sender, GridViewDeleteEventArgs e)
	{
		string deleteRow = "delete from tb_Job where J_PostID='" + gvPost.DataKeys[e.RowIndex].Value.ToString() + "'";
		DBHelper.DBHelper.ExectueNonQuery(deleteRow);
		Bind();
	}

	protected void gvPost_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
	{
		gvPost.EditIndex = -1;
		Bind();
	}

	protected void gvPost_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{
		gvPost.PageIndex = e.NewPageIndex;
		Bind();
	}
}