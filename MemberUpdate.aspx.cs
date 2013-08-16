using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class MemberUpdate : System.Web.UI.Page
{
    public string session_name;
    //ComSQL cl = new ComSQL();

    protected void Page_Load(object sender, EventArgs e)
    {
        /*
        if(Session["user_name"] == null){
            Response.Redirect("MemberLogin.aspx");
        };
        */
        this.session_name = "¶¶°Õ";
        /*
        DataTable dt;
        this.session_name = "¶¶°Õ";
        clsMember m = new clsMember();
        m.user_name = this.session_name;
        dt = ComSQL.Member_ExistAccount(m);
        Response.Write(dt.Rows.Count);
        */
    }
}