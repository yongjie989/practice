<%@ Import Namespace="System.Data"%>  
<%@ Import Namespace="MySql.Data.MySqlClient"%>  
<%@ Page Language="VB" %>  
<script runat="server">  
  
Sub Page_Load(sender As Object, e As EventArgs)  
BindData()  
End Sub  
  
Sub BindData()  
  
'*** DataSet ***'  
Dim ds As DataSet  
ds = CreateDataSet()  
myRepeater.DataSource = ds.Tables(0).DefaultView  
myRepeater.DataBind()  
  
End Sub  
  
'*** DataSet ***'  
Function CreateDataSet() As DataSet  
Dim objConn As New MySql.Data.MySqlClient.MySqlConnection  
Dim objCmd As New MySql.Data.MySqlClient.MySqlCommand  
Dim dtAdapter As New MySql.Data.MySqlClient.MySqlDataAdapter  
  
Dim ds As New DataSet  
Dim strConnString,strSQL As String  
  
strConnString = "Server=127.0.0.1;User=root; Port=3306; Password=doitwell17355602; Database=doitwell; Pooling=false"  
strSQL = "SELECT * FROM painter"  
  
objConn.ConnectionString = strConnString  
With objCmd  
.Connection = objConn  
.CommandText = strSQL  
.CommandType = CommandType.Text  
End With  
dtAdapter.SelectCommand = objCmd  
  
dtAdapter.Fill(ds)  
  
dtAdapter = Nothing  
objConn.Close()  
objConn = Nothing  
  
Return ds   '*** Return DataSet ***'  
  
End Function  
  
</script>  
<html>  
<head>  
<title>ShotDev.Com Tutorial</title>  
</head>  
<body>  
<form id="form1" runat="server">  
<asp:Repeater id="myRepeater" runat="server">  
<HeaderTemplate>  
<table border="1">  
<tr>  
<th>CustomerID</th>  
<th>Name</th>  
<th>Email</th>  
<th>CountryCode</th>  
<th>Budget</th>  
<th>Used</th>  
</tr>  
</HeaderTemplate>  
<ItemTemplate>  
<tr>  
<td align="center"><%#Container.DataItem("CustomerID") %></td>  
<td><%#Container.DataItem("Name") %></td>  
<td><%#Container.DataItem("Email") %></td>  
<td align="center"><%#Container.DataItem("CountryCode") %></td>  
<td align="right"><%#Container.DataItem("Budget") %></td>  
<td align="right"><%#Container.DataItem("Used") %></td>  
</tr>  
</ItemTemplate>  
</asp:Repeater>  
</form>  
</body>  
</html>  