Imports System.Data.SqlClient
Imports System.Data
Public Class collections
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub LinkButton2_Click(sender As Object, e As EventArgs) Handles LinkButton2.Click
        GridView1.DataSourceID = SqlDataSource1.ID
        GridView1.DataBind()
    End Sub

    Private Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim rangehold As HtmlGenericControl = CType(e.Row.FindControl("rangeholder"), HtmlGenericControl)
            Dim goalholder As HtmlGenericControl = CType(e.Row.FindControl("goalholder"), HtmlGenericControl)
            Dim loadholder As HtmlGenericControl = CType(e.Row.FindControl("loadbalance"), HtmlGenericControl)
            Dim duedateholder As HtmlGenericControl = CType(e.Row.FindControl("duedate"), HtmlGenericControl)
            Dim Cashoutbtn As LinkButton = CType(e.Row.FindControl("LinkButton2"), LinkButton)
            '  Dim label2 As Label = CType(e.Row.FindControl("Label2"), Label)
            rangehold.Style.Add("width", Math.Round(getpercentofnumber(loadholder.InnerHtml, Val(goalholder.InnerHtml))).ToString & "%")


            ''''datecalc

            If Today.Date > CDate(duedateholder.InnerHtml) Then
                duedateholder.InnerHtml = " <i class='fa fa-times-circle'></i> EXPIRED"
                duedateholder.Attributes.Add("class", "badge badge-danger ")
            End If


            '''''enddatecalc


            '''''''''

            'Dim statushold As HtmlGenericControl = CType(e.Row.FindControl("statushold"), HtmlGenericControl)
            'If statushold.InnerHtml.Contains("UNPAID") Then
            '    statushold.InnerHtml = " <i class='fa fa-times-circle'></i> UNPAID"
            '    statushold.Attributes.Add("class", "badge bg-warning")
            '    Cashoutbtn.Enabled = True


            'ElseIf statushold.InnerHtml.Contains("PROCESSING") Then
            '    statushold.InnerHtml = " <i class='fa fa-check-circle'></i> PROCESSING"
            '    statushold.Attributes.Add("class", "badge badge-primary ")
            '    Cashoutbtn.Text = "PROCESSING"
            '    Cashoutbtn.CssClass = "btn btn-danger btn-sm btn-block disabled"

            'Else
            '    statushold.InnerHtml = " <i class='fa fa-check-circle'></i> PAID"
            '    statushold.Attributes.Add("class", "badge bg-success fa-inverse")
            '    'Cashoutbtn.Enabled = False
            '    Cashoutbtn.Text = "<i class='fa fa-check-circle'></i> PAID"
            '    Cashoutbtn.CssClass = "btn btn-success btn-sm btn-block disabled"
            'End If
            '''''
        End If
    End Sub

    Public Function LoadBalance(ByVal collectionid As String) 'As Double()

        Dim balance As Double
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
                ' balance(1) = myreader.GetValue(3).ToString()
                ' Session.Item("balance") = balance
                '+ CInt(AmtHolder.InnerHtml)
            Else
                'TextBox1.Text = String.Empty
                balance = 0
                ' balance(1) = 0
            End If

            myreader.Close()

            CNN.Close()
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
        Return balance
    End Function
    Public Function getpercentofnumber(ByVal raisedamt As Double, ByVal goalamt As Double)
        Dim returner As Double
        Dim phold As Double = raisedamt / goalamt
        returner = phold * 100
        Return returner
    End Function
End Class