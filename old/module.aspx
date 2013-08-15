<%@ Page Language="VB"%>
<script runat="server">
Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
    HelloWorldLabel.Text = "Hello, world!"
    now.Text = DateTime.Now
    system_message.InnerHtml = Server.HtmlEncode("Welcome! here is asp.net page" & DateTime.Now)
End Sub
</script>
