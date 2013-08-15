<script runat="server">


Public Function SystemTime() as DateTime
    return DateTime.Now
End Function

Public Function CreateDataSet(ByVal strSQL as String) As DataSet
    Dim ds As New DataSet
    Dim objConn As New MySql.Data.MySqlClient.MySqlConnection
    Dim objCmd As New MySql.Data.MySqlClient.MySqlCommand
    Dim dtAdapter As New MySql.Data.MySqlClient.MySqlDataAdapter
    objConn.ConnectionString = ConfigurationManager.ConnectionStrings("dbconn").ConnectionString.ToString()
    
    With objCmd
        .Connection = objConn
        .CommandText = strSQL
        .CommandType = CommandType.Text
    End With
    dtAdapter.SelectCommand = objCmd

    dtAdapter.Fill(ds)
    
    objConn.Close()
    objConn = Nothing
    dtAdapter = Nothing

    return ds

End Function

</script>
