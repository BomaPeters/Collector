Imports System.Drawing
Imports System.Drawing.Drawing2D
Imports System.Drawing.Imaging
Imports System.Drawing.Design
Imports System.IO
Public Class WebForm1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' ImgPrv.ImageUrl = "\imgs\ebd3587b-2b0b-4664-9930-29d1ffcac7ac.png"
        If IsPostBack And FileUpload1.HasFile = True Then
            Dim imagehold As String
            Dim s As String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz#*"
            Dim r As New Random

            Dim sb As New System.Text.StringBuilder
            For i As Integer = 1 To 9
                Dim idx As Integer = r.Next(0, 45)
                sb.Append(s.Substring(idx, 1))


            Next
            '''''''''''''''''''''''''''''
            Dim img As String = String.Empty
            Dim bmpImg As Bitmap = Nothing

            bmpImg = Resize_Image(FileUpload1.PostedFile.InputStream, 1280, 720)
            Dim newnamehold As String = Guid.NewGuid().ToString()
            img = Server.MapPath("..\img\collectionpic\") + newnamehold + ".png"
            bmpImg.Save(img, ImageFormat.Jpeg)
            ImgPrv.ImageUrl = "..\img\collectionpic\" + newnamehold + ".png"
            Label1.Text = ImgPrv.ImageUrl.ToString
            bmpImg.Dispose()
            '''''''''''''''''''''''''''''''''''''''
            '  imagehold = "..\img\collectionpic\" & FileUpload1.FileName
            ' ResizeKeepAspect(imagehold, 1280, 7200)
            ' FileUpload1.SaveAs(Server.MapPath("..\img\collectionpic").ToString() & "\" + FileUpload1.FileName)
            '   imagehold = "..\img\collectionpic\" & FileUpload1.FileName
            '  Session.Item("imgholding") = "..\img\collectionpic\" & FileUpload1.FileName
            ' ImgPrv.ImageUrl = imagehold
        Else

        End If
    End Sub
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
    Public Shared Function ResizeKeepAspect(ByVal src As Size, ByVal maxWidth As Integer, ByVal maxHeight As Integer, ByVal Optional enlarge As Boolean = False) As Size
        maxWidth = If(enlarge, maxWidth, Math.Min(maxWidth, src.Width))
        maxHeight = If(enlarge, maxHeight, Math.Min(maxHeight, src.Height))
        Dim rnd As Decimal = Math.Min(maxWidth / CDec(src.Width), maxHeight / CDec(src.Height))
        Return New Size(CInt(Math.Round(src.Width * rnd)), CInt(Math.Round(src.Height * rnd)))
    End Function
End Class