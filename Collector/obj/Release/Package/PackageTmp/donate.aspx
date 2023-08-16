<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="donate.aspx.vb" Inherits="Collector.donate" %>

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
      <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>

    <script src="bootstrap-4.4.1-dist/js/bootstrap.min.js"></script>
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
            background-color: black !important;
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
          .btncusblue{
    background-color:#1CADE4 !important;
    color:white !important;
}
.btncusblue :hover{
    background-color:#1689b6 !important;
    color:white !important;
    border-color:	#1689b6;
}
    </style>
     <script src="https://checkout.flutterwave.com/v3.js"></script>
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
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse     " id="navbarSupportedContent">


                              <ul class="navbar-nav  ml-auto  mr-lg-4 text-center      ">
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
                          <div class="d-flex myrightmargin ">
        <a class="btn  btncusblue btn-block "  href="signup.aspx">Start a Collection <i class="fa  fa-angle-double-up"></i></a>
                             
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
                            <h3 class="card-title text-center">Donate</h3>
                         
                        </div>

                        <div class="card-body">
                            <div class="row">

                                <div class="col">
                                    <p class="text-left">Purpose for Donation:</p>
                                    <h6 class=" ">
                                        <asp:Label ID="Label4" runat="server" Text="0.0" CssClass="h6 text-dark">Birthday Celebration</asp:Label></h6>
                                </div>
                            </div>
                            <hr />
                            <div class="row ">

                                <div class="col">
                                    <p class="text-left">Donation will benefit:</p>
                                    <h6 class="">
                                        <asp:Label ID="Label3" runat="server" Text="" CssClass="h6 text-dark"></asp:Label></h6>
                                </div>
                            </div>
                            <hr />
                              <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
                            <div class="form-group">
                                <label>Enter Donation Amount:</label>
                                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control form-control-lg border   border-primary"  onkeyup="FormatCurrency(this);calccharge();" onkeypress="return CheckNumeric();" required="true" MaxLength="7" TextMode="Phone" ></asp:TextBox>
                          
                            </div>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                     <div class="form-group">
                                <label>Fullname</label>
                                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" required="true"></asp:TextBox>
                                <asp:CheckBox ID="CheckBox1" runat="server" Text="Show me as anonymous" CssClass="   p-3" AutoPostBack="true" />
                                  
                            </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <div class="card  marginsetter   mb-3 shadow-sm">
                        <div class="card-body ">
                            <div class="row">
                                <div class="col text-center ">
                                    <h6 class=" mylinotte" id="payable" runat="server">0</h6>
                                    <small>Amt. Payable(₦)</small>
                                </div>
                                 <div class="col border-left text-center border-primary"> <h6 class="mylinotte" id="chargeholder" runat="server">0</h6>
                                     <small>Charge(1.5%)</small>
                                 </div>
                                  
                            </div>
                        </div>
                    </div>
                              
                          
                             <div class="form-group">
                                <label>Donor Email Address</label>
                                <asp:TextBox ID="email" runat="server" CssClass="form-control" required="true" TextMode="Email" Placeholder="Email"></asp:TextBox>
                            </div>
                             <div class="form-group">
                                <label>Donor PhoneNumber</label>
                                <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" required="true"  MaxLength="11" onkeypress="return CheckNumeric();" TextMode="Phone"></asp:TextBox>
                      
                             </div>
                            <div class="form-group">
                                <asp:Button ID="Button1" runat="server" Text="Donate" CssClass="btn custombtn btn-block btn-lg" />
                                <asp:HiddenField ID="HiddenField1" runat="server" />
                                <asp:HiddenField ID="HiddenField2" runat="server" />
                                <asp:HiddenField ID="HiddenField3" runat="server" />
                                <asp:HiddenField ID="HiddenField4" runat="server" />
                                <asp:HiddenField ID="HiddenField5" runat="server" />
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
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

        </script>

        <script type="text/javascript">
        /* FLWPUBK_TEST-a0b97af1d781453d6ff6aa247dc989f0 - X*/
            //FLWPUBK - 5729b2b564ff3853d72cfc5b18cfbcc8- X
            //FLWPUBK_TEST-a0b97af1d781453d6ff6aa247dc989f0-X
            function makePayment() {
                var emailhold = document.getElementById('<%=HiddenField1.ClientID%>').value;
                                var amounthold = document.getElementById('<%=HiddenField2.ClientID%>').value;
                                var phonehold = document.getElementById('<%=HiddenField3.ClientID%>').value;
                                var namehold = document.getElementById('<%=HiddenField4.ClientID%>').value;
                                var collectionider = document.getElementById('<%=HiddenField5.ClientID%>').value;
                                FlutterwaveCheckout({
                                    public_key: "FLWPUBK-5729b2b564ff3853d72cfc5b18cfbcc8-X",
                                    tx_ref: phonehold+"_"+collectionider,
                                    amount: amounthold,
                                    currency: "NGN",
                                    country: "NG",
                                    payment_options: "card", //,mobilemoney,ussd
                                    redirect_url: "success.aspx",
                                    customer: {
                                        email: emailhold,
                                        phone_number: phonehold,
                                        name: namehold,
                                    },
                                    //callback: function (data) { // specified callback function
                                    //    console.log(data);
                                    //},
                                    customizations: {
                                        title: "COLLECTOR",
                                        description: "COLLECTOR INSTANT CREDIT",
                                        logo: "https://kpolom.com/img/kpolomCOLLECTOR.png",
                                    },
                                });
            }
        </script>
          <script src="https://widget.sirena.app/get?token=4d35e4536a394c63a19bb8059b2c6126"></script>
    </form>
</body>
</html>
