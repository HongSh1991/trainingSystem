﻿using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class Admin_Webascx_AddDepartment : System.Web.UI.UserControl
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if(!IsPostBack) {
			// 绑定数据至DDL
			string orgName = "select * from tb_OrgContent";
			ddlBOrgContent.DataSource = DBHelper.DBHelper.ExecuteDataTable(orgName);
			ddlBOrgContent.DataTextField = "O_OrgName";
			ddlBOrgContent.DataValueField = "O_OrgID";
			ddlBOrgContent.DataBind();

			Bind();
		}
	}

	protected void btnSaveDe_Click(object sender, EventArgs e)
	{
		string val = tbAddDepartment.Text.Trim().ToString();
		string val1 = ddlBOrgContent.SelectedValue;
		string sqlInsertOrg = "insert into tb_Department(D_DepartmentName, D_OrgID)values('" + val + "', '" + val1 + "')";
		DBHelper.DBHelper.ExectueNonQuery(sqlInsertOrg);
		Response.Write("<script>alert('部门名称保存成功！');window.location=''</script>");
		//string departmentName = "select D_DepartmenName from tb_Department where D_OrgName = @orgName";
		//SqlParameter[] pms = new SqlParameter[] {
		//	new SqlParameter("@orgName", val1)
		//};
		//string dName = DBHelper.DBHelper.ExecuteScalar(departmentName, pms).ToString();
		//if (val == dName)
		//{
		//	Response.Write("<script>alert('部门名称已存在！');window.location=''</script>");
		//}
		//else
		//{
		//	string sqlInsertOrg = "insert into tb_Department(D_DepartmenName, D_OrgName)values('" + val + "', '" + val1 + "')";
		//	DBHelper.DBHelper.ExectueNonQuery(sqlInsertOrg);
		//	Response.Write("<script>alert('部门名称保存成功！');window.location=''</script>");
		//}
	}

	public void Bind()
	{
		string dataSearch = "select * from tb_Department a, tb_OrgContent b where a.D_OrgID=b.O_OrgID";
		gvDepartment.DataSource = DBHelper.DBHelper.ExecuteDataTable(dataSearch);
		gvDepartment.DataKeyNames = new string[] { "D_DepID" };
		gvDepartment.DataBind();
	}

	protected void gvDepartment_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowIndex != -1)
		{
			//e.Row.Cells[0].Text = (e.Row.RowIndex + 1).ToString();

			//如果使用了分页控件且希望序号在翻页后不重新计算，使用下面方法  
			int indexID = (gvDepartment.PageIndex) * gvDepartment.PageSize + e.Row.RowIndex + 1;
			e.Row.Cells[0].Text = indexID.ToString();
		}
	}

	protected void gvDepartment_RowEditing(object sender, GridViewEditEventArgs e)
	{
		gvDepartment.EditIndex = e.NewEditIndex;
		Bind();
	}

	protected void gvDepartment_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
	{
		gvDepartment.EditIndex = -1;
		Bind();
	}

	protected void gvDepartment_RowDeleting(object sender, GridViewDeleteEventArgs e)
	{
		string deleteRow = "delete from tb_Department where D_DepID='" + gvDepartment.DataKeys[e.RowIndex].Value.ToString() + "'";
		DBHelper.DBHelper.ExectueNonQuery(deleteRow);
		Bind();
	}

	protected void gvDepartment_RowUpdating(object sender, GridViewUpdateEventArgs e)
	{
		string updateRow = "update tb_Department set D_DepartmentName='"
			+ ((TextBox)(gvDepartment.Rows[e.RowIndex].Cells[1].Controls[0])).Text.ToString().Trim() + "' where D_DepID= '" + gvDepartment.DataKeys[e.RowIndex].Value.ToString() + "'";
		DBHelper.DBHelper.ExectueNonQuery(updateRow);
		gvDepartment.EditIndex = -1;
		Bind();
	}

	protected void gvDepartment_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{
		gvDepartment.PageIndex = e.NewPageIndex;
		Bind();
	}
}