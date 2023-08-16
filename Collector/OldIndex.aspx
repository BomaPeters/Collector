<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="OldIndex.aspx.vb" Inherits="Collector.OldIndex" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>COLLECTOR</title>
    <!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-H8CLYGHRYC"></script>
<script>
    window.dataLayer = window.dataLayer || [];
    function gtag() { dataLayer.push(arguments); }
    gtag('js', new Date());

    gtag('config', 'G-H8CLYGHRYC');
</script>
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
            font-family:'myowner';
            src:url(fonts/penna.otf);
        }
        @font-face {
             font-family:'LeagueGothic';
            src:url(fonts/LeagueGothic-CondensedRegular.otf);
        }
        @font-face { font-family:'Choplin';
            src:url(fonts/Choplin-ExtraLight-DEMO.otf);
        }
          @font-face { font-family:'ChoplinMedium';
            src:url(fonts/Choplin-Medium-DEMO.otf);
        }
        @font-face {
             font-family:'Audrey-Bold';
            src:url(fonts/Audrey-Bold.otf);
        }
         @font-face {
              font-family:'Zefani';
            src:url(fonts/ZefaniStencilRegular.otf);
           
        }
          @font-face {
               font-family:'Linotte';
            src:url(fonts/Linotte-SemiBold.otf);
           
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
                   .bordercoloryellow {
            border-color: #EBC23E
        }
           .bordercolorblue {
            border-color: #247391
        }
             .companybluecolor {
            color: #247391
        }
                 .yellowback { background-color:#FEC50B;
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
                    .update
{
position: fixed;
top: 0px;
left: 0px;
min-height: 100%;
min-width: 100%;
background-image: url("img/loading (1).gif");
background-position:center center;
background-repeat:no-repeat;
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
             #homepage { height:auto; padding-top:100px;
    padding-bottom:50px;
        }
               #aboutus {
            background-color:#FFFFFF;
            height:auto; padding-top:110px;
    padding-bottom:50px;
        }
                #fees {
            background-color:#1CADE4;height:auto; padding-top:110px;
    padding-bottom:50px;
        }
                #howitworks{
                    padding-top:110px;
                        padding-bottom:50px;
                }
                #contactus {
            /*background-color:#FFFFFF;*/
            height:auto; padding-top:110px;
    padding-bottom:50px;
        }
                 #donations {
            background-color:#FEC50B;
            height:auto; padding-top:110px;
    padding-bottom:50px;
        }

                .navbar-default .navbar-nav>li>a {
    color:white;/*font: bold 25px ;*/
    font-family:'Linotte';
    font-size:25px;
    font-weight:bold;
   

}
        .navbar-brand {
               font-family:'Linotte';
    font-size:25px;
    font-weight:bold; color: #1CADE4 !important;
        }
         .backyellow { background-color:#F7BD2F;background-image:url('img/bg_yellow_1.png') ; /*background-size:cover;
                        background-attachment: fixed;
 background-position: center;
 background-repeat: no-repeat;*/
        }
           .mynewbackground{
        background-image:url('img/bg_yellow_1.png');border-color: transparent !important;
    }
          .navbar-custom .nav-item.active .nav-link,
        .navbar-custom .nav-item:hover .nav-link {
            color: white;
    background-color: black !important;
   
    border-radius:7px;
    font-size: large;
            font-weight: bold;
        }
       .navbar-custom .navbar-nav .nav-link {
          
             font-family:'Linotte';
    font-size: large;
    font-weight:bold;
    color:   #1CADE4;
        }
         .colorawesom {color:#FEC50B !important;
        }
        .colorawesomblue { color:#1CADE4 !important;
        }
        .backgroundawesomeblue{ background-color:#1CADE4 !important; border-radius:5px; color:white;}
        .backcolorblue{ background-color:#1CADE4 !important;}
            .mychopplinfont{
                  font-family:'Choplin'
             }
            .mylinottefont{
                font-family: 'Linotte';
            }
             .greybackground{
                  background-color:#FAFAFA;
             }
                   @media ( min-width: 320px) {
            .ellipse {
            width: 100px;
    height: 20px;
    margin-top:17%;
    margin-left:33%;
    border-radius: 50%;
    background:white;
   
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

          
           .h1title{
     font-family:'Audrey-Bold';font-size:20vw; color:  white;
 }
                    .header2{
     font-family:'Choplin';font-size:14vw;
 }
                      .header2inner{
    font-family:'Linotte'; font-size:21.5625vw; color:white;
}
                       .h2title {
 font-family:'Linotte';font-size:10vw; /*20vw*/
        }
                        .bevposition{margin-top:10%; margin-left:24%;}
                         .h3title {font-family:'myowner';font-size:10.0625vw;font-weight:bold;
        }
                          .h5title {font-family:'myowner';font-size:12.0625vw;font-weight:bold;
        }
                          .backgroundHolder{
         width:100%; height:auto;background-image:url('img/kpolomcaseX.png'); background-repeat:no-repeat; background-size: auto; padding-bottom:0; background-position:center
     }
     }
          @media ( min-width: 480px) {
            .ellipse {
            width: 100px;
    height: 20px;
    margin-top:10%;
    margin-left:43%;
    border-radius: 50%;
    background:white;
   
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
             .h1title{
     font-family:'Audrey-Bold';font-size:13.333333333333334vw; color: white;
 }
              .header2{
     font-family:'Choplin';font-size:6.5vw; /*12.5vw*/
 }
              .header2inner{
    font-family:'Linotte'; font-size:14.375vw; color:white;
}
               .h2title {
 font-family:'Linotte';font-size:13.333333333333334vw
        }
                .bevposition{ margin-top:2%; margin-left:35%} /*39.5%*/
     }
           .h3title {font-family:'myowner';font-size:9.375vw;font-weight:bold;
        }
            .h5title {font-family:'myowner';font-size:6.375vw;font-weight:bold;
        }
            .backgroundHolder{
         width:100%; height:auto;background-image:url('img/kpolomcaseX.png'); background-repeat:no-repeat; background-size: auto; padding-bottom:0; background-position:center
     }

         @media ( min-width: 1200px) {
             .ellipse {
            width: 100px;
    height: 20px;
    /*margin: 2px auto 0;*/
    margin-top:4px;
    margin-left:10%;
    border-radius: 50%;
    background:white;
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
       
  .stackreposition {margin-left: 0% !important;
            }

   .h1title{
     font-family:'Audrey-Bold';font-size:5.333333333333333vw; color: white;
 }
    .header2{
     font-family:'Choplin';font-size:5vw; 
 }
    .header2inner{
    font-family:'Linotte'; font-size:5.75vw; color:white;
}
     .h2title {
 font-family:'Linotte';font-size:3.333333333333333vw
        }
                     .bevposition{ margin-top:15%; margin-left:4%;}
      .h3title {font-family:'myowner';font-size:3.25vw;font-weight:bold;
        }
       .h5title {font-family:'myowner';font-size:2.25vw;font-weight:bold;
        }
       .backgroundHolder{
         width:100%; height:auto;background-image:url('img/kpolomcaseX.png'); background-repeat:no-repeat; background-size: auto; padding-bottom:0;background-position:left;
     }
  }
         .imgresizer{ width:200px !important; height: auto !important;}
.active1{  color: white !important;
    background-color: black !important;
   
    border-radius:7px;
    font-size: large;
            font-weight: bold;}
.activeblue{  color: white !important;
    background-color: #1CADE4 !important;
   
    border-radius:7px;
    font-size: large;
            font-weight: bold;}
.activeblue a{  color: white !important;
    }
 .underline {width:10% !important; margin-top:-15px !important; margin-bottom:15px !important; border-top:5px solid #1CADE4 !important;
        }
           .underlinewhite {width:10% !important; margin-top:-15px !important; margin-bottom:15px !important; border-top:5px solid #fff !important;
        }
              #footer {height:auto;padding-top:10px;
    padding-bottom:10px;
        }
              html {
            /*For smooth scrolling behavior*/
            scroll-behavior: smooth;
        }
              .nohoverlink{
                  text-decoration:none !important;
                  color: black !important;
              }
               .nohoverlink :hover{
                  text-decoration:none !important;
                  color: black !important;
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
         .myrightmargin{
           margin-right:0% !important;
       }
          @media (min-width: 992px){
                .myrightmargin{
           margin-right:17% !important;
       }
          }
         .btncustomoutline{
                 color: #fff;
    border-color: #fff;
         }
          .btncustomoutline:hover{
                 color: #1CADE4 !important;
    border-color: #fff;
    background-color:#fff !important;
         } /* hide close when burger shown */
  
   .navbar-toggler.collapsed .close-icon {
    display: none;
}

.navbar-toggler:not(.collapsed) .navbar-toggler-icon {
    display: inline;
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

/*.text-truncate-container {
   
}*/
.text-truncate-container  {
    /* width: 250px;*/
    -webkit-line-clamp: 2;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
}
.thumb
{
   /* max-height:370px !important;*/ /*max-width:560px;*/
   width: 100%;
height:40vh;
object-fit: cover;
}
  .cardwidthsetter {
            min-width: 300px !important;
        }
@media (max-width: 768px) {
    .carousel-inner .carousel-item > div {
        display: none;
    }
    .carousel-inner .carousel-item > div:first-child {
        display: block;
    }
}

.carousel-inner .carousel-item.active,
.carousel-inner .carousel-item-next,
.carousel-inner .carousel-item-prev {
    display: flex;
}

/* display 3 */
@media (min-width: 768px) {
    
    .carousel-inner .carousel-item-right.active,
    .carousel-inner .carousel-item-next {
      transform: translateX(33.333%);
    }
    
    .carousel-inner .carousel-item-left.active, 
    .carousel-inner .carousel-item-prev {
      transform: translateX(-33.333%);
    }
}

.carousel-inner .carousel-item-right,
.carousel-inner .carousel-item-left{ 
  transform: translateX(0);
}
/*.card-img-top {

}*/
    </style>
</head>
<body class="greybackground">
    <form id="form1" runat="server">
       <div class="container ">
            <nav  class="navbar navbar-expand-lg navbar-light     greybackground    rounded  navbar-custom  fixed-top " style="border-color: transparent !important">
                    <a class="navbar-brand  ml-8-lg pl-lg-5  " href="index.aspx">
                        <img src="img/kpolomCOLLECTOR.png" style="width: auto; height: 50px;" class="  colorawesomblue" />COLLECTOR </a>
                    <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                       <div class="close-icon py-1">✖</div>
                    </button>

                    <div class="collapse navbar-collapse     " id="navbarSupportedContent">
                        
                        <%--mr-4--%>
                        <ul class="navbar-nav  ml-auto  mr-lg-4     text-center   ">
                            <li class="nav-item px-2">
                                <a class="nav-link  pl-2 " href="#homepage">home</a>
                            </li>
                            <li class="nav-item px-2">
                                <a class="nav-link pl-2" href="#aboutus">about</a>
                            </li>
                            <li class="nav-item px-2">
                                <a class="nav-link pl-2 " href="#fees">FAQs</a>
                            </li>
                         
                           <%--  <li class="nav-item px-2">
                                <a class="nav-link pl-2  " href="#fees" id="linker3">fees</a>
                  
                            </li>--%>
                           <%--  <li class="nav-item px-2">
                                <a class="nav-link page-scroller " href="Login.aspx" id="linjjj">FAQs</a>
                  
                            </li>--%>
                            
                                 <li class="nav-item px-2">
                                <a class="nav-link page-scroller  " href="signin.aspx" id="lin">sign in <i class="fa  fa-lock"></i></a>
                  
                            </li>
                        </ul>
                          <div class="d-flex myrightmargin ">
        <a class="btn   btncusblue btn-block "  href="signup.aspx">Start a Collection <i class="fa  fa-angle-double-up"></i></a>
                             
      </div>


                    </div>
                </nav>
        </div>

              <div id="homepage"  class="page-section greybackground  " >

        <div  class="container ">
           
    <div class="row">
        <div class="   col-lg-7"><%--<br /><br />--%>
         
 <h2 class=" header2 colorawesomblue">Collect dues,raise funds to support your beloved causes.</h2>
            <span class="h4  text-justify " style="font-family: 'Linotte';">
               We empower individuals,communities or organisations raise funds and collect membership dues online efficiently.
               <%-- <span class="badge badge-dark">0706 308 3344</span> to get started.--%>
            </span><br />
       <div class="row mt-2">
           <div class="  col-md-5 mb-2">
                   <a class="btn  btncusblue  btn-block  text-white" href="signup.aspx">Start a Collection <i class="fa fa-angle-double-up "></i></a>
           </div>
           <div class=" col-md-5">
               <a href="signin.aspx" class="btn  custombtn-outline btn-block">Sign In <i class="fa  fa-lock"></i></a>
           </div>
       </div>
        </div>
        <div class="   col-lg-5"  >
    
               <img src="img/04.-Helping-SomeoneCOPY.png" class="img-fluid mt-lg-4 " />
          <%--   <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
<lottie-player src="https://assets3.lottiefiles.com/packages/lf20_jm1zwwig.json"  background="transparent"  speed="1"  style="width: auto; height: 100%;"  loop  autoplay></lottie-player>
       <a href="lottifiles/deliverybike.json"></a>--%>
             
     
       
    </div>
<br /><br /><br /><br /><br />
    </div>
    </div>
       </div>

         <section id="aboutus"  class="page-section" >
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h2 class="h2title  text-left" >About Us</h2>
                     <hr class="underline" align="left" />
                    </div>
                </div>
               <div class="row">
<div class="col-lg-7">
     <p class="mychopplinfont text-justify">
  The Collector is a free-to-use online donation tool that lets you set up your own  collection page in minutes, which you can use to raise donations as an act of kindness on behalf of people or occasions you care about.
         Collections created can be shared with friends and family via social media to create more awareness concerning that cause.
    </p>
    <p class="mychopplinfont text-justify">
   Funds collected will go directly to the beneficiary account stated at the expiration of the collection.We are simply the bridge between individuals seeking to support their community, neighborhood or an event and donors willing to assist them.
    </p>
  
   
</div>
                   <div class="col-lg-5" >
               <img src="img/23.-Scaling-MountainCOPY.png" class="img-fluid" />
               <%--   <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
<lottie-player src="lottifiles/homedelivery.json"  background="transparent"  speed="1"   style="width: auto; height: 400px; "   loop autoplay  ></lottie-player>
                     --%>
                      
                   </div>
               </div>

                   
            </div>
        </section>
        <section id="howitworks">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h2 class="h2title text-left" >How it works</h2>
                     <hr class="underline" align="left" />
                       
                    </div>
                </div>
                <div class="row  " >
                    <div class="col-md-4">
                        <div class="card shadow h-100">
                            <div class="card-body text-justify mychopplinfont">
                                <b class="  colorawesomblue"><i class="fa fa-handshake mr-2   colorawesomblue"></i> 1.Create Collection</b>
                                <ul class="   fa-ul" style="">
                                        <li><span class="fa-li fa   fa-check-circle colorawesomblue "></span>Add a title as the purpose of collection.</li>
                                    <li><span class="fa-li fa   fa-check-circle colorawesomblue "></span>Select a collection category.</li>
                                    <li><span class="fa-li fa   fa-check-circle colorawesomblue "></span>Add a photo that showcases the person or event.</li>
                                  <li><span class="fa-li fa   fa-check-circle colorawesomblue "></span>
                                        Set your financial goal.
                                    </li>
                         <%--           <li><span class="fa-li fa   fa-check-circle colorawesomblue "></span>Add a title as the purpose of collection that is specific to your cause.For e.g 'Help John Walk Again'.</li>
                                    <li><span class="fa-li fa   fa-check-circle colorawesomblue "></span>Select a collection category that seems closest to your current situation.</li>
                                    <li><span class="fa-li fa   fa-check-circle colorawesomblue "></span>Use a photo that showcases the person or event that you are raising funds for.</li>
                                    <li><span class="fa-li fa   fa-check-circle colorawesomblue "></span>Enter the recipients account details.Bear in mind that proceeds from donations will be paid directly into the recipients account 
                                        and the account name of the recipient will be displayed in the 'collecting for' field on the collection page.
                                    </li>
                                    <li><span class="fa-li fa   fa-check-circle colorawesomblue "></span>
                                        Set your financial goal.Your goal amount should reflect how much you are planning to raise.
                                    </li>
                                     <li><span class="fa-li fa   fa-check-circle colorawesomblue "></span>
                                        Tell people why they should donate.A great story should be open,descriptive and include a bit about who you are,what you're raising funds for and how the money will be spent.If you're raising funds for someone else(a beneficiary),it is a good idea to share how you know them.
                                    </li>--%>
                                </ul>
                            </div>
                            <div class="card-footer  backcolorblue">
                                <i class="fa fa-arrow-alt-circle-right   fa-inverse fa-2x  d-none d-sm-block	"></i>
                                    <i class="fa  fa-arrow-alt-circle-down   fa-inverse fa-2x  d-block d-sm-none "></i>
                            </div>
                        </div>
                        </div>
                    <div class="col-md-4">
                        <div class="card shadow h-100">
                            <div class="card-body mychopplinfont">
                                <b class=" colorawesomblue"><i class="fa  fa-user-friends mr-2"></i> 2.Share with friends</b>
                                <ul class="fa-ul">
                                    <li><span class="fa-li fa   fa-check-circle colorawesomblue "></span> Share via Facebook,Twitter and Whatsapp.</li>
                                    <li><span class="fa-li fa   fa-check-circle colorawesomblue "></span>Share via email.</li>
                                    <li><span class="fa-li fa   fa-check-circle colorawesomblue "></span>Share with family and your community.</li>
                                 
                             
                                </ul>

<%--                                     <b class=" colorawesomblue mt-lg-3"><i class="fa  fa-balance-scale mr-2"></i> 3.Manage Donations.</b>
                                <ul class="fa-ul">
                                    <li><span class="fa-li fa   fa-check-circle colorawesomblue "></span> Accept donations.</li>
                                    <li><span class="fa-li fa   fa-check-circle colorawesomblue "></span>Reachout and thank donors.</li>
                                    <li><span class="fa-li fa   fa-check-circle colorawesomblue "></span>Withdraw funds at the  expiration or end of the collection.</li>
                                 
                            
                                </ul>--%>
                            </div>
                             <div class="card-footer  backcolorblue">
                                  <i class="fa fa-arrow-alt-circle-right   fa-inverse fa-2x  d-none d-sm-block	"></i>
                                    <i class="fa  fa-arrow-alt-circle-down   fa-inverse fa-2x  d-block d-sm-none "></i>
                               <%-- <i class="fa fa-arrow-alt-circle-right fa-inverse fa-2x"></i>--%>
                            </div>
                        </div>
                        </div>
                    <div class="col-md-4">
                        <div class="card shadow h-100">
                            <div class="card-body mychopplinfont">
                              

                                     <b class=" colorawesomblue mt-lg-3"><i class="fa  fa-balance-scale mr-2"></i> 3.Manage Donations.</b>
                                <ul class="fa-ul">
                                    <li><span class="fa-li fa   fa-check-circle colorawesomblue "></span> Accept donations.</li>
                                    <li><span class="fa-li fa   fa-check-circle colorawesomblue "></span>Reachout and thank donors.</li>
                                    <li><span class="fa-li fa   fa-check-circle colorawesomblue "></span>Withdraw funds at the  expiration or end of the collection.</li>
                                 
                            
                                </ul>
                            </div>
                             <div class="card-footer  backcolorblue">
                                  <i class="fa fa-arrow-alt-circle-right   fa-inverse fa-2x  d-none d-sm-block	"></i>
                                    <i class="fa  fa-arrow-alt-circle-down   fa-inverse fa-2x  d-block d-sm-none "></i>
                                <%--<i class="fa fa-arrow-alt-circle-right fa-inverse fa-2x"></i>--%>
                            </div>
                        </div>
                        </div>
                  
                    </div>
            </div>
        
        </section>
        <section id="fees" class="page-section pb-4 ">
            <div class="container mb-4 ">
                <div class=" row">
                    <div class="col-lg-12">
                        <h2 class="h2title  text-start " style="color:white;" >FAQs</h2>
                     <hr class="underlinewhite" align="left" />
                  
                        
                    </div>
                </div>
                
                 <div class="row">
   <div class=" col-md-7">
    <%--   col-sm-9 col-md-9 col-lg-7 mx-auto--%>
         <!--Accordion wrapper-->

<div class="accordion md-accordion" id="accordionEx" role="tablist" aria-multiselectable="true">



  <!-- Accordion card -->
  
  <!-- Accordion card -->


            <div class="card">
               
    <div class="card-header bg-white border-bottom border-primary" role="tab" id="headingOne1">
      <a   data-toggle="collapse" data-parent="#accordionEx" href="#collapseOne1" aria-expanded="true"
        aria-controls="collapseOne1" class="nohoverlink">
        <h5 class="mb-0    mylinottefont   "><i class="fa  fa-angle-double-right colorawesomblue"></i> How much does it cost to start a collection? 
        </h5>
      </a>
    </div>

    <!-- Card body -->
    <div id="collapseOne1" class="collapse " role="tabpanel" aria-labelledby="headingOne1" data-parent="#accordionEx">
      <div class="card-body ">
       <nav class="nav flex-column ">
<p>
    It is absolutely <span class=" badge badge-primary">FREE</span> to start a collection,however you will be required to create an account to begin.
</p>

           
</nav>
       
      </div>
    </div>

                <div class="card-header " role="tab" id="headingOne2">
      <a   data-toggle="collapse" data-parent="#accordionEx" href="#collapseOne2" aria-expanded="true"
        aria-controls="collapseOne2" class="nohoverlink">
        <h5 class="mb-0    mylinottefont "><i class="fa  fa-angle-double-right colorawesomblue"></i> <span>
            After a successful collection round, who is the donation paid to?
                                                                                                     </span>
        </h5>
      </a>
    </div>

    <!-- Card body -->
    <div id="collapseOne2" class="collapse " role="tabpanel" aria-labelledby="headingOne2" data-parent="#accordionEx">
      <div class="card-body  ">
       <nav class="nav flex-column  ">
 
 
<p>
    After a successful collection round, the funds donated are paid into the <span class="badge badge-primary">beneficiary account</span> stated when the collection was created.
</p>
           
</nav>
       
      </div>
    </div>


                <div class="card-header" role="tab" id="headingOne3">
      <a   data-toggle="collapse" data-parent="#accordionEx" href="#collapseOne3" aria-expanded="true"
        aria-controls="collapseOne3" class="nohoverlink">
        <h5 class="mb-0  mylinottefont"><i class="fa  fa-angle-double-right colorawesomblue"></i> What happens when the due date of a collection has expired? 
        </h5>
      </a>
    </div>

    <!-- Card body -->
    <div id="collapseOne3" class="collapse " role="tabpanel" aria-labelledby="headingOne3" data-parent="#accordionEx">
      <div class="card-body  ">
       <nav class="nav flex-column  ">
 
 
<p>
   When the due date of a collection has been exceeded, people will no longer be able to support the collection by donating because the <span class="badge badge-primary">DONATE</span> button will be disabled.
</p>
           
</nav>
       
      </div>
    </div>

              

                <div class="card-header" role="tab" id="headingOne5">
      <a   data-toggle="collapse" data-parent="#accordionEx" href="#collapseOne5" aria-expanded="true"
        aria-controls="collapseOne5" class="nohoverlink">
        <h5 class="mb-0  mylinottefont  "><i class="fa  fa-angle-double-right colorawesomblue"></i> How long does it take for the funds collected to reflect in a beneficiary account? 
        </h5>
      </a>
    </div>

    <!-- Card body -->
    <div id="collapseOne5" class="collapse " role="tabpanel" aria-labelledby="headingOne5" data-parent="#accordionEx">
      <div class="card-body  ">
       <nav class="nav flex-column  ">
 
 <p>
     It usually takes between 12 to 36 hours during work days and can take up to 48 hours during weekends.
 </p>    
</nav>
       
      </div>
    </div>
                  <div class="card-header" role="tab" id="headingOne4">
      <a   data-toggle="collapse" data-parent="#accordionEx" href="#collapseOne4" aria-expanded="true"
        aria-controls="collapseOne4" class="nohoverlink">
        <h5 class="mb-0   mylinottefont"><i class="fa  fa-angle-double-right colorawesomblue"></i> Can a beneficiary account be changed during or after a collection? 
        </h5>
      </a>
    </div>

    <!-- Card body -->
    <div id="collapseOne4" class="collapse " role="tabpanel" aria-labelledby="headingOne4" data-parent="#accordionEx">
      <div class="card-body  ">
       <nav class="nav flex-column  ">
 
 <p>
     A beneficiary account <span class="badge badge-primary">cannot</span> be changed after a collection has been created.
 </p>
           
</nav>
       
      </div>
    </div>

                <div class="card-header" role="tab" id="headingOne6">
      <a   data-toggle="collapse" data-parent="#accordionEx" href="#collapseOne6" aria-expanded="true"
        aria-controls="collapseOne6" class="nohoverlink">
        <h5 class="mb-0   mylinottefont ">  <i class="fa  fa-angle-double-right  colorawesomblue"></i>
Can my collection round be suspended?

        </h5>
      </a>
    </div>

    <!-- Card body -->
    <div id="collapseOne6" class="collapse " role="tabpanel" aria-labelledby="headingOne6" data-parent="#accordionEx">
      <div class="card-body  ">
       <nav class="nav flex-column  ">
 
<p>
    Collection rounds that contain content that are malicious, promiscuous, misleading or seeking for ransom will be suspended and the funds returned to the donors.
</p>
           
</nav>
       
      </div>
    </div>

                <div class="card-header" role="tab" id="headingOne7">
      <a   data-toggle="collapse" data-parent="#accordionEx" href="#collapseOne7" aria-expanded="true"
        aria-controls="collapseOne7" class="nohoverlink">
        <h5 class="mb-0  mylinottefont "><i class="fa  fa-angle-double-right colorawesomblue"></i> What happens if I exceed the financial goal set in my collection round? 
        </h5>
      </a>
    </div>

    <!-- Card body -->
    <div id="collapseOne7" class="collapse " role="tabpanel" aria-labelledby="headingOne7" data-parent="#accordionEx">
      <div class="card-body  ">
       <nav class="nav flex-column  ">
 
 
<p>
    If you exceed the financial goal set in your collection round, the collection round will still be active until the due date has been exceeded or the round cashed-out.
</p>
           
</nav>
       
      </div>
    </div>

                <div class="card-header" role="tab" id="headingOne8">
      <a   data-toggle="collapse" data-parent="#accordionEx" href="#collapseOne8" aria-expanded="true"
        aria-controls="collapseOne8" class=" nohoverlink">
        <h5 class="mb-0   mylinottefont "><i class="fa  fa-angle-double-right colorawesomblue"></i> When does a collection round end? 
        </h5>
      </a>
    </div>

    <!-- Card body -->
    <div id="collapseOne8" class="collapse " role="tabpanel" aria-labelledby="headingOne1" data-parent="#accordionEx">
      <div class="card-body  greybackground">
       <nav class="nav flex-column   ">
 
 
<p>
A collection round ends either when the due date has been exceeded or the total donation so far has been cashed-out by the collection creator.
</p>
           
</nav>
       
      </div>
    </div>
  </div>

</div>
<!-- Accordion wrapper -->

         <a class="btn btncustomoutline btn-block  mt-3 font-weight-bold " href="signup.aspx">Start a Collection <i class="fa fa-angle-double-up "></i></a>
 
       
   
   
   </div>
    <div class="col-md-5">
        <img src="img/animation_500_l3gduzcrNEW.gif" class="img-fluid " />
    </div>
  </div>

                <br />
                <br />
                <br />
                </div>
            </section>
        
        <section id="contactus" class="pb-4">
            <div class="container mb-4">
                 <div class="row">
                    <div class="col-lg-12">
                        <h2 class="h2title text-left" >Raise funds for</h2>
                     <hr class="underline" align="left" />
                        <%-- <h6 class="mychopplinfont  text-justify mb-2 mt-1">
                         
                            You can join or create a contribution and let us help you manage the collections and payment process without stress.
                           Your wallet can be credited via bank transfer, card payments or from any of our agent banking centres.
                             
                        </h6>--%>
                    </div>
                </div>
                <div class="row row-cols-2  " >
                    <div class="col-md-4">
                        <p class="  text-center"> 
                                      <span class="  fa-stack fa-3x">
                                                      <i class="fa fa-circle fa-stack-2x colorawesomblue"></i>
                                                      <i class=" fa fa-clinic-medical  fa-stack-1x fa-inverse"></i>
                                                  </span><br /> <b class="mychopplinfont" >Medical</b></p>
                    </div>
                    <div class="col-md-4">
                        <p class="  text-center"> 
                                      <span class="  fa-stack fa-3x">
                                                      <i class="fa fa-circle fa-stack-2x colorawesomblue"></i>
                                                      <i class=" fa  fa-hourglass-half fa-stack-1x fa-inverse"></i>
                                                  </span><br /> <b class="mychopplinfont" >Emergency</b></p>
                    </div>
                    <div class=" col-md-4">
                        <p class="  text-center"> 
                                      <span class="  fa-stack fa-3x">
                                                      <i class="fa fa-circle fa-stack-2x colorawesomblue"></i>
                                                      <i class=" fa  fa-user-graduate fa-stack-1x fa-inverse"></i>
                                                  </span><br /> <b  class="mychopplinfont">Education</b></p>
                    </div>
                      <div class="col-md-4">
                        <p class="  text-center"> 
                                      <span class="  fa-stack fa-3x">
                                                      <i class="fa fa-circle fa-stack-2x colorawesomblue"></i>
                                                      <i class=" fa fa-synagogue fa-stack-1x fa-inverse"></i>
                                                  </span><br /> <b class="mychopplinfont" >Religious Purpose</b></p>
                    </div>
                    <div class="col-md-4">
                        <p class="  text-center"> 
                                      <span class="  fa-stack fa-3x">
                                                      <i class="fa fa-circle fa-stack-2x colorawesomblue"></i>
                                                      <i class=" fa  fa-battery-empty fa-stack-1x fa-inverse"></i>
                                                  </span><br /> <b class="mychopplinfont" >Burial</b></p>
                    </div>
                    <div class=" col-md-4">
                        <p class="  text-center"> 
                                      <span class="  fa-stack fa-3x">
                                                      <i class="fa fa-circle fa-stack-2x colorawesomblue"></i>
                                                      <i class=" fa fa-gifts fa-stack-1x fa-inverse"></i>
                                                  </span><br /> <b class="mychopplinfont" >Celebration</b></p>
                    </div>
                    <div class=" col-md-4">
                        <p class="  text-center"> 
                                      <span class="  fa-stack fa-3x ">
                                                      <i class="fa fa-circle fa-stack-2x colorawesomblue"></i>
                                                      <i class=" fa   fa-handshake fa-stack-1x fa-inverse"></i>
                                                  </span><br />
                                                      <b class="mychopplinfont " >Find Me<br />Something</b>
                                                         </p>
                    </div>
                    <div class=" col-md-4">
                        <p class="  text-center"> 
                                      <span class="  fa-stack fa-3x ">
                                                      <i class="fa fa-circle fa-stack-2x colorawesomblue"></i>
                                                      <i class=" fa   fa-briefcase fa-stack-1x fa-inverse"></i>
                                                  </span><br />
                                                      <b class="mychopplinfont " >Business</b>
                                                         </p>
                    </div>
                </div>
            </div>
        </section>
        <section id="donations" class=" pb-4">
<div class="container">
    <div class="row">
                    <div class="col-lg-12">
                        <h2 class="h2title text-left  " >Fundraisers close to you</h2>
                     <hr class=" underline" align="left" />
                      
                    </div>
                </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:kpolomDUMMYConnectionString %>' SelectCommand="SELECT * FROM [Collection_Details] WHERE ShowMeOnIndex=1 AND TYPE='COLLECTION' ORDER BY [CreatedDate] DESC">
    </asp:SqlDataSource>
    
   
    <%--<div class="d-flex flex-row flex-nowrap overflow-auto">
  <div class="card card-block mx-2 p-3 h-100 cardwidthsetter">
    <img src="..." class="card-img-top" alt="...">
    <div class="card-body">
      <h5 class="card-title">Card title</h5>
      <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
    </div>
    <div class="card-footer">
      <small class="text-muted">Last updated 3 mins ago</small>
    </div>
  </div>
        <div class="card card-block mx-2 p-3 h-100 cardwidthsetter">
    <img src="..." class="card-img-top" alt="...">
    <div class="card-body">
      <h5 class="card-title">Card title</h5>
      <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
    </div>
    <div class="card-footer">
      <small class="text-muted">Last updated 3 mins ago</small>
    </div>
  </div>
        <div class="card card-block mx-2 p-3 h-100 cardwidthsetter">
    <img src="..." class="card-img-top" alt="...">
    <div class="card-body">
      <h5 class="card-title">Card title</h5>
      <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
    </div>
    <div class="card-footer">
      <small class="text-muted">Last updated 3 mins ago</small>
    </div>
  </div>
        <div class="card card-block mx-2 p-3 h-100 cardwidthsetter">
    <img src="..." class="card-img-top" alt="...">
    <div class="card-body">
      <h5 class="card-title">Card title</h5>
      <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
    </div>
    <div class="card-footer">
      <small class="text-muted">Last updated 3 mins ago</small>
    </div>
  </div>
</div>--%>

    

    


        <div class="row mx-auto my-auto">
        <div id="recipeCarousel" class="carousel slide w-100" data-ride="carousel">
            <div class="carousel-inner w-100" role="listbox">
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" >
                    <ItemTemplate>
                <div class="carousel-item  <%#GetActiveClass(Container.ItemIndex) %>"">
                    <div class="col-md-4">
                        <div class="card h-100">
                           <div class="card-body">
                                <img src='<%# Eval("Profile_Pic_Link") %>' class="card-img-top img-thumbnail img-fluid thumb" alt="...">
                    <div class="card-body">
                         
                        <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" CssClass="card-title   h5 colorawesomblue mylinottefont"><%# Eval("Collection_Name").ToString %></asp:HyperLink>
    <p class="card-text text-truncate-container mychopplinfont"><%# Eval("Collection_Desc").ToString %></p>
    <a href="#" class=""></a>
                        <asp:HyperLink ID="HyperLink2" runat="server" CssClass=" btn custombtn-outline btn-block"><i class=" fas fa-hand-holding-heart"></i> Donate</asp:HyperLink>
                      
                        <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("CollectionID") %>' />
                    <%--    <div class="row">
                            <div class="col-6">
                               
                            </div>
                             <div class="col-6"></div>
                        </div>--%>
                    </div>
                           </div>
                            <div class=" card-footer backcolorblue text-center">
                                   

                                         <b id="loadbalance" runat="server" class="  text-white  "> <%#"₦" & String.Format("{0:#,##0.##}", LoadBalance(Eval("CollectionID").ToString)) %> <i>raised</i></b>
                                <%--  <a href="#" class="btn  custombtn-outline"><i class=" fas fa-hand-holding-heart"></i> Donate</a>--%>
                                   
                            </div>
                        </div>
                    </div>
                </div>

                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <a class="carousel-control-prev w-auto" href="#recipeCarousel" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon bg-dark border border-dark rounded-circle" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next w-auto" href="#recipeCarousel" role="button" data-slide="next">
                <span class="carousel-control-next-icon bg-dark border border-dark rounded-circle" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
</div>
        </section>
        <section id="footer">
            <div class="container-fluid">
                
                <div class="row">
                    <div class="col-sm-12 col-md-12 col-lg-12"><p class="text-center">
                 Powered by Fourthman Notions Network Limited – owners of KPOLOM <br />     © Copyright 2022-2023 Collector.ng. All rights reserved. <a href="terms.aspx">Terms</a>
                                           </p></div>
                </div>
            </div>
        </section>
    </form>
      <script>
          $(document).ready(function () {
              // Add minus icon for collapse element which is open by default
              $(".collapse.show").each(function () {
                  $(this).prev(".card-header").find(".fa").addClass("fa-angle-double-down").removeClass("fa-angle-double-right");
              });

              // Toggle plus minus icon on show hide of collapse element
              $(".collapse").on('show.bs.collapse', function () {
                  $(this).prev(".card-header").find(".fa").removeClass("fa-angle-double-right").addClass("fa-angle-double-down colorawesomblue");
              }).on('hide.bs.collapse', function () {
                  $(this).prev(".card-header").find(".fa").removeClass("fa-angle-double-down").addClass("fa-angle-double-right colorawesomblue");
              });
          });
      </script>
    <script src="https://widget.sirena.app/get?token=4d35e4536a394c63a19bb8059b2c6126"></script>
        <script>

            /* Code for changing active 
            link on clicking */
            var btns =
                $("#navigation .navbar-nav .nav-link");

            for (var i = 0; i < btns.length; i++) {
                btns[i].addEventListener("click",
                    function () {
                        var current = document
                            .getElementsByClassName("active1");

                        current[0].className = current[0]
                            .className.replace(" active1", "");

                        this.className += " active1";
                    });
            }

            /* Code for changing active 
            link on Scrolling */
            $(window).scroll(function () {
                var distance = $(window).scrollTop();
                $('.page-section').each(function (i) {

                    if ($(this).position().top
                        <= distance + 250) {

                        $('.navbar-nav a.active1')
                            .removeClass('active1');

                        $('.navbar-nav a').eq(i)
                            .addClass('active1');
                    }
                });
            }).scroll();
        </script>
    <script>
        $(document).ready(function () {
            $('.myown').unwrap();
        });
    </script>
    <script type="text/javascript">
        $('#recipeCarousel').carousel({
            interval: 10000
        })

        $('.carousel .carousel-item').each(function () {
            var minPerSlide = 3;
            var next = $(this).next();
            if (!next.length) {
                next = $(this).siblings(':first');
            }
            next.children(':first-child').clone().appendTo($(this));

            for (var i = 0; i < minPerSlide; i++) {
                next = next.next();
                if (!next.length) {
                    next = $(this).siblings(':first');
                }

                next.children(':first-child').clone().appendTo($(this));
            }
        });

    </script>
</body>
</html>
