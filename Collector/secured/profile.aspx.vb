Imports System.Data.SqlClient
Public Class profile
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Session.Item("LoginType").ToString().Contains("COLLECTOR") Then
                GetProfileDetails(Session.Item("CID").ToString)
            ElseIf Session.Item("LoginType").ToString().Contains("KPOLOM") Then
                GetProfileDetailsFROMKPOLOM(Session.Item("CID").ToString)
            End If

        End If
    End Sub
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
            returner = myreadere.GetValue(0).ToString()
            TextBox1.Text = myreadere.GetValue(1).ToString() ' gets email for payment
            TextBox2.Text = myreadere.GetValue(2).ToString() ' gets UserID for Checkout
            TextBox3.Text = myreadere.GetValue(6).ToString() ' gets UserRole
            TextBox4.Text = myreadere.GetValue(5).ToString() ' gets UserPhone


        Else
            returner = "wrong"
        End If

        myreadere.Close()

        CNNe.Close()
        Return returner


    End Function
    Public Sub Updater(ByVal USERidhold As String)
        If IsPostBack Then
            Try


                Dim CNNS As SqlConnection = New SqlConnection
                CNNS.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("kpolomDUMMYConnectionString").ConnectionString

                CNNS.Open()


                Dim CMDS As SqlCommand = New SqlCommand
                CMDS.CommandText = "UPDATE myLOGINCollector SET Firstname=@Firstname,Lastname=@Lastname WHERE userID=@userID"

                CMDS.Parameters.AddWithValue("@Firstname", TextBox1.Text)
                CMDS.Parameters.AddWithValue("@Lastname", TextBox2.Text)


                CMDS.Parameters.AddWithValue("@userID", USERidhold)

                CMDS.Connection = CNNS
                CMDS.ExecuteNonQuery()
                Dim rowsaffected As Integer = CMDS.ExecuteNonQuery
                '  Label2.Text = rowsaffected
                Dim daD As SqlDataAdapter = New SqlDataAdapter()
                daD.SelectCommand = CMDS

                CNNS.Close()

                ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert('Account Has Been Updated.');", True)
            Catch ex As Exception
                'Response.Write(ex.Message)
                ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert(""" & ex.Message & """);", True)
            End Try
        End If
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If Session.Item("LoginType").ToString().Contains("COLLECTOR") Then
            Updater(Session.Item("CID").ToString)
        ElseIf Session.Item("LoginType").ToString().Contains("KPOLOM") Then
            ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert('Please Update Profile from your KPOLOM account.');", True)
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
            returner = myreadere.GetValue(0).ToString()
            TextBox1.Text = myreadere.GetValue(2).ToString() ' gets Firstname
            TextBox2.Text = myreadere.GetValue(4).ToString() ' gets Lastname
            TextBox3.Text = myreadere.GetValue(1).ToString() ' gets Userphonenumber
            TextBox4.Text = myreadere.GetValue(7).ToString() ' gets UsereMAIL


        Else
            returner = "wrong"
        End If

        myreadere.Close()

        CNNe.Close()
        Return returner


    End Function
End Class