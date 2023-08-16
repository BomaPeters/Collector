Imports Newtonsoft.Json
Imports System.Data.SqlClient
Imports System.Net
Imports System.Web.Script.Serialization
Imports System.Drawing
Imports System.Drawing.Drawing2D
Imports System.Drawing.Imaging
Imports System.Drawing.Design
Imports System.IO
Public Class createcollection
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        TextBox4.Attributes.Add("autocomplete", "off")
        TextBox1.Attributes.Add("autocomplete", "off")
        If IsPostBack And FileUpload1.HasFile = True Then
            'Dim imagehold As String
            'Dim s As String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz#*"
            'Dim r As New Random

            'Dim sb As New System.Text.StringBuilder
            'For i As Integer = 1 To 9
            '    Dim idx As Integer = r.Next(0, 45)
            '    sb.Append(s.Substring(idx, 1))


            'Next
            'FileUpload1.SaveAs(Server.MapPath("..\img\collectionpic").ToString() & "\" + FileUpload1.FileName) OLD WORKING CODE
            'imagehold = "..\img\collectionpic\" & FileUpload1.FileName
            'Session.Item("imgholding") = "..\img\collectionpic\" & FileUpload1.FileName
            'ImgPrv.ImageUrl = imagehold
            '''''''new code'''''
            Dim img As String = String.Empty
            Dim bmpImg As Bitmap = Nothing

            bmpImg = Resize_Image(FileUpload1.PostedFile.InputStream, 1280, 720)
            Dim newnamehold As String = Guid.NewGuid().ToString()
            img = Server.MapPath("..\img\collectionpic\") + newnamehold + ".png"
            bmpImg.Save(img, ImageFormat.Jpeg)
            ImgPrv.ImageUrl = "..\img\collectionpic\" + newnamehold + ".png"
            Session.Item("imgholding") = "..\img\collectionpic\" + newnamehold + ".png"
            bmpImg.Dispose()
            '''''''''''''''''''''''''''''''''''''''

            ''''end NEW CODE'''''
        Else

        End If
    End Sub
    Public Sub createcollection()
        Try


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
            CMD.CommandText = "SELECT * FROM  Collection_Details"


            CMD.Connection = CNN
            Dim da As SqlDataAdapter = New SqlDataAdapter()
            da.SelectCommand = CMD
            Dim ds As Data.DataSet = New Data.DataSet()
            da.Fill(ds, "Collection_Details")
            Dim CB As SqlCommandBuilder = New SqlCommandBuilder(da)
            Dim drow As Data.DataRow = ds.Tables("Collection_Details").NewRow


            drow("userID") = Session.Item("CID").ToString
            ' drow("TransDate") = DateTime.Now.ToString("dd-MMM-yyyy")
            Session.Item("collectionhold") = sb.ToString
            drow("CollectionID") = Session.Item("collectionhold").ToString
            drow("Collection_Name") = TextBox1.Text.ToUpper
            'Dim texter As String = TextBox6.Text
            'texter = texter.Replace("<", "&lt;")
            'texter = texter.Replace(">", "&gt;")
            drow("Collection_Desc") = Server.HtmlEncode(TextBox6.Text)

            drow("Receiver_Acct_Number") = TextBox2.Text

            drow("Receiver_Bank_Name") = DropDownList1.SelectedItem.Text
            drow("Receiver_Name") = TextBox3.Text
            drow("DueDate") = TextBox4.Text
            drow("CreatedDate") = DateTime.Now
            If String.IsNullOrEmpty(TextBox5.Text) = True Then
                drow("Goal") = 0.0
            Else
                drow("Goal") = TextBox5.Text
            End If

            drow("Status") = "UNPAID"
            drow("CashOutDate") = TextBox4.Text
            drow("Profile_Pic_Link") = Session.Item("imgholding").ToString
            drow("ShareCount") = 0
            drow("Category") = DropDownList2.SelectedItem.Text
            drow("PaidDate") = DateTime.Now
            ds.Tables("Collection_Details").Rows.Add(drow)
            da.Update(ds, "Collection_Details")
            CNN.Close()
            TextBox1.Text = ""
            TextBox2.Text = ""
            TextBox3.Text = ""
            '  ClientScript.RegisterStartupScript([GetType](), "alert", (Convert.ToString("alert('") & "Collection has been successfully created.") + "');", True)
            ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert('Collection has been successfully been created.');" + String.Format("window.location='../share.aspx?collectionid={0}';", Session.Item("collectionhold").ToString), True)

        Catch ex As Exception
            Session.Item("errormsg") = ex.Message & vbNewLine & "Page-" & System.IO.Path.GetFileName(Request.Url.ToString) & vbNewLine & ex.Source & vbNewLine & ex.StackTrace

            ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert(""" & ex.Message & """);window.location='Error.aspx';", True)

        End Try
    End Sub
    Public Class Example
        Public Property bank_name As String
        Public Property account_name As String
        Public Property account_number As String
        Public Property bank_code As String
        Public Property requests As String
        Public Property execution_time As String
    End Class
    'Public Function getAccountName(ByVal bankcode As String, ByVal accountnumber As String)
    '    Dim Returner As String
    '    Dim url As String = String.Format("http://app.nuban.com.ng/api/NUBAN-PQJWPAUW281?bank_code={0}&acc_no={1}", bankcode, accountnumber)

    '    Using client As New WebClient()
    '        Dim json As String = client.DownloadString(url)
    '        'json = json.Replace("[", "").Replace("]", "")
    '        '' Dim weatherInfo As Example = (New JavaScriptSerializer()).Deserialize(Of Example)(json)
    '        'Dim result As Example = (JsonConvert).DeserializeObject(Of Example)(json)
    '        'Returner = result.account_name.ToString
    '        If json.StartsWith("[") Then
    '            json = json.Replace("[", "").Replace("]", "")
    '            Dim result As Example = (JsonConvert).DeserializeObject(Of Example)(json)
    '            Returner = result.account_name.ToString
    '            '   Button1.Visible = True
    '        Else
    '            Dim badresult As Examplebad = (JsonConvert).DeserializeObject(Of Examplebad)(json)
    '            Returner = "NO NAME"

    '        End If
    '    End Using
    '    Return Returner
    'End Function

    Private Sub TextBox2_TextChanged(sender As Object, e As EventArgs) Handles TextBox2.TextChanged
        TextBox3.Text = getAccountName(DropDownList1.SelectedValue, TextBox2.Text)

    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If System.Web.HttpContext.Current.Session("imgholding") Is Nothing Or TextBox3.Text = "NO NAME" Then
            ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert('Please ensure that an image has been uploaded for this collection and an account name is valid.');", True)
        ElseIf TextBox6.Text = "" Then
            ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert('Please ensure that a description is entered.');", True)

        Else
            If DropDownList2.SelectedItem.Text = "---Select Collection Category---" Then
                ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert('Please select a collection category.');", True)

            Else
                createcollection()
            End If

        End If
    End Sub

    Private Sub DropDownList2_Load(sender As Object, e As EventArgs) Handles DropDownList2.Load
        If Not IsPostBack Then
            DropDownList2.Items.Insert(0, "---Select Collection Category---")
        End If
    End Sub
    Public Class Examplebad
        Public Property [Error] As Boolean
        Public Property message As String
    End Class
    Private Function Resize_Image(ByVal streamImage As Stream, ByVal maxWidth As Integer, ByVal maxHeight As Integer) As Bitmap
        Dim originalImage As New Bitmap(streamImage)
        Dim newWidth As Integer = originalImage.Width
        Dim newHeight As Integer = originalImage.Height
        Dim aspectRatio As Double = CDbl(originalImage.Width) / CDbl(originalImage.Height)

        If aspectRatio <= 1 AndAlso originalImage.Width > maxWidth Then
            newWidth = maxWidth
            newHeight = CInt(Math.Round(newWidth / aspectRatio))
        ElseIf aspectRatio > 1 AndAlso originalImage.Height > maxHeight Then
            newHeight = maxHeight
            newWidth = CInt(Math.Round(newHeight * aspectRatio))
        End If

        Return New Bitmap(originalImage, newWidth, newHeight)
    End Function
    Public Class NubanVerifier
        Public Property account_number As String
        Public Property account_name As String
        Public Property Bank_name As String
        Public Property bank_code As String
        Public Property requests As String
        Public Property execution_time As String
        Public Property status As String
    End Class
    Public Function getAccountName(ByVal bankcode As String, ByVal accountnumber As String)
        Dim Returner As String = String.Empty
        Dim url As String = String.Format("https://maylancer.org/api/nuban/api.php?account_number={0}&bank_code={1}", accountnumber, bankcode)
        Using client As New WebClient()
            Dim json As String = client.DownloadString(url)

            Dim result As NubanVerifier = (JsonConvert).DeserializeObject(Of NubanVerifier)(json)
            If result.status.Contains("Account number resolved") Then
                Returner = result.account_name.ToString
                nonamealert.Visible = False
            ElseIf result.status.Contains("error") Then
                Returner = "NO NAME"
                nonamealert.Visible = True
            End If

        End Using
        Return Returner
    End Function

End Class