Imports System.Data.SqlClient
Public Class share
    Inherits System.Web.UI.Page
    Dim colhold As String
    Dim userID As String
    Dim sharecounthold As Integer
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try


            colhold = Request.QueryString("collectionid")
            Session.Item("collectionhold") = colhold
            Session.Remove("imgholding")
            GetCollectiondetails(colhold)
            creatorname.InnerHtml = GetCreatorName(userID)
            Dim loadhold As Double = LoadBalance()
            Label1.Text = "₦" & String.Format("{0:#,##0.##}", loadhold)
            Text1.Value = "https://collector.ng/share.aspx?collectionid=" & colhold
            rangeholder.Style.Add("width", Math.Round(getpercentofnumber(loadhold, Val(goalhold.InnerHtml))).ToString & "%")
            ' Label1.Text = Math.Round(getpercentofnumber(1550, 100000))
            ' Label2.Text = String.Format("{0:#,##0.##}", CSng(goalhold.InnerHtml))
            goalhold.InnerText = "₦" & String.Format("{0:#,##0.##}", CSng(goalhold.InnerHtml))
            CountComments()

            If Not IsPostBack Then
                'DataList1.DataSourceID = SqlDataSource1.ID
                'DataList1.DataBind()
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
        Dim pgd As PagedDataSource = New PagedDataSource()
        pgd.DataSource = SqlDataSource1.Select(DataSourceSelectArguments.Empty())
        pgd.CurrentPageIndex = CurrentPageIndex
        pgd.AllowPaging = True
        pgd.PageSize = 5
        LinkButton2.Enabled = Not (pgd.IsLastPage)
        LinkButton1.Enabled = Not (pgd.IsFirstPage)
        DataList1.DataSource = pgd
        DataList1.DataBind()
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
            '  Label2.Text = String.Format("{0:#,##0.##}", CSng(Val(reader.GetValue(9).ToString()))) 'goal
            goalhold.InnerHtml = CSng(Val(reader.GetValue(9).ToString()))
            '"₦" & String.Format("{0:#,##0.##}", CSng(Val(reader.GetValue(9).ToString())))
            Label3.Text = reader.GetValue(6).ToString() 'collecting for
            Label4.Text = reader.GetValue(2).ToString() ' purpose for collecting

            If Today.Date > CDate(reader.GetValue(7).ToString()) Then
                duedate.InnerHtml = " <i class='fa fa-times-circle'></i> EXPIRED"
                'duedateholder.Attributes.Add("class", "badge badge-danger ")
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

            If reader.GetValue(10).ToString = "PROCESSING" Or reader.GetValue(10).ToString = "PAID" Then
                Button1.Text = " CLOSED" ' ✖
                Button1.CssClass = "btn btn-danger btn-lg  btn-block disabled "
                Button1.Enabled = False
            Else


            End If
        Else
            ' returner = String.Empty

        End If
        reader.Close()
        CNNe.Close()


    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect(String.Format("donate.aspx?collectionid={0}", colhold))
    End Sub
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

    Private Sub SqlDataSource1_Selected(sender As Object, e As SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Selected
        contribcnt.InnerHtml = e.AffectedRows.ToString
        If e.AffectedRows < 1 Then
            verifier.Visible = True
            nextprevbtnhold.Visible = False
        Else
            verifier.Visible = False
            nextprevbtnhold.Visible = True
        End If
    End Sub

    Private Sub LinkButton2_Click(sender As Object, e As EventArgs) Handles LinkButton2.Click
        CurrentPageIndex += 1
        showData()
        Page.MaintainScrollPositionOnPostBack = True
    End Sub

    Private Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        CurrentPageIndex -= 1
        showData()
        Page.MaintainScrollPositionOnPostBack = True
    End Sub

    Public Sub CountComments()
        ' Dim returner As Single

        Dim CNNr As SqlConnection = New SqlConnection
        CNNr.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("kpolomDUMMYConnectionString").ConnectionString

        CNNr.Open()

        Dim CMDe As SqlCommand = New SqlCommand
        CMDe.CommandText = "SELECT COUNT( * ) as counter FROM [Collection_Log] INNER JOIN Donor_Details ON Collection_Log.TransID= Donor_Details.TransID WHERE (Collection_Log.[CollectionID] =@CollectionID ) AND (  Donor_Details.Donor_Comment  IS NOT NULL )" '' DID NOT HAVE PLACEMENT ID BEFORE

        CMDe.Parameters.AddWithValue("@CollectionID", colhold)

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
                commentcounter.InnerHtml = "0"
                ' contrideposit.InnerHtml = "₦0.0"
            Else
                If counter >= 1000000 Then
                    commentcounter.InnerHtml = (counter / 1000000).ToString("0.##") + "M"
                ElseIf counter >= 100000 Then
                    commentcounter.InnerHtml = (counter / 1000).ToString("0.##") + "K"
                ElseIf counter >= 10000 Then
                    commentcounter.InnerHtml = (counter / 1000).ToString("0.##") + "K"
                ElseIf counter >= 1000 Then
                    commentcounter.InnerHtml = (counter / 1000).ToString("0.##") + "K"
                ElseIf counter <= 0 Then
                    commentcounter.InnerHtml = "0"
                Else
                    commentcounter.InnerHtml = counter
                End If
                'commentcounter.InnerHtml = Val(counter)
                ' contrideposit.InnerHtml = String.Format("₦{0:#,##0.##}", CSng(Val(alldeposits)))
            End If

        Else
            commentcounter.InnerHtml = "0.00"

        End If
        reader.Close()
        CNNr.Close()


    End Sub

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
    'Private Sub kok_ServerClick(sender As Object, e As EventArgs) Handles kok.ServerClick
    '    kok.HRef = "http://www.facebook.com/sharer/sharer.php?u=https://kpolom.com/"
    'End Sub
    '<System.Web.Script.Services.ScriptMethod()>
    '<System.Web.Services.WebMethod>
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

                ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert('Account Has Been Updated.');", True)
            Catch ex As Exception
                ''Response.Write(ex.Message)
                'ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert(""" & ex.Message & """);", True)
                Session.Item("errormsg") = ex.Message & vbNewLine & "Page-" & System.IO.Path.GetFileName(Request.Url.ToString) & vbNewLine & ex.Source & vbNewLine & ex.StackTrace

                ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert(""" & ex.Message & """);window.location='Error.aspx';", True)

            End Try
        End If
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        If IsPostBack = True Then
            UpdateShareCount(colhold)
        End If
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
End Class