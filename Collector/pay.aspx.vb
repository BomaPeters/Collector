Imports System.Data.SqlClient
Imports System.Drawing
Imports DevExpress.Web.ASPxSpreadsheet.Internal.Forms

Public Class pay
    Inherits System.Web.UI.Page
    Dim colhold As String ' = "X4QQdTe8E"
    Dim STARTdateforDUES, DueDateforDUES As Date
    Dim DuesLogdatatable As DataTable
    Dim BalHold As Single
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        colhold = Request.QueryString("collectionid")
        Session.Item("collectionhold") = colhold
        GetCollectiondetails(colhold)
        heyyyy.Text = CInt(Session.Item("sharecounthold"))
        If System.Web.HttpContext.Current.Session.Item("UserEmail") Is Nothing Then

        Else
            TextBox2.Text = Session.Item("UserEmail").ToString
            Label2.Text = GetParticipantName(TextBox2.Text, colhold).ToUpper
            GetDuesLOG(Session.Item("PID").ToString, colhold)
            For Each checkitem As ListItem In CheckBoxList1.Items
                'If checkitem.Text.Contains("") Then

                'End If
                For Each readeritem As DataRow In DuesLogdatatable.Rows
                    '    MsgBox(checkitem.Text & "-" & CDate(readeritem.Item(6).ToString).Month, MsgBoxStyle.MsgBoxHelp, "warning")
                    If (CDate(checkitem.Text).Year = CDate(readeritem.Item(6).ToString).Year And CDate(checkitem.Text).Month = CDate(readeritem.Item(6).ToString).Month) Then
                        ' CheckBoxList1.Attributes.Add("Style", "color:green")
                        checkitem.Attributes.Add("Style", "color:#1CADE4")
                        checkitem.Selected = True
                        checkitem.Enabled = False
                    End If
                Next
            Next
        End If
        If Not IsPostBack Then

            If Me.Page.User.Identity.IsAuthenticated = False Then
                notlogged.Visible = True
                loggednow.Visible = False
                ProfileLink.Visible = False
            Else
                notlogged.Visible = False
                loggednow.Visible = True
                ProfileLink.Visible = True

            End If
        End If
    End Sub

    Private Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        'Label2.Text = "HUUUUU"
        Label2.Text = GetParticipantName(TextBox2.Text, colhold).ToUpper
        If Label2.Text.Contains("Name does not exist") Then
        Else
            GetDuesLOG(Session.Item("PID").ToString, colhold)
            For Each checkitem As ListItem In CheckBoxList1.Items
                'If checkitem.Text.Contains("") Then

                'End If
                For Each readeritem As DataRow In DuesLogdatatable.Rows
                    '    MsgBox(checkitem.Text & "-" & CDate(readeritem.Item(6).ToString).Month, MsgBoxStyle.MsgBoxHelp, "warning")
                    If (CDate(checkitem.Text).Year = CDate(readeritem.Item(6).ToString).Year And CDate(checkitem.Text).Month = CDate(readeritem.Item(6).ToString).Month) Then
                        ' CheckBoxList1.Attributes.Add("Style", "color:green")
                        checkitem.Attributes.Add("Style", "color:#1CADE4")
                        checkitem.Selected = True
                        checkitem.Enabled = False
                    End If
                Next
            Next
        End If
    End Sub
    Public Function GetParticipantName(emailorphone As String, _duesID As String) As String
        Dim returner As String = String.Empty
        Try



            Dim CNNe As SqlConnection = New SqlConnection
            CNNe.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("kpolomDUMMYConnectionString").ConnectionString

            CNNe.Open()

            Dim CMDe As SqlCommand = New SqlCommand
            ' CMDe.CommandText = "SELECT Password,Centre,userID FROM [myLOGIN] WHERE [Centre]='" & username & "' "
            CMDe.CommandText = "SELECT Firstname,Lastname,PhoneNumber,EmailAdd,userID FROM [Dues_Participants] WHERE (DuesID=@DuesID) AND (EmailAdd=@EmailAdd OR PhoneNumber=@PhoneNumber)"
            CMDe.Parameters.AddWithValue("@DuesID", _duesID)
            CMDe.Parameters.AddWithValue("@EmailAdd", emailorphone)
            CMDe.Parameters.AddWithValue("@PhoneNumber", emailorphone)
            CMDe.Connection = CNNe
            Dim dae As SqlDataAdapter = New SqlDataAdapter()
            dae.SelectCommand = CMDe
            Dim dse As Data.DataSet = New Data.DataSet()
            dae.Fill(dse, "Dues_Participants")
            ' Dim CB As SqlCommand = New SqlCommand()
            Dim myreadere As SqlDataReader
            myreadere = CMDe.ExecuteReader

            myreadere.Read()
            If myreadere.HasRows Then
                returner = myreadere.GetValue(0).ToString() & " " & myreadere.GetValue(1).ToString()
                ''Session.Item("emailholder") = myreadere.GetValue(1).ToString() ' gets email for payment
                Session.Item("PID") = myreadere.GetValue(4).ToString() ' gets UserID for Paticipant

                Session.Item("donoremailhold") = myreadere.GetValue(3).ToString()
                Session.Item("donorphone") = myreadere.GetValue(2).ToString()
                Session.Item("donorname") = returner
                ' Label2.Visible = True
                selectmonth.Visible = True
                ''Session.Item("UserRole") = myreadere.GetValue(3).ToString() ' gets UserRole
                'Session.Item("UserPhone") = myreadere.GetValue(1).ToString() ' gets UserPhone
                CheckBoxList1.Items.Clear()
                LoadCheckboxDate()
                ''''''''''CHECK EACH CHEBOXLIST IF THEY TALLY WITH DATABASE VALUES'''''
                'For Each checkitem As ListItem In CheckBoxList1.Items
                '    If checkitem.Text.Contains("") Then

                '    End If
                'Next


            Else
                ' Label2.Visible = True
                selectmonth.Visible = False
                returner = "Name does not exist." 'GetProfileDetailsFROMKPOLOM(userid)
                CheckBoxList1.Items.Clear()
                ' "wrong"
            End If

            myreadere.Close()

            CNNe.Close()

        Catch ex As Exception
            ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert(""" & ex.Message & """);", True)
        End Try
        Return returner
    End Function
    Public Sub GetCollectiondetails(ByRef _CollectionID As String)
        Dim returner As String = String.Empty
        Try


            Dim CNNe As SqlConnection = New SqlConnection
            CNNe.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("kpolomDUMMYConnectionString").ConnectionString

            CNNe.Open()

            Dim CMDe As SqlCommand = New SqlCommand
            CMDe.CommandText = "SELECT * FROM Collection_Details WHERE ([CollectionID] = @CollectionID)"
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
                'Label2.Text = String.Format("{0:#,##0.##}", CSng(Val(reader.GetValue(9).ToString()))) 'goal
                Label3.Text = String.Format("{0:#,##0.##}", CSng(Val(reader.GetValue(9).ToString()))) 'goal reader.GetValue(6).ToString() 'collecting for
                Label4.Text = reader.GetValue(2).ToString() ' purpose for collecting
                Session("DuesName") = reader.GetValue(2).ToString()
                STARTdateforDUES = CDate(reader.GetValue(15).ToString()) 'START DATE FOR DUES
                DueDateforDUES = CDate(reader.GetValue(7).ToString()) 'due date FOR DUES
                'descriptionhold.InnerHtml = reader.GetValue(3).ToString() 'description
                'Image1.ImageUrl = reader.GetValue(12).ToString()
                Dim duestype As String = reader.GetValue(16).ToString() ' purpose for collecting
                If duestype.Contains("False") Then
                    Label1.Text = "Anybody"
                Else
                    Label1.Text = "Members Only"
                End If

                If String.IsNullOrEmpty(reader.GetValue(13).ToString()) = True Then
                    Session("sharecounthold") = 0

                Else
                    Session("sharecounthold") = CInt(reader.GetValue(13).ToString())

                End If
            Else
                ' returner = String.Empty

            End If
            reader.Close()
            CNNe.Close()

        Catch ex As Exception
            ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert(""" & ex.Message & """);", True)
        End Try
    End Sub

    'Private Sub DataList1_ItemDataBound(sender As Object, e As DataListItemEventArgs) Handles DataList1.ItemDataBound
    '    Dim mycheck As CheckBox = TryCast(e.Item.FindControl("CheckBox4"), CheckBox)
    'End Sub

    Private Sub CheckBoxList1_Load(sender As Object, e As EventArgs) Handles CheckBoxList1.Load



    End Sub

    'Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click

    '    For Each item As ListItem In CheckBoxList1.Items
    '        If item.Selected = True Then
    '            MsgBox(item.Text, MsgBoxStyle.MsgBoxHelp, "warning")
    '        End If
    '    Next
    'End Sub
    Public Sub LoadCheckboxDate()
        Dim STARTDATE = STARTdateforDUES
        Dim last6months = DueDateforDUES.AddMonths(1)
        While STARTDATE <= last6months
            CheckBoxList1.Items.Add(String.Format("{0} {1}", CDate(STARTDATE).ToString("MMM").ToUpper, STARTDATE.Year))
            ' CheckBoxList1.ForeColor.IsSystemColor = Color.FromKnownColor(KnownColor.Tomato)
            CheckBoxList1.Attributes.Add("Style", "color:red")
            STARTDATE = STARTDATE.AddMonths(1)
        End While

    End Sub
    Public Sub GetDuesLOG(_UserID As String, _duesID As String)
        Dim returner As String = String.Empty
        Dim CNNe As SqlConnection = New SqlConnection
        CNNe.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("kpolomDUMMYConnectionString").ConnectionString

        CNNe.Open()

        Dim CMDe As SqlCommand = New SqlCommand
        ' CMDe.CommandText = "SELECT Password,Centre,userID FROM [myLOGIN] WHERE [Centre]='" & username & "' "
        CMDe.CommandText = "SELECT * FROM [Dues_Log] WHERE (DuesID=@DuesID) AND (userID=@userID)"
        CMDe.Parameters.AddWithValue("@DuesID", _duesID)
        CMDe.Parameters.AddWithValue("@userID", _UserID)

        CMDe.Connection = CNNe
        Dim dae As SqlDataAdapter = New SqlDataAdapter()
        dae.SelectCommand = CMDe
        Dim dse As Data.DataSet = New Data.DataSet()
        dae.Fill(dse, "Dues_Log")
        ' Dim CB As SqlCommand = New SqlCommand()
        DuesLogdatatable = dse.Tables(0)

        'GridView1.DataSource = DuesLogdatatable
        'GridView1.DataBind()
        Dim myreadere As SqlDataReader
        myreadere = CMDe.ExecuteReader

        myreadere.Read()
        If myreadere.HasRows Then
            returner = myreadere.GetValue(0).ToString() & " " & myreadere.GetValue(1).ToString()
            ''Session.Item("emailholder") = myreadere.GetValue(1).ToString() ' gets email for payment
            Session.Item("PID") = myreadere.GetValue(2).ToString() ' gets UserID for Paticipant
            ''Session.Item("UserRole") = myreadere.GetValue(3).ToString() ' gets UserRole
            'Session.Item("UserPhone") = myreadere.GetValue(1).ToString() ' gets UserPhone
            '  LoadCheckboxDate()
            '''''''''CHECK EACH CHEBOXLIST IF THEY TALLY WITH DATABASE VALUES'''''

            '  MsgBox(myreadere.GetValue(1).ToString() & "-" & myreadere.GetValue(1).ToString(), MsgBoxStyle.MsgBoxHelp, "warning")

        Else

            '  CheckBoxList1.Items.Clear()
            ' "wrong"
        End If

        myreadere.Close()

        CNNe.Close()

    End Sub

    Private Sub CheckBoxList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles CheckBoxList1.SelectedIndexChanged
        Dim count As Integer = 0
        For Each item As ListItem In CheckBoxList1.Items
            If item.Selected = True And item.Enabled = True Then
                count += 1
                item.Attributes.Add("Style", "color:#1CADE4")

            End If
            If item.Selected = True And item.Enabled = False Then

                item.Attributes.Add("Style", "color:#1CADE4;text-align:center;")
            End If
        Next
        TextBox1.Text = count * CInt(Label3.Text)
        If count <= 0 Then
            Button1.Visible = False
        Else
            Button1.Visible = True
        End If
        Dim chargehold As Single = Math.Round(Val(TextBox1.Text) * 0.015)
        payable.InnerHtml = Val(TextBox1.Text) + chargehold
        chargeholder.InnerHtml = chargehold
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Try
            HiddenField1.Value = Session.Item("donoremailhold") '"boma@gmail.com"
            Session.Item("amounthold") = CDbl(TextBox1.Text)
            HiddenField2.Value = CDbl(TextBox1.Text) + Math.Round((CInt(TextBox1.Text) * 0.015)) 'CDbl(CSng(Session.Item("amounthold")) + CInt(chargeholder.InnerHtml)) ' I removed * 100
            HiddenField3.Value = Session.Item("donorphone") 'PHONE
            HiddenField4.Value = Label2.Text 'fullname
            Dim s As String = "01234567890123456789012345678901234567890123456789"
            Dim r As New Random

            Dim sb As New System.Text.StringBuilder
            For i As Integer = 1 To 9
                Dim idx As Integer = r.Next(0, 45)
                sb.Append(s.Substring(idx, 1))


            Next
            Session.Item("GeneratedCollectIDDUES") = sb.ToString
            HiddenField5.Value = colhold & "_" & Session.Item("GeneratedCollectIDDUES").ToString 'collection-id
            Session.Item("collectionname") = Label4.Text
            'TEST START
            ''''
            Dim dt As New DataTable

            dt.Columns.Add("LogID", GetType(String))
            dt.Columns.Add("TransID", GetType(String))
            dt.Columns.Add("userID", GetType(String))
            dt.Columns.Add("DuesID", GetType(String))
            dt.Columns.Add("Amount", GetType(Double))
            dt.Columns.Add("TimeOfTrans", GetType(DateTime))
            dt.Columns.Add("PaymentMonth", GetType(Date))
            Dim MR As New Random
            For Each checkeditem As Object In CheckBoxList1.Items

                'Dim LogID As String = GenerateRandom()
                If checkeditem.Selected = True And checkeditem.Enabled = True Then


                    ' MsgBox(GenerateRandom() & "-" & CDate(checkeditem.Text).ToString("MMM-YYYY"))
                    Dim TransID As String = Session.Item("GeneratedCollectIDDUES") 'Guid.NewGuid.ToString.Substring(0, 8)
                    Dim userID As String = Session.Item("PID")
                    Dim DuesID As String = colhold
                    Dim Amount As Double = Convert.ToDouble(Label3.Text)
                    Dim TimeOfTrans As DateTime = DateTime.Now
                    Dim PaymentMonth As Date = CDate(checkeditem.Text)
                    dt.Rows.Add(MR.Next().ToString().Substring(0, 9), TransID, userID, DuesID, Amount, TimeOfTrans, PaymentMonth)
                End If
            Next

            Session("selectedItems") = dt
            ' Response.Redirect("complete.aspx")
            'END TEST 

            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "validation", "<script type='text/javascript'>makePayment();</script>", False)


        Catch ex As Exception
            ''Response.Write(ex.Message)
            'ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert(""" & ex.Message & """);", True)
            Session.Item("errormsg") = ex.Message & vbNewLine & "Page-" & System.IO.Path.GetFileName(Request.Url.ToString) & vbNewLine & ex.Source & vbNewLine & ex.StackTrace

            ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert(""" & ex.Message & """);window.location='Error.aspx';", True)

        End Try
        ''/////CURRENTLY WORK CODE//////
        'BalHold = LoadBalance()
        '''Count Number of CheckedCheckboxes
        'Dim CHECKCOUNT As Integer = 0
        'For Each checkeditem As Object In CheckBoxList1.Items

        '    'Dim LogID As String = GenerateRandom()
        '    If checkeditem.Selected = True And checkeditem.Enabled = True Then
        '        CHECKCOUNT += 1
        '    End If

        'Next
        ''end COUNT
        'creditAccountContrib(BalHold, CHECKCOUNT * CDbl(Label3.Text))
        'InsertToDuesLOG(Session.Item("GeneratedCollectIDDUES").ToString)
        ''///////END OF CURRENT WORKING CODE
    End Sub
    Public Sub InsertToDuesLOG(ByVal _transID As String)
        Try

            Dim dt As New DataTable

            dt.Columns.Add("LogID", GetType(String))
            dt.Columns.Add("TransID", GetType(String))
            dt.Columns.Add("userID", GetType(String))
            dt.Columns.Add("DuesID", GetType(String))
            dt.Columns.Add("Amount", GetType(Double))
            dt.Columns.Add("TimeOfTrans", GetType(DateTime))
            dt.Columns.Add("PaymentMonth", GetType(Date))
            Dim MR As New Random
            For Each checkeditem As Object In CheckBoxList1.Items

                'Dim LogID As String = GenerateRandom()
                If checkeditem.Selected = True And checkeditem.Enabled = True Then


                    ' MsgBox(GenerateRandom() & "-" & CDate(checkeditem.Text).ToString("MMM-YYYY"))
                    Dim TransID As String = _transID 'Guid.NewGuid.ToString.Substring(0, 8)
                    Dim userID As String = Session.Item("PID")
                    Dim DuesID As String = colhold
                    Dim Amount As Double = Convert.ToDouble(Label3.Text)
                    Dim TimeOfTrans As DateTime = DateTime.Now
                    Dim PaymentMonth As Date = CDate(checkeditem.Text)
                    dt.Rows.Add(MR.Next().ToString().Substring(0, 9), TransID, userID, DuesID, Amount, TimeOfTrans, PaymentMonth)
                End If
            Next
            'GridView1.DataSource = dt
            'GridView1.DataBind()
            Session("selectedItems") = dt
            Dim consString As String = ConfigurationManager.ConnectionStrings("kpolomDUMMYConnectionString").ConnectionString
            Using connection As New SqlConnection(consString)
                '    'Using CMD As New SqlCommand("INSERT INTO Dues_Log(LogID,TransID,userID,DuesID,Amount,TimeOfTrans,PaymentMonth) VALUES (@LogID,@TransID,@userID,@DuesID,@Amount,@TimeOfTrans,@PaymentMonth)  ",
                '    '                    connection)

                Using sqlBulkCopy As New SqlBulkCopy(connection)
                    'Set the database table name
                    sqlBulkCopy.DestinationTableName = "dbo.Dues_Log"

                    '[OPTIONAL]: Map the DataTable columns with that of the database table
                    sqlBulkCopy.ColumnMappings.Add("LogID", "LogID")
                    sqlBulkCopy.ColumnMappings.Add("TransID", "TransID")
                    sqlBulkCopy.ColumnMappings.Add("userID", "userID")
                    sqlBulkCopy.ColumnMappings.Add("DuesID", "DuesID")
                    sqlBulkCopy.ColumnMappings.Add("Amount", "Amount")
                    sqlBulkCopy.ColumnMappings.Add("TimeOfTrans", "TimeOfTrans")
                    sqlBulkCopy.ColumnMappings.Add("PaymentMonth", "PaymentMonth")
                    connection.Open()
                    sqlBulkCopy.WriteToServer(dt)

                    connection.Close()
                End Using
            End Using



            ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert(""" & "done" & """);", True) 'window.location='complete.aspx';
        Catch ex As Exception
            MsgBox(ex.Message)
            'Session.Item("errormsg") = ex.Message & vbNewLine & "Page-" & System.IO.Path.GetFileName(Request.Url.ToString) & vbNewLine & ex.Source & vbNewLine & ex.StackTrace

            ' ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert(""" & ex.Message & """);window.location='Error.aspx';", True)
        End Try
    End Sub

    Private Sub TextBox1_TextChanged(sender As Object, e As EventArgs) Handles TextBox1.TextChanged

    End Sub
    Public Sub creditAccountContrib(ByVal _Bal As Single, ByVal _Amt As Single)
        Try


            Dim s As String = "01234567890123456789012345678901234567890123456789"
            Dim r As New Random

            Dim sb As New System.Text.StringBuilder
            For i As Integer = 1 To 9
                Dim idx As Integer = r.Next(0, 45)
                sb.Append(s.Substring(idx, 1))


            Next
            Session.Item("GeneratedCollectIDDUES") = sb.ToString
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

            drow("TransID") = Session.Item("GeneratedCollectIDDUES").ToString 'sb.ToString
            drow("CollectionID") = Session.Item("collectionhold").ToString
            drow("TransDate") = DateTime.Now.ToString("dd-MMM-yyyy")
            drow("Deposit") = _Amt 'CDbl(Session.Item("amounthold"))
            drow("Withdrawal") = DBNull.Value
            drow("Balance") = (_Bal + _Amt) 'CInt(Session.Item("amounthold"))

            drow("TimeOfTrans") = DateTime.Now.ToLongTimeString



            ds.Tables("Collection_Log").Rows.Add(drow)
            da.Update(ds, "Collection_Log")
            CNN.Close()
        Catch ex As Exception
            Session.Item("errormsg") = ex.Message & vbNewLine & "Page-" & System.IO.Path.GetFileName(Request.Url.ToString) & vbNewLine & ex.Source & vbNewLine & ex.StackTrace

            ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert(""" & ex.Message & """);window.location='Error.aspx';", True)
        End Try
    End Sub
    Public Function LoadBalance() As Double

        Dim balance As Integer = 0
        Try
            Dim CNN As SqlConnection = New SqlConnection
            CNN.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("kpolomDUMMYConnectionString").ConnectionString

            CNN.Open()

            Dim CMD As SqlCommand = New SqlCommand
            CMD.CommandText = "SELECT TOP (1) CollectionID, TransDate, Deposit, Withdrawal, Balance, TimeOfTrans FROM  Collection_Log WHERE  CollectionID='" & Session.Item("collectionhold").ToString & "'ORDER BY TimeOfTrans DESC"


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

    Private Sub pay_Unload(sender As Object, e As EventArgs) Handles Me.Unload
        'Session("UserEmail")

    End Sub

    Private Sub form1_Unload(sender As Object, e As EventArgs) Handles form1.Unload
        Session.Remove("UserEmail")
    End Sub
End Class