<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/secured/Site1.Master" CodeBehind="Dashboard.aspx.vb" Inherits="Collector.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .borderwidth{ border-bottom-width:5px !important; }
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
        <div class="row mt-4">
            <div class=" col-md-11  back ">
                    <h5 class=" colorawesomblue mylinottefamily my-2 borderwidth border-bottom border-customblue ">Dashboard</h5>
               
                <div class="row mt-3">
                    <div class="  col-md-3 mb-2">
                        <div class="card shadow p-3 borderwidth border-bottom border-customblue border-top-0 border-left-0 border-right-0">
                            <div class="card-body">
                             
                                <div class="row">
                                    <div class="col-4  text-center">
                                        <i class="fa  fa-angle-double-up fa-2x colorawesomblue"></i>
                                    </div>
                                     <div class="col-8">
                                         <h6 class="mb-0" id="collectionscount" runat="server">0</h6>
                                         <small class="text-muted mt-0">Collections</small>
                                     </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    <div class="  col-md-3 mb-2">
                        <div class="card  shadow p-3 borderwidth border-bottom border-customblue  border-top-0 border-left-0 border-right-0">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-4  text-center">
                                        <i class="fa  fa-angle-double-down fa-2x colorawesomblue"></i>
                                    </div>
                                     <div class="col-8">
                                         <h6 class="mb-0" id="totalcollected" runat="server">0</h6>
                                         <small class="text-muted mt-0">Total Collected</small>
                                     </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="  col-md-3 mb-2">
                        <div class="card shadow p-3 borderwidth border-bottom border-customblue border-top-0 border-left-0 border-right-0">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-4  text-center">
                                        <i class="fa fa-gifts fa-2x colorawesomblue"></i>
                                    </div>
                                     <div class="col-8">
                                         <h6 class="mb-0" id="donationcnt" runat="server">0</h6>
                                         <small class="text-muted mt-0">Total Donations</small>
                                     </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="  col-md-3 mb-2">
                        <div class="card shadow p-3 borderwidth border-bottom  border-customblue border-top-0 border-left-0 border-right-0">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-4  text-center">
                                        <i class="fa   fa-clipboard-list fa-2x colorawesomblue"></i>
                                    </div>
                                     <div class="col-8">
                                         <h6 class="mb-0" id="duesCount" runat="server">0</h6>
                                         <small class="text-muted mt-0">Dues</small>
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
                        <div class="card h-100 shadow p-3 borderwidth border-bottom border-customblue border-top-0 border-left-0 border-right-0">
                            <div class="card-body">

                                <div class="table-responsive">
                                    <asp:GridView ID="GridView1" runat="server" CssClass="table small" GridLines="None" AutoGenerateColumns="False" DataKeyNames="CollectionID" DataSourceID="SqlDataSource1"  HeaderStyle-CssClass="  backgroundawesomeblue fa-inverse" AllowPaging="true" PageSize="5">
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
                                                <small class="blockquote-footer"><%# CDate(Eval("CreatedDate").ToString).ToString("dd-MMM-yy") %></small>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                Type
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                 <b id="typehold" runat="server" class="  "> <%# Eval("Type").ToString %></b>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderTemplate >
                                                Due
                                            </HeaderTemplate>
                                            <HeaderStyle  CssClass="text-center "/>
                                            <ItemTemplate >
                                                 <b class=" badge badge-warning" id="duedate" runat="server"><%# CDate(Eval("DueDate").ToString).ToString("dd-MMM-yy") %></b>
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
                                                 <b id="loadbalance" runat="server" class=""> <%#"₦" & String.Format("{0:#,##0.##}", LoadBalance(Eval("CollectionID").ToString)) %></b>
                                   
                                            </ItemTemplate>
                                             <ItemStyle CssClass="text-center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                View
                                            </HeaderTemplate>
                                            <HeaderStyle  CssClass="text-center "/>
                                            <ItemTemplate>
                                            <div class="d-flex flex-row">
                                                      <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" CssClass="btn btn-outline-primary btn-sm small mx-1" ><i class="fa fa-eye"></i>  </asp:HyperLink> <a href="mycollections.aspx" class="btn btn-outline-primary btn-sm small"><i class="fa  fa-pen"></i></a>
                                            </div>
                                          
                                            </ItemTemplate>
                                             <ItemStyle CssClass="text-center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField Visible="false">
                                            <ItemTemplate>
                                                <b id="B3" runat="server" class="invisible"> <%# Eval("CollectionID").ToString %></b>
                                                                 <b id="B1" runat="server" class="invisible"> <%# LoadBalance(Eval("CollectionID").ToString) %></b> 
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

                                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="CollectionID" DataSourceID="SqlDataSource1" CssClass="d-none  " ShowFooter="true"> <%--d-none--%>
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
                                                 <b id="B3" runat="server" class=""> <%# Eval("Type").ToString %></b>
                                            </ItemTemplate>
                                             <ItemStyle CssClass="text-center" />
                                               
                                        </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:kpolomDUMMYConnectionString %>' SelectCommand="SELECT * FROM [Collection_Details] WHERE ([userID] = @userID) ORDER BY [CreatedDate] DESC">
            <SelectParameters>
                <asp:SessionParameter SessionField="CID" Name="userID" Type="String"></asp:SessionParameter>
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
