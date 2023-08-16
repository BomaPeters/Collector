<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/admin/Site2.Master" CodeBehind="Dashboard.aspx.vb" Inherits="Collector.Dashboard1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="row mt-4">
            <div class=" col-md-10">
                    <h5 class="text-primary mylinottefamily my-2 borderwidth border-bottom border-primary ">Dashboard</h5>
                <div class="row mt-3">
                    <div class="  col-md-4 mb-2">
                        <div class="card shadow p-3 borderwidth border-bottom border-primary border-top-0 border-left-0 border-right-0">
                            <div class="card-body">
                             
                                <div class="row">
                                    <div class="col-4  text-center">
                                        <i class="fa  fa-angle-double-up fa-3x text-primary"></i>
                                    </div>
                                     <div class="col-8">
                                         <h5 class="mb-0" id="collectionscount" runat="server">0</h5>
                                         <small class="text-muted mt-0">Collections</small>
                                     </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    <div class="  col-md-4 mb-2">
                        <div class="card  shadow p-3 borderwidth border-bottom border-primary border-top-0 border-left-0 border-right-0">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-4  text-center">
                                        <i class="fa  fa-angle-double-down fa-3x text-primary"></i>
                                    </div>
                                     <div class="col-8">
                                         <h5 class="mb-0" id="totalcollected" runat="server">0</h5>
                                         <small class="text-muted mt-0">Total Collected(₦)</small>
                                     </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="  col-md-4 mb-2">
                        <div class="card shadow p-3 borderwidth border-bottom border-primary border-top-0 border-left-0 border-right-0">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-4  text-center">
                                        <i class="fa fa-gifts fa-3x text-primary"></i>
                                    </div>
                                     <div class="col-8">
                                         <h5 class="mb-0" id="donationcnt" runat="server">0</h5>
                                         <small class="text-muted mt-0">Total Donations</small>
                                     </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                  <div class="row mt-3">
                    <div class="  col-md-4 mb-2">
                        <div class="card shadow p-3 borderwidth border-bottom border-primary border-top-0 border-left-0 border-right-0">
                            <div class="card-body">
                             
                                <div class="row">
                                    <div class="col-4  text-center">
                                        <i class="fa   fa-users fa-3x text-primary"></i>
                                    </div>
                                     <div class="col-8">
                                         <h5 class="mb-0" id="usercount" runat="server">0</h5>
                                         <small class="text-muted mt-0">No. Of Signups</small>
                                     </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    <div class="  col-md-4 mb-2">
                        <div class="card  shadow p-3 borderwidth border-bottom border-primary border-top-0 border-left-0 border-right-0">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-4  text-center">
                                        <i class="fa  fa-sign-out-alt fa-3x text-primary"></i>
                                    </div>
                                     <div class="col-8">
                                         <h5 class="mb-0" id="H2" runat="server">0</h5>
                                         <small class="text-muted mt-0">Cash Out Request</small>
                                     </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="  col-md-4 mb-2">
                        <div class="card shadow p-3 borderwidth border-bottom border-primary border-top-0 border-left-0 border-right-0">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-4  text-center">
                                        <i class="fa fa-gifts fa-3x text-primary"></i>
                                    </div>
                                     <div class="col-8">
                                         <h5 class="mb-0" id="H3" runat="server">0</h5>
                                         <small class="text-muted mt-0">PageViews</small>
                                     </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-12">
                          <div class="row d-sm-none  d-lg-none">
         <div class="col-sm-6">
             <span class="small"><i class="fa fa-arrow-left"></i> Swipe left to see more</span>
         </div>
     </div>
                        <div class="card h-100 shadow p-3 borderwidth border-bottom border-primary border-top-0 border-left-0 border-right-0">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
  <li class="nav-item" role="presentation">
    <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">All</a>
  </li>
  <li class="nav-item" role="presentation">
    <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">Cashout Request</a>
  </li>
  <li class="nav-item" role="presentation">
    <a class="nav-link" id="pills-contact-tab" data-toggle="pill" href="#pills-contact" role="tab" aria-controls="pills-contact" aria-selected="false">Paid</a>
  </li>
</ul>
<div class="tab-content" id="pills-tabContent">
  <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
      
                                    <asp:GridView ID="GridView1" runat="server" CssClass="table" GridLines="None" AutoGenerateColumns="False" DataKeyNames="CollectionID" DataSourceID="SqlDataSource1"  HeaderStyle-CssClass="bg-primary fa-inverse" AllowPaging="true" PageSize="10">
                                    <Columns>
                                       <%-- <asp:BoundField DataField="userID" HeaderText="userID" SortExpression="userID"></asp:BoundField>
                                        <asp:BoundField DataField="CollectionID" HeaderText="CollectionID" ReadOnly="True" SortExpression="CollectionID"></asp:BoundField>--%>
              <%--                          <asp:BoundField DataField="Collection_Name" HeaderText="Collection Name" SortExpression="Collection_Name" ControlStyle-CssClass="small text-primary"></asp:BoundField>--%>
                                       <%-- <asp:BoundField DataField="Collection_Desc" HeaderText="Collection_Desc" SortExpression="Collection_Desc"></asp:BoundField>
                                        <asp:BoundField DataField="Receiver_Acct_Number" HeaderText="Receiver_Acct_Number" SortExpression="Receiver_Acct_Number"></asp:BoundField>
                                        <asp:BoundField DataField="Receiver_Bank_Name" HeaderText="Receiver_Bank_Name" SortExpression="Receiver_Bank_Name"></asp:BoundField>
                                        <asp:BoundField DataField="Receiver_Name" HeaderText="Receiver_Name" SortExpression="Receiver_Name"></asp:BoundField>--%>
                                       <%-- <asp:BoundField DataField="DueDate" HeaderText="DueDate" SortExpression="DueDate"></asp:BoundField>
                                        <asp:BoundField DataField="CreatedDate" HeaderText="CreatedDate" SortExpression="CreatedDate"></asp:BoundField>--%>
          <%--                              <asp:BoundField DataField="Goal" HeaderText="Goal" SortExpression="Goal"></asp:BoundField>
                                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status"></asp:BoundField>
                                        <asp:BoundField DataField="CashOutDate" HeaderText="CashOutDate" SortExpression="CashOutDate"></asp:BoundField>
                                        <asp:BoundField DataField="Profile_Pic_Link" HeaderText="Profile_Pic_Link" SortExpression="Profile_Pic_Link"></asp:BoundField>--%>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                Collection Name
                                            </HeaderTemplate>
                                            <HeaderStyle CssClass="" />
                                            <ItemTemplate>
                                                 <b id="collectionname" runat="server" class="  "> <%# Eval("Collection_Name").ToString %></b>
                                                <small class="blockquote-footer" id="nameholder" runat="server"><%# GetProfileDetails(Eval("userID").ToString) %></small>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("CollectionID").ToString %>' CssClass=" border border-primary form-control-sm"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderTemplate >
                                                Created
                                            </HeaderTemplate>
                                            <HeaderStyle  CssClass="text-center "/>
                                            <ItemTemplate >
                                                 <b class=" badge badge-warning" id="duedate" runat="server"><%# CDate(Eval("CreatedDate").ToString).ToString("dd-MMM-yy - hh:mm") %></b>
                                            </ItemTemplate>
                                            <ItemStyle CssClass="text-center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                Status
                                            </HeaderTemplate>
                                             <HeaderStyle  CssClass="text-center "/>
                                            <ItemTemplate>
                                                <b id="statushold" runat="server" class="  badge badge-warning card-text "><%# Eval("Status").ToString %></b>
                                            </ItemTemplate>
                                             <ItemStyle CssClass="text-center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                Collected
                                            </HeaderTemplate>
                                             <HeaderStyle  CssClass="text-center "/>
                                            <ItemTemplate>
                                                 <b id="loadbalance" runat="server" class=""> <%#"₦" & String.Format("{0:#,##0.##}", LoadBalance(Eval("CollectionID").ToString)) %></b><br />
                                                         <b id="B1" runat="server" class="invisible small"> <%# LoadBalance(Eval("CollectionID").ToString) %></b>
                                                 <b id="B3" runat="server" class=" invisible small"> <%# Eval("userID").ToString %></b>
                                            </ItemTemplate>
                                             <ItemStyle CssClass="text-center" />
                                        </asp:TemplateField>
                                       
                                             <asp:TemplateField>
                                            <HeaderTemplate>
                                               Shares
                                            </HeaderTemplate>
                                             <HeaderStyle  CssClass="text-center "/>
                                            <ItemTemplate>
                                                 <b id="sharescount" runat="server" class=""> <%#Eval("ShareCount").ToString %></b><br />
                                                   
                                            </ItemTemplate>
                                             <ItemStyle CssClass="text-center" />
                                        </asp:TemplateField>
                                        
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                View
                                            </HeaderTemplate>
                                             <HeaderStyle  CssClass="text-center "/>
                                            <ItemTemplate>
                                       
                                                <a href="https://www.collector.ng/share.aspx?collectionid=<%# Eval("CollectionID").ToString.Trim %>" class="btn btn-outline-primary btn-sm btn-block " target="_blank">View</a>
                                            </ItemTemplate>
                                             <ItemStyle CssClass="text-center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderTemplate>Show</HeaderTemplate>
                                            <ItemTemplate>
                                             <%--   <asp:CheckBox ID="CheckBox1" runat="server"   />--%>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-outline-warning " CommandName="Updater">LinkButton</asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField Visible="false" >
                                            <ItemTemplate>
                                                <span id="shower" runat="server"><%# Eval("ShowMeOnIndex").ToString%></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                        <PagerStyle CssClass=" pagination-ys" />
                                </asp:GridView>
                                    <table class="table text-center" id="notable" runat="server">
                                        <thead class="">
                                            <tr class="bg-primary fa-inverse">
                                                <th>Collection Name</th>
                                                <th>Due</th>
                                                  <th>Status</th>
                                                  <th>Collected</th>
                                            </tr>
                                            
                                        </thead>
                                        <tr>
                                            <td>-</td>
                                            <td>-</td>
                                             <td>-</td>
                                            <td>-</td>
                                        </tr>
                                         <tr>
                                            <td>-</td>
                                            <td>-</td>
                                             <td>-</td>
                                            <td>-</td>
                                        </tr>
                                    </table>

                                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="CollectionID" DataSourceID="SqlDataSource1" CssClass="  d-none  " ShowFooter="true">
                                        <Columns>
                                           <%-- <asp:BoundField DataField="userID" HeaderText="userID" SortExpression="userID"></asp:BoundField>
                                            <asp:BoundField DataField="CollectionID" HeaderText="CollectionID" ReadOnly="True" SortExpression="CollectionID"></asp:BoundField>
                                            <asp:BoundField DataField="Collection_Name" HeaderText="Collection_Name" SortExpression="Collection_Name"></asp:BoundField>
                                            <asp:BoundField DataField="Collection_Desc" HeaderText="Collection_Desc" SortExpression="Collection_Desc"></asp:BoundField>
                                            <asp:BoundField DataField="Receiver_Acct_Number" HeaderText="Receiver_Acct_Number" SortExpression="Receiver_Acct_Number"></asp:BoundField>
                                            <asp:BoundField DataField="Receiver_Bank_Name" HeaderText="Receiver_Bank_Name" SortExpression="Receiver_Bank_Name"></asp:BoundField>
                                            <asp:BoundField DataField="Receiver_Name" HeaderText="Receiver_Name" SortExpression="Receiver_Name"></asp:BoundField>
                                            <asp:BoundField DataField="DueDate" HeaderText="DueDate" SortExpression="DueDate"></asp:BoundField>
                                            <asp:BoundField DataField="CreatedDate" HeaderText="CreatedDate" SortExpression="CreatedDate"></asp:BoundField>
                                            <asp:BoundField DataField="Goal" HeaderText="Goal" SortExpression="Goal"></asp:BoundField>
                                            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status"></asp:BoundField>
                                            <asp:BoundField DataField="CashOutDate" HeaderText="CashOutDate" SortExpression="CashOutDate"></asp:BoundField>
                                            <asp:BoundField DataField="Profile_Pic_Link" HeaderText="Profile_Pic_Link" SortExpression="Profile_Pic_Link"></asp:BoundField>
                                           --%>  <asp:TemplateField>
                                            <HeaderTemplate>
                                                Collected
                                            </HeaderTemplate>
                                             <HeaderStyle  CssClass="text-center "/>
                                            <ItemTemplate>
                                                
                                                         <b id="B1" runat="server" class=""> <%# LoadBalance(Eval("CollectionID").ToString) %></b>
                                                  <b id="B2" runat="server" class=""> <%# Countdonations(Eval("CollectionID").ToString) %></b>
                                            </ItemTemplate>
                                             <ItemStyle CssClass="text-center" />
                                               
                                        </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
  </div>
  <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
      <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="CollectionID" DataSourceID="SqlDataSource2" CssClass="table" GridLines="None" HeaderStyle-CssClass="bg-primary fa-inverse" AllowPaging="true" PageSize="10">
          <Columns>
          <%--    <asp:BoundField DataField="userID" HeaderText="userID" SortExpression="userID"></asp:BoundField>
              <asp:BoundField DataField="CollectionID" HeaderText="CollectionID" ReadOnly="True" SortExpression="CollectionID"></asp:BoundField>
              <asp:BoundField DataField="Collection_Name" HeaderText="Collection_Name" SortExpression="Collection_Name"></asp:BoundField>
              <asp:BoundField DataField="Collection_Desc" HeaderText="Collection_Desc" SortExpression="Collection_Desc"></asp:BoundField>
              <asp:BoundField DataField="Receiver_Acct_Number" HeaderText="Receiver_Acct_Number" SortExpression="Receiver_Acct_Number"></asp:BoundField>
              <asp:BoundField DataField="Receiver_Bank_Name" HeaderText="Receiver_Bank_Name" SortExpression="Receiver_Bank_Name"></asp:BoundField>
              <asp:BoundField DataField="Receiver_Name" HeaderText="Receiver_Name" SortExpression="Receiver_Name"></asp:BoundField>
              <asp:BoundField DataField="DueDate" HeaderText="DueDate" SortExpression="DueDate"></asp:BoundField>
              <asp:BoundField DataField="CreatedDate" HeaderText="CreatedDate" SortExpression="CreatedDate"></asp:BoundField>
              <asp:BoundField DataField="Goal" HeaderText="Goal" SortExpression="Goal"></asp:BoundField>
              <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status"></asp:BoundField>
              <asp:BoundField DataField="CashOutDate" HeaderText="CashOutDate" SortExpression="CashOutDate"></asp:BoundField>
              <asp:BoundField DataField="Profile_Pic_Link" HeaderText="Profile_Pic_Link" SortExpression="Profile_Pic_Link"></asp:BoundField>
              <asp:BoundField DataField="ShareCount" HeaderText="ShareCount" SortExpression="ShareCount"></asp:BoundField>
              <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category"></asp:BoundField>
              <asp:BoundField DataField="PaidDate" HeaderText="PaidDate" SortExpression="PaidDate"></asp:BoundField>--%>
              <asp:TemplateField>
                                            <HeaderTemplate>
                                                Collection Name
                                            </HeaderTemplate>
                                            <HeaderStyle CssClass="" />
                                            <ItemTemplate>
                                                 <b id="collectionname" runat="server" class="  "> <%# Eval("Collection_Name").ToString %></b>
                                                <small class="blockquote-footer" id="nameholder" runat="server"><%# GetProfileDetails(Eval("userID").ToString) %></small>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderTemplate >
                                                Requested
                                            </HeaderTemplate>
                                            <HeaderStyle  CssClass="text-center "/>
                                            <ItemTemplate >
                                                 <b class=" badge badge-warning" id="duedate" runat="server"><%# CDate(Eval("PaidDate").ToString).ToString("dd-MMM-yy - hh:mm") %></b>
                                            </ItemTemplate>
                                            <ItemStyle CssClass="text-center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                Status
                                            </HeaderTemplate>
                                             <HeaderStyle  CssClass="text-center "/>
                                            <ItemTemplate>
                                                <b id="statushold" runat="server" class="  badge badge-warning card-text "><%# Eval("Status").ToString %></b>
                                            </ItemTemplate>
                                             <ItemStyle CssClass="text-center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                Collected
                                            </HeaderTemplate>
                                             <HeaderStyle  CssClass="text-center "/>
                                            <ItemTemplate>
                                                 <b id="loadbalance" runat="server" class=""> <%#"₦" & String.Format("{0:#,##0.##}", LoadBalance(Eval("CollectionID").ToString)) %></b><br />
                                                         <b id="B1" runat="server" class="invisible small"> <%# LoadBalance(Eval("CollectionID").ToString) %></b>
                                                 <b id="B3" runat="server" class=" invisible small"> <%# Eval("userID").ToString %></b>
                                            </ItemTemplate>
                                             <ItemStyle CssClass="text-center" />
                                        </asp:TemplateField>
                                       
                                             <asp:TemplateField>
                                            <HeaderTemplate>
                                               Shares
                                            </HeaderTemplate>
                                             <HeaderStyle  CssClass="text-center "/>
                                            <ItemTemplate>
                                                 <b id="sharescount" runat="server" class=""> <%#Eval("ShareCount").ToString %></b><br />
                                                   
                                            </ItemTemplate>
                                             <ItemStyle CssClass="text-center" />
                                        </asp:TemplateField>
                                        
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                View
                                            </HeaderTemplate>
                                             <HeaderStyle  CssClass="text-center "/>
                                            <ItemTemplate>
                                       
                                                <a href="https://www.kpolom.com/collector/share.aspx?collectionid=<%# Eval("CollectionID").ToString.Trim %>" class="btn btn-outline-primary btn-sm btn-block " target="_blank">View</a>
                                            </ItemTemplate>
                                             <ItemStyle CssClass="text-center" />
                                        </asp:TemplateField>
          </Columns>
           <PagerStyle CssClass=" pagination-ys" />
      </asp:GridView>
      <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:kpolomDUMMYConnectionString %>' SelectCommand="SELECT * FROM [Collection_Details] WHERE ([Status] = @Status) ORDER BY [PaidDate] DESC">
          <SelectParameters>
              <asp:QueryStringParameter QueryStringField="PROCESSING" DefaultValue="PROCESSING" Name="Status" Type="String"></asp:QueryStringParameter>
          </SelectParameters>
      </asp:SqlDataSource>
  </div>
  <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">
      <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="CollectionID" DataSourceID="SqlDataSource3" CssClass="table" GridLines="None" HeaderStyle-CssClass="bg-primary fa-inverse" AllowPaging="true" PageSize="10">
          <Columns>
           <%--   <asp:BoundField DataField="userID" HeaderText="userID" SortExpression="userID"></asp:BoundField>
              <asp:BoundField DataField="CollectionID" HeaderText="CollectionID" ReadOnly="True" SortExpression="CollectionID"></asp:BoundField>
              <asp:BoundField DataField="Collection_Name" HeaderText="Collection_Name" SortExpression="Collection_Name"></asp:BoundField>
              <asp:BoundField DataField="Collection_Desc" HeaderText="Collection_Desc" SortExpression="Collection_Desc"></asp:BoundField>
              <asp:BoundField DataField="Receiver_Acct_Number" HeaderText="Receiver_Acct_Number" SortExpression="Receiver_Acct_Number"></asp:BoundField>
              <asp:BoundField DataField="Receiver_Bank_Name" HeaderText="Receiver_Bank_Name" SortExpression="Receiver_Bank_Name"></asp:BoundField>
              <asp:BoundField DataField="Receiver_Name" HeaderText="Receiver_Name" SortExpression="Receiver_Name"></asp:BoundField>
              <asp:BoundField DataField="DueDate" HeaderText="DueDate" SortExpression="DueDate"></asp:BoundField>
              <asp:BoundField DataField="CreatedDate" HeaderText="CreatedDate" SortExpression="CreatedDate"></asp:BoundField>
              <asp:BoundField DataField="Goal" HeaderText="Goal" SortExpression="Goal"></asp:BoundField>
              <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status"></asp:BoundField>
              <asp:BoundField DataField="CashOutDate" HeaderText="CashOutDate" SortExpression="CashOutDate"></asp:BoundField>
              <asp:BoundField DataField="Profile_Pic_Link" HeaderText="Profile_Pic_Link" SortExpression="Profile_Pic_Link"></asp:BoundField>
              <asp:BoundField DataField="ShareCount" HeaderText="ShareCount" SortExpression="ShareCount"></asp:BoundField>
              <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category"></asp:BoundField>
              <asp:BoundField DataField="PaidDate" HeaderText="PaidDate" SortExpression="PaidDate"></asp:BoundField>--%>
               <asp:TemplateField>
                                            <HeaderTemplate>
                                                Collection Name
                                            </HeaderTemplate>
                                            <HeaderStyle CssClass="" />
                                            <ItemTemplate>
                                                 <b id="collectionname" runat="server" class="  "> <%# Eval("Collection_Name").ToString %></b>
                                                <small class="blockquote-footer" id="nameholder" runat="server"><%# GetProfileDetails(Eval("userID").ToString) %></small>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderTemplate >
                                                Paid
                                            </HeaderTemplate>
                                            <HeaderStyle  CssClass="text-center "/>
                                            <ItemTemplate >
                                                 <b class=" badge badge-warning" id="duedate" runat="server"><%# CDate(Eval("PaidDate").ToString).ToString("dd-MMM-yy - hh:mm") %></b>
                                            </ItemTemplate>
                                            <ItemStyle CssClass="text-center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                Status
                                            </HeaderTemplate>
                                             <HeaderStyle  CssClass="text-center "/>
                                            <ItemTemplate>
                                                <b id="statushold" runat="server" class="  badge badge-warning card-text "><%# Eval("Status").ToString %></b>
                                            </ItemTemplate>
                                             <ItemStyle CssClass="text-center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                Collected
                                            </HeaderTemplate>
                                             <HeaderStyle  CssClass="text-center "/>
                                            <ItemTemplate>
                                                 <b id="loadbalance" runat="server" class=""> <%#"₦" & String.Format("{0:#,##0.##}", LoadBalance(Eval("CollectionID").ToString)) %></b><br />
                                                         <b id="B1" runat="server" class="invisible small"> <%# LoadBalance(Eval("CollectionID").ToString) %></b>
                                                 <b id="B3" runat="server" class=" invisible small"> <%# Eval("userID").ToString %></b>
                                            </ItemTemplate>
                                             <ItemStyle CssClass="text-center" />
                                        </asp:TemplateField>
                                       
                                             <asp:TemplateField>
                                            <HeaderTemplate>
                                               Shares
                                            </HeaderTemplate>
                                             <HeaderStyle  CssClass="text-center "/>
                                            <ItemTemplate>
                                                 <b id="sharescount" runat="server" class=""> <%#Eval("ShareCount").ToString %></b><br />
                                                   
                                            </ItemTemplate>
                                             <ItemStyle CssClass="text-center" />
                                        </asp:TemplateField>
                                        
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                View
                                            </HeaderTemplate>
                                             <HeaderStyle  CssClass="text-center "/>
                                            <ItemTemplate>
                                       
                                                <a href="https://www.kpolom.com/collector/share.aspx?collectionid=<%# Eval("CollectionID").ToString.Trim %>" class="btn btn-outline-primary btn-sm btn-block " target="_blank">View</a>
                                            </ItemTemplate>
                                             <ItemStyle CssClass="text-center" />
                                        </asp:TemplateField>
          </Columns>
      </asp:GridView>
      <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString='<%$ ConnectionStrings:kpolomDUMMYConnectionString %>' SelectCommand="SELECT * FROM [Collection_Details] WHERE ([Status] = @Status) ORDER BY [PaidDate] DESC">
          <SelectParameters>
              <asp:QueryStringParameter QueryStringField="PAID" DefaultValue="PAID" Name="Status" Type="String"></asp:QueryStringParameter>
          </SelectParameters>
      </asp:SqlDataSource>
  </div>
</div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:kpolomDUMMYConnectionString %>' SelectCommand="SELECT  * FROM [Collection_Details]  ORDER BY [CreatedDate] DESC">
         
        </asp:SqlDataSource>
</asp:Content>
