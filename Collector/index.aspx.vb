Imports System.Data.SqlClient
Public Class index
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub



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