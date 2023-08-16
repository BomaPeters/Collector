Imports System.Data.SqlClient
Public Class Dashboard1
    Inherits System.Web.UI.Page
    Dim M As Decimal
    Dim d As Decimal

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        usercount.InnerHtml = CountUsers()
        H2.InnerHtml = CountRequest()
    End Sub

    Private Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim duenameholder As HtmlGenericControl = CType(e.Row.FindControl("nameholder"), HtmlGenericControl)
            Dim useridholder As HtmlGenericControl = CType(e.Row.FindControl("B3"), HtmlGenericControl)
            If duenameholder.InnerHtml.Contains("wrong") Then
                duenameholder.InnerHtml = GetProfileDetailsFROMKPOLOM(useridholder.InnerHtml.Trim)
            End If
            Dim statushold As HtmlGenericControl = CType(e.Row.FindControl("statushold"), HtmlGenericControl)

            ''''''''''''''''''''
            Dim Label1 As Label = CType(e.Row.FindControl("Label1"), Label)
            Dim shower As HtmlGenericControl = CType(e.Row.FindControl("shower"), HtmlGenericControl)
            Dim LinkButton1 As LinkButton = CType(e.Row.FindControl("LinkButton1"), LinkButton)
            'Dim CheckBox1 As CheckBox = CType(e.Row.FindControl("CheckBox1"), CheckBox)

            If shower.InnerHtml.Contains(True) Then
                LinkButton1.Text = "<i class='fa fa-eye'></i>  SHOWING"
                LinkButton1.CssClass = "btn btn-outline-success"
                'CheckBox1.Checked = True
            Else
                LinkButton1.Text = "<i class='fa fa-eye-slash'></i> SHOW"
                'CheckBox1.Checked = False
            End If


            ''''''''''''''''

            If statushold.InnerHtml.Contains("UNPAID") Then
                statushold.InnerHtml = " <i class='fa fa-times-circle'></i> UNPAID"
                statushold.Attributes.Add("class", "badge bg-warning")
                '  Cashoutbtn.Enabled = True


            ElseIf statushold.InnerHtml.Contains("PROCESSING") Then
                statushold.InnerHtml = " <i class='fa fa-check-circle'></i> PROCESSING"
                statushold.Attributes.Add("class", "badge badge-primary ")


            Else
                statushold.InnerHtml = " <i class='fa fa-check-circle'></i> PAID"
                statushold.Attributes.Add("class", "badge bg-success fa-inverse")
                'Cashoutbtn.Enabled = False

            End If
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
        End If
    End Sub

    Private Sub SqlDataSource1_Selected(sender As Object, e As SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Selected
        If e.AffectedRows <= 0 Then
            notable.Visible = True
        Else
            notable.Visible = False
            collectionscount.InnerHtml = e.AffectedRows.ToString
        End If
    End Sub

    Private Sub GridView3_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView3.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim duenameholder As HtmlGenericControl = CType(e.Row.FindControl("nameholder"), HtmlGenericControl)
            Dim useridholder As HtmlGenericControl = CType(e.Row.FindControl("B3"), HtmlGenericControl)
            If duenameholder.InnerHtml.Contains("wrong") Then
                duenameholder.InnerHtml = GetProfileDetailsFROMKPOLOM(useridholder.InnerHtml.Trim)
            End If
            Dim statushold As HtmlGenericControl = CType(e.Row.FindControl("statushold"), HtmlGenericControl)
            If statushold.InnerHtml.Contains("UNPAID") Then
                statushold.InnerHtml = " <i class='fa fa-times-circle'></i> UNPAID"
                statushold.Attributes.Add("class", "badge bg-warning")
                '  Cashoutbtn.Enabled = True


            ElseIf statushold.InnerHtml.Contains("PROCESSING") Then
                statushold.InnerHtml = " <i class='fa fa-check-circle'></i> PROCESSING"
                statushold.Attributes.Add("class", "badge badge-primary ")


            Else
                statushold.InnerHtml = " <i class='fa fa-check-circle'></i> PAID"
                statushold.Attributes.Add("class", "badge bg-success fa-inverse")
                'Cashoutbtn.Enabled = False

            End If
        End If
    End Sub

    Private Sub GridView4_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView4.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim duenameholder As HtmlGenericControl = CType(e.Row.FindControl("nameholder"), HtmlGenericControl)
            Dim useridholder As HtmlGenericControl = CType(e.Row.FindControl("B3"), HtmlGenericControl)
            If duenameholder.InnerHtml.Contains("wrong") Then
                duenameholder.InnerHtml = GetProfileDetailsFROMKPOLOM(useridholder.InnerHtml.Trim)
            End If
            Dim statushold As HtmlGenericControl = CType(e.Row.FindControl("statushold"), HtmlGenericControl)
            If statushold.InnerHtml.Contains("UNPAID") Then
                statushold.InnerHtml = " <i class='fa fa-times-circle'></i> UNPAID"
                statushold.Attributes.Add("class", "badge bg-warning")
                '  Cashoutbtn.Enabled = True


            ElseIf statushold.InnerHtml.Contains("PROCESSING") Then
                statushold.InnerHtml = " <i class='fa fa-check-circle'></i> PROCESSING"
                statushold.Attributes.Add("class", "badge badge-primary ")


            Else
                statushold.InnerHtml = " <i class='fa fa-check-circle'></i> PAID"
                statushold.Attributes.Add("class", "badge bg-success fa-inverse")
                'Cashoutbtn.Enabled = False

            End If
        End If
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

    Public Function GetProfileDetails(username As String) As String
        Dim returner As String = String.Empty
        Dim CNNe As SqlConnection = New SqlConnection
        CNNe.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("kpolomDUMMYConnectionString").ConnectionString

        CNNe.Open()

        Dim CMDe As SqlCommand = New SqlCommand
        ' CMDe.CommandText = "SELECT Password,Centre,userID FROM [myLOGIN] WHERE [Centre]='" & username & "' "
        CMDe.CommandText = "SELECT * FROM [myLOGINCollector] WHERE (userID=@userID)"
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
            returner = myreadere.GetValue(1).ToString() & " " & myreadere.GetValue(2).ToString()
            'TextBox1.Text = myreadere.GetValue(1).ToString() ' gets email for payment
            'TextBox2.Text = myreadere.GetValue(2).ToString() ' gets UserID for Checkout
            'TextBox3.Text = myreadere.GetValue(6).ToString() ' gets UserRole
            'TextBox4.Text = myreadere.GetValue(5).ToString() ' gets UserPhone


        Else
            returner = "wrong"
        End If

        myreadere.Close()

        CNNe.Close()
        Return returner


    End Function
    Public Function GetProfileDetailsFROMKPOLOM(username As String) As String
        Dim returner As String = String.Empty
        Dim CNNe As SqlConnection = New SqlConnection
        CNNe.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("kpolomDUMMYConnectionString").ConnectionString

        CNNe.Open()

        Dim CMDe As SqlCommand = New SqlCommand
        ' CMDe.CommandText = "SELECT Password,Centre,userID FROM [myLOGIN] WHERE [Centre]='" & username & "' "
        CMDe.CommandText = "SELECT * FROM [Customer_Details] WHERE (KID=@userID)"
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
            returner = myreadere.GetValue(2).ToString() & " " & myreadere.GetValue(4).ToString()
            'TextBox1.Text = myreadere.GetValue(2).ToString() ' gets Firstname
            'TextBox2.Text = myreadere.GetValue(4).ToString() ' gets Lastname
            'TextBox3.Text = myreadere.GetValue(1).ToString() ' gets Userphonenumber
            'TextBox4.Text = myreadere.GetValue(7).ToString() ' gets UsereMAIL


        Else
            returner = "wrong2"
        End If

        myreadere.Close()

        CNNe.Close()
        Return returner


    End Function
    Public Function CountUsers()
        Dim returner As Integer = 0

        Dim CNNr As SqlConnection = New SqlConnection
        CNNr.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("kpolomDUMMYConnectionString").ConnectionString

        CNNr.Open()

        Dim CMDe As SqlCommand = New SqlCommand
        CMDe.CommandText = "SELECT COUNT( * ) as counter FROM [myLOGINCollector] "



        'CMDe.Parameters.AddWithValue("@StillValid", 1)
        CMDe.Connection = CNNr
        Dim dae As SqlDataAdapter = New SqlDataAdapter()
        dae.SelectCommand = CMDe
        Dim dse As DataSet = New DataSet()
        dae.Fill(dse, "myLOGINCollector")


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
    Public Function CountRequest()
        Dim returner As Integer = 0

        Dim CNNr As SqlConnection = New SqlConnection
        CNNr.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("kpolomDUMMYConnectionString").ConnectionString

        CNNr.Open()

        Dim CMDe As SqlCommand = New SqlCommand
        CMDe.CommandText = "SELECT COUNT( * ) as counter FROM Collection_Details WHERE Status='PROCESSING' "



        'CMDe.Parameters.AddWithValue("@StillValid", 1)
        CMDe.Connection = CNNr
        Dim dae As SqlDataAdapter = New SqlDataAdapter()
        dae.SelectCommand = CMDe
        Dim dse As DataSet = New DataSet()
        dae.Fill(dse, "Collection_Details")


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
    Public Sub UpdateCollectionDetails(ByVal collectionidhold As String, ByVal Showindex As Integer)
        If IsPostBack Then
            Try


                Dim CNNS As SqlConnection = New SqlConnection
                CNNS.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("kpolomDUMMYConnectionString").ConnectionString

                CNNS.Open()


                Dim CMDS As SqlCommand = New SqlCommand

                CMDS.CommandText = "UPDATE Collection_Details SET ShowMeOnIndex=@ShowMeOnIndex WHERE CollectionID=@CollectionID"





                CMDS.Parameters.AddWithValue("@CollectionID", collectionidhold)
        If Showindex = 1 Then
                    CMDS.Parameters.AddWithValue("@ShowMeOnIndex", 0)
                Else
            CMDS.Parameters.AddWithValue("@ShowMeOnIndex", 1)
        End If
        CMDS.Connection = CNNS
            CMDS.ExecuteNonQuery()
            Dim rowsaffected As Integer = CMDS.ExecuteNonQuery
            '  Label2.Text = rowsaffected
            Dim daD As SqlDataAdapter = New SqlDataAdapter()
            daD.SelectCommand = CMDS

            CNNS.Close()
            GridView1.DataBind()
                ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert('Collection view state has been updated.');", True)
            Catch ex As Exception
            'Response.Write(ex.Message)
            ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert(""" & ex.Message & """);", True)
            End Try
        End If
    End Sub

    Private Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridView1.RowCommand
        If e.CommandName = "Updater" Then
            Dim row As GridViewRow = CType(((CType(e.CommandSource, LinkButton)).NamingContainer), GridViewRow)
            Dim collectionid As TextBox = CType(row.FindControl("TextBox1"), TextBox)
            Dim shower As HtmlGenericControl = CType(row.FindControl("shower"), HtmlGenericControl)
            Dim showercontainer As Integer
            If shower.InnerHtml.Contains(True) Then
                showercontainer = 1
            Else
                showercontainer = 0
            End If
            UpdateCollectionDetails(collectionid.Text, showercontainer)
            GridView1.DataBind()
        End If
    End Sub
End Class