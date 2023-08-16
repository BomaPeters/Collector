<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="dues.aspx.vb" Inherits="Collector.dues" %>

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

    <style>
        .form-signin {
            width: 100%;
        }

        .greybackground {
            background-color: #EEEEEE
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

        .concave {
            background-color: #fc0;
            width: 100%;
            padding: 20px 20px 0;
            height: 45%;
            box-sizing: border-box;
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
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

        #homepage {
            height: auto;
            padding-top: 100px;
            padding-bottom: 50px;
        }

        #aboutus {
            background-color: #FFFFFF;
            height: auto;
            padding-top: 110px;
            padding-bottom: 50px;
        }

        #fees {
            background-color: #1CADE4;
            height: auto;
            padding-top: 110px;
            padding-bottom: 50px;
        }

        #contactus {
            /*background-color:#FFFFFF;*/
            height: auto;
            padding-top: 110px;
            padding-bottom: 50px;
        }

        .navbar-default .navbar-nav > li > a {
            color: white; /*font: bold 25px ;*/
            font-family: 'Linotte';
            font-size: 25px;
            font-weight: bold;
        }

        .navbar-brand {
            font-family: 'Linotte';
            font-size: 25px;
            font-weight: bold;
            color: #FEC50B !important;
        }

        .backyellow {
            background-color: #F7BD2F;
            background-image: url('img/bg_yellow_1.png'); /*background-size:cover;
                        background-attachment: fixed;
 background-position: center;
 background-repeat: no-repeat;*/
        }

        .mynewbackground {
            background-image: url('img/bg_yellow_1.png');
            border-color: transparent !important;
        }

        .navbar-custom .nav-item.active .nav-link,
        .navbar-custom .nav-item:hover .nav-link {
            color: white;
            background-color: black !important;
            border-radius: 7px;
            font-size: large;
            font-weight: bold;
        }

        .navbar-custom .navbar-nav .nav-link {
            font-family: 'Linotte';
            font-size: large;
            font-weight: bold;
            color: #1CADE4;
        }

        .colorawesom {
            color: #FEC50B !important;
        }

        .colorawesomblue {
            color: #1CADE4 !important;
        }

        .backgroundawesomeblue {
            background-color: #1CADE4 !important;
            border-radius: 5px;
            color: white;
        }

        .mychopplinfont {
            font-family: 'Choplin'
        }

        .greybackground {
            background-color: #FAFAFA;
        }

        @media ( min-width: 320px) {
            .ellipse {
                width: 100px;
                height: 20px;
                margin-top: 17%;
                margin-left: 33%;
                border-radius: 50%;
                background: white;
            }


            @-webkit-keyframes animbox {
                0% {
                    -webkit-transform: translateY(5px);
                    transform: translateY(50px);
                }

                100% {
                    -webkit-transform: translateY(5px);
                    transform: translateY(50px);
                }
            }

            @keyframes animbox {
                0% {
                    -webkit-transform: translateY(5px);
                    transform: translateY(5px);
                }

                100% {
                    -webkit-transform: translateY(50px);
                    transform: translateY(50px);
                }
            }


            .h1title {
                font-family: 'Audrey-Bold';
                font-size: 20vw;
                color: white;
            }

            .header2 {
                font-family: 'Choplin';
                font-size: 14vw;
            }

            .header2inner {
                font-family: 'Linotte';
                font-size: 21.5625vw;
                color: white;
            }

            .h2title {
                font-family: 'Linotte';
                font-size: 10vw; /*20vw*/
            }

            .bevposition {
                margin-top: 10%;
                margin-left: 24%;
            }

            .h3title {
                font-family: 'myowner';
                font-size: 10.0625vw;
                font-weight: bold;
            }

            .h5title {
                font-family: 'myowner';
                font-size: 12.0625vw;
                font-weight: bold;
            }

            .backgroundHolder {
                width: 100%;
                height: auto;
                background-image: url('img/kpolomcaseX.png');
                background-repeat: no-repeat;
                background-size: auto;
                padding-bottom: 0;
                background-position: center
            }
        }

        @media ( min-width: 480px) {
            .ellipse {
                width: 100px;
                height: 20px;
                margin-top: 10%;
                margin-left: 43%;
                border-radius: 50%;
                background: white;
            }
            /*#koko { background-color: blue;
        }*/

            @-webkit-keyframes animbox {
                0% {
                    -webkit-transform: translateY(5px);
                    transform: translateY(5px);
                }

                100% {
                    -webkit-transform: translateY(50px);
                    transform: translateY(50px);
                }
            }

            @keyframes animbox {
                0% {
                    -webkit-transform: translateY(5px);
                    transform: translateY(5px);
                }

                100% {
                    -webkit-transform: translateY(50px);
                    transform: translateY(50px);
                }
            }
            /*.stackreposition {margin-left: 30% !important;
            }*/
            .h1title {
                font-family: 'Audrey-Bold';
                font-size: 13.333333333333334vw;
                color: white;
            }

            .header2 {
                font-family: 'Choplin';
                font-size: 6.5vw; /*12.5vw*/
            }

            .header2inner {
                font-family: 'Linotte';
                font-size: 14.375vw;
                color: white;
            }

            .h2title {
                font-family: 'Linotte';
                font-size: 13.333333333333334vw
            }

            .bevposition {
                margin-top: 2%;
                margin-left: 35%
            }
            /*39.5%*/
        }

        .h3title {
            font-family: 'myowner';
            font-size: 9.375vw;
            font-weight: bold;
        }

        .h5title {
            font-family: 'myowner';
            font-size: 6.375vw;
            font-weight: bold;
        }

        .backgroundHolder {
            width: 100%;
            height: auto;
            background-image: url('img/kpolomcaseX.png');
            background-repeat: no-repeat;
            background-size: auto;
            padding-bottom: 0;
            background-position: center
        }

        @media ( min-width: 1200px) {
            .ellipse {
                width: 100px;
                height: 20px;
                /*margin: 2px auto 0;*/
                margin-top: 4px;
                margin-left: 10%;
                border-radius: 50%;
                background: white;
                margin-bottom: 7%;
                /*background: #cce6ff;*/
            }


            @-webkit-keyframes animbox {
                0% {
                    -webkit-transform: translateY(0);
                    transform: translateY(0);
                }

                100% {
                    -webkit-transform: translateY(-20px);
                    transform: translateY(-20px);
                }
            }

            @keyframes animbox {
                0% {
                    -webkit-transform: translateY(0);
                    transform: translateY(0);
                }

                100% {
                    -webkit-transform: translateY(-20px);
                    transform: translateY(-20px);
                }
            }

            .stackreposition {
                margin-left: 0% !important;
            }

            .h1title {
                font-family: 'Audrey-Bold';
                font-size: 5.333333333333333vw;
                color: white;
            }

            .header2 {
                font-family: 'Choplin';
                font-size: 5vw;
            }

            .header2inner {
                font-family: 'Linotte';
                font-size: 5.75vw;
                color: white;
            }

            .mylinotte {
                font-family: 'Linotte';
            }

            .h2title {
                font-family: 'Linotte';
                font-size: 3.333333333333333vw
            }

            .bevposition {
                margin-top: 15%;
                margin-left: 4%;
            }

            .h3title {
                font-family: 'myowner';
                font-size: 3.25vw;
                font-weight: bold;
            }

            .h5title {
                font-family: 'myowner';
                font-size: 2.25vw;
                font-weight: bold;
            }

            .backgroundHolder {
                width: 100%;
                height: auto;
                background-image: url('img/kpolomcaseX.png');
                background-repeat: no-repeat;
                background-size: auto;
                padding-bottom: 0;
                background-position: left;
            }
        }

        .imgresizer {
            width: 200px !important;
            height: auto !important;
        }

        .active1 {
            color: white !important;
            background-color: black !important;
            border-radius: 7px;
            font-size: large;
            font-weight: bold;
        }

        .activeblue {
            color: white !important;
            background-color: #1CADE4 !important;
            border-radius: 7px;
            font-size: large;
            font-weight: bold;
        }

            .activeblue a {
                color: white !important;
            }

        .underline {
            width: 10% !important;
            margin-top: -15px !important;
            margin-bottom: 15px !important;
            border-top: 5px solid #1CADE4 !important;
        }

        .underlinewhite {
            width: 10% !important;
            margin-top: -15px !important;
            margin-bottom: 15px !important;
            border-top: 5px solid #fff !important;
        }

        #footer {
            height: auto;
            padding-top: 10px;
            padding-bottom: 10px;
        }

        html {
            /*For smooth scrolling behavior*/
            scroll-behavior: smooth;
        }

        @media ( min-width: 320px) {
            .marginsetter {
                color: red;
            }
        }

        @media (min-width: 480px) {
            .marginsetter {
                color: green;
            }
        }

        @media (min-width: 1200px) {
            .marginsetter {
                color: orange;
            }
        }
         .show-read-more .more-text{
        display: none;
    }
            .show-read-more1 .more-text1{
        display: none;
    }
            .removespacebtwlines{
                   padding : 0;
    margin : 0;
    line-height : 20px;
            }
              @media (min-width: 768px) and (max-width: 991px)
 {
   .ml-8-lg{
                   margin-left: 10% !important;
               }

               }
        @media (min-width: 576px) and (max-width: 768px) {
             .ml-8-lg{
                   margin-left: 4% !important;
               }
        }
        @media (min-width: 1200px){
              .ml-8-lg{
                   margin-left: 10% !important;
               }
        }
         /*.myrightmargin{
           margin-right:17% !important;
       }
         .login ::before{
              font-family: 'FontAwesome';
              font-weight:900;
              content:"\f007";
         }*/
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
.thumb
{
    /*max-height:370px;*/ /*max-width:560px;*/
      width: 100%;
height:55vh; /*40vh;*/
object-fit:   contain;
}
       .btncusblue{
    background-color:#1CADE4 !important;
    color:white !important;
}
.btncusblue :hover{
    background-color:#1689b6 !important;
    color:white !important;
    border-color:	#1689b6;
}
/**html .thumb
{
    width:expression((this.width/this.height)>=0.90?560:'auto');
    height:expression((this.width/this.height)<0.90?300:'auto');
}*/
/*.col-md-7 img {width:100%; height:55%}*/

#mytable th:first-child,td:first-child{
 /*   position:sticky;
    left:0px;
    background-color: red;
    width:40%*/
       
}
#GridView1 th:first-child,td:first-child{
    position:sticky;
    left:0px;
    background-color:  #f8fafb;
    width:400px !important;  /*400px;*/
  min-width:250px; /
      
}
 @media (max-width: 767px) { 
    #GridView1 th:first-child,td:first-child{
    position: sticky;
    left:0px;
    background-color:#f8fafb ; 
     width:50% !important;
        min-width:0px !important;
}
 }
input[type=checkbox]:checked:before{color:red !important; background-color:purple;accent-color:pink}
 .border-customblue {
    border-color: #1CADE4 !important;
}

 /* .colorme{
         color:deeppink !important;
     }
 @media (max-width: 767.98px) { 
     .colorme{
         color:aqua !important;
     }
 }*/
    </style>
</head>
<body onload="myFunction()">
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
            <nav  class="navbar navbar-expand-lg navbar-light     greybackground    rounded  navbar-custom  fixed-top " style="border-color: transparent !important">
                    <a class="navbar-brand  ml-8-lg pl-lg-5 colorawesomblue " href="index.aspx">
                        <img src="img/kpolomCOLLECTOR.png" style="width: auto; height: 50px;" class="  " />COLLECTOR </a>
                    <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon "></span>
                           <div class="close-icon py-1">✖</div>
                    </button>

                    <div class="collapse navbar-collapse     " id="navbarSupportedContent">
                        
                        
                        <ul class="navbar-nav  ml-auto    mr-lg-4 text-center    ">
                            <li class="nav-item px-2">
                                <a class="nav-link  pl-2" href="index.aspx#homepage">home</a>
                            </li>
                            <li class="nav-item px-2">
                                <a class="nav-link pl-2" href="index.aspx#aboutus">about</a>
                            </li>
                            <li class="nav-item px-2">
                                <a class="nav-link pl-2 " href="index.aspx#fees">FAQs</a>
                            </li>
                         
                           <%--  <li class="nav-item px-2">
                                <a class="nav-link pl-2  " href="#fees" id="linker3">fees</a>
                  
                            </li>--%>
                           <%--  <li class="nav-item px-2">
                                <a class="nav-link page-scroller " href="Login.aspx" id="linjjj">FAQs</a>
                  
                            </li>--%>
                            
                                 <li class="nav-item px-2" id="notlogged" runat="server">
                                <a class="nav-link page-scroller  " href="signin.aspx" id="lin">sign in <i class="fa  fa-lock "></i></a>
                  
                            </li>
                              <li class="nav-item px-2" id="ProfileLink" runat="server">
                                <a class="nav-link page-scroller  " href="secured/mycollections.aspx" >MyCollections <i class="fa   fa-angle-double-up "></i></a>
                  
                            </li>
                            <li class="nav-item px-2" id="loggednow" runat="server">
                                <asp:LoginStatus ID="LoginStatus1" runat="server"  CssClass="nav-link  pl-2" LoginText="sign in <i class='fa fa-lock'></i> " LogoutAction="Redirect" LogoutPageUrl="~/signin.aspx" LogoutText="LogOut <i class='fa fa-sign-out'></i> "   />
                            </li>
                        </ul>
                          <div class="d-flex myrightmargin " id="notloggedstart"  runat="server">
        <a class="btn   btncusblue btn-block "  href="signup.aspx">Start a Collection <i class="fa  fa-angle-double-up"></i></a>
                             
      </div>
                        <div class="d-flex myrightmargin " id="loggedstart"  runat="server">
        <a class="btn   btncusblue btn-block "  href="secured/createcollection.aspx">New Collection <i class="fa  fa-angle-double-up"></i></a>
                             
      </div>

                    </div>
                </nav>
        </div>
        <br />
        <br />
        <div class="  container   mt-5  ">
            <div class="row mb-2">
                <div class="col-md-7">
                <div class="card ">
     <%--<div class="card-img">
               
     </div>--%>
                                 <center>
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/collector/img/collectionpic/mina.jpg" CssClass=" img-thumbnail shadow-sm  img-fluid   card-img-top " /></center><%--thumb--%>
                </div>
                    <%-- <a href=""></a>--%>
                    <div class="card shadow-sm my-3">
                        <div class="card-body">
                            <div class="form-row">
                                <div class="col">
                                    <asp:Button ID="Button1" runat="server" Text="PAY" CssClass="btn  btncusblue btn-lg btn-block  " />
                                </div>
                                <div class="col">

                                    <button type="button" class=" btn  custombtn-outline btn-lg btn-block " data-toggle="modal" data-target="#staticBackdrop" id="myclick">SHARE</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="card shadow mb-3 ">
                        <div class="card-body">
                            <div class="row ">

                                <div class="col">
                                   
                                    <p class="text-left">Dues Collected:</p>
                                    <h6 class="">
          <asp:Label ID="Label1" runat="server" Text="Label" CssClass="h4 text-dark">0.00</asp:Label> <small>collected at <b id="goalhold" runat="server" > 0.0</b>  per payment</small></h6>
                                <%--<div class="progress  w-100" style="height:5px">
  <div id="rangeholder" runat="server" class="progress-bar bg-info" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
</div>--%>
                                </div>
                      
                            </div><hr />
                                   <div class="row ">
                                     
                               <div class="col"><p class="text-left">Dues for:</p>
                                   <h6 class=""> <asp:Label ID="Label3" runat="server" Text="DONT KNOW" CssClass="h6 text-dark"></asp:Label></h6></div>
                           </div>
                            <hr />
                   <%--           <div class="row">
                              
                               <div class="col">
                                   <p class="text-left">Purpose for Collecting:</p>
                                   <h6 class=" "><asp:Label ID="Label4" runat="server" Text="0.0" CssClass="h6 text-dark">Birthday Celebration</asp:Label></h6></div>
                           </div><hr />--%>

                                <div class="row">
                             

           <div class="col">
                <p class="text-left mb-0">Want to join?</p>
        <span id="anybodyview" runat="server">
                <input type="button" value="&#xf055 Join " class="btn btn-warning fa" data-toggle="modal" data-target="#staticBackdrop2"   />
        </span>
               <span class="badge badge-warning p-2 small" id="membersonlyview" runat="server"><i class="fa  fa-info-circle"></i> Contact Dues Creator</span>
           </div>


                                    <div class="col">
                                        <p class="text-left mb-0">Open to:</p>
                                        <asp:Label ID="Label4" runat="server" CssClass="h6"></asp:Label>
                                    </div>
                           </div>

                           
                        </div>
                    </div>
                    <hr class=" border border-primary" />
                    <div class="card  colorawesomblue   mb-3 shadow-sm">
                        <div class="card-body ">
                            <div class="row">
                                <div class="col text-center ">
                                    <h6 class=" mylinotte" id="contribcnt" runat="server">0</h6>
                                    <small>Contributions</small>
                                </div>
                                 <div class="col border-left border-right text-center"> <h6 class="mylinotte" id="membercounter" runat="server">0</h6>
                                     <small>Members</small>
                                 </div>
                                  <div class="col text-center">
                                      <h6 class=" mylinotte" id="shareholdonpage" runat="server">0</h6>
                                      <small>Shares</small>
                                  </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row my-2"> 
                <div class="col-md-7">
                    <div class="card mb-3">
                        <div class="card-header backgroundawesomeblue">
                             <h6 class="">Created by:</h6>
                        </div>
                      <div class="card-body">
                             
               <div class="list-group list-group-flush">
                   <div class="list-group-item list-group-item-action flex-column align-items-start">
                       <div class="d-flex w-100 justify-content-between">
                           <span>
                            
                               <b class=" ">     <span class="  fa-stack">
                                                      <i class="fa fa-circle fa-stack-2x text-primary"></i>
                                                      <i class=" fa fa-user fa-stack-1x fa-inverse"></i>
                                                  </span><span id="creatorname" runat="server"></span></b><small class="">-  <b id="createddate" runat="server" class="badge badge-primary "></b></small>
                           </span><br />
                         
                       </div>
                   </div>

                   <div class="list-group-item ">
                          <div class="row">
                            
                              <div class="col p-2 d-flex  align-content-center flex-wrap">
                                    <small >Due Date: <b id="duedate" runat="server" class="badge  badge-danger p-2">00-OCT-21</b> </small>

                               
                              </div>
                              <div class="col p-2  justify-content-center   border-left">
                                  <p class=" my-auto"> 
                                      <span class="  fa-stack">
                                                      <i class="fa fa-circle fa-stack-2x text-primary"></i>
                                                      <i class=" fa fa-tags fa-stack-1x fa-inverse"></i>
                                                  </span> <b id="categoryhold" runat="server"></b></p>
                              </div>
                          </div>

                   </div>
               </div>
                        <%--<div class="d-flex w-100  justify-content-around  ">
                          
                        </div>--%>
                      </div>

                    </div>
                  
                </div>
                 <div class="col-md-5">
                  <div class="card shadow-sm">
                      <div class="card-header backgroundawesomeblue">
                             <h6>Description:</h6>

                          
                      </div>
                      <div class="card-body">
   
                          <div class="text-justify show-read-more1 " id="descriptionhold" runat="server">
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Deserunt ipsam repellendus voluptatum, totam magni iusto numquam quo eos dolor perferendis.
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Deserunt ipsam repellendus voluptatum, totam magni iusto numquam quo eos dolor perferendis.
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Deserunt ipsam repellendus voluptatum, totam magni iusto numquam quo eos dolor perferendis.
                    </div>
                       <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
                          
                         
                               <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString='<%$ ConnectionStrings:kpolomDUMMYConnectionString %>' SelectCommand="SELECT  * FROM [Collection_Log] INNER JOIN Donor_Details ON Collection_Log.TransID= Donor_Details.TransID WHERE (Collection_Log.[CollectionID] = @CollectionID) ORDER BY [TimeOfTrans] DESC">
            <SelectParameters>
                <asp:SessionParameter SessionField="collectionhold" Name="CollectionID" Type="String"></asp:SessionParameter>

            </SelectParameters>
        </asp:SqlDataSource>
                             
                                  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:kpolomDUMMYConnectionString %>' SelectCommand="SELECT  * FROM [Collection_Log] INNER JOIN Donor_Details ON Collection_Log.TransID= Donor_Details.TransID WHERE (Collection_Log.[CollectionID] = @CollectionID) ORDER BY [TimeOfTrans] DESC">
            <SelectParameters>
                <asp:SessionParameter SessionField="collectionhold" Name="CollectionID" Type="String"></asp:SessionParameter>

            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:kpolomDUMMYConnectionString %>' SelectCommand="SELECT * FROM [Collection_Log] INNER JOIN Donor_Details ON Collection_Log.TransID= Donor_Details.TransID WHERE (Collection_Log.[CollectionID] = @CollectionID) ORDER BY [TimeOfTrans] DESC">
            <SelectParameters>
                <asp:SessionParameter SessionField="collectionhold" Name="CollectionID"></asp:SessionParameter>
            </SelectParameters>
        </asp:SqlDataSource>
                          
                    
                      </div>
                  </div>
                 
                 </div>
            </div>

            <div class="row">
<div class="col-md">
    <div class="card shadow-sm mb-3">
                      <div class="card-header  backgroundawesomeblue">
                            <h6>Payment Ledger: <span  class="badge  badge-light colorawesomblue"><i class="fa fa-user-circle"></i> <span id="countmembers" runat="server"></span></span></h6>
                      </div>
                      <div class="card-body">
                          <div class="row  d-sm-none  d-lg-none">
                                 <div class="col-sm-8">
             <span class="small"><i class="fa fa-arrow-left"></i> Swipe left to see more</span>
         </div>
                              </div>
                          <div class="table-responsive">
                              
                         
                       

                              <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="userID" DataSourceID="SqlDataSource4" CssClass="table small" HeaderStyle-CssClass="" GridLines="None" AllowPaging="true" PageSize="10" BackColor="" EmptyDataText="No participants have been added" RowStyle-BorderColor="#0066ff" ><%--#f8fafb--%>
                                  <Columns>
        <%--                              <asp:BoundField DataField="userID" HeaderText="userID" ReadOnly="True" SortExpression="userID"></asp:BoundField>
                                      <asp:BoundField DataField="DuesID" HeaderText="DuesID" SortExpression="DuesID"></asp:BoundField>--%>
                           <%--           <asp:BoundField DataField="Firstname" HeaderText="Firstname" SortExpression="Firstname"></asp:BoundField>
                                      <asp:BoundField DataField="Lastname" HeaderText="Lastname" SortExpression="Lastname"></asp:BoundField>--%>
                    <%--                  <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber"></asp:BoundField>
                                      <asp:BoundField DataField="EmailAdd" HeaderText="EmailAdd" SortExpression="EmailAdd"></asp:BoundField>
                                      <asp:BoundField DataField="CreatedDate" HeaderText="CreatedDate" SortExpression="CreatedDate"></asp:BoundField>--%>
                                 <asp:TemplateField ControlStyle-Width="">
                                     <HeaderTemplate>
                                         Participants
                                     </HeaderTemplate>
                                     <ItemTemplate >
                                            
                                         <div class="card w-100  " >
                                             <div class="card-body">
                                                   
                                                 <b class="card-text text-uppercase mb-0  text-nowrap colorme"><%# Eval("Firstname").ToString & " " & Eval("Lastname").ToString  %></b><br />
                                          <div class="row">
                                              <div class="  col-md-6">
                                                   <small class="text-muted text-uppercase mb-0">Total Paid</small><br />
                                                 <p id="counter" runat="server" class="mb-0 font-weight-bold " >₦0</p>
                                              </div>
                                              <div class=" col-md-6">
                                                  <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-sm custombtn-outline small btn-block mt-lg-2 mt-3  text-nowrap font-weight-light"  CommandName="Redirect">Pay Now <i class="fa  fa-angle-double-right"></i></asp:LinkButton>
                                              </div>
                                          </div>
                                                 </div>
                                         </div>
                               <span id="userID" runat="server" class="invisible m-0 p-0"><%# Eval("userID").ToString %></span>
                                            <span id="UserEmail" runat="server" class="invisible m-0 p-0"><%# Eval("EmailAdd").ToString %></span>
                                     </ItemTemplate>
                                 </asp:TemplateField>
                                      </Columns>

                              </asp:GridView>
                              <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString='<%$ ConnectionStrings:kpolomDUMMYConnectionString %>' SelectCommand="SELECT * FROM [Dues_Participants] WHERE ([DuesID] = @DuesID) ORDER BY CreatedDate DESC">
                                  <SelectParameters>
                                      <asp:SessionParameter SessionField="collectionhold" Name="DuesID" Type="String"></asp:SessionParameter>
                                  </SelectParameters>
                              </asp:SqlDataSource>
                          </div>
                    
                      </div>
                  </div>
</div>
            </div>
            </div>
        <section id="footer" class="greybackground">
            <div class="container-fluid">
                
                <div class="row">
                    <div class="col-sm-12 col-md-12 col-lg-12"><p class="text-center">
                The site is owned and operated by Fourthman Notions Network Limited – owners of KPOLOM - a company registered in Nigeria.<br />      © Copyright 2022-2023 Kpolom. All rights reserved. <a href="terms.aspx">Terms</a>
                                           </p></div>
                </div>
            </div>
        </section>
        <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title text-center" id="staticBackdropLabel"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body ">
        <div class="card">
                                                  
<div class="card-body ">
 
  <h3>Help by Sharing</h3>
    <p class="text-muted">Collections that are shared on social media raise more money</p>

        <ul class="list-group list-group-flush">
            <li class="list-group-item">
                <a href="#" onclick="share();updateme();"><i class=" fab fa-facebook-square  "></i> Facebook</a>
               
            </li>
            <li class="list-group-item">
               <a href="#"  onclick="sharetwitter();updateme();"><i class="  fab  fa-twitter-square  "></i> Twitter</a>
            </li>
               <li class="list-group-item">
               

              <%-- <a href="https://wa.me/?text=Awesome%20Blog!%5Cn%20blog.shahednasser.com" ><i class="  fa   fa-whatsapp  "></i> WhatsApp</a>--%>
                <%--   https://wa.me/?text=Awesome%20Blog!%5Cn%20blog.shahednasser.com--%>
                   <a href="#" onclick="sharewhatsapp();updateme();"><i class="  fab   fa-whatsapp  "></i> Share on Whatsapp</a>
            </li>
             <li class="list-group-item">
             
          <div class="input-group">
              <input id="Text1" type="text" class="form-control" runat="server" /><div class="input-group-append">
                  <button  class="btn btn-sm btn-success" onclick="copyclip();updateme();"><i class="fa fa-clipboard"></i> Copy Link</button>
                                              </div>
          </div>

                  
                 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                     <ContentTemplate>
 <asp:Button ID="Button2" runat="server" Text="Button" CssClass="invisible" />
                     </ContentTemplate>
                 </asp:UpdatePanel>
            </li>
        </ul>      
    <br />
                              

          
          
              
                                       
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
        <div class="modal fade" id="staticBackdrop2" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h6 class="modal-title text-center" id="staticBackdropLabel2">Add Member</h6>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body ">
        <div class="card">
          <div class="card-header  backgroundawesomeblue">
                <h6 class="text-white  mylinotte">Enter Member Details</h6>
          </div>                                        
<div class="card-body ">
 

   <%-- <p class="text-muted">Collections that are shared on social media raise more money</p>--%>
    <div class="form-group">
        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Placeholder="Enter Firstname"  MaxLength="20"></asp:TextBox>
    </div>
   
             <div class="form-group">
        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Placeholder="Enter Lastname"  MaxLength="20"></asp:TextBox>
    </div>                 

          <div class="form-group">
        <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" Placeholder="Enter PhoneNumber" TextMode="Phone"  MaxLength="15"></asp:TextBox>
    </div>
        <div class="form-group">
        <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" Placeholder="Enter Email Address" TextMode="Email" MaxLength="50"></asp:TextBox>
    </div>
          
              
                                       
</div>
                                                </div>
      </div>
      <div class="modal-footer">
          <asp:Button ID="Button3" runat="server" Text="Add"  CssClass="btn  custombtn-outline"/>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
         
       <%-- <button type="button" class="btn btn-primary">Understood</button>--%>
      </div>
    </div>
  </div>
</div>
        <script type="text/javascript">
        function copyclip() {
            var copytext = document.getElementById("Text1");
            copytext.select();
            copytext.setSelectionRange(0, 99999);
            document.execCommand("copy");
            alert('Link has been copied.');

        }
    </script>
        <script type="text/javascript">
            share = function () {
                url = 'http://www.facebook.com/sharer/sharer.php?u=' + window.location.href;
                options = 'toolbar=0,status=0,resizable=1,width=626,height=436';
                window.open(url, 'sharer', options);
            }
         
            function sharewhatsapp() {
                var topic = document.getElementById('<%=Label4.ClientID%>').innerText;
                var url = 'https://wa.me/?text=Hello,could%20you%20help%20share%20or%20donate%20to%20this%20collection.%20' + topic +'.%20To%20know%20more%20visit%20'+ window.location.href;
              window.open(url);
            }
            function sharetwitter() {
                var url = 'https://twitter.com/intent/tweet?text=' + window.location.href;
                window.open(url);
            };
        </script>
        <script>
            $(document).ready(function () {
                var maxLength = 230;
                $(".show-read-more1").each(function () {
                    var myStr = $(this).text();
                    if ($.trim(myStr).length > maxLength) {
                        var newStr = myStr.substring(0, maxLength);
                        var removedStr = myStr.substring(maxLength, $.trim(myStr).length);
                        $(this).empty().html(newStr);

                        $(this).append('<a href="javascript:void(0);" class="read-more1 btn btn-outline-primary btn-sm">read more...</a>');
                        $(this).append('<span class="more-text1" style="color:red;">' + removedStr + '</span>');
                    }
                });
                $(".read-more1").click(function () {
                    $(this).siblings(".more-text1").contents().unwrap();
                    $(this).remove();
                });
            });
        </script>
             <script>
                 function updateme() {
                     //PageMethods.UpdateShareCount(collectionidhold,OnSuccessMethod)
                     document.getElementById('<%=Button2.ClientID%>').click();
                 }
             </script>
    </form>
</body>
</html>
