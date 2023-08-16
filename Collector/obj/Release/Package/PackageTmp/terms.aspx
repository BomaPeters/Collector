<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="terms.aspx.vb" Inherits="Collector.terms" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>COLLECTOR</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Support people & events you care about." />
    <meta name="author" content="kpolom" />
    <link href="img/kpolomCOLLECTOR.png" rel="icon" />

    <link href="bootstrap-4.4.1-dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>

    <script src="bootstrap-4.4.1-dist/js/bootstrap.min.js"></script>
    <link href="fontawesome-free-5.15.3-web/css/all.css" rel="stylesheet" />
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
        <div class=" container">
          
            <br />
        <div class="card mt-2">
            <div class="card-body">
                 <h3 class=" mt-lg-3 mt-2 card-title">TERMS</h3>
                <div class="row">
            <div class="col-md-12">
                   
            </div>
        </div>
            </div>
        </div>
        </div>
    </form>
</body>
</html>
