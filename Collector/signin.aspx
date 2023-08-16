<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="signin.aspx.vb" Inherits="Collector.signin" %>

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
           margin-right:0% !important;
       }
        @media (min-width: 992px) {
            .myrightmargin {
                margin-right: 17% !important;
            }
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
                     <%--   <li class="nav-item px-2">
                            <a class="nav-link pl-2" href="#howstuck">about</a>
                        </li>--%>
                        <li class="nav-item px-2">
                            <a class="nav-link pl-2 " href="index.aspx#fees">FAQs</a>
                        </li>


                      <%--  <li class="nav-item px-2">
                            <a class="nav-link page-scroller  " href="Login.aspx" id="lin">sign in <i class="fa  fa-lock"></i></a>

                        </li>--%>
                    </ul>
                    <div class="d-flex myrightmargin ">
                        <a class="btn   custombtn btn-block " href="signup.aspx">Start a Collection  <i class="fa  fa-angle-double-up"></i></a>
                    </div>


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
                            <h3 class="card-title text-center">Sign In</h3>

                        </div>
                        <div class="card-body">

                             <div class="form-row">
                    <div class="col text-center">
                      
                        <asp:Label ID="Label1" runat="server" Text="" CssClass=" alert alert-danger small fa" Visible="false"></asp:Label>
                    </div>
                </div>
                            <%-- <h5 class="card-title text-center">Sign Up</h5>--%>
                          
                            <div class="row">
                                <div class="col text-center">
                                    <div class=" form-group">
                                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-warning  btn-sm"><i class="fa fa-lock"></i> Login with KPOLOM details</asp:LinkButton>
                                       
                                        
                                    </div>
                                </div>
                                
                            </div>
                            <div class="row my-4">
    <div class="col"><hr class="  bordercoloryellow" /></div>
    <div class="col-auto"><small class="  companybluecolor">OR</small></div>
    <div class="col"><hr class="bordercoloryellow" /></div>
</div>
                            <div class=" form-group">
                                <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" Placeholder="PhoneNumber"  MaxLength="11"></asp:TextBox>

                               
                            </div>
                           
                              <div class=" form-group input-group" id="show_hide_password">
                               <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" Placeholder="Password"  TextMode="Password"></asp:TextBox>
                                  <div class="input-group-prepend">
                         <a href="" class="btn btn-secondary rounded"><i class="fa fa-eye-slash" aria-hidden="true"></i></a>
                    </div>
                           </div>
                            <div class="form-row ">
                               <div class="col text-center">
                                    <asp:Button ID="Button1" runat="server" Text="Sign In" CssClass="btn  custombtn btn-lg btn-block" />
                               </div>
                            </div>
          </div>
                        <div class="card-footer bg-white border-top border-warning">
                         
                <center>
                    
                     <label for="inputPassword " class="text-center">Don't have an account?</label>
                </center>
              <a href="signup.aspx" class="btn  custombtn-outline btn-block text-uppercase my-2" type="submit"><i class=" mr-2"></i> Create an Account</a>
             
                        </div>
        </div>
      </div>
                
    </div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
               
  </div>
             <section id="footer" class="border-top border-white">
                  <button type="button" class=" invisible " data-toggle="modal" data-target="#staticBackdrop" id="myclick"><i class="fa fa-lock"></i> Login with KPOLOM details</button>
            <div class="container-fluid">
                
                <div class="row">
                    <div class="col-sm-12 col-md-12 col-lg-12"><p class="text-center  pt-4">
                      © Copyright 2022-2023 Collector.ng. All rights reserved. <a href="terms.aspx">Terms</a>
                                           </p></div>
                </div>
            </div>
        </section>

    
        <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title text-center" id="staticBackdropLabel">Login with KPOLOM details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="card">
                                                  <div class="card-header yellowback  " style="  border-bottom-left-radius: 50%;
    border-bottom-right-radius: 50%;">
                 <center>
                <a href="https://kpolom.com/" target="_blank" class=" ">
                   
                       <img src="img/BEVELED KPOLOM1.png" style="width: auto; height: 60px"  class=" "/>
                 
                    
                </a>
               </center>
          <center  style="margin-top:-2%;  margin-bottom:4%"  >
              <b class="" style="  font-family:'Linotte';" > Kpolom</b>
                 </center>
            </div>
<div class="card-body">
 
  <div class=" form-group">
                                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Placeholder="PhoneNumber"  MaxLength="11"></asp:TextBox>

                               
                            </div>
                           
                              <div class=" form-group input-group" id="show_hide_password1">
                               <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Placeholder="Password"  TextMode="Password"></asp:TextBox>
                                  <div class="input-group-prepend">
                         <a href="" class="btn btn-secondary rounded"><i class="fa fa-eye-slash" aria-hidden="true"></i></a>
                    </div>
                           </div>

          <div class="form-row">
                 <div class="col-md">
                      <div class="custom-control custom-checkbox mb-3">
                <input type="checkbox" class="custom-control-input" id="customCheck1" />
                <label class="custom-control-label small" for="customCheck1">Remember password</label>
              </div>
                 </div>
                 <div class="col-md"><a href="../forgotpassword.aspx" class="small companybluecolor">Forgot Password?</a></div>
             </div>
          
                <asp:Button ID="Button2" runat="server" Text="Sign in" CssClass="btn   btn-warning btn-block text-uppercase" />
                                       
</div>
                                                </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
         
       <%-- <button type="button" class="btn btn-primary">Understood</button>--%>
      </div>
    </div>
  </div>
</div>
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

                 $(document).ready(function () {
                     $("#show_hide_password1 a").on('click', function (event) {
                         event.preventDefault();
                         if ($('#show_hide_password1 input').attr("type") == "text") {
                             $('#show_hide_password1 input').attr('type', 'password');
                             $('#show_hide_password1 i').addClass("fa-eye-slash");
                             $('#show_hide_password1 i').removeClass("fa-eye");
                         } else if ($('#show_hide_password1 input').attr("type") == "password") {
                             $('#show_hide_password1 input').attr('type', 'text');
                             $('#show_hide_password1 i').removeClass("fa-eye-slash");
                             $('#show_hide_password1 i').addClass("fa-eye");
                         }
                     });
                 });

                 function ShowPopup() {

                     //$("#staticBackdrop").modal("show");
                     $("#myclick").click();
                 }
             </script>
          <script src="https://widget.sirena.app/get?token=4d35e4536a394c63a19bb8059b2c6126"></script>
    </form>
</body>
</html>
