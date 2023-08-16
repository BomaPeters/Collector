<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/admin/Site2.Master" CodeBehind="customerprofile.aspx.vb" Inherits="Collector.customerprofile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">
         <div class="row mt-4">
            <div class=" col-md-10">
             <div class="card shadow borderwidth border-bottom border-primary border-top-0 border-left-0 border-right-0">
                         <div class="card-body">
                                <h5 class="text-primary mylinottefamily my-2 borderwidth border-bottom border-primary ">Profile</h5>
                             <div class="row">
<div class="col-md-6">
                             <div class=" input-group mt-3 mb-3">
                      <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" required="true"  Placeholder="Search with PhoneNumber"  AutoPostBack="True"  onkeyup="losefocus();" onpaste="losefocus(); " onkeypress="return CheckNumeric()" ></asp:TextBox>
                       <asp:LinkButton ID="LinkButton2" runat="server"  CssClass="btn btn-primary " Visible="false"><i class="fa fa-user"></i> Details</asp:LinkButton>
                                 <asp:Label ID="Label1" runat="server" Text="Label" CssClass="alert alert-danger small fa" Visible="false"></asp:Label>
                  </div>

</div>
                                 <div class="col-md-6">
                                     <a href="allmembers.aspx" class="btn btn-primary btn-block mt-lg-3"><i class="fa fa-users"></i> View All Users</a>
                                 </div>
                             </div>
                         </div>
                     </div>


                </div>
             </div>
         </div>

    <div class="content" id="detailshold" runat="server" visible="false">
            <div class="row mt-4">
            <div class=" col-md-10">
             <div class="card shadow borderwidth border-bottom border-primary border-top-0 border-left-0 border-right-0">
                         <div class="card-body">
                              <h5 class="text-primary mylinottefamily my-2 borderwidth border-bottom border-primary ">Details</h5>
                             <asp:Label ID="Label2" runat="server" Text="Label" CssClass=" badge badge-primary small my-2 p-2"></asp:Label>
                             <asp:Label ID="Label3" runat="server" Text="Label" CssClass=" badge badge-success small my-2 p-2"></asp:Label>
        <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Firstname:</label>
                                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" required="true"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Lastname:</label>
                                        <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" required="true"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                             <div class="row">
                                 <div class="col-md-6">
                                     <div class="form-group">
                                        <label>PhoneNumber:</label>
                                        <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                    </div>
                                 </div>
                                 <div class="col-md-6 ">
                            <div class="form-group">
                                        <label>Email Address:</label>
                                        <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                    </div>

                                 </div>
                             </div>
                           


                                 <div class="table-responsive">
                                    <asp:GridView ID="GridView1" runat="server" CssClass="table" GridLines="None" AutoGenerateColumns="False" DataKeyNames="CollectionID" DataSourceID=""  HeaderStyle-CssClass="bg-primary fa-inverse" AllowPaging="true" PageSize="5">
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
                                               
                                               
                                                <hr />
                                                  <span class="">
                                                             <b><span class="badge badge-light p-2"><i class="fa fa-university"></i></span> <%# Eval("Receiver_Acct_Number").ToString %></b>-<small><%# Eval("Receiver_Bank_Name").ToString %></small><br />
                                                       
                                                 </span>
                                                      
                                                           <b class="badge badge-light p-3"><i class="fa fa-user"></i> <%# Eval("Receiver_Name").ToString %></b>
                                                      
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderTemplate >
                                                Due
                                            </HeaderTemplate>
                                            <HeaderStyle  CssClass="text-center "/>
                                            <ItemTemplate >
                                                 <b class=" badge badge-warning  p-2" id="duedate" runat="server"><%# CDate(Eval("DueDate").ToString).ToString("dd-MMM-yy") %></b>

                                                
                                            </ItemTemplate>
                                            <ItemStyle CssClass="text-center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                Status
                                            </HeaderTemplate>
                                             <HeaderStyle  CssClass="text-center "/>
                                            <ItemTemplate>
                                                <b id="statushold" runat="server" class="  badge badge-warning card-text p-2 "><%# Eval("Status").ToString %></b><br />
                                                   <small id="paiddate" runat="server" class="blockquote-footer badge  badge-success badge-pill"><i class="fa fa-calendar-check"></i> <%# CDate(Eval("CreatedDate").ToString).ToString("dd-MMM-yy") %></small>
                                                
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
                                                         <b id="B1" runat="server" class="invisible"> <%# LoadBalance(Eval("CollectionID").ToString) %></b>
                                            </ItemTemplate>
                                             <ItemStyle CssClass="text-center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                               Shares
                                            </HeaderTemplate>
                                             <HeaderStyle  CssClass="text-center "/>
                                            <ItemTemplate>
                                                 <b id="sharescount" runat="server" class=""> <%#Eval("ShareCount").ToString %></b><br class="border-bottom border-primary" />
                                                   
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
                                     </div>
                             </div>
                 </div>
                </div>
                </div>

          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:kpolomDUMMYConnectionString %>' SelectCommand="SELECT * FROM [Collection_Details] WHERE ([userID] = @userID) ORDER BY [CreatedDate] DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="Label2" PropertyName="Text" Name="userID" Type="String"></asp:ControlParameter>

            </SelectParameters>
        </asp:SqlDataSource>
    </div>
       <script type="text/javascript">
        function losefocus() {

            var text = document.getElementById('<%=TextBox1.ClientID%>');
            if (text != null && text.value.length > 10) {
                text.blur();

            }
        }
       </script>
</asp:Content>
