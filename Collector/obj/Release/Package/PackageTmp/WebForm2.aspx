<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="WebForm2.aspx.vb" Inherits="Collector.WebForm2" ValidateRequest="false" %>

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
    <meta name="viewport" content="width=device-width, initial-scale=1" />
     <meta name="description" content="Support people & events you care about." />
    <meta name="author" content="kpolom" />

      <link href="img/kpolomCOLLECTOR.png" rel="icon" />
    <link href="bootstrap-5.3.0-alpha3-dist/css/bootstrap.min.css" rel="stylesheet" />
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
     font-family:'Choplin';font-size:13vw;
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
 .underline {width:10% !important; margin-top:-15px !important; margin-bottom:15px !important; border-top:5px solid #1CADE4 !important;opacity:unset !important;
        }
           .underlinewhite {width:10% !important; margin-top:-15px !important; margin-bottom:15px !important; border-top:5px solid #fff !important;opacity:unset !important;
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
  
  /* .navbar-toggler.collapsed .close-icon {
    display: none;
}

.navbar-toggler:not(.collapsed) .navbar-toggler-icon {
    display: inline;
}*/
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



.navbar-nav .nav-link.active, .navbar-nav .nav-link.show {
 color: white !important;
    background-color: black !important;
   
    border-radius:7px;
    font-size: large;
            font-weight: bold;
}
.nav-pills .nav-link.active, .nav-pills .show>.nav-link {
    color: white !important;
    background-color: #1CADE4 !important;
}
     /*.nav-link { color:#1CADE4 !important;
     }*/
    </style>
</head>
<body class="greybackground" >

    <form id="form1" runat="server">
         
        <div class="container">
            <nav id="navbar-example2" class="navbar navbar-expand-lg  greybackground fixed-top rounded navbar-custom" >
  <div class="container">
    <a class="navbar-brand" href="#"><img src="img/kpolomCOLLECTOR.png" style="width: auto; height: 50px;" class="  colorawesomblue" />COLLECTOR </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-end" id="navbarNavAltMarkup">
   
             <ul class="navbar-nav  text-center mb-2 mb-lg-0">
        <li class="nav-item px-2">
          <a class="nav-link active" aria-current="page" href="#homepage">home</a>
        </li>
        <li class="nav-item px-2">
          <a class="nav-link" href="#aboutus">about</a>
        </li>
        <li class="nav-item px-2">
          <a class="nav-link" href="#fees">FAQs</a>
        </li>
                  <li class="nav-item px-2">
            <a class="nav-link " href="signin.aspx" id="lin">sign in <i class="fa  fa-lock"></i></a>
        </li>
                 <li class="nav-item">
                          <a class="btn   btncusblue btn-block "  href="signup.aspx">Start a Collection <i class="fa  fa-angle-double-up"></i></a>
                 </li>
      </ul>
    </div>
  </div>
</nav>
        </div>
        <div class=" w-100" data-bs-spy="scroll" data-bs-target="#navbar-example2">
         <div id="homepage"  class="page-section greybackground  " >

        <div  class="container ">
           
    <div class="row">
        <div class="   col-lg-7"><%--<br /><br />--%>
         
 <h2 class=" header2 colorawesomblue">Collect dues, raise funds to support your beloved causes.</h2>
            <span class=" h5  text-justify " style="font-family: 'Linotte'; text-align:justify">
               We empower individuals, communities or organisations raise funds and collect membership dues online efficiently.
               <%-- <span class="badge badge-dark">0706 308 3344</span> to get started.--%>
            </span><br />
       <div class="row mt-2">
           <div class="  col-md-5 mb-2">
                   <a class="btn  btncusblue   w-100  text-white" href="signup.aspx">Start a Collection <i class="fa fa-angle-double-up "></i></a>
           </div>
           <div class=" col-md-5">
               <a href="signin.aspx" class="btn  custombtn-outline  w-100">Sign In <i class="fa  fa-lock"></i></a>
           </div>
       </div>
        </div>
        <div class="   col-lg-5"  >
    
               <img src="img/04.-Helping-SomeoneCOPY.png" class="img-fluid mt-lg-4 " />
      
             
     
       
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
     <p class="mychopplinfont text-justify " style="text-align:justify">
  <%--The Collector is a free-to-use online donation tool that lets you set up your own  collection page in minutes, which you can use to raise donations as an act of kindness on behalf of people or occasions you care about.
         Collections created can be shared with friends and family via social media to create more awareness concerning that cause.--%>
   The Collector offers a comprehensive solution for individuals, organizations, and groups looking to raise funds and manage their membership dues.<br />By using this application, you can simplify the process of fundraising and membership management and focus on achieving your goals. Sign up today to get started.
         </p>
    <p class="mychopplinfont text-justify" style="text-align:justify">
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
                
          
             <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
  <li class="nav-item" role="presentation">
    <button class="nav-link active btn-outline-primary colorawesomblue" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">Collections <i class="fa fa-handshake"></i></button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link btn-outline-primary colorawesomblue" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">Dues <i class="fa   fa-clipboard-list"></i></button>
  </li>

</ul>
<div class="tab-content" id="pills-tabContent">
  <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0">
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
  <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab" tabindex="0">
      <div class="row   " >
                    <div class= " col-12 col-md-5 mb-2 mb-lg-4 offset-lg-1 ">
                        <div class="card shadow h-100 backcolorblue">
                            <div class="card-body text-justify mychopplinfont">
                                <b class=" fa-inverse"><i class="fa fa-handshake mr-2    fa-inverse"></i> 1.Create Dues</b>
                                <ul class="   fa-ul fa-inverse" style="">
                                             <li><span class="fa-li fa   fa-check-circle  fa-inverse "></span>Add a photo that best describes the purpose.</li>
                                        <li><span class="fa-li fa   fa-check-circle   fa-inverse "></span>Add a title as the purpose for the dues.</li>
                                    <li><span class="fa-li fa   fa-check-circle   fa-inverse "></span>Select dues type such as Alumni,home owners association etc.</li>
                           <li><span class="fa-li fa   fa-check-circle   fa-inverse "></span>Select how frequently  dues should be paid eg Monthly.</li>
                                  
                 
                                </ul>
                            </div>
                            <div class="card-footer  backcolorblue  border-top">
                                <i class="fa fa-arrow-alt-circle-right   fa-inverse fa-2x  d-none d-sm-block	"></i>
                                    <i class="fa  fa-arrow-alt-circle-down   fa-inverse fa-2x  d-block d-sm-none "></i>
                            </div>
                        </div>
                        </div>

          <div class= " col-12 col-md-5 mb-2 mb-lg-4 ">
                        <div class="card shadow h-100 backcolorblue">
                            <div class="card-body text-justify mychopplinfont">
                                <b class=" fa-inverse"><i class="fa fa-edit mr-2    fa-inverse"></i> 2.Modify </b>
                                <ul class="   fa-ul fa-inverse" style="">
                                   <li><span class="fa-li fa   fa-check-circle   fa-inverse "></span>Set who is eligible to join the membership list such as anybody or members only.</li>
                                  <li><span class="fa-li fa   fa-check-circle  fa-inverse "></span>
                                        Select start and end dates for the collection.
                                    </li>
                                     <li><span class="fa-li fa   fa-check-circle  fa-inverse "></span>
                                        Set amount to be paid and a description of the collection.
                                    </li>
                
                                </ul>
                            </div>
                            <div class="card-footer  backcolorblue  border-top">
                                <i class="fa fa-arrow-alt-circle-right   fa-inverse fa-2x  d-none d-sm-block	"></i>
                                    <i class="fa  fa-arrow-alt-circle-down   fa-inverse fa-2x  d-block d-sm-none "></i>
                            </div>
                        </div>
                        </div>
                    <div class=" col-12 col-md-5 mb-2 offset-lg-1 ">
                        <div class="card shadow h-100 backcolorblue">
                            <div class="card-body mychopplinfont">
                                <b class="  fa-inverse "><i class="fa  fa-user-friends mr-2  fa-inverse "></i> 3.Share with friends</b>
                                <ul class="fa-ul fa-inverse">
                                    <li><span class="fa-li fa   fa-check-circle  fa-inverse "></span> Share via Facebook,Twitter and Whatsapp.</li>
                                    <li><span class="fa-li fa   fa-check-circle  fa-inverse  "></span>Share via email.</li>
                                    <li><span class="fa-li fa   fa-check-circle  fa-inverse  "></span>Share with members of your association or your community.</li>
                                 
                             
                                </ul>


                            </div>
                             <div class="card-footer  backcolorblue border-top" >
                                  <i class="fa fa-arrow-alt-circle-right     fa-inverse fa-2x  d-none d-sm-block	"></i>
                                    <i class="fa  fa-arrow-alt-circle-down    fa-inverse fa-2x  d-block d-sm-none "></i>
                       
                            </div>
                        </div>
                        </div>
                    <div class=" col-12 col-md-5 mb-2 ">
                        <div class="card shadow h-100 backcolorblue">
                            <div class="card-body mychopplinfont">
                              

                                     <b class="   fa-inverse  mt-lg-3"><i class="fa  fa-balance-scale mr-2  fa-inverse "></i> 4.Manage Donations.</b>
                                <ul class="fa-ul fa-inverse">
                                    <li><span class="fa-li fa   fa-check-circle  fa-inverse  "></span> Accept donations.</li>
                                    <li><span class="fa-li fa   fa-check-circle  fa-inverse  "></span>View ledger of dues that have been paid.</li>
                                    <li><span class="fa-li fa   fa-check-circle  fa-inverse  "></span>Withdraw funds as collection is on going or at the  expiration of the collection.</li>
                                 
                            
                                </ul>
                            </div>
                             <div class="card-footer  backcolorblue border-top">
                                  <i class="fa fa-arrow-alt-circle-right   fa-inverse fa-2x  d-none d-sm-block	"></i>
                                    <i class="fa  fa-arrow-alt-circle-down   fa-inverse fa-2x  d-block d-sm-none "></i>
                                <%--<i class="fa fa-arrow-alt-circle-right fa-inverse fa-2x"></i>--%>
                            </div>
                        </div>
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
       <div class="accordion accordion-flush" id="accordionFlushExample">
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
         <h5 class="mb-0    mylinottefont   "><i class="fa  fa-angle-double-right colorawesomblue"></i> How much does it cost to start a collection? 
        </h5>
      </button>
    </h2>
    <div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body"><p>
           It is absolutely <span class=" badge  badge-primary bg-primary">FREE</span> to start a collection,however you will be required to create an account to begin.
                                  </p></div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
        <h5 class="mb-0    mylinottefont "><i class="fa  fa-angle-double-right colorawesomblue"></i> <span>
            After a successful collection round, who is the donation paid to?
                                                                                                     </span>
        </h5>
      </button>
    </h2>
    <div id="flush-collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body"><p>
    After a successful collection round, the funds donated are paid into the <span class="badge  bg-primary">beneficiary account</span> stated when the collection was created.
</p>
</div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
              <h5 class="mb-0  mylinottefont"><i class="fa  fa-angle-double-right colorawesomblue"></i> What happens when the due date of a collection has expired? 
        </h5>

      </button>
    </h2>
    <div id="flush-collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
          <p>
   When the due date of a collection has been exceeded, people will no longer be able to support the collection by donating because the <span class="badge bg-primary">DONATE</span> button will be disabled.
</p>

      </div>
    </div>
  </div>
       <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
              <h5 class="mb-0  mylinottefont  "><i class="fa  fa-angle-double-right colorawesomblue"></i> How long does it take for the funds collected to reflect in a beneficiary account? 
        </h5>


      </button>
    </h2>
    <div id="flush-collapseFour" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
   <p>
     It usually takes between 12 to 36 hours during work days and can take up to 48 hours during weekends.
 </p>    


      </div>
    </div>
  </div>
       <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseEight" aria-expanded="false" aria-controls="flush-collapseEight">
                     <h5 class="mb-0   mylinottefont"><i class="fa  fa-angle-double-right colorawesomblue"></i> Can a beneficiary account be changed during or after a collection? 
        </h5>


      </button>
    </h2>
    <div id="flush-collapseEight" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
       <p>
     A beneficiary account <span class="badge bg-primary">cannot</span> be changed after a collection has been created.
 </p>


      </div>
    </div>
  </div>

<div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFive" aria-expanded="false" aria-controls="flush-collapseFive">
                    <h5 class="mb-0   mylinottefont ">  <i class="fa  fa-angle-double-right  colorawesomblue"></i>
Can my collection round be suspended?

        </h5>


      </button>
    </h2>
    <div id="flush-collapseFive" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
     <p>
    Collection rounds that contain content that are malicious, promiscuous, misleading or seeking for ransom will be suspended and the funds returned to the donors.
</p>


      </div>
    </div>
  </div>
       <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseSix" aria-expanded="false" aria-controls="flush-collapseSix">
                  <h5 class="mb-0  mylinottefont "><i class="fa  fa-angle-double-right colorawesomblue"></i> What happens if I exceed the financial goal set in my collection round? 
        </h5>


      </button>
    </h2>
    <div id="flush-collapseSix" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
   <p>
    If you exceed the financial goal set in your collection round, the collection round will still be active until the due date has been exceeded or the round cashed-out.
</p>


      </div>
    </div>
  </div>
       <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseSeven" aria-expanded="false" aria-controls="flush-collapseSeven">
                     <h5 class="mb-0   mylinottefont "><i class="fa  fa-angle-double-right colorawesomblue"></i> When does a collection round end? 
        </h5>


      </button>
    </h2>
    <div id="flush-collapseSeven" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
    <p>
A collection round ends either when the due date has been exceeded or the total donation so far has been cashed-out by the collection creator.
</p>


      </div>
    </div>
  </div>
</div>

<!-- Accordion wrapper -->

         <a class="btn btncustomoutline  w-100  mt-3 font-weight-bold " href="signup.aspx">Start a Collection <i class="fa fa-angle-double-up "></i></a>
   
   
   
   
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
      </div>
        <script src="bootstrap-5.3.0-alpha3-dist/js/bootstrap.bundle.js"></script>
    </form>
    <script>
        $(document).ready(function () {
            // Add minus icon for collapse element which is open by default
            $(".collapse.show").each(function () {
                $(this).prev(".accordion-item").find(".fa").addClass("fa-angle-double-down").removeClass("fa-angle-double-right");
            });

            // Toggle plus minus icon on show hide of collapse element
            $(".collapse").on('show.bs.collapse', function () {
                $(this).prev(".accordion-item").find(".fa").removeClass("fa-angle-double-right").addClass("fa-angle-double-down colorawesomblue");
            }).on('hide.bs.collapse', function () {
                $(this).prev(".accordion-item").find(".fa").removeClass("fa-angle-double-down").addClass("fa-angle-double-right colorawesomblue");
            });
        });
    </script>
    <script src="https://widget.sirena.app/get?token=4d35e4536a394c63a19bb8059b2c6126"></script>
        
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

<script>
    function showlast() {
        var firstTabEl = document.querySelector('#myTab li:last-child button')
        var firstTab = new bootstrap.Tab(firstTabEl)

        firstTab.show()
    }
    function showfirst() {
        var firstTabEl = document.querySelector('#myTab li:first-child button')
        var firstTab = new bootstrap.Tab(firstTabEl)

        firstTab.show()
    }
</script>
</body>
</html>
