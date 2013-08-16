using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class testdb : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        clsMember m = new clsMember();
        m.user_name ="test";
        ComSQL.Member_ExistAccount(m);
    }
}