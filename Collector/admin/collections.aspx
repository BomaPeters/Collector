<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/admin/Site2.Master" CodeBehind="collections.aspx.vb" Inherits="Collector.collections" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="content">
         <div class="row mt-4">
            <div class=" col-md-10">
             <div class="card shadow borderwidth border-bottom border-primary border-top-0 border-left-0 border-right-0">
                         <div class="card-body">
                                <h5 class="text-primary mylinottefamily my-2 borderwidth border-bottom border-primary ">Collection</h5>
                             <div class="row">
<div class="col-md-10">
                             <div class=" input-group mt-3 mb-3">
                      <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" required="true"  Placeholder="Enter Collection ID"  AutoPostBack="True"  ></asp:TextBox>
                       <asp:LinkButton ID="LinkButton2" runat="server"  CssClass="btn btn-primary " ><i class="fa fa-user"></i> Details</asp:LinkButton>
                                 <asp:Label ID="Label1" runat="server" Text="Label" CssClass="alert alert-danger small fa" Visible="false"></asp:Label>
                  </div>

</div>
                                 </div>
                             </div>
                 </div>
                </div>
             </div>
             </div>
       <div class="content" id="detailshold" runat="server" >
            <div class="row mt-4">
            <div class=" col-md-10">
              <%--  <img src="../../img/collectionpic/mina.jpg" />--%>
             <div class="card shadow borderwidth border-bottom border-primary border-top-0 border-left-0 border-right-0">
                         <div class="card-body">
                              <h5 class="text-primary mylinottefamily my-2 borderwidth border-bottom border-primary ">Details</h5>
                             <div class="table-responsive mt-2">
                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped  text-center small" AutoGenerateColumns="False" DataKeyNames="CollectionID" DataSourceID="SqlDataSource1" GridLines="None" AllowPaging="true" PageSize="5">
                                <Columns>
                                  <%--  <asp:BoundField DataField="userID" HeaderText="userID" SortExpression="userID"></asp:BoundField>
                                    <asp:BoundField DataField="CollectionID" HeaderText="CollectionID" ReadOnly="True" SortExpression="CollectionID"></asp:BoundField>--%>
                     <%--               <asp:BoundField DataField="Collection_Name" HeaderText="Collection_Name" SortExpression="Collection_Name"></asp:BoundField>--%>
             <%--                       <asp:BoundField DataField="Collection_Desc" HeaderText="Collection_Desc" SortExpression="Collection_Desc"></asp:BoundField>--%>
                      <%--              <asp:BoundField DataField="Receiver_Acct_Number" HeaderText="Receiver_Acct_Number" SortExpression="Receiver_Acct_Number"></asp:BoundField>--%>
                            <%--        <asp:BoundField DataField="Receiver_Bank_Name" HeaderText="Receiver_Bank_Name" SortExpression="Receiver_Bank_Name"></asp:BoundField>--%>
                               <%--     <asp:BoundField DataField="Receiver_Name" HeaderText="Receiver_Name" SortExpression="Receiver_Name"></asp:BoundField>
                                    <asp:BoundField DataField="DueDate" HeaderText="DueDate" SortExpression="DueDate"></asp:BoundField>
                                    <asp:BoundField DataField="CreatedDate" HeaderText="CreatedDate" SortExpression="CreatedDate"></asp:BoundField>--%>
                                   <%-- <asp:BoundField DataField="Goal" HeaderText="Goal" SortExpression="Goal"></asp:BoundField>--%>
                                   
                                <%--    <asp:BoundField DataField="CashOutDate" HeaderText="CashOutDate" SortExpression="CashOutDate"></asp:BoundField>--%>
           <%--                         <asp:BoundField DataField="Profile_Pic_Link" HeaderText="Profile_Pic_Link" SortExpression="Profile_Pic_Link"></asp:BoundField>--%>
                               
                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            Details
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            

                                           <div class="card  shadow  borderwidth border-bottom border-primary border-top-0 border-left-0 border-right-0">
                                               <div class="card-body">
                                                <div class="row no-gutters">
                                                      <div class=" col-md-4">
  <img class="  card-img" src='<%# Eval("Profile_Pic_Link").ToString %>'  /> <%--"../" &--%>
                                                          <div class="row   my-2">
                                                              <div class="col">
                                                                  <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-outline-primary btn-sm btn-block " CommandName="sharer" >Share</asp:LinkButton>
                                                                 
                                                              </div>
                                                                <div class="col">
                                                                    <asp:LinkButton ID="LinkButton3" runat="server" CssClass="btn btn-outline-danger btn-sm btn-block" CommandName="casher" OnClientClick="return confirm('WARNING: Cashing-Out this collection will close it and new donations will not be allowed after you cash out.Click OK to continue.');">CashOut</asp:LinkButton>
                                                                   
                                                                </div>
                                                          </div>
                                                </div>
                                                <div class=" col-md-8">
                                                   
  <h5 id="collectionamehold" runat="server" class="card-title colorawesomblue"><%# Eval("Collection_Name").ToString %></h5>
                                                    <%--  <h6 class=" card-subtitle"><%# Eval("Receiver_Name").ToString %>
                                                    </h6>--%>
                                                    <p class="card-text">
                                                         <span class="  fa-stack">
                                                      <i class="fa fa-circle fa-stack-2x text-primary"></i>
                                                      <i class="fa  fa-user fa-stack-1x fa-inverse"></i>
                                                  </span>
                                                        <%# Eval("Receiver_Name").ToString %>
                                                        <small class="blockquote-footer" id="bankname" runat="server"><%# Eval("Receiver_Bank_Name").ToString %></small>
                                                    </p>
                                                    <p>
                                                        <b class="">
          <asp:Label ID="Label2" runat="server" Text='<%# "₦" & String.Format("{0:#,##0.##}", LoadBalance(Eval("CollectionID").ToString)) %>' CssClass=" font-weight-bold text-dark"></asp:Label> <small>collected for goal of <b id="goalhold" > <%#"₦" & String.Format("{0:#,##0.##}", CSng(Eval("Goal").ToString)) %></b> </small>

  </b>
                                <div class="progress  w-75 mx-auto" style="height:10px">
  <div id="rangeholder" runat="server" class="progress-bar bg-info" role="progressbar" style="width:60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                   
                                   
</div>
                                                        
                                                      
                                                    </p>
                                               
                                                    <div class="row   mx-auto">
                                                        <div class="col-4">
                                                              <small>Status</small><br />
 <b id="statushold" runat="server" class="  badge badge-warning card-text "><%# Eval("Status").ToString %></b>
                                                          
                                                        </div>
                                                        <div class="col-4">
                                                            <small>Created</small><br />
                                                             <b class=" badge badge-warning card-text"><%#CDate(Eval("CreatedDate").ToString).ToString("dd-MMM-yy") %></b>
                                                            
                                                        </div>
                                                        <div class="col-4">
                                                             <small>Due</small><br />
                                                             <b class=" badge badge-warning" id="duedate" runat="server"><%# CDate(Eval("DueDate").ToString).ToString("dd-MMM-yy") %></b>
                                                        </div>
                                                    </div>
                                             <b id="goalholder" runat="server" class="invisible"><%# CDbl(Eval("Goal").ToString) %></b>
                                    <b id="loadbalance" runat="server" class="invisible"><%# LoadBalance(Eval("CollectionID").ToString) %></b>
                                     <b id="receivername" runat="server" class="invisible"><%# Eval("Receiver_Name").ToString %></b>
                                     <b id="receiveracctno" runat="server" class="invisible"><%# Eval("Receiver_Acct_Number").ToString %></b>
                                           <b id="collectionID" runat="server" class= "invisible"><%# Eval("CollectionID").ToString %></b>
                                    <asp:Label ID="Label4" runat="server" Visible="false" Text='<%# Eval("CollectionID").ToString %>'></asp:Label>
                                    <input type="text" value="<%# Eval("CollectionID").ToString %>" id="Text1"  class="invisible" />
                                                </div>
                                              
                                            </div>

                                               </div>
                                           </div>
                                        </ItemTemplate>
                                        
                                    </asp:TemplateField>
                                    
                                   <%-- <asp:TemplateField>
                                   <HeaderTemplate>Financials</HeaderTemplate>
                                   <ItemTemplate>
                                                                           <b class="">
          <asp:Label ID="Label1" runat="server" Text='<%# "₦" & String.Format("{0:#,##0.##}", LoadBalance(Eval("CollectionID").ToString)) %>' CssClass=" font-weight-bold text-dark"></asp:Label> <small>collected for goal of <b id="goalhold" > <%#"₦" & String.Format("{0:#,##0.##}", CSng(Eval("Goal").ToString)) %></b> .</small></b>
                                <div class="progress  w-100" style="height:5px">
  <div id="rangeholder" runat="server" class="progress-bar bg-info" role="progressbar" style="width:60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>

                                    <b id="goalholder" runat="server" class="invisible"> <%# CDbl(Eval("Goal").ToString) %></b>
                                    <b id="loadbalance" runat="server" class="invisible"> <%# LoadBalance(Eval("CollectionID").ToString) %></b>
</div>
                                   </ItemTemplate>
                               </asp:TemplateField>--%>
                                   <%--  <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status"></asp:BoundField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn  btn-outline-danger btn-sm">CashOut</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                    </Columns>
                                <PagerStyle CssClass="pagination-ys" />
                            </asp:GridView>
                               <div class="alert   alert-danger alert-dismissible fade show mt-3" role="alert" id="verifier" runat="server" visible="false">
  <strong>WARNING!</strong>  You currently do not have any collection round.Create <a href="createcollection.aspx" class="font-weight-bold">now</a> to get started.
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>

                               

                           </div>
                             </div>
                 </div>
                </div>
                </div>
           </div>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:kpolomDUMMYConnectionString %>' SelectCommand="SELECT * FROM [Collection_Details] WHERE ([CollectionID] = @userID) ORDER BY [CreatedDate] DESC">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="userID" Type="String"></asp:ControlParameter>

        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
