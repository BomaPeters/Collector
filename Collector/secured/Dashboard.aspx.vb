Imports System.Data.SqlClient
Public Class Dashboard
    Inherits System.Web.UI.Page
    Dim M As Decimal
    Dim d As Decimal
    Dim f As Decimal
    Dim G As Integer
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        '  Session.Item("CID") = "aDZdRMWbU " '"bTO8PEfFL"
        'Session.Item("LoginType") = "COLLECTOR"
    End Sub

    Private Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            ''Hyperlink Code
            Dim typehold As HtmlGenericControl = CType(e.Row.FindControl("typehold"), HtmlGenericControl)
            Dim collectorIDHold As String = TryCast(e.Row.FindControl("B3"), HtmlGenericControl).InnerHtml
            Dim hyperhold As HyperLink = CType(e.Row.FindControl("HyperLink1"), HyperLink)

            If typehold.InnerHtml = "COLLECTION" Then
                hyperhold.NavigateUrl = Request.Url.AbsoluteUri.Replace(Request.Url.PathAndQuery, "/") & "share.aspx?collectionid=" & Trim(collectorIDHold)

            Else
                hyperhold.NavigateUrl = Request.Url.AbsoluteUri.Replace(Request.Url.PathAndQuery, "/") & "dues.aspx?collectionid=" & Trim(collectorIDHold)

            End If
            ''End Hyperlink Code


            Dim duedateholder As HtmlGenericControl = CType(e.Row.FindControl("duedate"), HtmlGenericControl)
            'Dim Cashoutbtn As LinkButton = CType(e.Row.FindControl("LinkButton2"), LinkButton)
            'rangehold.Style.Add("width", Math.Round(getpercentofnumber(loadholder.InnerHtml, Val(goalholder.InnerHtml))).ToString & "%")




            '''''datecalc
            If Today.Date > CDate(duedateholder.InnerHtml) Then
                duedateholder.InnerHtml = " <i class='fa fa-times-circle'></i> EXPIRED"
                duedateholder.Attributes.Add("class", "badge badge-danger p-2")
            End If


            '''''enddatecalc


            '''''''''

            Dim statushold As HtmlGenericControl = CType(e.Row.FindControl("statushold"), HtmlGenericControl)
            If statushold.InnerHtml.Contains("UNPAID") Then
                statushold.InnerHtml = " <i class='fa fa-times-circle'></i> UNPAID"
                statushold.Attributes.Add("class", "badge bg-warning p-2")
                '  Cashoutbtn.Enabled = True


            ElseIf statushold.InnerHtml.Contains("PROCESSING") Then
                statushold.InnerHtml = " <i class='fa fa-check-circle'></i> PROCESSING"
                statushold.Attributes.Add("class", "badge badge-primary p-2 ")


            Else
                statushold.InnerHtml = " <i class='fa fa-check-circle'></i> PAID"
                statushold.Attributes.Add("class", "badge bg-success fa-inverse p-2")
                'Cashoutbtn.Enabled = False

            End If
            '        '''''
        End If
    End Sub

    Private Sub SqlDataSource1_Selected(sender As Object, e As SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Selected
        If e.AffectedRows <= 0 Then
            notable.Visible = True
        Else
            notable.Visible = False
            ' collectionscount.InnerHtml = e.AffectedRows.ToString
        End If
    End Sub

    Private Sub GridView2_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView2.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim loadholder As HtmlGenericControl = CType(e.Row.FindControl("B1"), HtmlGenericControl)

            M += CDec(loadholder.InnerHtml)
            totalcollected.InnerHtml = "₦" & String.Format("{0:#,##0.##}", M)

            Dim countdonations As HtmlGenericControl = CType(e.Row.FindControl("B2"), HtmlGenericControl)
            d += CDec(countdonations.InnerHtml)
            donationcnt.InnerHtml = d

            Dim countdues As HtmlGenericControl = CType(e.Row.FindControl("B3"), HtmlGenericControl)
            If countdues.InnerHtml.Contains("DUES") Then
                f += 1
            Else
                G += 1
            End If
            duesCount.InnerHtml = f
            collectionscount.InnerHtml = G
        End If
    End Sub

    Private Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridView1.RowCommand
        'If e.CommandName = "Viewer" Then
        '    ' String.Format("window.location='../share.aspx?collectionid={0}';", Session.Item("collectionhold").ToString)
        '    Dim row As GridViewRow = CType(((CType(e.CommandSource, Control)).NamingContainer), GridViewRow)
        '    Dim RowIndex As Integer = row.RowIndex
        '    Dim collectorIDHold As String = TryCast(row.FindControl("B3"), HtmlGenericControl).InnerHtml
        '    Label1.Text = Request.Url.AbsoluteUri.Replace(Request.Url.PathAndQuery, "/") & "share.aspx?collectionid=" & Trim(collectorIDHold)
        '    Response.Redirect(Request.Url.AbsoluteUri.Replace(Request.Url.PathAndQuery, "/") & "share.aspx?collectionid=" & Trim(collectorIDHold))
        'End If
    End Sub

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
    Public Function Countdonations(ByVal collectionid As String)
        Dim returner As Integer = 0

        Dim CNNr As SqlConnection = New SqlConnection
        CNNr.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("kpolomDUMMYConnectionString").ConnectionString

        CNNr.Open()

        Dim CMDe As SqlCommand = New SqlCommand
        CMDe.CommandText = "SELECT COUNT( * ) as counter FROM [Collection_Log] INNER JOIN Donor_Details ON Collection_Log.TransID= Donor_Details.TransID WHERE (Collection_Log.[CollectionID] =@CollectionID )" '' DID NOT HAVE PLACEMENT ID BEFORE

        CMDe.Parameters.AddWithValue("@CollectionID", collectionid)

        'CMDe.Parameters.AddWithValue("@StillValid", 1)
        CMDe.Connection = CNNr
        Dim dae As SqlDataAdapter = New SqlDataAdapter()
        dae.SelectCommand = CMDe
        Dim dse As DataSet = New DataSet()
        dae.Fill(dse, "Collection_Log")


        Dim reader As SqlDataReader = CMDe.ExecuteReader()
        reader.Read()
        If reader.HasRows Then
            Dim counter As Integer = reader.GetValue(0).ToString()

            If String.IsNullOrEmpty(counter) Then
                '    commentcounter.InnerHtml = "0"
                '    ' contrideposit.InnerHtml = "₦0.0"
                returner = 0
            Else
                returner = counter
            End If
            '    If counter >= 1000000 Then
            '        commentcounter.InnerHtml = (counter / 1000000).ToString("0.##") + "M"
            '    ElseIf counter >= 100000 Then
            '        commentcounter.InnerHtml = (counter / 1000).ToString("0.##") + "K"
            '    ElseIf counter >= 10000 Then
            '        commentcounter.InnerHtml = (counter / 1000).ToString("0.##") + "K"
            '    ElseIf counter >= 1000 Then
            '        commentcounter.InnerHtml = (counter / 1000).ToString("0.##") + "K"
            '    ElseIf counter <= 0 Then
            '        commentcounter.InnerHtml = "0"
            '    Else
            '        commentcounter.InnerHtml = counter
            '    End If
            'commentcounter.InnerHtml = Val(counter)
            ' contrideposit.InnerHtml = String.Format("₦{0:#,##0.##}", CSng(Val(alldeposits)))
            'End If

            'Else
            '    commentcounter.InnerHtml = "0.00"

        End If
        reader.Close()
        CNNr.Close()
        Return returner

    End Function
End Class