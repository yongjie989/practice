<%@ Page Language="VB"%>
<%@ Import Namespace="System.Data"%>  
<%@ Import Namespace="MySql.Data.MySqlClient"%>  
<%@ Import Namespace="System.Configuration"%>
<!-- #include file="modules.aspx" -->

<!-- #include file="header.html" -->
<script type="text/javascript">
function test(){
    alert('123');
    return false;
};

</script>

<script runat="server">
Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
    Dim id,layout,act as String
    act = Request.QueryString("act")
    
    if act = "" then
        
        'id = Request.QueryString("id")
        'layout = Request.QueryString("layout")
        'Response.WriteFile("index.html")
        HelloWorldLabel.Text = "URL Query String = " & id & " " & layout
        now.Text = DateTime.Now
        system_message.InnerHtml = Server.HtmlEncode("Welcome! here is asp.net page" & SystemTime() )
        
        'template.InnerHtml = Server.HtmlEncode("<!-- #include file=\"index.html\" -->")
    end if 
    if act = "showdata" then
        
        Dim ds As DataSet
        ds = CreateDataSet("SELECT * FROM painter")
        myRepeater.DataSource = ds.Tables(0).DefaultView
        myRepeater.DataBind()
        
        'template.InnerHtml = Server.HtmlEncode("<!-- #include file=\"showdata.html\" -->")
    end if
End Sub
</script>


<!-- #include file="index.html" -->
<!-- #include file="showdata.html" -->
<!-- #include file="footer.html" -->