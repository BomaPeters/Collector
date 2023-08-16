<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="success.aspx.vb" Inherits="Collector.success" %>

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
         .myrightmargin{
           margin-right:0% !important;
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
                            <h3 class="card-title text-center">Success</h3>
                     
                        </div>

                        <div class="card-body">
                            <div class="row">

                                <div class="col text-center">
                                    <i class="fa fa-smile-o fa-3x text-primary"></i><br />
                                    <small class="">Thank you for supporting:</small>
                                    <h6 class=" ">
                                        <asp:Label ID="Label4" runat="server" Text="0.0" CssClass="h6 text-dark"></asp:Label></h6>
                                    <span><small>Your donation of</small><br /> <b id="AmtHolder" runat="server">0.00</b><br /> has benefitted <br /><asp:Label ID="Label3" runat="server" Text="" CssClass=" font-weight-bold text-dark"></asp:Label> </span>
                                </div>
                            </div>
                            <hr />
                            
                         
                            
                           <%--   <p class="card-text text-center invisible "><span class=" float-start">Amount:</span> <b class="  float-end" > 14,000.00</b>&nbsp;<b class=" float-end">NGN&nbsp;</b></p>--%>
 
                            <div class="form-group">
                                <label>Say a kind word:</label>
                                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control form-control-lg border   border-primary"  TextMode="MultiLine" Rows="3" MaxLength="10" onkeypress="return this.value.length<=150"></asp:TextBox>
                               
                                </div>
                            <div class="form-group">
                                <asp:Button ID="Button1" runat="server" Text="Post Comment" CssClass="btn custombtn btn-block btn-lg" />
                               
                            </div>
                     
                               <hr />
                            <b>Show more support by sharing</b>
                              <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                      
                            <div class="row">
                                <div class="col">
                                     <asp:LinkButton ID="LinkButton1" runat="server"><i class=" fab fa-facebook-square  "></i> Facebook</asp:LinkButton>
                                   
                                </div>
                                <div class="col">
                                    
                                    <asp:LinkButton ID="LinkButton2" runat="server"><i class="  fab   fa-whatsapp   "></i> Whatsapp</asp:LinkButton>
                                </div>
                                <div class="col">
                                         
                                    <asp:LinkButton ID="LinkButton3" runat="server"><i class="  fab  fa-twitter-square  "></i> Twitter</asp:LinkButton>
                                </div>
                            </div>
                            <div class="row">
                                <div class=" col-md my-2">
          <div class="input-group">
              <input id="Text1" type="text" class="form-control" runat="server" /><div class="input-group-append">
                  <button  class="btn btn-sm btn-success" onclick="copyclip();"><i class="fa fa-clipboard"></i> Copy Link</button>
                                              </div>
          </div>

                                </div>
                                <div class=" col-md my-2">
                                    <asp:LinkButton ID="LinkButton4" runat="server" CssClass="btn btn-warning btn-block "> <i class="fa fa-arrow-left"></i> Return to Collection</asp:LinkButton>
                                </div>
                            </div>
                          
                            
                              
                        </div>
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

            function calccharge() {
                var valhold = document.getElementById('<%= TextBox1.ClientID %>').value;
                var numonly = valhold.replace(/\D/g,'');
                var chargehold  =Math.round (0.015 * numonly);

                document.getElementById('chargeholder').innerHTML = chargehold;
                document.getElementById('payable').innerHTML = parseInt(numonly) + parseInt(chargehold);
                //var future = new Date();
                //var numberhold = valhold;
                //future.setDate(future.getDate() + numberhold);
                //document.getElementById('datehold').innerHTML = 'Expire Date:' + future + 'Today= ' + new Date();
                //alert(valhold);
            }
           
            function ShowPopup() {

                //$("#staticBackdrop").modal("show");
                $("#myclick").click();
            }
            function copyclip() {
                var copytext = document.getElementById("<%=Text1.ClientID%>");
                   copytext.select();
                   copytext.setSelectionRange(0, 99999);
                   document.execCommand("copy");
                   alert('Link has been copied.');

               }
        </script>
    </form>
</body>
</html>
