using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Newtonsoft.Json;

public partial class MemberAdmin : System.Web.UI.Page
{
    public string session_name;
    public string json;
    protected void Page_Load(object sender, EventArgs e)
    {
        /*
        if(Session["user_name"] == null){
            Response.Redirect("Login.aspx");
        };
        */
        
        //this.session_name = "¶¶°Õ";
        
        DataTable dt;
        string cmdSql = string.Format("SELECT * FROM {0}", ComSQL.TABLE_MEMBER);
        dt = MySqlDbAccess.ExcuteQueryData(cmdSql, false);
        this.json = JsonConvert.SerializeObject(dt.Rows[0]);
        
        //Response.Write(dt.Rows[0]["user_name"]);
        //Response.Write(this.json );
        
        /*
        clsMember m = new clsMember();
        m.user_name = this.session_name;
        dt = ComSQL.Member_ExistAccount(m);
        Response.Write(dt.Rows.Count);
        */
    }
}