<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/secured/Site1.Master" CodeBehind="profile.aspx.vb" Inherits="Collector.profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style>
        .borderwidth{ border-bottom-width:5px !important; }
        .mylinottefamily{ font-family:'Linotte'}
         .colorawesomblue { color:#1CADE4 !important;
        }
           .backgroundawesomeblue {
            background-color: #1CADE4 !important;
          /*  border-radius: 5px;
            color: white;*/
        }
           .border-customblue {
    border-color: #1CADE4 !important;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">
            <div class="row  ">
                <div class="col-md-7">
                    <div class="card mt-4 shadow borderwidth border-bottom border-customblue border-top-0 border-left-0 border-right-0">
                        <div class="card-body">
                            <h5 class="colorawesomblue mylinottefamily my-2 borderwidth border-bottom border-customblue ">Profile</h5>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Firstname:</label>
                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" required="true"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Lastname:</label>
                                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" required="true"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                        <label>PhoneNumber:</label>
                                        <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                    </div>
                            <div class="form-group">
                                        <label>Email Address:</label>
                                        <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                    </div>

                            <div class="form-group">
                                <asp:Button ID="Button1" runat="server" Text="Update" CssClass=" btn btn-primary  btn-lg" />
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
         </div>
</asp:Content>
