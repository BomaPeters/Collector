Imports Newtonsoft.Json
Imports System.Net
Imports System.Data.SqlClient
Public Class WebForm2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Label1.Text = LoadBalance("X4QQdTe8E")
        'Label2.Text = GetTotalDeduction("X4QQdTe8E")
        Session.Item("CID") = "aDZdRMWbU" ' "ZDRT6M6L7" '"bTO8PEfFL" ' '
    End Sub
    'Public Function LoadBalance(ByVal collectionid As String) As String
    '    Dim balance As String = 0
    '    Try
    '        Dim CNN As SqlConnection = New SqlConnection
    '        CNN.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("kpolomDUMMYConnectionString").ConnectionString

    '        CNN.Open()

    '        Dim CMD As SqlCommand = New SqlCommand
    '        CMD.CommandText = "SELECT TOP (1) CollectionID, TransDate, Deposit, Withdrawal, Balance, TimeOfTrans FROM  Collection_Log WHERE  CollectionID='" & collectionid & "'ORDER BY TimeOfTrans DESC"


    '        CMD.Connection = CNN
    '        Dim da As SqlDataAdapter = New SqlDataAdapter()
    '        da.SelectCommand = CMD
    '        Dim ds As Data.DataSet = New Data.DataSet()
    '        da.Fill(ds, "Collection_Log")
    '        ' Dim CB As SqlCommand = New SqlCommand()
    '        Dim myreader As SqlDataReader
    '        myreader = CMD.ExecuteReader

    '        myreader.Read()
    '        If myreader.HasRows Then
    '            balance = myreader.GetValue(4).ToString()
    '            ' balance(1) = myreader.GetValue(3).ToString()
    '            ' Session.Item("balance") = balance
    '            '+ CInt(AmtHolder.InnerHtml)
    '        Else
    '            'TextBox1.Text = String.Empty
    '            balance = 0
    '            ' balance(1) = 0
    '        End If

    '        myreader.Close()

    '        CNN.Close()
    '    Catch ex As Exception
    '        Response.Write(ex.Message)
    '    End Try
    '    Return balance
    'End Function
    Public Function GetTotalDeduction(ByVal collectionid As String) As String
        Dim balance As String = 0
        Try
            Dim CNN As SqlConnection = New SqlConnection
            CNN.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("kpolomDUMMYConnectionString").ConnectionString

            CNN.Open()

            Dim CMD As SqlCommand = New SqlCommand
            CMD.CommandText = "SELECT SUM(Withdrawal) as total FROM  Collection_Log WHERE  CollectionID='" & collectionid & "'"


            CMD.Connection = CNN
            Dim da As SqlDataAdapter = New SqlDataAdapter()
            da.SelectCommand = CMD
            Dim ds As Data.DataSet = New Data.DataSet()
            da.Fill(ds, "Collection_Log")
            ' Dim CB As SqlCommand = New SqlCommand()
            Dim myreader As SqlDataReader
            myreader = CMD.ExecuteReader

            myreader.Read()
            If myreader.HasRows Then
                balance = Val(myreader.GetValue(0).ToString())

            Else
                'TextBox1.Text = String.Empty
                balance = 0
                ' balance(1) = 0
            End If

            myreader.Close()

            CNN.Close()
        Catch ex As Exception
            Response.Write(ex.Message)
            '  ClientScript.RegisterStartupScript(Me.GetType(), "validation", "alert(""" & ex.Message & """);", True)
            '  ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert(""" & ex.Message & """);window.location='Error.aspx';", True)

        End Try
        Return balance
    End Function
    Public Class NubanVerifier
        Public Property account_number As String
        Public Property account_name As String
        Public Property Bank_name As String
        Public Property bank_code As String
        Public Property requests As String
        Public Property execution_time As String
        Public Property status As String
    End Class
    Public Function getAccountName(ByVal bankcode As String, ByVal accountnumber As String)
        Dim Returner As String = String.Empty
        Dim url As String = String.Format("https://maylancer.org/api/nuban/api.php?account_number={0}&bank_code={1}", accountnumber, bankcode)
        Using client As New WebClient()
            Dim json As String = client.DownloadString(url)

            Dim result As NubanVerifier = (JsonConvert).DeserializeObject(Of NubanVerifier)(json)
                If result.status.Contains("Account number resolved") Then
                    Returner = result.account_name.ToString
                ElseIf result.status.Contains("error") Then
                    Returner = "NO NAME"
                End If

        End Using
        Return Returner
    End Function

    'Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
    '    '' Label1.Text = getAccountName("012", "2007838509")
    '    ' createcollection()
    '    'Dim texter As String = ""
    '    'texter = texter.Replace("<", "&lt;").Replace(">", "&gt;")
    '    '' texter = 
    '    'Label1.Text = texter
    '    If TextBox1.Text = "" Then
    '        Label1.Text = "empty"
    '    Else
    '        Label1.Text = "Something inside"
    '    End If
    '    Button1.Text = "CLICKED"
    'End Sub
    'Public Sub createcollection()
    '    Dim s As String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz"
    '    Dim r As New Random

    '    Dim sb As New System.Text.StringBuilder
    '    For i As Integer = 1 To 9
    '        Dim idx As Integer = r.Next(0, 45)
    '        sb.Append(s.Substring(idx, 1))


    '    Next
    '    Dim CNN As SqlConnection = New SqlConnection
    '    CNN.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("kpolomDUMMYConnectionString").ConnectionString

    '    CNN.Open()

    '    Dim CMD As SqlCommand = New SqlCommand
    '    CMD.CommandText = "SELECT * FROM  Collection_Details"


    '    CMD.Connection = CNN
    '    Dim da As SqlDataAdapter = New SqlDataAdapter()
    '    da.SelectCommand = CMD
    '    Dim ds As Data.DataSet = New Data.DataSet()
    '    da.Fill(ds, "Collection_Details")
    '    Dim CB As SqlCommandBuilder = New SqlCommandBuilder(da)
    '    Dim drow As Data.DataRow = ds.Tables("Collection_Details").NewRow


    '    drow("userID") = "ZZSSSDDD"
    '    ' drow("TransDate") = DateTime.Now.ToString("dd-MMM-yyyy")
    '    Session.Item("collectionhold") = sb.ToString
    '    drow("CollectionID") = Session.Item("collectionhold").ToString
    '    drow("Collection_Name") = "HTML TEST"
    '    Dim texter As String = TextBox1.Text
    '    texter = texter.Replace("<", "&lt;")
    '    texter = texter.Replace(">", "&gt;")
    '    drow("Collection_Desc") = Server.HtmlEncode(TextBox1.Text)
    '    'TextBox6.Text = TextBox6.Text.replaceAll("<", "&lt;")
    '    'TextBox6.Text = TextBox6.Text.replaceAll(">", "&gt;")
    '    drow("Receiver_Acct_Number") = "2007838509"

    '    drow("Receiver_Bank_Name") = "FBN"
    '    drow("Receiver_Name") = "JOHN DOE"
    '    drow("DueDate") = DateTime.Now
    '    drow("CreatedDate") = DateTime.Now

    '    drow("Goal") = "67777"


    '        drow("Status") = "UNPAID"
    '    drow("CashOutDate") = DateTime.Now
    '    drow("Profile_Pic_Link") = "/img/koko.jpg"
    '    drow("ShareCount") = 0
    '    drow("Category") = "Emergency"
    '    drow("PaidDate") = DateTime.Now
    '    ds.Tables("Collection_Details").Rows.Add(drow)
    '    da.Update(ds, "Collection_Details")
    '    CNN.Close()

    '    '  ClientScript.RegisterStartupScript([GetType](), "alert", (Convert.ToString("alert('") & "Collection has been successfully created.") + "');", True)
    '    ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert('Collection has been successfully been created.');" + String.Format("window.location='../share.aspx?collectionid={0}';", Session.Item("collectionhold").ToString), True)
    'End Sub

    'Private Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
    '    If e.Row.RowType = DataControlRowType.DataRow Then
    '        Dim Raised As HtmlGenericControl = CType(e.Row.FindControl("Raised"), HtmlGenericControl)
    '        Dim Deducted As HtmlGenericControl = CType(e.Row.FindControl("Deducted"), HtmlGenericControl)
    '        Dim label1 As Label = CType(e.Row.FindControl("Label1"), Label)
    '        Dim collectionID As HtmlGenericControl = CType(e.Row.FindControl("collectionID"), HtmlGenericControl)
    '        Dim raisedhold As Double = GetTotalDeduction(collectionID.InnerHtml)
    '        Dim loadhold As Double = LoadBalance(collectionID.InnerHtml)
    '        Raised.InnerHtml = raisedhold + loadhold
    '        Deducted.InnerHtml = "₦" & String.Format("{0:#,##0.##}", raisedhold)
    '        label1.Text = "₦" & String.Format("{0:#,##0.##}", loadhold)
    '    End If
    'End Sub
    Private Sub Repeater1_ItemDataBound(sender As Object, e As RepeaterItemEventArgs) Handles Repeater1.ItemDataBound
        Dim collectorIDHold As HiddenField = CType(e.Item.FindControl("HiddenField1"), HiddenField)
        Dim hyperhold As HyperLink = CType(e.Item.FindControl("HyperLink1"), HyperLink)
        hyperhold.NavigateUrl = Request.Url.AbsoluteUri.Replace(Request.Url.PathAndQuery, "/") & "share.aspx?collectionid=" & Trim(collectorIDHold.Value)

        Dim hyperholddonate As HyperLink = CType(e.Item.FindControl("HyperLink2"), HyperLink)
        hyperholddonate.NavigateUrl = Request.Url.AbsoluteUri.Replace(Request.Url.PathAndQuery, "/") & "share.aspx?collectionid=" & Trim(collectorIDHold.Value)
        Dim loadbalance As HtmlGenericControl = CType(e.Item.FindControl("loadbalance"), HtmlGenericControl)
        If loadbalance.InnerHtml.Contains("₦0 ") Then
            loadbalance.InnerHtml = "Please Donate"


        End If
    End Sub

    Public Function GetActiveClass(ByVal itemindex As Integer) As String
        If itemindex = 0 Then
            Return "active"
        Else
            Return ""
        End If

    End Function
    Public Function LoadBalance(ByVal collectionid As String) As Double

        Dim balance As Integer = 0
        Try
            Dim CNN As SqlConnection = New SqlConnection
            CNN.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("kpolomDUMMYConnectionString").ConnectionString

            CNN.Open()

            Dim CMD As SqlCommand = New SqlCommand
            CMD.CommandText = "SELECT TOP (1) CollectionID, TransDate, Deposit, Withdrawal, Balance, TimeOfTrans FROM  Collection_Log WHERE  CollectionID='" & collectionid & "'ORDER BY TimeOfTrans DESC"


            CMD.Connection = CNN
            Dim da As SqlDataAdapter = New SqlDataAdapter()
            da.SelectCommand = CMD
            Dim ds As Data.DataSet = New Data.DataSet()
            da.Fill(ds, "Collection_Log")
            ' Dim CB As SqlCommand = New SqlCommand()
            Dim myreader As SqlDataReader
            myreader = CMD.ExecuteReader

            myreader.Read()
            If myreader.HasRows Then
                balance = myreader.GetValue(4).ToString()
                ' Session.Item("balance") = balance
                '+ CInt(AmtHolder.InnerHtml)
            Else
                'TextBox1.Text = String.Empty
                balance = 0

            End If

            myreader.Close()

            CNN.Close()
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
        Return balance
    End Function
End Class