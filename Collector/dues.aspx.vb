
Imports System.Data.SqlClient
Imports DevExpress.Web.ASPxScheduler.Internal

Public Class dues
    Inherits System.Web.UI.Page
    Dim colhold As String
    Dim userID As String
    Dim sharecounthold As Integer
    Dim STARTdateforDUES, DueDateforDUES As Date
    Dim DuesLogdatatable As DataTable
    Dim AmountperParticipant As Double
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try

            '"0YMSEIO0i " '
            colhold = Request.QueryString("collectionid")
            Session.Item("collectionhold") = colhold
            Session.Remove("imgholding")
            GetCollectiondetails(colhold)
            creatorname.InnerHtml = GetCreatorName(userID)
            'cHECK IF GETCOLLECTION HAS A ROW IF DOES THEN LOAD
            If Not IsNothing(STARTdateforDUES) Then
                GetDuesLOG(colhold)
                contribcnt.InnerHtml = DuesLogdatatable.Rows.Count
            End If
            '''
            Dim loadhold As Double = LoadBalance()
            Dim deducted As Double = GetTotalDeduction(colhold)
            Label1.Text = "₦" & String.Format("{0:#,##0.##}", loadhold + deducted)
            Text1.Value = "https://collector.ng/dues.aspx?collectionid=" & colhold
            'rangeholder.Style.Add("width", Math.Round(getpercentofnumber(loadhold, Val(goalhold.InnerHtml))).ToString & "%")

            'goalhold.InnerText = "₦" & String.Format("{0:#,##0.##}", CSng(goalhold.InnerHtml))
            'CountComments()

            If Not IsPostBack Then

                GetCollectiondetails(colhold) 'newest
                goalhold.InnerText = "₦" & String.Format("{0:#,##0.##}", CSng(goalhold.InnerHtml))
                CurrentPageIndex = 0
                showData()
                If Me.Page.User.Identity.IsAuthenticated = False Then
                    notlogged.Visible = True
                    loggednow.Visible = False
                    ProfileLink.Visible = False
                    notloggedstart.Visible = True
                    loggedstart.Visible = False
                Else
                    notlogged.Visible = False
                    loggednow.Visible = True
                    ProfileLink.Visible = True
                    notloggedstart.Visible = False
                    loggedstart.Visible = True
                End If
            Else
                '  goalhold.InnerText = "₦" & String.Format("{0:#,##0.##}", CSng(goalhold.InnerHtml))
            End If
        Catch ex As Exception
            Session.Item("errormsg") = ex.Message & vbNewLine & "Page-" & System.IO.Path.GetFileName(Request.Url.ToString) & vbNewLine & ex.Source & vbNewLine & ex.StackTrace

            ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert(""" & ex.Message & """);window.location='Error.aspx';", True)

        End Try
    End Sub
    Private pg As Integer = 0
    Public Property CurrentPageIndex As Integer
        Get
            If ViewState("pg") Is Nothing Then Return 0 Else Return Convert.ToInt16(ViewState("pg"))
        End Get

        Set(ByVal value As Integer)
            ViewState("pg") = value
        End Set
    End Property
    Private Sub showData()
        'Dim pgd As PagedDataSource = New PagedDataSource()
        'pgd.DataSource = SqlDataSource1.Select(DataSourceSelectArguments.Empty())
        'pgd.CurrentPageIndex = CurrentPageIndex
        'pgd.AllowPaging = True
        'pgd.PageSize = 5
        'LinkButton2.Enabled = Not (pgd.IsLastPage)
        'LinkButton1.Enabled = Not (pgd.IsFirstPage)
        'DataList1.DataSource = pgd
        'DataList1.DataBind()
    End Sub
    Public Function getpercentofnumber(ByVal raisedamt As Double, ByVal goalamt As Double)
        Dim returner As Double
        Dim phold As Double = raisedamt / goalamt
        returner = phold * 100
        Return returner
    End Function
    Public Sub GetCollectiondetails(ByRef _CollectionID As String)
        Dim returner As String = String.Empty
        Dim CNNe As SqlConnection = New SqlConnection
        CNNe.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("kpolomDUMMYConnectionString").ConnectionString

        CNNe.Open()

        Dim CMDe As SqlCommand = New SqlCommand
        CMDe.CommandText = "SELECT * FROM Collection_Details WHERE ([CollectionID] = @CollectionID AND Type='DUES')"
        CMDe.Parameters.AddWithValue("@CollectionID", _CollectionID)

        CMDe.Connection = CNNe
        Dim dae As SqlDataAdapter = New SqlDataAdapter()
        dae.SelectCommand = CMDe
        Dim dse As DataSet = New DataSet()
        dae.Fill(dse, "Collection_Details")

        'jsonReturner("success", "OK")
        Dim reader As SqlDataReader = CMDe.ExecuteReader()
        reader.Read()
        If reader.HasRows Then
            '  Label2.Text = String.Format("{0:#,##0.##}", CSng(Val(reader.GetValue(9).ToString()))) 'goal
            goalhold.InnerHtml = CSng(Val(reader.GetValue(9).ToString()))
            AmountperParticipant = CSng(Val(reader.GetValue(9).ToString()))
            '"₦" & String.Format("{0:#,##0.##}", CSng(Val(reader.GetValue(9).ToString())))
            Label3.Text = reader.GetValue(2).ToString() 'collecting for
            Dim duestype As String = reader.GetValue(16).ToString() ' purpose for collecting

            STARTdateforDUES = CDate(reader.GetValue(15).ToString()) 'START DATE FOR DUES
            DueDateforDUES = CDate(reader.GetValue(7).ToString()) 'due date FOR DUES
            ' LoadCheckboxDate(CDate(reader.GetValue(15).ToString()), CDate(reader.GetValue(7).ToString()))
            If duestype.Contains("False") Then
                Label4.Text = "Anybody"
                anybodyview.Visible = True
                membersonlyview.Visible = False
            Else
                Label4.Text = "Members Only"
                anybodyview.Visible = False
                membersonlyview.Visible = True
            End If

            If Today.Date > CDate(reader.GetValue(7).ToString()) Then
                duedate.InnerHtml = " <i class='fa fa-times-circle'></i> EXPIRED"

                Button1.Text = " CLOSED"
                Button1.CssClass = "btn btn-danger btn-lg  btn-block disabled "
                Button1.Enabled = False
            Else
                duedate.InnerHtml = CDate(reader.GetValue(7).ToString()).ToString("dd-MMM-yy") 'due date
            End If
            createddate.InnerHtml = CDate(reader.GetValue(8).ToString()).ToString("dd-MMM-yy") 'created date
            descriptionhold.InnerHtml = Server.HtmlDecode(reader.GetValue(3).ToString()) 'description
            Image1.ImageUrl = reader.GetValue(12).ToString()
            userID = reader.GetValue(0).ToString()

            If String.IsNullOrEmpty(reader.GetValue(13).ToString()) = True Then
                sharecounthold = 0
                shareholdonpage.InnerHtml = sharecounthold
            Else
                sharecounthold = CInt(reader.GetValue(13).ToString())
                shareholdonpage.InnerHtml = sharecounthold
            End If
            categoryhold.InnerHtml = reader.GetValue(14).ToString()

            Select Case Trim(reader.GetValue(17))
                Case "COLLECTION"
                    If reader.GetValue(10).ToString = "PROCESSING" Or reader.GetValue(10).ToString = "PAID" Then
                        Button1.Text = " CLOSED" ' ✖
                        Button1.CssClass = "btn btn-danger btn-lg  btn-block disabled "
                        Button1.Enabled = False
                    Else


                    End If

                Case "DUES"
                    If reader.GetValue(10).ToString = "PAID" Then
                        Button1.Text = " CLOSED" ' ✖
                        Button1.CssClass = "btn btn-danger btn-lg  btn-block disabled "
                        Button1.Enabled = False
                    Else


                    End If
            End Select
        Else
            ' returner = String.Empty

        End If
        reader.Close()
        CNNe.Close()


    End Sub
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
            'TextBox2.Text = ' gets Lastname
            'TextBox3.Text = myreadere.GetValue(1).ToString() ' gets Userphonenumber
            'TextBox4.Text = myreadere.GetValue(7).ToString() ' gets UsereMAIL


        Else
            returner = "wrong"
        End If

        myreadere.Close()

        CNNe.Close()
        Return returner


    End Function
    Public Function LoadBalance() As Double

        Dim balance As Integer = 0
        Try
            Dim CNN As SqlConnection = New SqlConnection
            CNN.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("kpolomDUMMYConnectionString").ConnectionString

            CNN.Open()

            Dim CMD As SqlCommand = New SqlCommand
            CMD.CommandText = "SELECT TOP (1) CollectionID, TransDate, Deposit, Withdrawal, Balance, TimeOfTrans FROM  Collection_Log WHERE  CollectionID='" & colhold & "'ORDER BY TimeOfTrans DESC"


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
            Session.Item("errormsg") = ex.Message & vbNewLine & "Page-" & System.IO.Path.GetFileName(Request.Url.ToString) & vbNewLine & ex.Source & vbNewLine & ex.StackTrace

            ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert(""" & ex.Message & """);window.location='Error.aspx';", True)

        End Try
        Return balance
    End Function

    Public Function GetCreatorName(userid As String) As String
        Dim returner As String = String.Empty
        Dim CNNe As SqlConnection = New SqlConnection
        CNNe.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("kpolomDUMMYConnectionString").ConnectionString

        CNNe.Open()

        Dim CMDe As SqlCommand = New SqlCommand
        ' CMDe.CommandText = "SELECT Password,Centre,userID FROM [myLOGIN] WHERE [Centre]='" & username & "' "
        CMDe.CommandText = "SELECT Firstname,Lastname FROM [myLOGINCollector] WHERE (userID=@userID)"
        CMDe.Parameters.AddWithValue("@userID", userid)
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
            returner = myreadere.GetValue(0).ToString() & " " & myreadere.GetValue(1).ToString()
            ''Session.Item("emailholder") = myreadere.GetValue(1).ToString() ' gets email for payment
            'Session.Item("CID") = myreadere.GetValue(2).ToString() ' gets UserID for Checkout
            ''Session.Item("UserRole") = myreadere.GetValue(3).ToString() ' gets UserRole
            'Session.Item("UserPhone") = myreadere.GetValue(1).ToString() ' gets UserPhone


        Else
            returner = GetProfileDetailsFROMKPOLOM(userid)
            ' "wrong"
        End If

        myreadere.Close()

        CNNe.Close()
        Return returner


    End Function

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        If String.IsNullOrEmpty(TextBox1.Text) = True Or String.IsNullOrEmpty(TextBox2.Text) = True Or String.IsNullOrEmpty(TextBox3.Text) = True Or String.IsNullOrEmpty(TextBox4.Text) = True Then
            ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert('Action was not successful.Field required.');", True)
        Else
            createMember()
        End If

    End Sub
    Public Sub createMember()
        Dim s As String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz"
        Dim r As New Random

        Dim sb As New System.Text.StringBuilder
        For i As Integer = 1 To 9
            Dim idx As Integer = r.Next(0, 45)
            sb.Append(s.Substring(idx, 1))


        Next
        Dim CNN As SqlConnection = New SqlConnection
        CNN.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("kpolomDUMMYConnectionString").ConnectionString

        CNN.Open()

        Dim CMD As SqlCommand = New SqlCommand
        CMD.CommandText = "SELECT * FROM  Dues_Participants"


        CMD.Connection = CNN
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        da.SelectCommand = CMD
        Dim ds As Data.DataSet = New Data.DataSet()
        da.Fill(ds, "Dues_Participants")
        Dim CB As SqlCommandBuilder = New SqlCommandBuilder(da)
        Dim drow As Data.DataRow = ds.Tables("Dues_Participants").NewRow


        drow("userID") = sb.ToString

        drow("DuesID") = Session.Item("collectionhold").ToString
        drow("Firstname") = TextBox1.Text.ToUpper
        drow("Lastname") = TextBox2.Text
        drow("PhoneNumber") = TextBox3.Text
        drow("EmailAdd") = TextBox4.Text
        drow("CreatedDate") = DateTime.Now
        ds.Tables("Dues_Participants").Rows.Add(drow)
        da.Update(ds, "Dues_Participants")
        CNN.Close()
        TextBox1.Text = ""
        TextBox2.Text = ""
        TextBox3.Text = ""
        '  ClientScript.RegisterStartupScript([GetType](), "alert", (Convert.ToString("alert('") & "Collection has been successfully created.") + "');", True)
        ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert('Member has been successfully added.');" + String.Format("window.location='../dues.aspx?collectionid={0}';", Session.Item("collectionhold").ToString), True)
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect(String.Format("pay.aspx?collectionid={0}", colhold))
    End Sub
    Public Sub LoadCheckboxDate(ByVal STARTdateforDUES As Date, ByVal DueDateforDUES As Date)
        'Dim STARTDATE = STARTdateforDUES
        'Dim last6months = DueDateforDUES.AddMonths(1)
        'While STARTDATE <= last6months
        '    Mychecklist.Items.Add(String.Format("{0} {1}", CDate(STARTDATE).ToString("MMM").ToUpper, STARTDATE.Year))
        '    ' CheckBoxList1.ForeColor.IsSystemColor = Color.FromKnownColor(KnownColor.Tomato)
        '    Mychecklist.Attributes.Add("Style", "color:red")
        '    STARTDATE = STARTDATE.AddMonths(1)
        'End While

    End Sub



    Private Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound

        If e.Row.RowType = DataControlRowType.DataRow Then
            '    Dim mytemplat As TemplateField = New TemplateField
            'Dim templaterow As New GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Normal)

            Dim userID As HtmlGenericControl = CType(e.Row.FindControl("userID"), HtmlGenericControl)
            Dim counthold As HtmlGenericControl = CType(e.Row.FindControl("counter"), HtmlGenericControl)

            '    ' mytemplat.HeaderText = "My new Header"
            '    '  mytemplat.ItemTemplate=New GridView.item
            '    '   GridView1.Columns.Add(mytemplat)


            'templaterow.Cells.Add(cell1)
            'GridView1.Controls(0).Controls.Add(templaterow)
            'e.Row.Cells(3).Controls.Add(mylabeler)
            Dim headercell As New TableHeaderCell
            headercell.Text = "kooooood"

            Dim headlaber As Label = New Label
            Dim STARTDATE = STARTdateforDUES
            Dim last6months = DueDateforDUES.AddMonths(1)
            Dim count As Integer = 0
            While STARTDATE <= last6months

                Dim cell1 As New TableCell
                Dim mylabeler As CheckBox = New CheckBox
                mylabeler.ID = "labeller1"
                mylabeler.CssClass = "small mt-2"
                mylabeler.Text = String.Format("{0} {1}", CDate(STARTDATE).ToString("MMM").ToUpper, STARTDATE.Year)
                ' Dim count As Integer = 0
                For Each readeritem As DataRow In DuesLogdatatable.Rows 'loop datatable to know who has paid


                    If (CDate(mylabeler.Text).Year = CDate(readeritem.Item(6).ToString).Year And CDate(mylabeler.Text).Month = CDate(readeritem.Item(6).ToString).Month) And userID.InnerHtml = readeritem.Item(2).ToString Then
                        ' CheckBoxList1.Attributes.Add("Style", "color:green")

                        count = count + 1
                        mylabeler.Attributes.Add("Style", "color:#1CADE4;text-align:center;")
                        ' mylabeler.Attributes.Add("Style", "text-align:center")

                        mylabeler.Checked = True
                        mylabeler.Enabled = False

                        counthold.InnerHtml = "₦" & String.Format("{0:#,##0.##}", CSng(count * AmountperParticipant)) ' counthold.InnerHtml & mylabeler.Text
                        'Else
                        '    counthold.InnerHtml = "₦" & 0
                    End If

                Next


                cell1.Controls.Add(mylabeler) 'Adds the checkbox to the cell
                e.Row.Cells.Add(cell1) 'adds the cell to the row
                STARTDATE = STARTDATE.AddMonths(1) ' completes the while loop
            End While
        End If
    End Sub

    Private Sub GridView1_DataBound(sender As Object, e As EventArgs) Handles GridView1.DataBound
        'Dim mytemplat As TemplateField = New TemplateField
        '' Dim mylabeler As Label = New Label
        'mytemplat.HeaderText = "My new Header"
        ''  mytemplat.ItemTemplate=New GridView.item
        'GridView1.Columns.Add(mytemplat)
    End Sub
    Public Sub GetDuesLOG(ByVal _duesID As String)
        Dim returner As String = String.Empty
        Dim CNNe As SqlConnection = New SqlConnection
        CNNe.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("kpolomDUMMYConnectionString").ConnectionString

        CNNe.Open()

        Dim CMDe As SqlCommand = New SqlCommand
        ' CMDe.CommandText = "SELECT Password,Centre,userID FROM [myLOGIN] WHERE [Centre]='" & username & "' "
        CMDe.CommandText = "SELECT * FROM [Dues_Log] WHERE (DuesID=@DuesID)"
        CMDe.Parameters.AddWithValue("@DuesID", _duesID)


        CMDe.Connection = CNNe
        Dim dae As SqlDataAdapter = New SqlDataAdapter()
        dae.SelectCommand = CMDe
        Dim dse As Data.DataSet = New Data.DataSet()
        dae.Fill(dse, "Dues_Log")
        ' Dim CB As SqlCommand = New SqlCommand()
        DuesLogdatatable = dse.Tables(0)


        CNNe.Close()

    End Sub

    Private Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridView1.RowCommand
        If e.CommandName = "Redirect" Then
            'Response.Redirect("")
            Dim row As GridViewRow = CType(((CType(e.CommandSource, LinkButton)).NamingContainer), GridViewRow)
            Dim UserID As HtmlGenericControl = CType(row.FindControl("UserEmail"), HtmlGenericControl)
            Session("UserEmail") = UserID.InnerHtml
            Response.Redirect(String.Format("pay.aspx?collectionid={0}", colhold))
        End If
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        If IsPostBack = True Then
            UpdateShareCount(colhold)
        End If
    End Sub

    Private Sub SqlDataSource4_Selected(sender As Object, e As SqlDataSourceStatusEventArgs) Handles SqlDataSource4.Selected
        membercounter.InnerHtml = e.AffectedRows.ToString
        If e.AffectedRows <= 0 Then
            countmembers.InnerHtml = 0
        Else
            countmembers.InnerHtml = e.AffectedRows.ToString
        End If
    End Sub
    Public Sub UpdateShareCount(ByVal collectionidhold As String)
        If IsPostBack Then
            Try


                Dim CNNS As SqlConnection = New SqlConnection
                CNNS.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("kpolomDUMMYConnectionString").ConnectionString

                CNNS.Open()


                Dim CMDS As SqlCommand = New SqlCommand
                CMDS.CommandText = "UPDATE Collection_Details SET ShareCount=@ShareCount WHERE CollectionID=@CollectionID"

                CMDS.Parameters.AddWithValue("@ShareCount", sharecounthold + 1)


                CMDS.Parameters.AddWithValue("@CollectionID", collectionidhold)

                CMDS.Connection = CNNS
                CMDS.ExecuteNonQuery()
                Dim rowsaffected As Integer = CMDS.ExecuteNonQuery
                '  Label2.Text = rowsaffected
                Dim daD As SqlDataAdapter = New SqlDataAdapter()
                daD.SelectCommand = CMDS

                CNNS.Close()

                '  ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert('Account Has Been Updated.');", True)
            Catch ex As Exception
                ''Response.Write(ex.Message)
                'ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert(""" & ex.Message & """);", True)
                Session.Item("errormsg") = ex.Message & vbNewLine & "Page-" & System.IO.Path.GetFileName(Request.Url.ToString) & vbNewLine & ex.Source & vbNewLine & ex.StackTrace

                ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert(""" & ex.Message & """);window.location='Error.aspx';", True)

            End Try
        End If
    End Sub
    Public Function GetTotalDeduction(ByVal collectionid As String) 'As Double
        Dim balance As Double
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
            '  ClientScript.RegisterStartupScript(Me.GetType(), "validation", "alert(""" & ex.Message & """);", True)
            '  ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert(""" & ex.Message & """);window.location='Error.aspx';", True)

        End Try
        Return balance
    End Function


End Class