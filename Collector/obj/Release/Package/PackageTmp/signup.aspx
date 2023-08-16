<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="signup.aspx.vb" Inherits="Collector.signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>COLLECTOR</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="Support people & events you care about." />
    <meta name="author" content="kpolom" />
    <link href="bootstrap-4.4.1-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="bootstrap-4.4.1-dist/css/bootstrap-pincode-input.css" rel="stylesheet" />
    <link href="fontawesome-free-5.15.3-web/css/all.css" rel="stylesheet" />
    <link href="img/kpolomCOLLECTOR.png" rel="icon" />
    <style>
        .form-signin {
            width: 100%;
        }

        .greybackground {
            background-color:#FBF8F6 /*#EEEEEE*/
        }

        @font-face {
            font-family: 'myowner';
            src: url(fonts/penna.otf);
        }

        @font-face {
            font-family: 'LeagueGothic';
            src: url(fonts/LeagueGothic-CondensedRegular.otf);
        }

        @font-face {
            font-family: 'Choplin';
            src: url(fonts/Choplin-ExtraLight-DEMO.otf);
        }

        @font-face {
            font-family: 'ChoplinMedium';
            src: url(fonts/Choplin-Medium-DEMO.otf);
        }

        @font-face {
            font-family: 'Audrey-Bold';
            src: url(fonts/Audrey-Bold.otf);
        }

        @font-face {
            font-family: 'Zefani';
            src: url(fonts/ZefaniStencilRegular.otf);
        }

        @font-face {
            font-family: 'Linotte';
            src: url(fonts/Linotte-SemiBold.otf);
        }

        .custombtn-outline {
            background-color: #fff;
            color: #1BA2D4;
            border-color: #1BA2D4
        }

            .custombtn-outline:hover {
                background-color: #1BA2D4;
                color: #fff;
                border-color: #1BA2D4
            }

        .bordercoloryellow {
            border-color: #EBC23E
        }

        .bordercolorblue {
            border-color: #247391
        }

        .companybluecolor {
            color: #247391
        }

        .yellowback {
            background-color: #FEC50B;
        }

        .update {
            position: fixed;
            top: 0px;
            left: 0px;
            min-height: 100%;
            min-width: 100%;
            background-image: url("img/loading (1).gif");
            background-position: center center;
            background-repeat: no-repeat;
            background-color: white;
            z-index: 500 !important;
            opacity: 0.8;
            overflow: hidden;
        }

        .loading-text {
            width: 90px;
            position: absolute;
            top: calc(50% - 15px);
            left: calc(50% - 45px);
            text-align: center;
        }
         .navbar-custom .nav-item.active .nav-link,
        .navbar-custom .nav-item:hover .nav-link {
            color: white;  /*white*/
    background-color: black !important;
   
    border-radius:7px;
    font-size: large;
            font-weight: bold;
        }
       .navbar-custom .navbar-nav .nav-link {
          
             font-family:'Linotte';
    font-size: large;
    font-weight:bold;
    color:  #1CADE4;  /*black*/
        }
          .custombtn-outline {
            background-color:  #fff;
            color:#1BA2D4;
            border-color: #1BA2D4
        }
               .custombtn-outline:hover {
            background-color:  #1BA2D4;
            color:#fff;
            border-color: #1BA2D4
        }
                  .custombtn {
            background-color:  #1BA2D4 ;
            color:#fff;
            border-color: #1BA2D4;
        }
               .custombtn:hover {
            background-color:  #0069d9;
            color:#fff;
            border-color: #1BA2D4
        }
                .navbar-brand {
               font-family:'Linotte';
    font-size:25px;
    font-weight:bold; color: #1BA2D4 !important;
        }
                 .myrightmargin{
           margin-right:17% !important;
       }
                   /* hide close when burger shown */
  
   .navbar-toggler.collapsed .close-icon {
    display: none;
}

.navbar-toggler:not(.collapsed) .navbar-toggler-icon {
    display: inline;
}
    </style>
</head>
<body class="greybackground" onload="myFunction()">
    <form id="form1" runat="server">
        <script>
            var myVar;

            function myFunction() {
                myVar = setTimeout(showPage, 3000);
            }

            function showPage() {
                document.getElementById("loader1").style.display = "none";
                document.getElementById("myDiv").style.display = "block";
            }
        </script>
        <div id="loader1" class="update"><span class=" loading-text">
            <img src="img/kpolomCOLLECTOR.png" style="height: 30px; width: auto" /></span></div>
        <div class="container border-danger border">
            <nav class="navbar navbar-expand-lg navbar-light  bg-white      rounded  navbar-custom  fixed-top " style="border-color: transparent !important">
                <a class="navbar-brand ml-lg-5 pl-lg-5  " href="index.aspx">
                    <img src="img/kpolomCOLLECTOR.png" style="width: auto; height: 50px;" class="" />COLLECTOR </a>
                <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                      <div class="close-icon py-1">✖</div>
                </button>

                <div class="collapse navbar-collapse     " id="navbarSupportedContent">

                   
                    <ul class="navbar-nav  ml-auto    mr-lg-4 text-center   ">
                        <li class="nav-item px-2">
                            <a class="nav-link  pl-2" href="index.aspx">home</a>
                        </li>
                        <li class="nav-item px-2">
                            <a class="nav-link pl-2" href="index.aspx#aboutus">about</a>
                        </li>
                        <li class="nav-item px-2">
                            <a class="nav-link pl-2 " href="index.aspx#fees">FAQs</a>
                        </li>


                        <li class="nav-item px-2">
                            <a class="nav-link page-scroller  " href="signin.aspx" id="lin">sign in <i class="fa  fa-lock"></i></a>

                        </li>
                    </ul>
                  <%--  <div class="d-flex myrightmargin ">
                        <a class="btn  btn-primary " href="Signup.aspx">create account <i class="fa fa-user-plus"></i></a>
                    </div>--%>


                </div>
            </nav>
        </div>
        <br />
        <br />
        <div class="container">
            <div class="row">
                <div class="col-sm-9 col-md-9 col-lg-6 mx-auto">




                    <div class="card card-signin    my-5 shadow">
                        <div class="card-header  bg-white border-bottom border-warning  ">
                            <h3 class="card-title text-center">Sign Up</h3>
                          

                        </div>
                        <div class="card-body">


                            <%-- <h5 class="card-title text-center">Sign Up</h5>--%>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class=" form-group">
                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Placeholder="Firstname" required="true"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class=" form-group">
                                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Placeholder="Lastname" required="true"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <div class=" form-group">
                                <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" Placeholder="PhoneNumber" required="true" MaxLength="11" onkeyup="losefocus();" onpaste="losefocus();" onkeypress="return CheckNumeric();" CausesValidation="True" AutoPostBack="True" TextMode="Phone"></asp:TextBox>

    
                            </div>
                           <div class=" form-group">
                               <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" Placeholder="Email Address" required="true" onkeyup="losefocusemail();" onpaste="losefocusemail();" CausesValidation="True" AutoPostBack="True"></asp:TextBox>
                           </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                              <div class=" form-group input-group" id="show_hide_password">
                               <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" Placeholder="Password" required="true" TextMode="Password"></asp:TextBox>
                                  <div class="input-group-prepend">
                         <a href="" class="btn btn-secondary rounded"><i class=" fa fa-eye-slash" aria-hidden="true"></i></a>
                    </div>
                           </div>

                            <div class="form-row ">
                               <div class="col text-center">
                                    <asp:Button ID="Button1" runat="server" Text="Get Started" CssClass="btn  custombtn btn-lg btn-block" />
                               </div>
                            </div>
                             <div class="row my-2">
    <div class="col"><hr class="  bordercoloryellow" /></div>
    <div class="col-auto"><small class="  companybluecolor">OR</small></div>
    <div class="col"><hr class="bordercoloryellow" /></div>
</div>
                <center>
                    
                     <label for="inputPassword " class="text-center">Already have an account?</label>
                </center>
              <a href="signin.aspx" class="btn  custombtn-outline btn-block text-uppercase" type="submit"><i class=" mr-2"></i> Sign In</a>
             
          </div>
                        <div class="card-footer bg-white border-top border-warning">
                            <small class="text-justify">
                                We charge a 3% commission on each completed collection. The payment processor fee is 1.5%  per donation as specified by FLUTTERWAVE. By continuing, you agree to  OUR terms and you acknowledge receipt of our privacy policy.
                            </small>
                        </div>
        </div>
      </div>
                
    </div>
            
                <button type="button" class="btn btn-primary  invisible " data-toggle="modal" data-target="#staticBackdrop" id="myclick">hey</button>
  </div>
             <section id="footer" class="border-top border-white">
            <div class="container-fluid">
                
                <div class="row">
                    <div class="col-sm-12 col-md-12 col-lg-12"><p class="text-center  pt-4">
                      © Copyright 2022-2023 Collector.ng. All rights reserved. <a href="terms.aspx">Terms</a>
                                           </p></div>
                </div>
            </div>
        </section>
    
        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
        <ProgressTemplate>
            <div class="update">
                <span class=" loading-text"><img src="../img/BEVELEDKPOLOMX.png"  style="height:30px;width:auto" /></span>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:kpolomDUMMYConnectionString %>' SelectCommand="SELECT * FROM [Collection_Details]"></asp:SqlDataSource>
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="bootstrap-4.4.1-dist/js/bootstrap.min.js"></script>
             <script>
                 $(document).ready(function () {
                     $("#show_hide_password a").on('click', function (event) {
                         event.preventDefault();
                         if ($('#show_hide_password input').attr("type") == "text") {
                             $('#show_hide_password input').attr('type', 'password');
                             $('#show_hide_password i').addClass("fa-eye-slash");
                             $('#show_hide_password i').removeClass("fa-eye");
                         } else if ($('#show_hide_password input').attr("type") == "password") {
                             $('#show_hide_password input').attr('type', 'text');
                             $('#show_hide_password i').removeClass("fa-eye-slash");
                             $('#show_hide_password i').addClass("fa-eye");
                         }
                     });
                 });

                 function ShowPopup() {

                     //$("#staticBackdrop").modal("show");
                     $("#myclick").click();
                 }
        </script>
        <script type="text/javascript">
                 function losefocus() {

                     var text = document.getElementById('<%=TextBox3.ClientID%>');
                     if (text != null && text.value.length > 10) {
                         text.blur();

                     }
                     //else if (text != null && text.value.length < 10) {
                     //    alert("Hello! I am an alert box!!");
                     //}
                 }

                 function losefocusemail() {
                     //&& text.value.length > 10
                     var text = document.getElementById('<%=TextBox4.ClientID%>');
                if (text.hasFocus()) {


                } else {
                    text.blur();
                }

            }
        </script>
        <script>
            function CheckNumeric() {
                return event.keyCode >= 48 && event.keyCode <= 57 || event.keyCode == 46;
            }
        </script>
    </form>
</body>
</html>
