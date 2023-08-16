Imports System.Data.SqlClient
Imports DevOne.Security.Cryptography.BCrypt
Imports BCrypt
Public Class signin
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        TextBox2.Attributes.Add("autocomplete", "off")
        TextBox1.Attributes.Add("autocomplete", "off")
        TextBox3.Attributes.Add("autocomplete", "off")
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If String.IsNullOrWhiteSpace(TextBox3.Text) = True Or String.IsNullOrWhiteSpace(TextBox5.Text) = True Then
            Label1.Visible = True
            Label1.Text = "** &#xf119; field required**"
        Else
            If GetHashedPassword(TextBox3.Text).Contains("wrong") Then
                Label1.Visible = True
                Label1.Text = "** &#xf119; Your phonenumber does not exist.**"
            Else
                If DoesPasswordMatch(GetHashedPassword(TextBox3.Text), TextBox5.Text) = True Then

                    FormsAuthentication.SetAuthCookie(Session.Item("CID").ToString, True)
                    Dim userRoles As String() = Roles.GetRolesForUser(Session.Item("CID").ToString)



                    If userRoles.Contains("COLLECTOR") Then
                        Session("LoginType") = "COLLECTOR"
                        Response.Redirect("secured/Dashboard.aspx")
                        ' ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert('Your account has successfully been created.');window.location='secured/Test1.aspx';", True)
                    End If
                Else
                    Label1.Visible = True
                    Label1.Text = "** &#xf119; Wrong PASSWORD or USERNAME**"
                End If

            End If
        End If
    End Sub

    Private Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        ClientScript.RegisterStartupScript(Me.GetType(), "Popup", "ShowPopup();", True)
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        If String.IsNullOrWhiteSpace(TextBox1.Text) = True Or String.IsNullOrWhiteSpace(TextBox2.Text) = True Then
            Label1.Visible = True
            Label1.Text = "** &#xf119; field required2**"
        Else
            If GetHashedPasswordKPOLOM(TextBox1.Text).Contains("wrong") Then
                Label1.Visible = True
                Label1.Text = "** &#xf119; Your phonenumber does not exist.2**"
            Else
                If DoesPasswordMatch(GetHashedPasswordKPOLOM(TextBox1.Text), TextBox2.Text) = True Then

                    FormsAuthentication.SetAuthCookie(Session.Item("CID").ToString, True)
                    Dim userRoles As String() = Roles.GetRolesForUser(Session.Item("CID").ToString)
                    '{"COLLECTOR"}
                    'Roles.GetRolesForUser(Session.Item("CID").ToString)

                    Session("LoginType") = "KPOLOM"

                    If userRoles.Contains("COLLECTOR") Then
                        Response.Redirect("secured/Dashboard.aspx")
                    ElseIf userRoles.Contains("CUSTOMER") Then
                        Response.Redirect("secured/Dashboard.aspx")
                        ' ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert('Your account has successfully been created.');window.location='secured/Test1.aspx';", True)
                    ElseIf userRoles.Contains("ADMIN") Then
                        Response.Redirect("admin/Dashboard.aspx")
                    End If
                Else
                    Label1.Visible = True
                    Label1.Text = "** &#xf119; Wrong PASSWORD or USERNAME2**"
                End If

            End If

        End If
    End Sub
    Public Function GetHashedPassword(username As String) As String
        Dim returner As String = String.Empty
        Dim CNNe As SqlConnection = New SqlConnection
        CNNe.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("kpolomDUMMYConnectionString").ConnectionString

        CNNe.Open()

        Dim CMDe As SqlCommand = New SqlCommand
        ' CMDe.CommandText = "SELECT Password,Centre,userID FROM [myLOGIN] WHERE [Centre]='" & username & "' "
        CMDe.CommandText = "SELECT Password,PhoneNumber,userID FROM [myLOGINCollector] WHERE (PhoneNumber=@PhoneNumber)"
        CMDe.Parameters.AddWithValue("@PhoneNumber", username)
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
            'Session.Item("emailholder") = myreadere.GetValue(1).ToString() ' gets email for payment
            Session.Item("CID") = myreadere.GetValue(2).ToString() ' gets UserID for Checkout
            'Session.Item("UserRole") = myreadere.GetValue(3).ToString() ' gets UserRole
            Session.Item("UserPhone") = myreadere.GetValue(1).ToString() ' gets UserPhone


        Else
            returner = "wrong"
        End If

        myreadere.Close()

        CNNe.Close()
        Return returner


    End Function
    Private Function DoesPasswordMatch(ByVal hashedPwdFromDatabase As String, ByVal userEnteredPassword As String) As Boolean
        '  Return BCrypt.Net.BCrypt.CheckPassword(userEnteredPassword & "^Y8~JJ", hashedPwdFromDatabase)
        Return BCrypt.Net.BCrypt.Verify(userEnteredPassword & "^Y8~JJU9", hashedPwdFromDatabase) ' & "^Y8~JJU9"
        '   BCrypt.Net.BCrypt.Verify("eieie", "", True,)
    End Function
    Public Function GetHashedPasswordKPOLOM(username As String) As String
        Dim returner As String = String.Empty
        Dim CNNe As SqlConnection = New SqlConnection
        CNNe.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("kpolomDUMMYConnectionString").ConnectionString

        CNNe.Open()

        Dim CMDe As SqlCommand = New SqlCommand
        ' CMDe.CommandText = "SELECT Password,Centre,userID FROM [myLOGIN] WHERE [Centre]='" & username & "' "
        CMDe.CommandText = "SELECT Password,Centre,userID FROM [myLOGIN] WHERE ([Centre]=@username) "
        CMDe.Parameters.AddWithValue("@username", username)
        CMDe.Connection = CNNe
        Dim dae As SqlDataAdapter = New SqlDataAdapter()
        dae.SelectCommand = CMDe
        Dim dse As Data.DataSet = New Data.DataSet()
        dae.Fill(dse, "myLOGIN")
        ' Dim CB As SqlCommand = New SqlCommand()
        Dim myreadere As SqlDataReader
        myreadere = CMDe.ExecuteReader

        myreadere.Read()
        If myreadere.HasRows Then
            returner = myreadere.GetValue(0).ToString()
            'Session.Item("emailholder") = myreadere.GetValue(1).ToString() ' gets email for payment
            Session.Item("CID") = myreadere.GetValue(2).ToString() ' gets UserID for Checkout
            'Session.Item("UserRole") = myreadere.GetValue(3).ToString() ' gets UserRole
            Session.Item("UserPhone") = myreadere.GetValue(1).ToString() ' gets UserPhone

            'myreader.GetValue(2).ToString()
        Else
            returner = "wrong"
        End If

        myreadere.Close()

        CNNe.Close()
        Return returner


    End Function
End Class