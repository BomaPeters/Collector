Imports System.Data.SqlClient
Public Class customerprofile
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim colhold As String
            colhold = Request.QueryString("userphoner")
            If colhold = String.Empty Then
                Exit Sub
            Else

                TextBox1.Text = colhold
                GetProfileDetails(TextBox1.Text)
            End If
        End If

    End Sub

    Private Sub TextBox1_TextChanged(sender As Object, e As EventArgs) Handles TextBox1.TextChanged
        GetProfileDetails(TextBox1.Text)
    End Sub
    Public Sub GetProfileDetails(username As String)
        Dim returner As String = String.Empty
        Dim CNNe As SqlConnection = New SqlConnection
        CNNe.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("kpolomDUMMYConnectionString").ConnectionString

        CNNe.Open()

        Dim CMDe As SqlCommand = New SqlCommand
        ' CMDe.CommandText = "SELECT Password,Centre,userID FROM [myLOGIN] WHERE [Centre]='" & username & "' "
        CMDe.CommandText = "SELECT TOP 1 * FROM [myLOGINCollector] WHERE (PhoneNumber=@userID)"
        CMDe.Parameters.AddWithValue("@userID", username)
        CMDe.Connection = CNNe
        Dim dae As SqlDataAdapter = New SqlDataAdapter()
        dae.SelectCommand = CMDe
        Dim dse As Data.DataSet = New Data.DataSet()
        dae.Fill(dse, "myLOGINCollector")
        ' Dim CB As SqlCommand = New SqlCommand()
        Dim myreadere As SqlDataReader
        myreadere = CMDe.ExecuteReader

        myreadere.Read()
        If myreadere.HasRows Then
            Label1.Visible = False
            returner = myreadere.GetValue(0).ToString()
            Label2.Text = returner.Trim
            TextBox2.Text = myreadere.GetValue(1).ToString() ' gets email for payment
            TextBox3.Text = myreadere.GetValue(2).ToString() ' gets UserID for Checkout
            TextBox4.Text = myreadere.GetValue(6).ToString() ' gets phonenumber
            TextBox5.Text = myreadere.GetValue(5).ToString() ' gets email
            Label3.Text = CDate(myreadere.GetValue(4).ToString()).ToString("dd-MMM-yy")
            LinkButton2.Visible = True
            detailshold.Visible = True
            GridView1.DataSourceID = SqlDataSource1.ID
            GridView1.DataBind()
        Else
            Label1.Visible = True
            Label1.Text = " ** &#xf119; Your phonenumber does not exist.**"
            LinkButton2.Visible = False
            detailshold.Visible = False
        End If

        myreadere.Close()

        CNNe.Close()
        '  Return returner


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

    Private Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            'Dim rangehold As HtmlGenericControl = CType(e.Row.FindControl("rangeholder"), HtmlGenericControl)
            'Dim goalholder As HtmlGenericControl = CType(e.Row.FindControl("goalholder"), HtmlGenericControl)

            Dim duedateholder As HtmlGenericControl = CType(e.Row.FindControl("duedate"), HtmlGenericControl)
            Dim paiddateholder As HtmlGenericControl = CType(e.Row.FindControl("paiddate"), HtmlGenericControl)
            'Dim Cashoutbtn As LinkButton = CType(e.Row.FindControl("LinkButton2"), LinkButton)
            'rangehold.Style.Add("width", Math.Round(getpercentofnumber(loadholder.InnerHtml, Val(goalholder.InnerHtml))).ToString & "%")
            '''''datecalc
            If Today.Date > CDate(duedateholder.InnerHtml) Then
                duedateholder.InnerHtml = " <i class='fa fa-times-circle'></i> EXPIRED"
                duedateholder.Attributes.Add("class", "badge badge-danger p-2 ")
            End If


            '''''enddatecalc


            '''''''''

            Dim statushold As HtmlGenericControl = CType(e.Row.FindControl("statushold"), HtmlGenericControl)
            If statushold.InnerHtml.Contains("UNPAID") Then
                statushold.InnerHtml = " <i class='fa fa-times-circle'></i> UNPAID"
                statushold.Attributes.Add("class", "badge bg-warning p-2")
                '  Cashoutbtn.Enabled = True

                paiddateholder.Visible = False
            ElseIf statushold.InnerHtml.Contains("PROCESSING") Then
                statushold.InnerHtml = " <i class='fa fa-check-circle'></i> PROCESSING"
                statushold.Attributes.Add("class", "badge badge-primary p-2 ")

                paiddateholder.Visible = False
            Else
                statushold.InnerHtml = " <i class='fa fa-check-circle'></i> PAID"
                statushold.Attributes.Add("class", "badge bg-success fa-inverse p-2")
                paiddateholder.Visible = True
                'Cashoutbtn.Enabled = False

            End If
            '''''
        End If
    End Sub
End Class