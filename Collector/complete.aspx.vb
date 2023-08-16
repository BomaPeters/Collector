Imports System.Data.SqlClient

Public Class complete
    Inherits System.Web.UI.Page
    Dim DuesLogdatatable As DataTable
    Dim BalHold As Single
    Dim sharecounthold As Integer
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        sharecounthold = CInt(Session.Item("sharecounthold"))

        If Not IsPostBack Then
            Try


                DuesLogdatatable = Session("selectedItems")
                Label4.Text = Session.Item("DuesName").ToString
                AmtHolder.InnerHtml = "₦" & String.Format("{0:#,##0.##}", CSng(Session.Item("amounthold")))

                ''/////CURRENTLY WORK CODE//////
                BalHold = LoadBalance()
                creditAccountContrib(BalHold, CSng(Session.Item("amounthold")))
                InsertToDuesLOG(Session.Item("GeneratedCollectIDDUES").ToString)
                ''///////END OF CURRENT WORKING CODE
                Text1.Value = Trim("https://www.collector.ng/dues.aspx?collectionid=" + Session.Item("collectionhold").ToString)
            Catch ex As Exception
                Session.Item("errormsg") = ex.Message & vbNewLine & "Page-" & System.IO.Path.GetFileName(Request.Url.ToString) & vbNewLine & ex.Source & vbNewLine & ex.StackTrace

                ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert(""" & ex.Message & """);window.location='Error.aspx';", True)
            End Try
        End If
    End Sub
    Public Sub creditAccountContrib(ByVal _Bal As Single, ByVal _Amt As Single)
        Try

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
    Public Sub InsertToDuesLOG(ByVal _transID As String)
        Try


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
                    sqlBulkCopy.WriteToServer(DuesLogdatatable)

                    connection.Close()
                End Using
            End Using



            ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert(""" & "done" & """);", True) 'window.location='complete.aspx';
        Catch ex As Exception
            MsgBox(ex.Message)
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

    Private Sub complete_Unload(sender As Object, e As EventArgs) Handles Me.Unload
        Session.Remove("selectedItems")
        Session.Remove("GeneratedCollectIDDUES")
        'Session.Remove("DuesName")
    End Sub

    Private Sub LinkButton4_Click(sender As Object, e As EventArgs) Handles LinkButton4.Click
        Response.Redirect(Trim("https://www.collector.ng/dues.aspx?collectionid=" + Session.Item("collectionhold").ToString))
    End Sub

    Private Sub LinkButton3_Click(sender As Object, e As EventArgs) Handles LinkButton3.Click
        UpdateShareCount(Session.Item("collectionhold").ToString)
        Response.Redirect(String.Format("https://twitter.com/intent/tweet?text=https://www.collector.ng/dues.aspx?collectionid={0}", Trim(Session.Item("collectionhold").ToString)))

    End Sub

    Private Sub LinkButton2_Click(sender As Object, e As EventArgs) Handles LinkButton2.Click
        If IsPostBack Then
            UpdateShareCount(Session.Item("collectionhold").ToString)
            Response.Redirect("https://wa.me/?text=Hello,could%20you%20help%20share%20or%20donate%20to%20this%20collection.%20" & Session.Item("DuesName").ToString & ".%20To%20know%20more%20visit%20" & Text1.Value)

        End If

    End Sub

    Private Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        UpdateShareCount(Session.Item("collectionhold").ToString)
        Response.Redirect(String.Format("https://www.facebook.com/sharer/sharer.php?u=https://www.collector.ng/dues.aspx?collectionid={0}", Trim(Session.Item("collectionhold").ToString)))

    End Sub
    Public Sub UpdateShareCount(ByVal collectionidhold As String)
        If IsPostBack = True Then
            Try


                Dim CNNS As SqlConnection = New SqlConnection
                CNNS.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("kpolomDUMMYConnectionString").ConnectionString

                CNNS.Open()


                Dim CMDS As SqlCommand = New SqlCommand
                CMDS.CommandText = "UPDATE Collection_Details SET ShareCount=@ShareCount WHERE CollectionID=@CollectionID"
                Dim holder As Integer = sharecounthold + 1

                CMDS.Parameters.AddWithValue("@ShareCount", holder)


                CMDS.Parameters.AddWithValue("@CollectionID", collectionidhold)

                CMDS.Connection = CNNS
                CMDS.ExecuteNonQuery()
                Dim rowsaffected As Integer = CMDS.ExecuteNonQuery
                '  Label2.Text = rowsaffected
                Dim daD As SqlDataAdapter = New SqlDataAdapter()
                daD.SelectCommand = CMDS

                CNNS.Close()

                '  ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert('Account Has Been Updated.');", True)
            Catch ex As Exception
                ''Response.Write(ex.Message)
                'ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert(""" & ex.Message & """);", True)
                Session.Item("errormsg") = ex.Message & vbNewLine & "Page-" & System.IO.Path.GetFileName(Request.Url.ToString) & vbNewLine & ex.Source & vbNewLine & ex.StackTrace

                'ClientScript.RegisterClientScriptBlock(Me.GetType(), "validation", "alert(""" & ex.Message & """);window.location='Error.aspx';", True)
                MsgBox(ex.Message, "warning")
            End Try
        End If
    End Sub
End Class