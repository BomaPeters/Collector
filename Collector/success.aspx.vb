Imports System.Data.SqlClient
Public Class success
    Inherits System.Web.UI.Page

    Dim sharecounthold As Integer
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Try
                AmtHolder.InnerHtml = "₦" & String.Format("{0:#,##0.##}", CSng(Session.Item("amounthold")))
                creditAccountContrib()
                InsertDonorDetails()
                GetCollectiondetails(Session.Item("collectionhold").ToString)
                Text1.Value = Trim("https://www.collector.ng/share.aspx?collectionid=" + Session.Item("collectionhold").ToString)
            Catch ex As Exception
                Session.Item("errormsg") = ex.Message & vbNewLine & "Page-" & System.IO.Path.GetFileName(Request.Url.ToString) & vbNewLine & ex.Source & vbNewLine & ex.StackTrace

                ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert(""" & ex.Message & """);window.location='Error.aspx';", True)
            End Try
        End If
    End Sub
    Public Sub creditAccountContrib()
        Try


            Dim s As String = "01234567890123456789012345678901234567890123456789"
            Dim r As New Random

            Dim sb As New System.Text.StringBuilder
            For i As Integer = 1 To 9
                Dim idx As Integer = r.Next(0, 45)
                sb.Append(s.Substring(idx, 1))


            Next
            Session.Item("GeneratedCollectID") = sb.ToString
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

            drow("TransID") = Session.Item("GeneratedCollectID").ToString 'sb.ToString
            drow("CollectionID") = Session.Item("collectionhold").ToString
            drow("TransDate") = DateTime.Now.ToString("dd-MMM-yyyy")
            drow("Deposit") = CDbl(Session.Item("amounthold"))
            drow("Withdrawal") = DBNull.Value
            drow("Balance") = (LoadBalance() + CInt(Session.Item("amounthold")))

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
    Public Sub InsertDonorDetails()
        Try


            Dim CNN As SqlConnection = New SqlConnection
            CNN.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("kpolomDUMMYConnectionString").ConnectionString

            CNN.Open()

            Dim CMD As SqlCommand = New SqlCommand
            CMD.CommandText = "SELECT * FROM  Donor_Details"


            CMD.Connection = CNN
            Dim da As SqlDataAdapter = New SqlDataAdapter()
            da.SelectCommand = CMD
            Dim ds As Data.DataSet = New Data.DataSet()
            da.Fill(ds, "Donor_Details")
            Dim CB As SqlCommandBuilder = New SqlCommandBuilder(da)
            Dim drow As Data.DataRow = ds.Tables("Donor_Details").NewRow

            drow("TransID") = Session.Item("GeneratedCollectID").ToString
            drow("Donor_Email") = Session.Item("donoremailhold").ToString
            drow("Donor_PhoneNumber") = Session.Item("donorphone").ToString
            drow("Donor_Name") = Session.Item("donorname").ToString
            drow("Donor_Comment") = ""
            ds.Tables("Donor_Details").Rows.Add(drow)
            da.Update(ds, "Donor_Details")
            CNN.Close()
        Catch ex As Exception
            Session.Item("errormsg") = ex.Message & vbNewLine & "Page-" & System.IO.Path.GetFileName(Request.Url.ToString) & vbNewLine & ex.Source & vbNewLine & ex.StackTrace

            ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert(""" & ex.Message & """);window.location='Error.aspx';", True)
        End Try
    End Sub
    Public Sub UpdateComment(ByVal transidhold As String)
        ' Dim today As DateTime = DateTime.Now
        Try


            Dim CNN As SqlConnection = New SqlConnection
            CNN.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("kpolomDUMMYConnectionString").ConnectionString

            CNN.Open()

            Dim CMD As SqlCommand = New SqlCommand
            CMD.CommandText = "UPDATE Donor_Details SET Donor_Comment=@Donor_Comment WHERE TransID=@TransID"

            CMD.Parameters.AddWithValue("@Donor_Comment", TextBox1.Text)
            CMD.Parameters.AddWithValue("@TransID", transidhold)

            CMD.Connection = CNN
            CMD.ExecuteNonQuery()
            Dim rowsaffected As Integer = CMD.ExecuteNonQuery

            Dim da As SqlDataAdapter = New SqlDataAdapter()
            da.SelectCommand = CMD
            CNN.Close()
            'Response.Redirect("share.aspx")
            Response.Redirect(String.Format("share.aspx?collectionid={0}", Session.Item("collectionhold").ToString))

        Catch ex As Exception
            Session.Item("errormsg") = ex.Message & vbNewLine & "Page-" & System.IO.Path.GetFileName(Request.Url.ToString) & vbNewLine & ex.Source & vbNewLine & ex.StackTrace

            ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert(""" & ex.Message & """);window.location='Error.aspx';", True)
        End Try
        ' MsgBox(ex.Message, MsgBoxStyle.Exclamation, "WARNING")

    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Try
            UpdateComment(Session.Item("GeneratedCollectID").ToString)
        Catch ex As Exception
            Session.Item("errormsg") = ex.Message & vbNewLine & "Page-" & System.IO.Path.GetFileName(Request.Url.ToString) & vbNewLine & ex.Source & vbNewLine & ex.StackTrace

            ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert(""" & ex.Message & """);window.location='Error.aspx';", True)
        End Try
    End Sub
    Public Sub GetCollectiondetails(ByRef _CollectionID As String)
        Try
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
                '  goalhold.InnerHtml = CSng(Val(reader.GetValue(9).ToString()))
                Label3.Text = reader.GetValue(6).ToString() 'collecting for
                Label4.Text = reader.GetValue(2).ToString() ' purpose for collecting
                'DueDate.InnerHtml = CDate(reader.GetValue(7).ToString()).ToString("dd-MMM-yy") 'due date
                'createddate.InnerHtml = CDate(reader.GetValue(8).ToString()).ToString("dd-MMM-yy") 'created date
                'descriptionhold.InnerHtml = reader.GetValue(3).ToString() 'description
                'Image1.ImageUrl = reader.GetValue(12).ToString()
                'userID = reader.GetValue(0).ToString()

                If String.IsNullOrEmpty(reader.GetValue(13).ToString()) = True Then
                    sharecounthold = 0

                Else
                    sharecounthold = CInt(reader.GetValue(13).ToString())

                End If
            Else
                ' returner = String.Empty

            End If
            reader.Close()
            CNNe.Close()
        Catch ex As Exception
            Session.Item("errormsg") = ex.Message & vbNewLine & "Page-" & System.IO.Path.GetFileName(Request.Url.ToString) & vbNewLine & ex.Source & vbNewLine & ex.StackTrace

            ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert(""" & ex.Message & """);window.location='Error.aspx';", True)
        End Try

    End Sub

    Private Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        UpdateShareCount(Session.Item("collectionhold").ToString)
        Response.Redirect(String.Format("https://www.facebook.com/sharer/sharer.php?u=https://www.collector.ng/share.aspx?collectionid={0}", Trim(Session.Item("collectionhold").ToString)))
    End Sub

    Private Sub LinkButton2_Click(sender As Object, e As EventArgs) Handles LinkButton2.Click
        UpdateShareCount(Session.Item("collectionhold").ToString)
        Response.Redirect("https://wa.me/?text=Hello,could%20you%20help%20share%20or%20donate%20to%20this%20collection.%20" & Session.Item("collectionname").ToString & ".%20To%20know%20more%20visit%20" & Text1.Value)

    End Sub

    Private Sub LinkButton3_Click(sender As Object, e As EventArgs) Handles LinkButton3.Click
        UpdateShareCount(Session.Item("collectionhold").ToString)
        Response.Redirect(String.Format("https://twitter.com/intent/tweet?text=https://www.collector.ng/share.aspx?collectionid={0}", Trim(Session.Item("collectionhold").ToString)))

    End Sub

    Private Sub LinkButton4_Click(sender As Object, e As EventArgs) Handles LinkButton4.Click
        Response.Redirect(Trim("https://www.collector.ng/share.aspx?collectionid=" + Session.Item("collectionhold").ToString))

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

                ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert('Account Has Been Updated.');", True)
            Catch ex As Exception
                ''Response.Write(ex.Message)
                'ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert(""" & ex.Message & """);", True)
                Session.Item("errormsg") = ex.Message & vbNewLine & "Page-" & System.IO.Path.GetFileName(Request.Url.ToString) & vbNewLine & ex.Source & vbNewLine & ex.StackTrace

                ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert(""" & ex.Message & """);window.location='Error.aspx';", True)

            End Try
        End If
    End Sub
End Class