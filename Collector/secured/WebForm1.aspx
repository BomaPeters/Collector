<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/secured/Site1.Master" CodeBehind="WebForm1.aspx.vb" Inherits="Collector.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <script src="https://cdn.tiny.cloud/1/sqrl76w4glb4feaqhngv59adhj4ju6j4jqboi07ibwomlc27/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="content">
         <div class="row mt-4">
            <div class=" col-md-10">

                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    <center>
                                                          <asp:Image ID="ImgPrv" runat="server"   ImageUrl="~/secured/imgs/c698e81e-9914-47e3-a214-e2fe6db539d1.png" CssClass="   img-thumbnail shadow-sm "  Height="200px"   /><br />
                                                        <a href="#" id="Imgbutton1"  onclick="openfiledialog();" class="btn btn-outline-primary mt-2"><i class="fa  fa-camera fa-lg"></i>Change Photo</a><br />
                                                   </center>
                <asp:FileUpload ID="FileUpload1" runat="server" onchange="if (confirm('Upload ' + this.value + '?')) this.form.submit();" />
<img src="imgs/ef3966bd-2799-4ab7-97cd-3157a3872bd7.png" />
                </div>
             </div>
          <div class="row mt-2">
              <div class="col-lg-10">
                  <h3>it is here</h3>
                  <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                   <textarea style="width:400px" id="basic-example" >
     Welcome to TinyMCE!
  </textarea>
              </div>
          </div>
          </div>
    
                                            <script type="text/javascript">
                                                function openfiledialog() {
                                                    //  $("#FileUpload1").click();
                                                    document.getElementById('<%= FileUpload1.ClientID %>').click();
                                                }
                //Loads previewed image from file upload and shows it in an asp.net imageholder

                                                function ImageResizer(canvasWidth, canvasHeight, sourceWidth, sourceHeight, destinationX, destinationY, destinationWidth, destinationHeight) {
                                                    var canvasRatio = canvasWidth / canvasHeight;
                                                    var sourceRatio = sourceWidth / sourceHeight;

                                                    if (sourceWidth > canvasWidth || sourceHeight > canvasHeight) {
                                                        //if the image do not fit into the required canvas
                                                        if (canvasRatio >= 1) {
                                                            //if the canvas is landscape
                                                            if (sourceRatio <= 1) {
                                                                //if the image is portrait
                                                                destinationHeight = canvasHeight;
                                                                destinationWidth = destinationHeight * sourceRatio;
                                                                destinationX = (canvasWidth - destinationWidth) / 2;
                                                                destinationY = 0;
                                                            }
                                                            else if (sourceRatio > 1) {
                                                                //if the image is landscape
                                                                if (canvasRatio < sourceRatio) {
                                                                    //make the landscape image fit inside the required Canvas. 
                                                                    //In this case ImageX is bigger than canvasWidth & ImageY is small than canvasHeight
                                                                    destinationWidth = canvasWidth;
                                                                    destinationHeight = destinationWidth / sourceRatio;
                                                                    destinationX = 0;
                                                                    destinationY = (canvasHeight - destinationHeight) / 2;
                                                                } else if (canvasRatio >= sourceRatio) {
                                                                    //In this case ImageY is bigger than canvasHeight & ImageX is small than canvasWidth
                                                                    destinationHeight = canvasHeight;
                                                                    destinationWidth = destinationHeight * sourceRatio;
                                                                    destinationX = (canvasWidth - destinationWidth) / 2;
                                                                    destinationY = 0;
                                                                }
                                                            }
                                                        }
                                                        else if (canvasRatio < 1) {
                                                            //if the canvas is portrait
                                                            if (sourceRatio >= 1) {
                                                                //if the image is landscape
                                                                destinationWidth = canvasWidth;
                                                                destinationHeight = destinationWidth / sourceRatio;
                                                                destinationX = 0;
                                                                destinationY = (canvasHeight - destinationHeight) / 2;
                                                            }
                                                            else if (sourceRatio < 1) {
                                                                //if the image is portrait
                                                                if (canvasRatio > sourceRatio) {
                                                                    //make the portrait image fit inside the required Canvas. 
                                                                    //In this case ImageY is bigger than canvasHeight & ImageX is small than canvasWidth
                                                                    destinationHeight = canvasHeight;
                                                                    destinationWidth = destinationHeight * sourceRatio;
                                                                    destinationX = (canvasWidth - destinationWidth) / 2;
                                                                    destinationY = 0;
                                                                } else if (canvasRatio <= sourceRatio) {
                                                                    //In this case ImageX is bigger than canvasWidth & ImageY is small than canvasHeight

                                                                    destinationWidth = canvasWidth;
                                                                    destinationHeight = destinationWidth / sourceRatio;
                                                                    destinationX = 0;
                                                                    destinationY = (canvasHeight - destinationHeight) / 2;
                                                                }
                                                            }
                                                        }
                                                    }
                                                    else {
                                                        //image will directly fit inside the canvas
                                                        destinationWidth = sourceWidth;
                                                        destinationHeight = sourceHeight;
                                                        destinationX = (canvasWidth - sourceWidth) / 2;
                                                        destinationY = (canvasHeight - sourceHeight) / 2;
                                                    }


                                                   // console.log("img.width=" + sourceWidth + " img.height=" + sourceHeight + " destinationX=" + destinationX + " destinationY=" + destinationY + " destinationWidth=" + destinationWidth + " destinationHeight=" + destinationHeight);
                                                    alert("img.width=" + sourceWidth + " img.height=" + sourceHeight + " destinationX=" + destinationX + " destinationY=" + destinationY + " destinationWidth=" + destinationWidth + " destinationHeight=" + destinationHeight);
                                                }
                                            </script>
    <script>
        tinymce.init({
            selector: 'textarea#basic-example',
            /* height: 500,*/
            //plugins: [
            //    'advlist', 'autolink', 'lists', 'link', 'image', 'charmap', 'preview',
            //    'anchor', 'searchreplace', 'visualblocks', 'code', 'fullscreen',
            //    'insertdatetime', 'media', 'table', 'help', 'wordcount'
            //],
            toolbar: 'undo redo | blocks | ' +
                'bold italic backcolor | alignleft aligncenter ' +
                'alignright alignjustify | bullist numlist outdent indent | ' +
                'removeformat ',
            content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:16px }'
        });
    </script>
</asp:Content>
