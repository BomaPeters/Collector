Imports System.Data.SqlClient
Imports System.Net.Mail
Imports System.IO
Public Class signup
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        TextBox3.Attributes.Add("autocomplete", "off")
        TextBox4.Attributes.Add("autocomplete", "off")
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If IsPostBack Then
            Session("retainer") = TextBox5.Text
            ' Session("pinholder") = first.Value & Second.Value & third.Value & fourth.Value
            Button1.Enabled = False
            createLoginDetails()
        End If
        'TextBox6.Text = "234" & TextBox3.Text.Substring(1, 10)
        'ClientScript.RegisterStartupScript(Me.GetType(), "Popup", "ShowPopup();", True)
    End Sub
    Public Sub checkphonenumber(ByVal myphonenumber As String)
        '  Dim returner As Integer
        Dim CNNe As SqlConnection = New SqlConnection
        CNNe.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("kpolomDUMMYConnectionString").ConnectionString

        CNNe.Open()

        Dim CMDe As SqlCommand = New SqlCommand
        CMDe.CommandText = "SELECT PhoneNumber  from myLOGINCollector WHERE PhoneNumber=@PhoneNumber"
        CMDe.Parameters.AddWithValue("@PhoneNumber", myphonenumber)

        CMDe.Connection = CNNe
        Dim dae As SqlDataAdapter = New SqlDataAdapter()
        dae.SelectCommand = CMDe
        Dim dse As DataSet = New DataSet()
        dae.Fill(dse, "myLOGINCollector")

        Dim reader As SqlDataReader = CMDe.ExecuteReader()
        reader.Read()
        If reader.HasRows Then

            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "validation", "alert('Phonenumber already exists.');", True)

            TextBox3.Text = String.Empty
        Else
            '   returner = 0

        End If
        reader.Close()
        CNNe.Close()


    End Sub
    Public Sub createLoginDetails()
        Try


            Dim s As String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz"
            Dim r As New Random

            Dim sb As New System.Text.StringBuilder
            For i As Integer = 1 To 9
                Dim idx As Integer = r.Next(0, 45)
                sb.Append(s.Substring(idx, 1))


            Next
            Session.Item("CID") = sb.ToString
            'Dim pwdToHash As String = TextBox6.Text.Trim & "^Y8~JJU9"
            'Dim hashToStoreInDatabase As String = BCrypt.Net.BCrypt.HashPassword(pwdToHash, BCrypt.Net.BCrypt.GenerateSalt())
            Dim pwdToHash As String = Session.Item("retainer").ToString & "^Y8~JJU9"
            Dim hashToStoreInDatabase As String = BCrypt.Net.BCrypt.HashPassword(pwdToHash, BCrypt.Net.BCrypt.GenerateSalt())


            'Dim PINToHash As String = Session.Item("pinholder") & "^Y8~JJU9"
            'Dim PINToStoreInDatabase As String = BCrypt.Net.BCrypt.HashPassword(PINToHash, BCrypt.Net.BCrypt.GenerateSalt())


            Dim CNN As SqlConnection = New SqlConnection
            CNN.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("kpolomDUMMYConnectionString").ConnectionString

            CNN.Open()

            Dim CMD As SqlCommand = New SqlCommand
            CMD.CommandText = "SELECT * FROM  myLOGINCollector"


            CMD.Connection = CNN
            Dim da As SqlDataAdapter = New SqlDataAdapter()
            da.SelectCommand = CMD
            Dim ds As Data.DataSet = New Data.DataSet()
            da.Fill(ds, "myLOGINCollector")
            Dim CB As SqlCommandBuilder = New SqlCommandBuilder(da)
            Dim drow As Data.DataRow = ds.Tables("myLOGINCollector").NewRow

            drow("userID") = Session.Item("CID").ToString
            drow("Firstname") = TextBox1.Text
            drow("Lastname") = TextBox2.Text
            ' Session.Item("passtest") = hashToStoreInDatabase

            drow("Password") = hashToStoreInDatabase
            'Label3.Text = hashToStoreInDatabase
            '  drow("AccountType") = "CUSTOMER"
            drow("CreatedDate") = DateTime.Now.ToString("dd-MMM-yyyy")
            drow("EmailAdd") = TextBox4.Text
            drow("PhoneNumber") = TextBox3.Text
            ds.Tables("myLOGINCollector").Rows.Add(drow)
            da.Update(ds, "myLOGINCollector")
            CNN.Close()
            Roles.AddUserToRole(Session.Item("CID").ToString, "COLLECTOR")
            FormsAuthentication.SetAuthCookie(Session.Item("CID").ToString, True)
            Dim userRoles As String() = Roles.GetRolesForUser(Session.Item("CID").ToString)


            If userRoles.Contains("COLLECTOR") Then
                ' Response.Redirect("secured/Test1.aspx")
                Session.Item("LoginType") = "COLLECTOR"
                emailsender(TextBox1.Text, TextBox4.Text)
                ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert('Your account has successfully been created.');window.location='secured/createcollection.aspx';", True)
            End If
        Catch ex As Exception
            ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert(""" & ex.Message & """);", True)
        End Try
    End Sub

    Private Sub TextBox3_TextChanged(sender As Object, e As EventArgs) Handles TextBox3.TextChanged
        checkphonenumber(TextBox3.Text)
    End Sub
    Public Sub checkemail(ByVal emailadd As String)
        '  Dim returner As Integer
        Dim CNNe As SqlConnection = New SqlConnection
        CNNe.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("kpolomDUMMYConnectionString").ConnectionString

        CNNe.Open()

        Dim CMDe As SqlCommand = New SqlCommand
        CMDe.CommandText = "SELECT EmailAdd  from myLOGINCollector WHERE EmailAdd=@Email_Add"
        CMDe.Parameters.AddWithValue("@Email_Add", emailadd)

        CMDe.Connection = CNNe
        Dim dae As SqlDataAdapter = New SqlDataAdapter()
        dae.SelectCommand = CMDe
        Dim dse As DataSet = New DataSet()
        dae.Fill(dse, "myLOGINCollector")

        'jsonReturner("success", "OK")
        Dim reader As SqlDataReader = CMDe.ExecuteReader()
        reader.Read()
        If reader.HasRows Then
            '  returner = reader.GetValue(0).ToString()

            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "validation", "alert('Email Address already exists.');", True)

            TextBox4.Text = String.Empty
        Else
            '   returner = 0

        End If
        reader.Close()
        CNNe.Close()


    End Sub

    Private Sub TextBox4_TextChanged(sender As Object, e As EventArgs) Handles TextBox4.TextChanged
        checkemail(TextBox4.Text)
    End Sub
    Public Sub emailsender(ByVal _userid As String, ByVal _TO As String)
        Try
            Dim mail = New MailMessage()
            Dim reader As New StreamReader(Server.MapPath("EmailSender.html"))
            Dim readFile As String = reader.ReadToEnd()
            Dim myString As String = ""
            myString = readFile



            myString = myString.Replace("[FULLNAME]", _userid)

            mail.From = New MailAddress("admin@kpolom.com", "KPOLOM COLLECTOR")
            mail.To.Add(New MailAddress(_TO))
            mail.Subject = "CONGRATULATIONS ON OPENING YOUR COLLECTOR ACCOUNT"
            mail.IsBodyHtml = True
            mail.Body = myString.ToString
            reader.Dispose()
            mail.Priority = MailPriority.High
            Dim mailclient = New SmtpClient()
            mailclient.Send(mail)

            ' ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert('An Email with password reset details has been sent.');window.location='index.aspx';", True)
        Catch ex As Exception
            Exit Sub
            Response.Write(ex.Message)
        End Try
    End Sub
End Class