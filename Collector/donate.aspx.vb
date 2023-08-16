Imports System.Data.SqlClient
Public Class donate
    Inherits System.Web.UI.Page
    Dim colhold As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        TextBox1.Attributes.Add("autocomplete", "off")
        TextBox2.Attributes.Add("autocomplete", "off")
        TextBox4.Attributes.Add("autocomplete", "off")
        colhold = Request.QueryString("collectionid")
        Session.Item("collectionhold") = colhold
        GetCollectiondetails(colhold)
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

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Try
            HiddenField1.Value = email.Text '"boma@gmail.com"
            Session.Item("amounthold") = CDbl(TextBox1.Text)
            HiddenField2.Value = CDbl(TextBox1.Text) + Math.Round((CInt(TextBox1.Text) * 0.015)) 'CDbl(CSng(Session.Item("amounthold")) + CInt(chargeholder.InnerHtml)) ' I removed * 100
            HiddenField3.Value = TextBox4.Text 'PHONE
            HiddenField4.Value = TextBox2.Text 'fullname
            HiddenField5.Value = colhold 'collection-id
            Session.Item("donoremailhold") = email.Text
            Session.Item("donorphone") = TextBox4.Text
            Session.Item("donorname") = TextBox2.Text
            Session.Item("collectionname") = Label4.Text
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "validation", "<script type='text/javascript'>makePayment();</script>", False)
        Catch ex As Exception
            ''Response.Write(ex.Message)
            'ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert(""" & ex.Message & """);", True)
            Session.Item("errormsg") = ex.Message & vbNewLine & "Page-" & System.IO.Path.GetFileName(Request.Url.ToString) & vbNewLine & ex.Source & vbNewLine & ex.StackTrace

            ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert(""" & ex.Message & """);window.location='Error.aspx';", True)

        End Try
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
            Label3.Text = reader.GetValue(6).ToString() 'collecting for
            Label4.Text = reader.GetValue(2).ToString() ' purpose for collecting
            'Label5.Text = CDate(reader.GetValue(7).ToString()).ToString("dd-MMM-yyyy") 'due date
            'descriptionhold.InnerHtml = reader.GetValue(3).ToString() 'description
            'Image1.ImageUrl = reader.GetValue(12).ToString()
        Else
            ' returner = String.Empty

        End If
        reader.Close()
        CNNe.Close()


    End Sub

    Private Sub CheckBox1_CheckedChanged(sender As Object, e As EventArgs) Handles CheckBox1.CheckedChanged
        If CheckBox1.Checked = True Then
            TextBox2.Text = "Anonymous"
        Else
            TextBox2.Text = String.Empty
        End If
    End Sub
End Class