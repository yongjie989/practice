<%@ Page Language="VB"%>
<script runat="server">
Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
    HelloWorldLabel.Text = "Hello, world!"
    now.Text = DateTime.Now
    system_message.InnerHtml = Server.HtmlEncode("Welcome! here is asp.net page" & DateTime.Now)
End Sub
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label runat="server" id="HelloWorldLabel"></asp:Label>
        <asp:Label runat="server" id="now"></asp:Label>
    </div>
    
    <div id="system_message" runat="server"></div>
    </form>
</body>
</html>