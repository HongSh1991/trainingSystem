using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Resources_UploadImages : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		HttpFileCollection files = Request.Files;//这里只能用<input type="file" />才能有效果,因为服务器控件是HttpInputFile类型

		string imgsize = string.Empty;
		string error = string.Empty;
		string FileNames = string.Empty;
		string TrueFileNames = string.Empty;
		string imgurl = string.Empty;
		string str = string.Empty;
		if (files.Count > 0)
		{
			long fileSize = 0;
			fileSize = files[0].ContentLength;
			string PicSizeVar = "1024";
			//上传图片是否已超过了一个限定的值
			if (fileSize > long.Parse(PicSizeVar) * 1024)
			{
				error = "图片超过1M，请重新上传";
			}
			else
			{
				double dbsize = Convert.ToDouble(fileSize) / 1024;
				imgsize = dbsize.ToString("0.00") + "KB";
				//获取上传文件的名称  
				string s = files[0].FileName.Replace(" ", "");
				//截取获得上传文件的名称(ie上传会把绝对路径也连带上，这里只得到文件的名称)  
				str = s.Substring(s.LastIndexOf("\\") + 1);
				FileNames = str;
				Random r = new Random();
				str = DateTime.Now.ToString("yyyyMMddHHmmss") + "_" + r.Next(1000).ToString() + "_" + str;//重命名文件，保证每个文件的名称都是唯一的
				TrueFileNames = str;
				string path = "~Resources/upload/" + str;
				files[0].SaveAs(Server.MapPath(path));
				imgurl = @"Resources/upload/" + str;
			}
			/*
			 *error:错误信息
			 *imgsize文件大小 
			 *imgurl图片真实地址
			 *FileNames文件重命名后的名字
			 *TrueFileNames真实的文件名称
			 */
			string res = "{ \"error\":\"" + error + "\", \"imgsize\":\"" + imgsize + "\",\"imgurl\":\"" + imgurl + "\",\"FileNames\":\"" + FileNames + "\",\"TrueFileNames\":\"" + TrueFileNames + "\"}";

			Response.Write(res);
			Response.End();
		}
	}
}