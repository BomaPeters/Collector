Imports System.Data.SqlClient
Public Class allmembers
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridView1.RowCommand
        If e.CommandName = "details" Then
            Dim row As GridViewRow = CType(((CType(e.CommandSource, LinkButton)).NamingContainer), GridViewRow)
            ' Session("userphoner") = "000"
            Dim loadholder As HtmlGenericControl = CType(row.FindControl("phonehold"), HtmlGenericControl)
            Response.Redirect(String.Format("customerprofile.aspx?userphoner={0}", loadholder.InnerHtml))
        End If
    End Sub
    Public Function CountCollections(ByVal collectionid As String)
        Dim returner As Integer = 0

        Dim CNNr As SqlConnection = New SqlConnection
        CNNr.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("kpolomDUMMYConnectionString").ConnectionString

        CNNr.Open()

        Dim CMDe As SqlCommand = New SqlCommand
        CMDe.CommandText = "SELECT COUNT(*) as counter FROM [Collection_Details]   WHERE ([userID] =@CollectionID )" '' DID NOT HAVE PLACEMENT ID BEFORE

        CMDe.Parameters.AddWithValue("@CollectionID", collectionid)

        'CMDe.Parameters.AddWithValue("@StillValid", 1)
        CMDe.Connection = CNNr
        Dim dae As SqlDataAdapter = New SqlDataAdapter()
        dae.SelectCommand = CMDe
        Dim dse As DataSet = New DataSet()
        dae.Fill(dse, "Collection_Details")


        Dim reader As SqlDataReader = CMDe.ExecuteReader()
        reader.Read()
        If reader.HasRows Then
            Dim counter As Integer = reader.GetValue(0).ToString()

            If String.IsNullOrEmpty(counter) Then
                '    commentcounter.InnerHtml = "0"
                '    ' contrideposit.InnerHtml = "₦0.0"
                returner = 0
            Else
                returner = counter
            End If
        Else
            returner = 0

        End If
        reader.Close()
        CNNr.Close()
        Return returner

    End Function
End Class