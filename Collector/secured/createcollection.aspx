<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/secured/Site1.Master" CodeBehind="createcollection.aspx.vb" Inherits="Collector.createcollection" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server" >
     <script src="https://cdn.tiny.cloud/1/sqrl76w4glb4feaqhngv59adhj4ju6j4jqboi07ibwomlc27/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">
        <div class="row  ">
            <div class="col-md-7">
                <div class="card mt-4">
                    <div class="card-body">
                      
                         <h5 class="text-primary mylinottefamily my-2 borderwidth border-bottom border-primary ">Create Collection</h5>
                        <div class="form-group">
                            <label>Purpose for Collection <small class="text-muted">e.g Life-Saving Surgery for Okoro Taiwo</small> </label>
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" MaxLength="50" required="true" ></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Collection Type</label>
                            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control ">

                                <asp:ListItem>Medical</asp:ListItem>
                                <asp:ListItem>Emergency</asp:ListItem>
                                <asp:ListItem>Education</asp:ListItem>
                                <asp:ListItem>Religious</asp:ListItem>
                                <asp:ListItem>Burial</asp:ListItem>
                                  <asp:ListItem>Business</asp:ListItem>
                                <asp:ListItem>Celebration</asp:ListItem>
                                <asp:ListItem>Find-Me-Something</asp:ListItem>
                            </asp:DropDownList>

                        </div>
                        <hr class="border border-primary" />
                        <div class="form-group">
                            <small>Upload an Image that supports this collection <b> (<i class="fa fa-info-circle colorawesomblue fa-1x"></i> Best Fit W:<=1,280px X H:<=720px)</b></small>
                        </div>
                        <center>
                                                          <asp:Image ID="ImgPrv" runat="server"   ImageUrl="~/secured/imgs/imgplaceblue.jpeg" CssClass="   img-thumbnail shadow-sm "  Height="200px"   /><br />
                                                        <a href="#" id="Imgbutton1"  onclick="openfiledialog();" class="btn btn-outline-primary mt-2"><i class="fa  fa-camera fa-lg"></i>Change Photo</a><br />
                                                   </center>
                      <%--  if (confirm('Upload ' + this.value + '?')) this.form.submit();--%>
                      <%--  checksize();--%>
                        <asp:FileUpload ID="FileUpload1" runat="server" onchange="if (confirm('Upload ' + this.value + '?')) this.form.submit();" CssClass=" invisible " />

                        <hr class="border border-primary" />
                        <div class=" alert alert-warning alert-dismissible fade show text-justify" role="alert">
                            <strong><i class="fa fa-info-circle"></i>info:</strong>
                            The proceeds from this collection will be
                                paid into the recipient's account.
                                Enter account details below.
                             
                                The account name of the recipient will  be displayed in the 'collecting for' field on the collection page.
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                        </div>
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <div class="form-group">
                                    <label>Select Recipient's Bank</label>
                                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" AutoPostBack="true">

                                        <asp:ListItem Value="044">Access Bank</asp:ListItem>
                                        <asp:ListItem Value="063">Access Bank (Diamond)</asp:ListItem>
                                        <asp:ListItem Value="035A">ALAT by WEMA</asp:ListItem>
                                        <asp:ListItem Value="401">ASO Savings and Loans</asp:ListItem>
                                        <asp:ListItem Value="50931">Bowen Microfinance Bank</asp:ListItem>
                                        <asp:ListItem Value="50823">CEMCS Microfinance Bank</asp:ListItem>
                                        <asp:ListItem Value="023">Citibank Nigeria</asp:ListItem>
                                        <asp:ListItem Value="050">Ecobank Nigeria</asp:ListItem>
                                        <asp:ListItem Value="562">Ekondo Microfinance Bank</asp:ListItem>
                                        <asp:ListItem Value="070">Fidelity Bank</asp:ListItem>
                                        <asp:ListItem Value="011">First Bank of Nigeria</asp:ListItem>
                                        <asp:ListItem Value="214">First City Monument Bank</asp:ListItem>
                                        <asp:ListItem Value="00103">Globus Bank</asp:ListItem>
                                        <asp:ListItem Value="058">Guaranty Trust Bank</asp:ListItem>
                                        <asp:ListItem Value="50383">Hasal Microfinance Bank</asp:ListItem>
                                        <asp:ListItem Value="030">Heritage Bank</asp:ListItem>
                                        <asp:ListItem Value="301">Jaiz Bank</asp:ListItem>
                                        <asp:ListItem Value="082">Keystone Bank</asp:ListItem>
                                        <asp:ListItem Value="50211">Kuda Bank</asp:ListItem>
                                        <asp:ListItem Value="90052">Lagos Building Investment Company Plc.</asp:ListItem>
                                        <asp:ListItem Value="565">One Finance</asp:ListItem>
                                        <asp:ListItem Value="526">Parallex Bank</asp:ListItem>
                                        <asp:ListItem Value="311">Parkway - ReadyCash</asp:ListItem>
                                        <asp:ListItem Value="076">Polaris Bank</asp:ListItem>
                                        <asp:ListItem Value="101">Providus Bank</asp:ListItem>
                                        <asp:ListItem Value="125">Rubies MFB</asp:ListItem>
                                        <asp:ListItem Value="51310">Sparkle Microfinance Bank</asp:ListItem>
                                        <asp:ListItem Value="221">Stanbic IBTC Bank</asp:ListItem>
                                        <asp:ListItem Value="068">Standard Chartered Bank</asp:ListItem>
                                        <asp:ListItem Value="232">Sterling Bank</asp:ListItem>
                                        <asp:ListItem Value="100">Suntrust Bank</asp:ListItem>
                                        <asp:ListItem Value="302">TAJ Bank</asp:ListItem>
                                        <asp:ListItem Value="51211">TCF MFB</asp:ListItem>
                                        <asp:ListItem Value="102">Titan Bank</asp:ListItem>
                                        <asp:ListItem Value="032">Union Bank of Nigeria</asp:ListItem>
                                        <asp:ListItem Value="033">United Bank For Africa</asp:ListItem>
                                        <asp:ListItem Value="215">Unity Bank</asp:ListItem>
                                        <asp:ListItem Value="566">VFD</asp:ListItem>
                                        <asp:ListItem Value="035">Wema Bank</asp:ListItem>
                                        <asp:ListItem Value="057">Zenith Bank</asp:ListItem>

                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label>Enter Recipient's Account Number </label>
                                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" required="true" onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;" MaxLength="10" onkeyup="losefocus();" onpaste="losefocus();" CausesValidation="True" AutoPostBack="True" TextMode="Phone"></asp:TextBox>
                                </div>


                                <div class="form-group">
                                    <label>Collecting For <small>(Recipient's Account Name)</small></label>
                                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" required="true" AutoPostBack="true" ReadOnly="true"></asp:TextBox>
                                </div>
                                <div class=" alert  alert-danger alert-dismissible fade show text-justify" role="alert" id="nonamealert" runat="server" visible="false">
                            <strong><i class="fa fa-info-circle"></i>warning:</strong>
       Please confirm the account number or bank and try again.
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                        </div>
                                <hr class="border border-primary" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                            <ProgressTemplate>
                                <div class="update">
                                    <span class=" loading-text">
                                        <img src="../img/kpolomCOLLECTOR.png" style="height: 30px; width: auto" /></span>
                                </div>
                            </ProgressTemplate>
                        </asp:UpdateProgress>

                        <div class="row">
                            <div class=" col-md">
                                <div class="form-group">
                                    <label>Due Date <small>(Collection expires by this date)</small> </label>
                                    <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" TextMode="Date" required="true" onblur="return checkDate();"></asp:TextBox>
                                </div>
                            </div>
                            <div class=" col-md">
                                <div class="form-group">
                                    <label>Goal <small>(how much you hope to raise)</small> </label>
                                    <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" onkeypress="return CheckNumeric()" onkeyup="FormatCurrency(this)" required="true" MaxLength="10" TextMode="Phone"></asp:TextBox>

                  
                                </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Description <small>(why people should donate)</small></label>
                                <asp:TextBox ID="TextBox6" ClientIDMode="Static" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4"   ></asp:TextBox>

                               <span id="spanDisplay"></span><span id="spammer"></span>
                            </div>

                            <div class="form-group">
                               
                                <asp:Button ID="Button1" runat="server" Text="Create Collection" CssClass="btn btn-primary btn-lg btn-block" />

                              
                            </div>
                            
                        </div>
                    </div>
                    </div>
                </div>
          </div>
    <script type="text/javascript">
                  function losefocus() {

                      var text = document.getElementById('<%=TextBox2.ClientID%>');
                      if (text != null && text.value.length >= 10) {
                          text.blur();

                      }
        }

        function FormatCurrency(ctrl) {
            //Check if arrow keys are pressed - we want to allow navigation around textbox using arrow keys
            if (event.keyCode == 37 || event.keyCode == 38 || event.keyCode == 39 || event.keyCode == 40) {
                return;
            }

            var val = ctrl.value;

            val = val.replace(/,/g, "")
            ctrl.value = "";
            val += '';
            x = val.split('.');
            x1 = x[0];
            x2 = x.length > 1 ? '.' + x[1] : '';

            var rgx = /(\d+)(\d{3})/;

            while (rgx.test(x1)) {
                x1 = x1.replace(rgx, '$1' + ',' + '$2');
            }

            ctrl.value = x1 + x2;
         

        }

</script>
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
                                                function checksize() {
                                                    var filelink = document.getElementById('<%= FileUpload1.ClientID %>');
                                                    let img = new Image()
                                                    img.src = window.URL.createObjectURL(event.target.files[0])
                                                    img.onload = () => {
                                                        //img.width === 225 && img.height === 225
                                                        if (img.width <= 1280 && img.height <= 720)  {
                                                            alert(`Nice, image is the right size. It can be uploaded`)
                                                            // upload logic here
                                                         //   if (confirm('Upload ' + this.value + '?')) this.form.submit();
                                                            if (confirm('Upload ' + filelink.value + '?')) filelink.form.submit();
                                                        } else {
                                                            alert(`Wrong size of image.Current image is w: ${img.width}px x h:${img.height}px ,required image size is width of <= 1,280px  and height of <=720px.`);
                                                        }
                                                    }
                                                }

                                                //function validateimg(ctrl) {
                                                //    var fileUpload = ctrl;
                                                //    var regex = new RegExp("([a-zA-Z0-9\s_\\.\-:])+(.jpg|.png|.gif)$");
                                                //    if (regex.test(fileUpload.value.toLowerCase())) {
                                                //        if (typeof (fileUpload.files) != "undefined") {
                                                //            var reader = new FileReader();
                                                //            reader.readAsDataURL(fileUpload.files[0]);
                                                //            reader.onload = function (e) {
                                                //                var image = new Image();
                                                //                image.src = e.target.result;
                                                //                image.onload = function () {
                                                //                    var height = this.height;
                                                //                    var width = this.width;
                                                //                    if (height < 1100 || width < 750) {
                                                //                        alert("At least you can upload a 1100*750 photo size.");
                                                //                        return false;
                                                //                    } else {
                                                //                        alert("Uploaded image has valid Height and Width.");
                                                //                        return true;
                                                //                    }
                                                //                };
                                                //            }
                                                //        } else {
                                                //            alert("This browser does not support HTML5.");
                                                //            return false;
                                                //        }
                                                //    } else {
                                                //        alert("Please select a valid Image file.");
                                                //        return false;
                                                //    }
                                                //}
    </script>
    <script type="text/javascript">
                                                function count(clientId) {
                                                    var maxvalue = 160;

                                                    var txtInput = document.getElementById(clientId);
                                                    var spanDisplay = document.getElementById('spanDisplay');
                                                  
                                                    //var spanSpam = document.getElementById('spammer');
                                                    txtInput.value.trim().length = 0;
                                                    spanDisplay.innerHTML = maxvalue - txtInput.value.trim().length;
                                                    // spanDisplay2.innerHTML = maxvalue - txtInput.value.trim().length;
                                                    //spanSpam.innerHTML = txtInput.value.trim().length;
                                                    //This part of the code disables the share button
                                                    txtInput.trim;
                                                    if (txtInput.value.trim().length >= maxvalue || txtInput.value.trim().length == 0) {

                                                       <%-- document.getElementById('<%= Button2.ClientID %>').disabled = true;--%>

        spanDisplay.style.color = 'red';
    }
    else {
     <%--   document.getElementById('<%= Button2.ClientID %>').disabled = false;--%>
            spanDisplay.style.color = 'black';
        }
        //this part increases the height of the textbox
        if (txtInput.scrollHeight > 72) {
            txtInput.style.height = txtInput.scrollHeight + "px";
        }
                                                }
    </script>
     <script>
         function CheckNumeric() {
             return event.keyCode >= 48 && event.keyCode <= 57 || event.keyCode == 46;
         }

         function checkDate() {

             var today = new Date();
             var enterDate = document.getElementById('<%= TextBox4.ClientID %>').value;
            enterDate = new Date(enterDate)
            if (enterDate < today) {
                alert("You need to select a due date that is earlier than today !");
                   document.getElementById('<%= TextBox4.ClientID %>').value = new Date('2004-10-10');


               }
           }
     </script>
    <script>
        tinymce.init({
            selector: 'textarea#TextBox6',
           /* height: 500,*/
            plugins: [
                'lists'
                //'advlist', 'autolink', 'lists', 'link', 'image', 'charmap', 'preview',
                //'anchor', 'searchreplace', 'visualblocks', 'code', 'fullscreen',
                //'insertdatetime', 'media', 'table', 'help', 'wordcount'
            ],
            toolbar: 'undo redo | blocks | ' +
                'bold italic backcolor | alignleft aligncenter ' +
                'alignright alignjustify | bullist numlist outdent indent | ' +
                'removeformat ',
            content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:16px }'
        });
    </script>
</asp:Content>
