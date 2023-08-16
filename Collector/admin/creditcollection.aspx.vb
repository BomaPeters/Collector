Imports System.Data.SqlClient
Public Class creditcollection
    Inherits System.Web.UI.Page

    Dim loadhold As Double
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Label4.Text = Today.Date
    End Sub
    Public Sub GetProfileDetails(username As String)
        Try
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
                Label1.Visible = True
                Label1.Text = myreadere.GetValue(1).ToString() & " " & myreadere.GetValue(2).ToString() 'myreadere.GetValue(0).ToString()
                Label1.CssClass = "badge badge-success  small fa mt-3 mb-3"
                Label3.Text = myreadere.GetValue(0).ToString()
                DropDownList1.DataSourceID = SqlDataSource1.ID



                'TextBox2.Text = myreadere.GetValue(1).ToString() ' gets email for payment
                'TextBox3.Text = myreadere.GetValue(2).ToString() ' gets UserID for Checkout
                'TextBox4.Text = myreadere.GetValue(6).ToString() ' gets phonenumber
                'TextBox5.Text = myreadere.GetValue(5).ToString() ' gets email
                'Label3.Text = CDate(myreadere.GetValue(4).ToString()).ToString("dd-MMM-yy")
                'LinkButton2.Visible = True
                'detailshold.Visible = True
                'GridView1.DataSourceID = SqlDataSource1.ID
                'GridView1.DataBind()


            Else
                'Label1.Visible = True
                'Label1.Text = " ** &#xf119; Your phonenumber does not exist.**"

                'DropDownList1.DataSourceID = ""
                'DropDownList1.Items.Clear()
                'DropDownList2.DataSourceID = ""
                'DropDownList2.Items.Clear()
                'DropDownList3.DataSourceID = ""
                'DropDownList3.Items.Clear()
                'goalhold.InnerHtml = 0
                'goalholdTEXT.InnerHtml = 0
                GetProfileDetailsFROMKPOLOM(username)
            End If

            myreadere.Close()

            CNNe.Close()
            '  Return returner

        Catch ex As Exception
            ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert(""" & ex.Message & """);", True)
        End Try
    End Sub

    Private Sub TextBox1_TextChanged(sender As Object, e As EventArgs) Handles TextBox1.TextChanged
        If IsPostBack Then
            GetProfileDetails(TextBox1.Text)
        End If
    End Sub
    Public Function getpercentofnumber(ByVal raisedamt As Double, ByVal goalamt As Double)
        Dim returner As Double
        Dim phold As Double = raisedamt / goalamt
        returner = phold * 100
        Return returner
    End Function
    Public Function LoadBalance() As Double

        Dim balance As Integer = 0
        Try
            Dim CNN As SqlConnection = New SqlConnection
            CNN.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("kpolomDUMMYConnectionString").ConnectionString

            CNN.Open()

            Dim CMD As SqlCommand = New SqlCommand
            CMD.CommandText = "SELECT TOP (1) CollectionID, TransDate, Deposit, Withdrawal, Balance, TimeOfTrans FROM  Collection_Log WHERE  CollectionID='" & DropDownList1.SelectedValue.ToString & "'ORDER BY TimeOfTrans DESC"


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
                Session.Item("balance") = balance
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

    Private Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        Try
            loadhold = LoadBalance()
            Label2.Text = "₦" & String.Format("{0:#,##0.##}", loadhold)
            ' goalhold.InnerHtml = DropDownList2.SelectedValue
            rangeholder.Style.Add("width", Math.Round(getpercentofnumber(loadhold, Val(goalhold.InnerHtml))).ToString & "%")
            goalholdTEXT.InnerHtml = "₦" & String.Format("{0:#,##0.##}", CSng(goalhold.InnerHtml))
            Dim dview As DataView = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView) 'gets specific field from sqldatasource
            For Each mimi In dview.Table.Rows
                '    statushold.InnerHtml = "today is " & Date.Today & " due date " & CType(mimi("DueDate"), Date)
                If CType(mimi("DueDate"), Date) <= Today.Date Then
                    statushold.Attributes.Add("class", "badge badge-danger fa-pull-right")
                    statushold.InnerHtml = "<i class='fa fa-times-circle'></i> Expired"
                Else
                    statushold.InnerHtml = "<i class='fa fa-thumbs-up'></i> Active"
                    statushold.Attributes.Add("class", "badge badge-success fa-pull-right")
                End If

            Next
        Catch ex As Exception
            ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert(""" & ex.Message & """);", True)
        End Try
    End Sub

    Private Sub DropDownList1_DataBound(sender As Object, e As EventArgs) Handles DropDownList1.DataBound
        Try
            loadhold = LoadBalance()
            Label2.Text = "₦" & String.Format("{0:#,##0.##}", loadhold)
            ' goalhold.InnerHtml = DropDownList2.SelectedValue
            Dim dview As DataView = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView) 'gets specific field from sqldatasource
            For Each mimi In dview.Table.Rows
                '    statushold.InnerHtml = "today is " & Date.Today & " due date " & CType(mimi("DueDate"), Date)
                If CType(mimi("DueDate"), Date) <= Today.Date Then
                    statushold.Attributes.Add("class", "badge badge-danger fa-pull-right")
                    statushold.InnerHtml = "<i class='fa fa-times-circle'></i> Expired"
                Else
                    statushold.InnerHtml = "<i class='fa fa-thumbs-up'></i> Active"
                    statushold.Attributes.Add("class", "badge badge-success fa-pull-right")
                End If

            Next
            DropDownList2.DataSourceID = SqlDataSource2.ID
            DropDownList3.DataSourceID = SqlDataSource3.ID
        Catch ex As Exception
            ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert(""" & ex.Message & """);", True)
        End Try
    End Sub

    Private Sub DropDownList2_DataBound(sender As Object, e As EventArgs) Handles DropDownList2.DataBound
        Try
            goalhold.InnerHtml = DropDownList2.SelectedValue
            rangeholder.Style.Add("width", Math.Round(getpercentofnumber(loadhold, Val(goalhold.InnerHtml))).ToString & "%")

            'If Object.ReferenceEquals(DropDownList2.SelectedItem, DBNull.Value) Then
            '    shareholdonpage.InnerHtml = 0
            'Else
            '  shareholdonpage.InnerHtml = DropDownList2.SelectedItem.Text
            'End If
            goalholdTEXT.InnerHtml = "₦" & String.Format("{0:#,##0.##}", CSng(goalhold.InnerHtml))
        Catch ex As Exception
            ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert(""" & ex.Message & """);", True)
        End Try
    End Sub

    Private Sub SqlDataSource3_Selected(sender As Object, e As SqlDataSourceStatusEventArgs) Handles SqlDataSource3.Selected
        contribcnt.InnerHtml = e.AffectedRows.ToString
    End Sub

    Private Sub CheckBox1_CheckedChanged(sender As Object, e As EventArgs) Handles CheckBox1.CheckedChanged
        If CheckBox1.Checked = True Then
            TextBox2.Text = "Anonymous"
        Else
            TextBox2.Text = String.Empty
        End If
    End Sub
    Public Sub creditAccountContrib()
        Dim s As String = "01234567890123456789012345678901234567890123456789"
        Dim r As New Random

        Dim sb As New System.Text.StringBuilder
        For i As Integer = 1 To 9
            Dim idx As Integer = r.Next(0, 45)
            sb.Append(s.Substring(idx, 1))


        Next
        Session.Item("GeneratedCollectID") = sb.ToString
        Dim CNN As SqlConnection = New SqlConnection
        CNN.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("kpolomDUMMYConnectionString").ConnectionString

        CNN.Open()

        Dim CMD As SqlCommand = New SqlCommand
        CMD.CommandText = "SELECT * FROM  Collection_Log"


        CMD.Connection = CNN
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        da.SelectCommand = CMD
        Dim ds As Data.DataSet = New Data.DataSet()
        da.Fill(ds, "Collection_Log")
        Dim CB As SqlCommandBuilder = New SqlCommandBuilder(da)
        Dim drow As Data.DataRow = ds.Tables("Collection_Log").NewRow

        drow("TransID") = Session.Item("GeneratedCollectID").ToString 'sb.ToString
        drow("CollectionID") = DropDownList1.SelectedValue
        drow("TransDate") = DateTime.Now.ToString("dd-MMM-yyyy")
        drow("Deposit") = CDbl(TextBox3.Text)
        drow("Withdrawal") = DBNull.Value
        drow("Balance") = (LoadBalance() + CInt(TextBox3.Text))

        drow("TimeOfTrans") = DateTime.Now.ToLongTimeString



        ds.Tables("Collection_Log").Rows.Add(drow)
        da.Update(ds, "Collection_Log")
        CNN.Close()
    End Sub
    Public Sub InsertDonorDetails()

        Dim CNN As SqlConnection = New SqlConnection
        CNN.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("kpolomDUMMYConnectionString").ConnectionString

        CNN.Open()

        Dim CMD As SqlCommand = New SqlCommand
        CMD.CommandText = "SELECT * FROM  Donor_Details"


        CMD.Connection = CNN
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        da.SelectCommand = CMD
        Dim ds As Data.DataSet = New Data.DataSet()
        da.Fill(ds, "Donor_Details")
        Dim CB As SqlCommandBuilder = New SqlCommandBuilder(da)
        Dim drow As Data.DataRow = ds.Tables("Donor_Details").NewRow

        drow("TransID") = Session.Item("GeneratedCollectID").ToString
        drow("Donor_Email") = TextBox5.Text
        drow("Donor_PhoneNumber") = TextBox4.Text
        drow("Donor_Name") = TextBox2.Text
        drow("Donor_Comment") = ""
        ds.Tables("Donor_Details").Rows.Add(drow)
        da.Update(ds, "Donor_Details")
        CNN.Close()
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        creditAccountContrib()
        InsertDonorDetails()
        GetProfileDetails(TextBox1.Text)
        TextBox2.Text = ""
        TextBox5.Text = ""
        TextBox6.Text = ""
        TextBox4.Text = ""
        TextBox3.Text = ""
        ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert('Collection has been successfully been credited.');", True)

    End Sub
    Public Sub GetProfileDetailsFROMKPOLOM(username As String)
        Dim returner As String = String.Empty
        Dim CNNe As SqlConnection = New SqlConnection
        CNNe.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("kpolomDUMMYConnectionString").ConnectionString

        CNNe.Open()

        Dim CMDe As SqlCommand = New SqlCommand
        ' CMDe.CommandText = "SELECT Password,Centre,userID FROM [myLOGIN] WHERE [Centre]='" & username & "' "
        CMDe.CommandText = "SELECT * FROM [Customer_Details] WHERE (PhoneNumber=@userID)"
        CMDe.Parameters.AddWithValue("@userID", username)
        CMDe.Connection = CNNe
        Dim dae As SqlDataAdapter = New SqlDataAdapter()
        dae.SelectCommand = CMDe
        Dim dse As Data.DataSet = New Data.DataSet()
        dae.Fill(dse, "Customer_Details")
        ' Dim CB As SqlCommand = New SqlCommand()
        Dim myreadere As SqlDataReader
        myreadere = CMDe.ExecuteReader

        myreadere.Read()
        If myreadere.HasRows Then
            returner =
            Label1.Visible = True
            Label1.Text = myreadere.GetValue(2).ToString() & " " & myreadere.GetValue(4).ToString() 'myreadere.GetValue(0).ToString()
            Label1.CssClass = "badge badge-success  small fa mt-3 mb-3  "
            Label3.Text = myreadere.GetValue(0).ToString()
            DropDownList1.DataSourceID = SqlDataSource1.ID


        Else
            'returner = "wrong"
            Label1.Visible = True
            Label1.Text = " ** &#xf119; Your phonenumber does not exist.**"

            DropDownList1.DataSourceID = ""
            DropDownList1.Items.Clear()
            DropDownList2.DataSourceID = ""
            DropDownList2.Items.Clear()
            DropDownList3.DataSourceID = ""
            DropDownList3.Items.Clear()
            goalhold.InnerHtml = 0
            goalholdTEXT.InnerHtml = 0
        End If

        myreadere.Close()

        CNNe.Close()
        '    Return returner


    End Sub
End Class