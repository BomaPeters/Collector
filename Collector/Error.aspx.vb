Imports System.Net.Mail
Imports System.IO
Imports System.Data.SqlClient
Public Class _Error
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If System.Web.HttpContext.Current.Session("errormsg") Is Nothing Then
                TextBox1.Text = "No specific error message."
            Else
                TextBox1.Text = Session.Item("errormsg").ToString
            End If

            ' Dim kok As Integer = "hkkh"
            If System.Web.HttpContext.Current.Session("collectionhold") Is Nothing Then
                Label1.Text = "None"
                Label2.Text = "None"
            Else
                GetCollectiondetails(Session.Item("collectionhold"))
            End If

        Catch ex As Exception
            TextBox1.Text = ex.Message
        End Try
    End Sub
    Public Sub emailsentforERROR(ByVal _TO As String)
        Try
            Dim mail = New MailMessage()
            'Dim reader As New StreamReader(Server.MapPath("EmailSender.html"))
            'Dim readFile As String = reader.ReadToEnd()
            'Dim myString As String = ""
            'myString = readFile



            'myString = myString.Replace("[FULLNAME]", _userid)

            mail.From = New MailAddress("admin@kpolom.com", "KPOLOM COLLECTOR")
            mail.To.Add(New MailAddress("admin@kpolom.com"))
            mail.Subject = "KPOLOM COLLECTOR ERROR NOTIFICATION"
            mail.IsBodyHtml = True
            mail.Body = "Be notified that the Collector encountered an error and you have been notified.Details below" & "<br/>" & "<i>" & TextBox1.Text & "</i>" & "<br/>" & "Regards," & "<br/>" & "The Team"
            'reader.Dispose()
            mail.Priority = MailPriority.High
            Dim mailclient = New SmtpClient()
            mailclient.Send(mail)

            ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert('We have been notified and will fix the issue as quick as we can.');window.location='index.aspx';", True)
        Catch ex As Exception
            Exit Sub
            Response.Write(ex.Message)
        End Try
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        emailsentforERROR("admin@kpolom.com")
    End Sub
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
            'Label2.Text = String.Format("{0:#,##0.##}", CSng(Val(reader.GetValue(9).ToString()))) 'goal
            Label2.Text = reader.GetValue(6).ToString() 'collecting for
            Label1.Text = reader.GetValue(2).ToString() ' purpose for collecting
            'Label5.Text = CDate(reader.GetValue(7).ToString()).ToString("dd-MMM-yyyy") 'due date
            'descriptionhold.InnerHtml = reader.GetValue(3).ToString() 'description
            'Image1.ImageUrl = reader.GetValue(12).ToString()
        Else
            ' returner = String.Empty

        End If
        reader.Close()
        CNNe.Close()


    End Sub
    Public Sub emailsentforPAYMENTERROR()
        Try
            Dim mail = New MailMessage()


            mail.From = New MailAddress("admin@kpolom.com", "KPOLOM COLLECTOR")
            mail.To.Add(New MailAddress("admin@kpolom.com"))
            mail.Subject = "COLLECTOR- DONATION ERROR PAYMENT NOTIFICATION"
            mail.IsBodyHtml = True
            mail.Body = "Be notified that the Collector encountered an error and you have been notified.Details below" & "<br/>" & "<i> Collection ID: " & Session.Item("collectionhold") & "</i>" & "<br/>" & "Donor PhoneNumber:" & TextBox2.Text & "<br/>" & "Donor Email: " & email.Text & "<br/>" & "Donor Amount: " & TextBox3.Text & "<br/>" & "Regards," & "<br/>" & "The Team."

            mail.Priority = MailPriority.High
            Dim mailclient = New SmtpClient()
            mailclient.Send(mail)

            ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert('We have been notified,we will confirm payment and credit the collection.');window.location='index.aspx';", True)
        Catch ex As Exception
            Exit Sub
            Response.Write(ex.Message)
        End Try
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        emailsentforPAYMENTERROR()
    End Sub
End Class