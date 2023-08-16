Imports System.Collections.ObjectModel
Imports System.Data.SqlClient
Public Class mycollections
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Session.Item("CID") = "aDZdRMWbU" ' "ZDRT6M6L7" '"bTO8PEfFL" ' '

        MaintainScrollPositionOnPostBack = True
    End Sub

    Private Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
        ' Dim kko As HtmlGenericControl = CType()
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim rangehold As HtmlGenericControl = CType(e.Row.FindControl("rangeholder"), HtmlGenericControl)
            Dim goalholder As HtmlGenericControl = CType(e.Row.FindControl("goalholder"), HtmlGenericControl)
            Dim loadholder As HtmlGenericControl = CType(e.Row.FindControl("loadbalance"), HtmlGenericControl)
            Dim duedateholder As HtmlGenericControl = CType(e.Row.FindControl("duedate"), HtmlGenericControl)
            Dim Cashoutbtn As LinkButton = CType(e.Row.FindControl("LinkButton2"), LinkButton)
            Dim Editbtn As LinkButton = CType(e.Row.FindControl("LinkButton3"), LinkButton)
            Dim AddParticipantbtn As LinkButton = CType(e.Row.FindControl("LinkButton4"), LinkButton)
            Dim rangecontainer As HtmlGenericControl = CType(e.Row.FindControl("rangecontainer"), HtmlGenericControl)
            Dim Raised As HtmlGenericControl = CType(e.Row.FindControl("Raised"), HtmlGenericControl)
            Dim Deducted As HtmlGenericControl = CType(e.Row.FindControl("Deducted"), HtmlGenericControl)
            Dim collectionID As HtmlGenericControl = CType(e.Row.FindControl("collectionID"), HtmlGenericControl)
            Dim raiseanddeductHold As HtmlGenericControl = CType(e.Row.FindControl("raiseanddeductHold"), HtmlGenericControl)
            Dim raisedhold As Double = GetTotalDeduction(collectionID.InnerHtml)
            Dim loadhold As Double = LoadBalance(collectionID.InnerHtml)
            Dim hyperhold As HyperLink = CType(e.Row.FindControl("HyperLink1"), HyperLink)
            '  Dim label2 As Label = CType(e.Row.FindControl("Label2"), Label)
            rangehold.Style.Add("width", Math.Round(getpercentofnumber(loadholder.InnerHtml, Val(goalholder.InnerHtml))).ToString & "%")

            Raised.InnerHtml = "₦" & String.Format("{0:#,##0.##}", raisedhold + loadhold)
            Deducted.InnerHtml = "₦" & String.Format("{0:#,##0.##}", raisedhold)
            ''''datecalc

            If Today.Date > CDate(duedateholder.InnerHtml) Then
                duedateholder.InnerHtml = " <i class='fa fa-times-circle'></i> EXPIRED"
                duedateholder.Attributes.Add("class", "badge badge-danger ")
                Editbtn.Visible = False
            Else
                Editbtn.Visible = True
            End If


            '''''enddatecalc


            '''''''''
            Dim typehold As HtmlGenericControl = CType(e.Row.FindControl("typeholder"), HtmlGenericControl)
            '''''MAKE VIEW HYPERLINK WORK
            If typehold.InnerHtml = "COLLECTION" Then
                hyperhold.NavigateUrl = Request.Url.AbsoluteUri.Replace(Request.Url.PathAndQuery, "/") & "share.aspx?collectionid=" & Trim(collectionID.InnerText)

            Else
                hyperhold.NavigateUrl = Request.Url.AbsoluteUri.Replace(Request.Url.PathAndQuery, "/") & "dues.aspx?collectionid=" & Trim(collectionID.InnerText)

            End If
            ''''end view here

            Dim statushold As HtmlGenericControl = CType(e.Row.FindControl("statushold"), HtmlGenericControl)
            If statushold.InnerHtml.Contains("UNPAID") Then
                statushold.InnerHtml = " <i class='fa fa-times-circle'></i> UNPAID"
                statushold.Attributes.Add("class", "badge bg-warning")
                Cashoutbtn.Enabled = True
                If typehold.InnerHtml.Contains("DUES") Then
                    Cashoutbtn.Text = "Withdraw"
                    Cashoutbtn.Attributes.Add("onclick", "return confirm('WARNING: You are about to withdraw from this collection.Click OK to continue.');")
                Else
                    Cashoutbtn.Text = "CashOut"
                    Cashoutbtn.Attributes.Add("onclick", "return confirm('WARNING: Cashing-Out this collection will close it and new donations will not be allowed after you cash out.Click OK to continue.');")
                End If

            ElseIf statushold.InnerHtml.Contains("PROCESSING") Then
                statushold.InnerHtml = " <i class='fa fa-check-circle'></i> PROCESSING"
                statushold.Attributes.Add("class", "badge badge-primary ")
                Cashoutbtn.Text = "<i class='fa fa-check-circle'></i> Processing"
                Cashoutbtn.CssClass = "btn btn-primary  btn-sm btn-block disabled small"

            Else
                statushold.InnerHtml = " <i class='fa fa-check-circle'></i> PAID"
                statushold.Attributes.Add("class", "badge bg-success fa-inverse")
                'Cashoutbtn.Enabled = False
                Cashoutbtn.Text = "<i class='fa fa-check-circle'></i> PAID"
                Cashoutbtn.CssClass = "btn btn-success btn-sm btn-block disabled"
            End If
            '''''''''
            Dim smallInBetween As HtmlGenericControl = CType(e.Row.FindControl("smallinbetween"), HtmlGenericControl)
            Dim innerPart As HtmlGenericControl = CType(e.Row.FindControl("innerPart"), HtmlGenericControl)

            If typehold.InnerHtml.Contains("DUES") Then
                typehold.InnerHtml = " <i class='fa fa-arrow-alt-circle-right'></i> DUES"
                smallInBetween.InnerHtml = "collected at"
                rangecontainer.Visible = False

                If Val(raisedhold) <= 0 Then
                    raiseanddeductHold.Visible = False
                Else
                    raiseanddeductHold.Visible = True
                End If
                ' Cashoutbtn.Text = "WITHDRAW"
            Else
                typehold.InnerHtml = " <i class='fa fa-arrow-alt-circle-up'></i> COLLECTION"
                typehold.Attributes.Add("class", "badge badge-primary ")
                innerPart.Visible = False
                rangecontainer.Visible = True
                AddParticipantbtn.Visible = False
                raiseanddeductHold.Visible = False
                hyperhold.Visible = False
                ' Cashoutbtn.Text = "CaSHOUT"
            End If
        End If
    End Sub

    Private Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridView1.RowCommand
        'casher
        If e.CommandName = "casher" Then
            Dim row As GridViewRow = CType(((CType(e.CommandSource, LinkButton)).NamingContainer), GridViewRow)
            Dim loadholder As HtmlGenericControl = CType(row.FindControl("loadbalance"), HtmlGenericControl)
            Dim bankname As HtmlGenericControl = CType(row.FindControl("bankname"), HtmlGenericControl)
            Dim acctname As HtmlGenericControl = CType(row.FindControl("receivername"), HtmlGenericControl)
            Dim acctNUMBER As HtmlGenericControl = CType(row.FindControl("receiveracctno"), HtmlGenericControl)
            Dim collectionIDNEW As HtmlGenericControl = CType(row.FindControl("collectionID"), HtmlGenericControl)
            Dim Labella As Label = CType(row.FindControl("Label4"), Label)
            Dim typehold As HtmlGenericControl = CType(row.FindControl("typeholder"), HtmlGenericControl)
            Dim DuesAmtHolder As Label = CType(row.FindControl("Label1"), Label)
            'Session.Item("collectold") = collectionIDNEW.InnerHtml
            '' Label2.Text = Session.Item("collectold").ToString
            'Label2.Text = "EdUNKTJDO"
            If CDbl(loadholder.InnerText) <= 100 Then
                ClientScript.RegisterStartupScript([GetType](), "alert", (Convert.ToString("alert('") & "You cannot cashout less than ₦100.") + "');", True)

            Else
                If typehold.InnerHtml.Contains("DUES") Then
                    Label7.Text = collectionIDNEW.InnerHtml
                    Label8.Text = "₦" & String.Format("{0:#,##0.##}", CDbl(loadholder.InnerHtml)) 'DuesAmtHolder.Text
                    banknameSmall.InnerHtml = bankname.InnerHtml
                    acctNumsmall.InnerHtml = acctNUMBER.InnerHtml
                    AcctnameSmall.InnerHtml = acctname.InnerHtml
                    TextBox9.Text = ""
                    ClientScript.RegisterStartupScript(Me.GetType(), "Popup", "callme4();", True)
                    'Updater(Labella.Text)

                    'insert_paymentnotification(bankname.InnerHtml, acctNUMBER.InnerHtml, acctname.InnerHtml, CDbl(loadholder.InnerHtml), collectionIDNEW.InnerHtml, Session.Item("UserPhone").ToString, "DEBIT")
                    'GridView1.DataBind()
                    'Page.MaintainScrollPositionOnPostBack = True
                Else
                    Updater(Labella.Text)

                    insert_paymentnotification(bankname.InnerHtml, acctNUMBER.InnerHtml, acctname.InnerHtml, CDbl(loadholder.InnerHtml), collectionIDNEW.InnerHtml, Session.Item("UserPhone").ToString, "CASHOUT")
                    GridView1.DataBind()
                    Page.MaintainScrollPositionOnPostBack = True
                End If
            End If
        End If
        If e.CommandName = "sharer" Then
            Dim row As GridViewRow = CType(((CType(e.CommandSource, LinkButton)).NamingContainer), GridViewRow)
            Dim typehold As HtmlGenericControl = CType(row.FindControl("typeholder"), HtmlGenericControl)
            Dim collectionIDNEW As HtmlGenericControl = CType(row.FindControl("collectionID"), HtmlGenericControl)
            Dim collectionamehold As HtmlGenericControl = CType(row.FindControl("collectionamehold"), HtmlGenericControl)
            If typehold.InnerHtml.Contains("COLLECTION") Then

                Text1.Value = Trim("https://collector.ng/share.aspx?collectionid=" + collectionIDNEW.InnerHtml)
                facebookshare.HRef = "https://www.facebook.com/sharer/sharer.php?u=https://www.collector.ng/share.aspx?collectionid=" & collectionIDNEW.InnerHtml
                '  facebookshare.Target = "_blank"
                twittershare.HRef = "https://twitter.com/intent/tweet?text=https://www.collector.ng/share.aspx?collectionid=" & collectionIDNEW.InnerHtml
                whatsappshare.HRef = "https://wa.me/?text=Hello,could%20you%20help%20share%20or%20donate%20to%20this%20collection.%20" & collectionamehold.InnerHtml & ".%20To%20know%20more%20visit%20" & Text1.Value
                ClientScript.RegisterStartupScript(Me.GetType(), "Popup", "callme();", True)

            Else

                Text1.Value = Trim("https://collector.ng/dues.aspx?collectionid=" + collectionIDNEW.InnerHtml)
                facebookshare.HRef = "https://www.facebook.com/sharer/sharer.php?u=https://www.collector.ng/dues.aspx?collectionid=" & collectionIDNEW.InnerHtml
                '  facebookshare.Target = "_blank"
                twittershare.HRef = "https://twitter.com/intent/tweet?text=https://www.collector.ng/dues.aspx?collectionid=" & collectionIDNEW.InnerHtml
                whatsappshare.HRef = "https://wa.me/?text=Hello,could%20you%20help%20share%20or%20donate%20to%20this%20collection.%20" & collectionamehold.InnerHtml & ".%20To%20know%20more%20visit%20" & Text1.Value
                ClientScript.RegisterStartupScript(Me.GetType(), "Popup", "callme();", True)

            End If

        End If
        If e.CommandName = "editor" Then
            'TextBox2.Text = myreader.GetValue(2).ToString() 'lastname


            Dim row As GridViewRow = CType(((CType(e.CommandSource, LinkButton)).NamingContainer), GridViewRow)
            Dim typehold As HtmlGenericControl = CType(row.FindControl("typeholder"), HtmlGenericControl)
            Dim goalholder As HtmlGenericControl = CType(row.FindControl("goalholder"), HtmlGenericControl)
            Dim collectionID As HtmlGenericControl = CType(row.FindControl("collectionID"), HtmlGenericControl)
            Dim collectionamehold As HtmlGenericControl = CType(row.FindControl("collectionamehold"), HtmlGenericControl)
            Dim collectiondeschold As HtmlGenericControl = CType(row.FindControl("collectiondesc"), HtmlGenericControl)
            Dim duedatehold As HtmlGenericControl = CType(row.FindControl("duedate"), HtmlGenericControl)
            Dim Categoryhold As HtmlGenericControl = CType(row.FindControl("Category"), HtmlGenericControl)
            TextBox1.Text = collectionamehold.InnerHtml
            If typehold.InnerHtml.Contains("COLLECTION") Then
                Dim kk As List(Of ListItem) = New List(Of ListItem)
                kk.Add(New ListItem("Medical", "Medical"))
                kk.Add(New ListItem("Emergency", "Emergency"))
                kk.Add(New ListItem("Education", "Education"))
                kk.Add(New ListItem("Religious", "Religious"))
                kk.Add(New ListItem("Burial", "Burial"))
                kk.Add(New ListItem("Business", "Business"))
                kk.Add(New ListItem("Celebration", "Celebration"))
                kk.Add(New ListItem("Find-Me-Something", "Find-Me-Something"))

                DropDownList2.Items.AddRange(kk.ToArray)
                DropDownList2.SelectedValue = Trim(Categoryhold.InnerHtml)
                TextBox4.Text = CDate(duedatehold.InnerHtml).ToString("yyyy-MM-dd")
                TextBox5.Text = CDbl(goalholder.InnerHtml)
                TextBox6.Text = Server.HtmlDecode(collectiondeschold.InnerHtml)
                Label5.Text = collectionID.InnerHtml
                ClientScript.RegisterStartupScript(Me.GetType(), "Popup", "callme2();", True)
            Else
                Dim kk As List(Of ListItem) = New List(Of ListItem)
                kk.Add(New ListItem("Alumni", "Alumni"))
                kk.Add(New ListItem("Home Owners Association", "Home Owners Association"))

                kk.Add(New ListItem("Religious", "Religious"))
                kk.Add(New ListItem("Family", "Family"))
                kk.Add(New ListItem("Sports", "Sports"))
                kk.Add(New ListItem("Social", "Social"))
                kk.Add(New ListItem("Professional", "Professional"))


                DropDownList2.Items.AddRange(kk.ToArray)
                DropDownList2.SelectedValue = Trim(Categoryhold.InnerHtml)
                TextBox4.Text = CDate(duedatehold.InnerHtml).ToString("yyyy-MM-dd")
                TextBox5.Text = CDbl(goalholder.InnerHtml)
                TextBox6.Text = Server.HtmlDecode(collectiondeschold.InnerHtml)
                Label5.Text = collectionID.InnerHtml
                TextBox4.Attributes.Add("required", "True")
                TextBox5.Attributes.Add("required", "True")
                TextBox6.Attributes.Add("required", "True")
                TextBox1.Attributes.Add("required", "True")
                ''''
                TextBox2.Attributes.Remove("required")
                TextBox3.Attributes.Remove("required")
                TextBox7.Attributes.Remove("required")
                TextBox8.Attributes.Remove("required")
                ''

                ClientScript.RegisterStartupScript(Me.GetType(), "Popup", "callme2();", True)
            End If
        End If
        If e.CommandName = "Adder" Then
            Dim row As GridViewRow = CType(((CType(e.CommandSource, LinkButton)).NamingContainer), GridViewRow)
            ' Dim typehold As HtmlGenericControl = CType(row.FindControl("typeholder"), HtmlGenericControl)

            Dim collectionID As HtmlGenericControl = CType(row.FindControl("collectionID"), HtmlGenericControl)
            Label6.Text = collectionID.InnerHtml
            TextBox2.Attributes.Add("required", "True")
            TextBox3.Attributes.Add("required", "True")
            TextBox7.Attributes.Add("required", "True")
            TextBox8.Attributes.Add("required", "True")

            'start here
            TextBox4.Attributes.Remove("required")
            TextBox5.Attributes.Remove("required")
            TextBox6.Attributes.Remove("required")
            TextBox1.Attributes.Remove("required")

            'end HERE

            ClientScript.RegisterStartupScript(Me.GetType(), "Popup", "callme3();", True)
        End If
    End Sub
    Public Function LoadBalance(ByVal collectionid As String) ' As Double
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
                balance = Val(myreader.GetValue(4).ToString())
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

    Public Sub insert_paymentnotification(ByVal bankname As String, ByVal accountnumber As String, ByVal accountName As String, ByVal amount As Double, ByVal collectionID As String, ByVal _userID As String, ByVal _typeOfTransac As String)
        Dim CNN As SqlConnection = New SqlConnection
        CNN.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("kpolomDUMMYConnectionString").ConnectionString

        CNN.Open()

        Dim CMD As SqlCommand = New SqlCommand
        CMD.CommandText = "SELECT * FROM  payment_notification"


        CMD.Connection = CNN
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        da.SelectCommand = CMD
        Dim ds As Data.DataSet = New Data.DataSet()
        da.Fill(ds, "payment_notification")
        Dim CB As SqlCommandBuilder = New SqlCommandBuilder(da)
        Dim drow As Data.DataRow = ds.Tables("payment_notification").NewRow


        drow("Bank_Name") = bankname

        drow("Account_Number") = accountnumber
        drow("Account_Name") = accountName
        drow("Amount") = amount
        drow("KID") = _userID
        drow("Created_date") = DateTime.Now.ToLongTimeString
        drow("Status") = 0
        drow("Updated_date") = DateTime.Now.ToLongTimeString

        drow("TypeOfAccount") = "Collection"


        drow("TransID") = collectionID
        drow("TypeOfTrans") = _typeOfTransac '"CASHOUT"
        ds.Tables("payment_notification").Rows.Add(drow)
        da.Update(ds, "payment_notification")
        CNN.Close()

        ClientScript.RegisterStartupScript([GetType](), "alert", (Convert.ToString("alert('") & "Payment notification has been received.Receiver account will be credited in 24 hours on weekdays,may take longer on weekends.") + "');", True)

    End Sub
    Public Sub Updater(ByVal collectionidhold As String)
        If IsPostBack Then
            Try


                Dim CNNS As SqlConnection = New SqlConnection
                CNNS.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("kpolomDUMMYConnectionString").ConnectionString

                CNNS.Open()


                Dim CMDS As SqlCommand = New SqlCommand
                CMDS.CommandText = "UPDATE Collection_Details SET Status='PROCESSING',PaidDate=@PaidDate WHERE CollectionID=@CollectionID"




                CMDS.Parameters.AddWithValue("@CollectionID", collectionidhold)
                CMDS.Parameters.AddWithValue("@PaidDate", DateTime.Now)

                CMDS.Connection = CNNS
                CMDS.ExecuteNonQuery()
                Dim rowsaffected As Integer = CMDS.ExecuteNonQuery
                '  Label2.Text = rowsaffected
                Dim daD As SqlDataAdapter = New SqlDataAdapter()
                daD.SelectCommand = CMDS

                CNNS.Close()

                '  ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert('Account Has Been Updated.');", True)
            Catch ex As Exception
                'Response.Write(ex.Message)
                ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert(""" & ex.Message & """);", True)
            End Try
        End If
    End Sub
    Public Sub UpdateCollectionDetails(ByVal collectionidhold As String)
        If IsPostBack Then
            Try


                Dim CNNS As SqlConnection = New SqlConnection
                CNNS.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("kpolomDUMMYConnectionString").ConnectionString

                CNNS.Open()


                Dim CMDS As SqlCommand = New SqlCommand
                CMDS.CommandText = "UPDATE Collection_Details SET Collection_Name=@Collection_Name,Collection_Desc=@Collection_Desc,DueDate=@DueDate,Goal=@Goal,Category=@Category WHERE CollectionID=@CollectionID"




                CMDS.Parameters.AddWithValue("@CollectionID", collectionidhold)
                CMDS.Parameters.AddWithValue("@Collection_Name", TextBox1.Text)
                CMDS.Parameters.AddWithValue("@Collection_Desc", Server.HtmlEncode(TextBox6.Text))
                CMDS.Parameters.AddWithValue("@DueDate", CDate(TextBox4.Text))
                CMDS.Parameters.AddWithValue("@Goal", TextBox5.Text)
                CMDS.Parameters.AddWithValue("@Category", DropDownList2.SelectedItem.Text)
                CMDS.Connection = CNNS
                CMDS.ExecuteNonQuery()
                Dim rowsaffected As Integer = CMDS.ExecuteNonQuery
                '  Label2.Text = rowsaffected
                Dim daD As SqlDataAdapter = New SqlDataAdapter()
                daD.SelectCommand = CMDS

                CNNS.Close()
                GridView1.DataBind()
                ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert('Collection Has Been Updated.');", True)
            Catch ex As Exception
                'Response.Write(ex.Message)
                ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert(""" & ex.Message & """);", True)
            End Try
        End If
    End Sub
    Private Sub SqlDataSource1_Selected(sender As Object, e As SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Selected
        If e.AffectedRows <= 0 Then
            verifier.Visible = True
        Else
            verifier.Visible = False
        End If
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        TextBox4.Visible = False
        TextBox5.Enabled = False
        TextBox6.Enabled = False
        UpdateCollectionDetails(Label5.Text)
    End Sub
    Public Sub createMember(ByVal _duesID As String)
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

        drow("DuesID") = _duesID
        drow("Firstname") = TextBox2.Text.ToUpper
        drow("Lastname") = TextBox3.Text.ToUpper
        drow("PhoneNumber") = TextBox7.Text
        drow("EmailAdd") = TextBox8.Text
        drow("CreatedDate") = DateTime.Now
        ds.Tables("Dues_Participants").Rows.Add(drow)
        da.Update(ds, "Dues_Participants")
        CNN.Close()

        TextBox2.Text = ""
        TextBox3.Text = ""
        TextBox7.Text = ""
        TextBox8.Text = ""
        '  ClientScript.RegisterStartupScript([GetType](), "alert", (Convert.ToString("alert('") & "Collection has been successfully created.") + "');", True)
        ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert('Member has been successfully been added.');", True)
    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click

        createMember(Label6.Text)
    End Sub

    Private Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        Updater(Label7.Text)

        insert_paymentnotification(banknameSmall.InnerHtml, acctNumsmall.InnerHtml, AcctnameSmall.InnerHtml, HiddenField1.Value, Label7.Text, Session.Item("UserPhone").ToString, "DEBIT") 'UserPhone
        GridView1.DataBind()
        Page.MaintainScrollPositionOnPostBack = True
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

    Private Sub GridView2_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView2.RowDataBound
        'var valhold = document.getElementById('<%= TextBox9.ClientID %>').value;
        '       var numonly = valhold.replace(/\D/g, '');
        'var chargehold = Math.Round(0.01 * numonly);
        '       If (chargehold <= 100) Then {
        '           chargehold = 100
        '       } else {
        '           chargehold = chargehold;
        '       };
        '<%#"₦" & String.Format("{0:#,##0.##}", LoadBalance(Eval("CollectionID").ToString) - (LoadBalance(Eval("CollectionID").ToString) * 0.03)) %>'
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim collectionID As HtmlGenericControl = CType(e.Row.FindControl("collectionID"), HtmlGenericControl)
            Dim Typehold As HtmlGenericControl = CType(e.Row.FindControl("Type"), HtmlGenericControl)
            Dim withdrawnhold As Double = GetTotalDeduction(collectionID.InnerHtml)
            Dim label2 As Label = CType(e.Row.FindControl("Label2"), Label)
            Dim label3 As Label = CType(e.Row.FindControl("Label3"), Label)
            Dim loadhold As Double = LoadBalance(collectionID.InnerHtml)
            Dim chargehold As Double = Math.Round(0.01 * loadhold)


            If Typehold.InnerHtml.Contains("DUES") Then
                label2.Text = "₦" & String.Format("{0:#,##0.##}", withdrawnhold + loadhold)
                label3.Text = "₦" & String.Format("{0:#,##0.##}", withdrawnhold - (Math.Ceiling(chargehold / 100) * 100))
            Else
                label2.Text = "₦" & String.Format("{0:#,##0.##}", loadhold)
                label3.Text = "₦" & String.Format("{0:#,##0.##}", loadhold - Math.Round((loadhold * 0.03)))
            End If


            If Typehold.InnerHtml.Contains("DUES") Then
                Typehold.InnerHtml = " <i class='fa fa-arrow-alt-circle-right'></i> DUES"

            Else
                Typehold.InnerHtml = " <i class='fa fa-arrow-alt-circle-up'></i> COLLECTION"
                Typehold.Attributes.Add("class", "badge badge-primary ")

            End If
        End If
    End Sub
End Class