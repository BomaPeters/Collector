<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/admin/Site2.Master" CodeBehind="creditcollection.aspx.vb" Inherits="Collector.creditcollection" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="content">
         <div class="row mt-4">
            <div class=" col-md-8">
             <div class="card shadow borderwidth border-bottom border-primary border-top-0 border-left-0 border-right-0">
                         <div class="card-body">
                                <h5 class="text-primary mylinottefamily my-2 borderwidth border-bottom border-primary ">Credit Details</h5>
                             <div class="input-group mt-3  mb-0">
                                      <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control border border-primary" required="true"  Placeholder="Search with PhoneNumber"  AutoPostBack="True"  onkeyup="losefocus();" onpaste="losefocus(); " onkeypress="return CheckNumeric()" ></asp:TextBox>
                               
                             </div>
                                 <asp:Label ID="Label1" runat="server" Text="No Name" CssClass=" badge badge-danger  small fa mt-3 mb-3"  Visible="true" ></asp:Label>
                              <div class="form-group">
                                        <label>Collection List:</label>
                                  <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control border border-primary" DataSourceID="" DataTextField="Collection_Name" DataValueField="CollectionID" AutoPostBack="True"></asp:DropDownList>
                                  </div>
                     <div class="card border border-primary  ">
                         <div class="card-body">
                                     <div class="form-group mb-4">
                                          <b id="statushold" runat="server" class="badge  badge-warning fa-pull-right fa   fa-list-alt">Status</b>
                                   <p class="text-left">Collected:</p>
                                        
                                    <h6 class="">
          <asp:Label ID="Label2" runat="server" Text="Label" CssClass="h6 text-dark">0.00</asp:Label> <small>collected for goal of <b id="goalholdTEXT" runat="server" > 0.0</b> .</small></h6>
                                <div class="progress  w-100" style="height:5px">
  <div id="rangeholder" runat="server" class="progress-bar  bg-primary" role="progressbar" style="width: 3%" aria-valuenow="3" aria-valuemin="0" aria-valuemax="100"></div>
</div>
                             </div>
                            <div class="row mt-3">
                                <div class="col text-center ">
                                    <h6 class=" mylinotte" id="contribcnt" runat="server">0</h6>
                                    <small>Contributions</small>
                                </div>
                                 <div class="col border-left border-right text-center"> <h6 class="mylinotte" id="commentcounter" runat="server">0</h6>
                                     <small>Comments</small>
                                 </div>
                                  <div class="col text-center">
                                      <h6 class=" mylinotte" id="shareholdonpage" runat="server">0</h6>
                                      <small>Shares</small>
                                  </div>
                               
                            </div>


                         </div>
                     </div>

                                 <asp:ScriptManager ID="ScriptManager1" runat="server">

                                </asp:ScriptManager>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        

                                        <div class="row">
<div class="col-lg-6">
    <div class="form-group mt-3">
                                <label>Fullname</label>
                                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control border border-primary" required="true"></asp:TextBox>
                                <asp:CheckBox ID="CheckBox1" runat="server" Text="Show me as anonymous" CssClass="   p-3" AutoPostBack="true" />
                                  
                            </div>
</div>

                                            <div class="col-lg-6">
                                                <div class="form-group mt-3">
                                <label>Comment</label>
                                <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control border border-primary" TextMode="MultiLine" Rows="2"></asp:TextBox>
                             
                                  
                            </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <div class="row">
                                    <div class="col-lg-6">
                               <div class="form-group">
                                <label>Enter Donor PhoneNumber:</label>
                                <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control form-control-lg border   border-primary" onkeypress="return CheckNumeric();" onkeyup="return CheckNumeric();" required="true" MaxLength="11"></asp:TextBox>
                              
                            </div>

                                    </div>
                                     <div class="col-lg-6">
                               <div class="form-group">
                                <label>Enter Donor Email:</label>
                                <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control form-control-lg border   border-primary" required="true" ></asp:TextBox>
                              
                            </div>

                                     </div>
                                </div>
                               <div class="form-group">
                                <label>Enter Donation Amount:</label>
                                <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control form-control-lg border   border-primary" onkeypress="return CheckNumeric();" onkeyup="FormatCurrency(this);" required="true" MaxLength="7"></asp:TextBox>
                              
                            </div>
                             <asp:Button ID="Button1" runat="server" Text="Credit" CssClass="btn btn-primary btn-lg" />
                             <asp:Label ID="Label3" runat="server" Text="Label" CssClass="fa-inverse"></asp:Label>
                             <asp:Label ID="Label4" runat="server" Text="Label" CssClass="fa-inverse"></asp:Label>
                              <b id="goalhold" runat="server"  class="fa-inverse"> 0.0</b>
                             <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="" DataTextField="ShareCount" DataValueField="Goal" CssClass="fa-inverse border border-white"></asp:DropDownList>
                             <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="" DataTextField="TransID" DataValueField="TransID" CssClass="fa-inverse border border-white"></asp:DropDownList>
                             </div>
                 </div>
                </div>
          <%--   AND ([DueDate] >= @DueDate)
               <asp:ControlParameter ControlID="Label4" PropertyName="Text" Name="DueDate" Type="DateTime"></asp:ControlParameter>--%>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:kpolomDUMMYConnectionString %>' SelectCommand="SELECT * FROM [Collection_Details] WHERE (([userID] = @userID) ) ORDER BY [CreatedDate] DESC">
                 <SelectParameters>
                     <asp:ControlParameter ControlID="Label3" PropertyName="Text" Name="userID" Type="String"></asp:ControlParameter>
                   
                 </SelectParameters>
             </asp:SqlDataSource>
             <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:kpolomDUMMYConnectionString %>' SelectCommand="SELECT TOP 1 * FROM [Collection_Details] WHERE ([CollectionID] = @CollectionID) ORDER BY [CreatedDate] DESC">
                 <SelectParameters>
                     <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="CollectionID" Type="String"></asp:ControlParameter>
                 </SelectParameters>
             </asp:SqlDataSource>
             <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString='<%$ ConnectionStrings:kpolomDUMMYConnectionString %>' SelectCommand="SELECT  * FROM [Collection_Log] INNER JOIN Donor_Details ON Collection_Log.TransID= Donor_Details.TransID WHERE (Collection_Log.[CollectionID] = @CollectionID)">
                 <SelectParameters>
                     <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="CollectionID"></asp:ControlParameter>
                 </SelectParameters>
             </asp:SqlDataSource>
             </div>
             </div>
           <script type="text/javascript">
        function losefocus() {

            var text = document.getElementById('<%=TextBox1.ClientID%>');
            if (text != null && text.value.length > 10) {
                text.blur();

            }
        }
        </script>
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
</asp:Content>
