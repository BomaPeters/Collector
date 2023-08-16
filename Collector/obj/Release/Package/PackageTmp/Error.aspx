<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Error.aspx.vb" Inherits="Collector._Error" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>COLLLECTOR</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="Support people & events you care about." />
    <meta name="author" content="kpolom" />
    <link href="bootstrap-4.4.1-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="bootstrap-4.4.1-dist/css/bootstrap-pincode-input.css" rel="stylesheet" />
    <link href="fontawesome-free-5.15.3-web/css/all.css" rel="stylesheet" />
    <link href="img/kpolomCOLLECTOR.png" rel="icon" />

    <style type="text/css">
        .form-signin {
            width: 100%;
        }

        .greybackground {
            background-color: #FBF8F6 /*#EEEEEE*/
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
            color: white; /*white*/
            background-color: #1CADE4 !important;
            border-radius: 7px;
            font-size: large;
            font-weight: bold;
        }

        .navbar-custom .navbar-nav .nav-link {
            font-family: 'Linotte';
            font-size: large;
            font-weight: bold;
            color: #1CADE4; /*black*/
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

        .custombtn {
            background-color: #1BA2D4;
            color: #fff;
            border-color: #1BA2D4;
        }

            .custombtn:hover {
                background-color: #0069d9;
                color: #fff;
                border-color: #1BA2D4
            }

        .navbar-brand {
            font-family: 'Linotte';
            font-size: 25px;
            font-weight: bold;
            color: #1BA2D4 !important;
        }

        .myrightmargin {
            margin-right: 0% !important;
        }

        @media (min-width: 992px) {
            .myrightmargin {
                margin-right: 17% !important;
            }
        }
        /* hide close when burger 
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
        <div id="loader1" class="update">
            <span class=" loading-text">
                <img src="img/kpolomCOLLECTOR.png" style="height: 30px; width: auto" /></span>
        </div>
        <div class="container border-danger border">
            <nav class="navbar navbar-expand-lg navbar-light  bg-white      rounded  navbar-custom  fixed-top " style="border-color: transparent !important">
                <%-- <a class="navbar-brand ml-lg-5 pl-lg-5  " href="../collector.aspx">
                    <img src="../img/kpolomCOLLECTOR.png" style="width: auto; height: 50px;" class="" />COLLECTOR </a>
                <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                      <div class="close-icon py-1">✖</div>
                </button>--%>
                <a class="navbar-brand ml-lg-5 pl-lg-5  " href="index.aspx">
                    <img src="img/kpolomCOLLECTOR.png" style="width: auto; height: 50px;" class="" />COLLECTOR </a>
                <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                    <div class="close-icon py-1">✖</div>
                </button>

                <div class="collapse navbar-collapse     " id="navbarSupportedContent">


                    <ul class="navbar-nav  ml-auto     mr-lg-4 text-center   ">
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
                    <div class="d-flex myrightmargin ">
                        <a class="btn  btn-primary  btn-block " href="Signup.aspx">create account <i class="fa fa-user-plus"></i></a>
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
                            <h3 class="card-title text-center">ERROR!</h3>

                        </div>

                        <div class="card-body">
                            <div class="row">

                                <div class="col text-center">
                                    <i class="fa  fa-frown-o  fa-4x text-primary"></i>
                                    <br />
                                    <small class="">An error has occured</small>
                                    <h6 class=" ">
                                        <asp:Label ID="Label4" runat="server" Text="Please wait a few minutes before you try again." CssClass="h6 text-dark"></asp:Label></h6>

                                </div>
                            </div>
                            <hr />



                            <%--   <p class="card-text text-center invisible "><span class=" float-start">Amount:</span> <b class="  float-end" > 14,000.00</b>&nbsp;<b class=" float-end">NGN&nbsp;</b></p>--%>

                            <div class="form-group">
                                <label>Error Message:</label>
                                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control form-control-lg border   border-primary" TextMode="MultiLine" Rows="3"></asp:TextBox>

                            </div>
                            <div class="form-group">
                                <asp:Button ID="Button1" runat="server" Text="Inform Us" CssClass="btn custombtn btn-block btn-lg" />

                            </div>

                            <hr />
                            <%--  <b class="badge badge-warning text-capitalize p-2"> Unsuccessful Donation? </b>--%>
                            <center>   <a href="#" class="btn  btn-warning btn-sm mx-auto   " data-toggle="modal" data-target="#staticBackdrop">Unsuccessful Donation? <b>Click Here <i class="fa fa-hand-o-up"></i></b></a></center>
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title text-center" id="staticBackdropLabel">Collection details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="card border border-primary">

                            <div class="card-body">
                                <div class="form-group">
                                    <small>Collection Name</small>
                                    <h6 class=" "><asp:Label ID="Label1" runat="server" Text="0.0" CssClass="h6 text-dark">Birthday Celebration</asp:Label></h6>
                                </div>
                                <hr />
                                <div class="form-group">
                                    <small>Collecting for</small>
                                    <h6 class=" "><asp:Label ID="Label2" runat="server" Text="0.0" CssClass="h6 text-dark">Creator Name</asp:Label></h6>
                                </div>
                                <hr />

                                <div class=" form-group">
                                    <small>Enter Donor PhoneNumber</small>
                                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Placeholder="PhoneNumber" MaxLength="11" onkeypress="return CheckNumeric();" ></asp:TextBox>


                                </div>

                                   <div class="form-group">
                                <small>Donor Email Address</small>
                                <asp:TextBox ID="email" runat="server" CssClass="form-control"  TextMode="Email" Placeholder="Email"></asp:TextBox>
                            </div>
                                <div class=" form-group ">
                                    <small>Enter Donation Amount</small>
                                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control form-control-lg border   border-primary" Placeholder="Amount"  onkeyup="FormatCurrency(this);" onkeypress="return CheckNumeric();"  MaxLength="7"></asp:TextBox>


                                </div>

          
                <asp:Button ID="Button2" runat="server" Text="Notify Us" CssClass="btn   btn-warning btn-block text-uppercase" />
                                       
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
        <script type="text/javascript">
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
             <%--   document.getElementById('<%=Button1.ClientID%>').value = 'Transfer ' + ctrl.value;--%>

            }

            function CheckNumeric() {
                return event.keyCode >= 48 && event.keyCode <= 57 || event.keyCode == 46;
            }

           
         

        </script>
    </form>
</body>
</html>
