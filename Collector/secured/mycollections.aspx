<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/secured/Site1.Master" CodeBehind="mycollections.aspx.vb" Inherits="Collector.mycollections" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script src="https://cdn.tiny.cloud/1/sqrl76w4glb4feaqhngv59adhj4ju6j4jqboi07ibwomlc27/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>

    <style>
        .backcolorblue{ background-color:#1CADE4 !important;}
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
                <div class="col-md-10">
                    
                    <div class="card mt-4">
                        <div class="card-body">
                             <h5 class=" colorawesomblue mylinottefamily my-2 borderwidth border-bottom  border-customblue ">My Collections</h5>
                        
                             <button type="button" class=" invisible " data-toggle="modal" data-target="#staticBackdrop" id="myclick">SHARE</button>
                           
                            <div class="row d-sm-none  d-lg-none">
         <div class="col-sm-6">
             <span class="small"><i class="fa fa-arrow-left"></i> Swipe left to see more</span>
         </div>
     </div>
                            <ul class="nav   nav-pills" id="myTab" role="tablist">
  <li class="nav-item" role="presentation">
    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Active</a>
  </li>
  <li class="nav-item" role="presentation">
    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Paid</a>
  </li>
 <%-- <li class="nav-item" role="presentation">
    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">Paid</a>
  </li>--%>
</ul>
<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                           <div class="table-responsive mt-2">
                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped  text-center small" AutoGenerateColumns="False" DataKeyNames="CollectionID" DataSourceID="SqlDataSource1" GridLines="None" AllowPaging="true" PageSize="5">
                                <Columns>
                                    <asp:TemplateField>
                                        <HeaderTemplate >
                                            Details
                                        </HeaderTemplate>
                                        
                                        <ItemTemplate>
                                            

                                           <div class="card  shadow  borderwidth border-bottom border-customblue border-top-0 border-left-0 border-right-0">
                                            
                                               <div class="card-body">
                                                <div class="row no-gutters">
                                                      <div class=" col-md-4">
  <img class="  card-img" src='<%# Eval("Profile_Pic_Link").ToString %>'  />
                                           <%--               <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Profile_Pic_Link").ToString %>' />--%>
                                                        <%--  <p><%# Eval("Profile_Pic_Link").ToString %></p>--%>
                                                          <div class="row   my-2">
                                                              <div class="col">
                                                                  <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-outline-primary btn-sm btn-block " CommandName="sharer" >Share</asp:LinkButton>
                                                                 
                                                              </div>
                                                                <div class="col">
                                                                    <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-outline-danger btn-sm btn-block" CommandName="casher" >CashOut</asp:LinkButton>
                                                                   
                                                                </div>
                                                          </div>
                                                           <asp:LinkButton ID="LinkButton3" runat="server" CommandName="editor" CssClass="btn btn-warning btn-block my-2"><i class="fa fa-edit"></i> Edit Collection</asp:LinkButton>
                                                </div>
                                                <div class=" col-md-8">
                                                 <div class=" row">
                                                    <div class=" col-lg-8 col-7"></div>
                                                     <div class=" col-lg-4 col-5">
                                                           <small>Type: </small><p class="badge  badge-warning  mb-0 mr-0 p-1" style=""  id="typeholder" runat="server"><i class="fa  fa-arrow-alt-circle-right"></i> <%# Eval("Type").ToString %></p>
                                                     </div>
                                                 </div>
  <h5 id="collectionamehold" runat="server" class="card-title colorawesomblue mylinottefamily "><%# Eval("Collection_Name").ToString %></h5>
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
                                                    <p class="mb-0">
                                                        <b >
          <asp:Label ID="Label1" runat="server" Text='<%# "₦" & String.Format("{0:#,##0.##}", LoadBalance(Eval("CollectionID").ToString)) %>' CssClass=" font-weight-bold text-dark"></asp:Label> <small id="smallinbetween" runat="server">collected for goal of</small><small> <b id="goalhold" > <%#"₦" & String.Format("{0:#,##0.##}", CSng(Eval("Goal").ToString)) %></b> <span id="innerPart" runat="server">per payment.</span> </small>

  </b>
                                <div class="progress  w-75 mx-auto" style="height:10px" id="rangecontainer" runat="server">
  <div id="rangeholder" runat="server" class="progress-bar  backgroundawesomeblue" role="progressbar" style="width:60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                   
                                   
</div>
                                                        
                                                   
                                                    </p>
                                                    <div class="d-flex flex-row  justify-content-center mb-1" id="raiseanddeductHold" runat="server">
                                                        <div class=" mx-lg-3 mx-2 p-1">
                                                             <small>Raised</small><br />
                                                             <b class=" badge badge-primary card-text p-1" id="Raised" runat="server"></b>
                                                           
                                                        </div>
                                                        <div class="mx-lg-3 mx-2 p-1">
                                                             <small>Withdrawn</small><br />
                                                             <b class=" badge  badge-danger card-text p-1" id="Deducted"  runat="server"></b>
                                                           
                                                        </div>
                                                    </div>
                                                    
                                                    <p class=" d-flex  flex-row justify-content-center">
                                                           <asp:LinkButton ID="LinkButton4" runat="server" CssClass="btn btn-outline-primary btn-sm small font-4xl"  CommandName="Adder"><i class="fa fa-plus-circle"></i> Add Participants</asp:LinkButton> 
                                                          <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" CssClass="btn  btn-outline-primary btn-sm small mx-1" ><i class="fa fa-eye "></i>  </asp:HyperLink>
                                                    </p>
                                               
                                                    <div class="row   mx-auto">
                                                        <div class="col-4">
                                                              <small>Status</small><br />
 <b id="statushold" runat="server" class="  badge badge-warning card-text p-1 "><%# Eval("Status").ToString %></b>
                                                          
                                                        </div>
                                                        <div class="col-4">
                                                            <small>Created</small><br />
                                                             <b class=" badge badge-warning card-text p-1"><%#CDate(Eval("CreatedDate").ToString).ToString("dd-MMM-yy") %></b>
                                                            
                                                        </div>
                                                        <div class="col-4">
                                                             <small>Due</small><br />
                                                             <b class=" badge badge-warning p-1" id="duedate" runat="server"><%# CDate(Eval("DueDate").ToString).ToString("dd-MMM-yy") %></b>
                                                        </div>
                                                    </div>
                                                   
                                            
                                                </div>
                                              
                                            </div>

                                               </div>
                                           </div>
                                        </ItemTemplate>
                                        
                                    </asp:TemplateField>
                                    <asp:TemplateField Visible="false">
                                        <ItemTemplate>
                                             <b id="goalholder" runat="server" class="invisible"><%# CDbl(Eval("Goal").ToString) %></b>
                                    <b id="loadbalance" runat="server" class="invisible"><%# LoadBalance(Eval("CollectionID").ToString) %></b>
                                     <b id="receivername" runat="server" class="invisible"><%# Eval("Receiver_Name").ToString %></b>
                                     <b id="receiveracctno" runat="server" class="invisible"><%# Eval("Receiver_Acct_Number").ToString %></b>
                                           <b id="collectionID" runat="server" class= "invisible"><%# Eval("CollectionID").ToString %></b>
                                                       <b id="collectiondesc" runat="server" class= "invisible"><%# Eval("Collection_Desc").ToString %></b>
                                                       <b id="Category" runat="server" class= "invisible"><%# Eval("Category").ToString %></b>
                                    <asp:Label ID="Label4" runat="server" Visible="false" Text='<%# Eval("CollectionID").ToString %>'></asp:Label>
                                    <input type="text" value="<%# Eval("CollectionID").ToString %>" id="Text1"  class="invisible" />
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
                                <HeaderStyle CssClass=" backgroundawesomeblue  fa-inverse rounded" />
                            </asp:GridView>
                               <div class="alert   alert-danger alert-dismissible fade show mt-3" role="alert" id="verifier" runat="server" visible="false">
  <strong>WARNING!</strong>  You currently do not have any collection round.Create <a href="createcollection.aspx" class="font-weight-bold">now</a> to get started.
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>

                               

                           </div>


  </div>
  <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">

      <div class="card h-100 shadow p-3 borderwidth border-bottom  border-customblue border-top-0 border-left-0 border-right-0 mt-2 rounded">
          <div class="card-body">
              <div class="table-responsive">
                  <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="CollectionID" DataSourceID="SqlDataSource2" CssClass=" table small text-center" GridLines="None" HeaderStyle-CssClass=" backgroundawesomeblue fa-inverse rounded" AllowPaging="True" PageSize="5">

                  <Columns>
                     <%-- <asp:BoundField DataField="userID" HeaderText="userID" SortExpression="userID"></asp:BoundField>
                      <asp:BoundField DataField="CollectionID" HeaderText="CollectionID" ReadOnly="True" SortExpression="CollectionID"></asp:BoundField>--%>
                      <asp:BoundField DataField="Collection_Name" HeaderText="Collection Name" SortExpression="Collection_Name"></asp:BoundField>
                  <%--    <asp:BoundField DataField="Collection_Desc" HeaderText="Collection_Desc" SortExpression="Collection_Desc"></asp:BoundField>--%>
                    <%--  <asp:BoundField DataField="Receiver_Acct_Number" HeaderText="Receiver_Acct_Number" SortExpression="Receiver_Acct_Number"></asp:BoundField>
                      <asp:BoundField DataField="Receiver_Bank_Name" HeaderText="Receiver_Bank_Name" SortExpression="Receiver_Bank_Name"></asp:BoundField>
                      <asp:BoundField DataField="Receiver_Name" HeaderText="Receiver_Name" SortExpression="Receiver_Name"></asp:BoundField>
                      <asp:BoundField DataField="DueDate" HeaderText="DueDate" SortExpression="DueDate"></asp:BoundField>
                      <asp:BoundField DataField="CreatedDate" HeaderText="CreatedDate" SortExpression="CreatedDate"></asp:BoundField>
                      <asp:BoundField DataField="Goal" HeaderText="Goal" SortExpression="Goal"></asp:BoundField>
                      <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status"></asp:BoundField>
                      <asp:BoundField DataField="CashOutDate" HeaderText="CashOutDate" SortExpression="CashOutDate"></asp:BoundField>
                      <asp:BoundField DataField="Profile_Pic_Link" HeaderText="Profile_Pic_Link" SortExpression="Profile_Pic_Link"></asp:BoundField>
                      <asp:BoundField DataField="ShareCount" HeaderText="ShareCount" SortExpression="ShareCount"></asp:BoundField>
                      <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category"></asp:BoundField>--%>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Type
                        </HeaderTemplate>
                        <ItemTemplate>
                                   <b id="Type" runat="server" class= " badge badge-warning"><%# Eval("Type").ToString %></b>
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField>
                          <HeaderTemplate>
                              Raised
                          </HeaderTemplate>
                          <ItemTemplate>
                              <asp:Label ID="Label2" runat="server" Text="" CssClass=""></asp:Label>
                          </ItemTemplate>
                      </asp:TemplateField>
                      <asp:TemplateField>
                          <HeaderTemplate>
                              Paid
                          </HeaderTemplate>
                          <ItemTemplate>
                              <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                          </ItemTemplate>
                      </asp:TemplateField>
                                                       <asp:TemplateField Visible="false">
                                        <ItemTemplate>

                                           <b id="collectionID" runat="server" class= "invisible"><%# Eval("CollectionID").ToString %></b>
                                     
                                            </ItemTemplate>
                                                           </asp:TemplateField>
                      <asp:BoundField DataField="PaidDate" HeaderText="PaidDate" SortExpression="PaidDate" DataFormatString="{0:dd-MMM-yy}"></asp:BoundField>
                  
                                            </Columns>
                      <PagerStyle CssClass="pagination-ys" />
              </asp:GridView>
              </div>
              <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:kpolomDUMMYConnectionString %>' SelectCommand="SELECT * FROM [Collection_Details] WHERE (([Status] = @Status) AND ([userID] = @userID)) ORDER BY [PaidDate] DESC">
                  <SelectParameters>
                      <asp:QueryStringParameter QueryStringField="PAID" DefaultValue="PAID" Name="Status" Type="String"></asp:QueryStringParameter>
                      <asp:SessionParameter SessionField="CID" Name="userID" Type="String"></asp:SessionParameter>
                  </SelectParameters>
              </asp:SqlDataSource>
          </div>
      </div>

  </div>
<%--  <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">...</div>--%>
</div>

                            </div>
                        </div>
                    </div>
                </div>
         </div>
    <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title text-center" id="staticBackdropLabel"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body ">
        <div class="card">
                                                  
<div class="card-body ">
 
  <h3>Help by Sharing</h3>
    <p class="text-muted">Collections that are shared on social media raise more money</p>

        <ul class="list-group list-group-flush">
            <li class="list-group-item">
             
              
               <%-- <input type="button" onclick="updateme();" value="hey" />--%>
               <%--   <button onclick=""></button>--%>
                <a href="#" id="facebookshare" runat="server" target="_blank" ><i class=" fab  fa-facebook  "></i> Facebook</a>
             <%--  onclick="share();updateme();"--%>
            </li>
            <li class="list-group-item">
               
             <%--   <a id="kok"  href="http://www.facebook.com/sharer/sharer.php?u=https://kpolom.com/"  target="_blank" class="">Share on Facebook work</a>--%>
            <%-- http://www.facebook.com/sharer/sharer.php?u=URL_HERE&t=TITLE_HERE--%>
               <a href="#" id="twittershare" runat="server" target="_blank"><i class="   fab  fa-twitter-square  "></i> Twitter</a>
            </li>
               <li class="list-group-item">
               

               <a href="#"><i class="  fab   fa-whatsapp  "></i> </a>
                   <a href="#" id="whatsappshare" runat="server" onclick="updateme();" target="_blank">Share on Whatsapp</a>
            </li>
             <li class="list-group-item">
             
          <div class="input-group">
              <input id="Text1" type="text" class="form-control" runat="server" /><div class="input-group-append">
                  <button  class="btn btn-sm btn-success" onclick="copyclip();"><i class="fa fa-clipboard"></i> Copy Link</button>
                                              </div>
          </div>

                 <asp:ScriptManager ID="ScriptManager1" runat="server" ></asp:ScriptManager>   
                 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                     <ContentTemplate>
 <asp:Button ID="Button2" runat="server" Text="Button" CssClass="invisible" />
                     </ContentTemplate>
                 </asp:UpdatePanel>
            </li>
        </ul>      
    <br />
                              

          
          
              
                                       
</div>
                                                </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
         
       <%-- <button type="button" class="btn btn-primary">Understood</button>--%>
      </div>
    </div>
  </div>
</div>
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <!-- Button trigger modal -->
<button type="button" class="btn btn-primary invisible" data-toggle="modal" data-target="#staticBackdrop22" id="myclick2">
  Launch static backdrop modal
</button>
    <button type="button" class="btn btn-primary invisible" data-toggle="modal" data-target="#staticBackdrop2" id="myclick3">
  Launch static backdrop modal
</button>
      <button type="button" class="btn btn-primary invisible" data-toggle="modal" data-target="#staticBackdrop11" id="myclick4">
  Launch static backdrop modal
</button>
<!-- Modal -->
<div class="modal fade" id="staticBackdrop22" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel22" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header   backcolorblue ">
        <h5 class="modal-title fa-inverse" id="staticBackdropLabel22">Edit Collection</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="card  border-customblue">
            <div class="card-body">
             <p class="mb-2">
                   <small>ID:</small> <asp:Label ID="Label5" runat="server" Text="Label" CssClass="badge badge-primary"></asp:Label>
             </p>
                <div class="form-group">
                            <label class="small">Purpose for Collection </label>
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" MaxLength="50"  ></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label class="small">Collection Type</label>
                            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control ">

                          <%--      <asp:ListItem>Medical</asp:ListItem>
                                <asp:ListItem>Emergency</asp:ListItem>
                                <asp:ListItem>Education</asp:ListItem>
                                <asp:ListItem>Religious</asp:ListItem>
                                <asp:ListItem>Burial</asp:ListItem>
                                  <asp:ListItem>Business</asp:ListItem>
                                <asp:ListItem>Celebration</asp:ListItem>
                                <asp:ListItem>Find-Me-Something</asp:ListItem>--%>
                            </asp:DropDownList>

                        </div>
                <div class="row">
                            <div class=" col-md">
                                <div class="form-group">
                                    <label class="small">DueDate <small>(Collection expires by this date)</small> </label>
                                    <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" TextMode="Date"  onblur="return checkDate();"></asp:TextBox>
                                </div>
                            </div>
                            <div class=" col-md">
                                <div class="form-group">
                                    <label class="small">Goal <small>(how much you hope to raise)</small> </label>
                                    <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" onkeypress="return CheckNumeric()" onkeyup="FormatCurrency(this)"  MaxLength="10" TextMode="Phone"></asp:TextBox>

                  
                                </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="small">Description <small class="text-muted">(why people should donate)</small></label>
                                <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4"   ClientIDMode="Static"  ></asp:TextBox>
                               <span id="spanDisplay"></span><span id="spammer"></span>
                            </div>
            </div>
        </div>
      </div>
      <div class="modal-footer">
            <asp:Button ID="Button1" runat="server"  CssClass="btn btn-primary btn-block" Text="Update" />
           <button type="button" class="btn  btn-outline-danger btn-block" data-dismiss="modal"><i class="  fas  fa-times"></i> Close</button>
        
          <%--<div class="row">
<div class="col-md">
     
</div>
              <div class="col-md">
                     
              </div>

          </div>--%>
      
      
       
      </div>
    </div>
  </div>
</div>

    <div class="modal fade" id="staticBackdrop2" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header  backgroundawesomeblue">
        <h6 class="modal-title text-center text-white" id="staticBackdropLabel2">Add Member</h6>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body ">
        <div class="card">
          <div class="card-header   backgroundawesomeblue border border-customblue">
                <h6 class="text-white  mylinotte">Enter Member Details</h6>
          </div>                                        
<div class="card-body ">
 <div class=" form-group">
    ID: <asp:Label ID="Label6" runat="server" Text="Label" CssClass="badge badge-primary"></asp:Label>
 </div>

   <%-- <p class="text-muted">Collections that are shared on social media raise more money</p>--%>
    <div class="form-group">
        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Placeholder="Enter Firstname"  MaxLength="20"></asp:TextBox>
    </div>
   
             <div class="form-group">
        <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" Placeholder="Enter Lastname"  MaxLength="20"></asp:TextBox>
    </div>                 

          <div class="form-group">
        <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control" Placeholder="Enter PhoneNumber" TextMode="Phone"  MaxLength="15" onkeypress="return CheckNumeric();"></asp:TextBox>
    </div>
        <div class="form-group">
        <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control" Placeholder="Enter Email Address" TextMode="Email" MaxLength="50"></asp:TextBox>
    </div>
          
              
                                       
</div>
                                                </div>
      </div>
      <div class="modal-footer">
          <asp:Button ID="Button3" runat="server" Text="Add"  CssClass="btn   btn-outline-primary"/>
        <button type="button" class="btn btn-outline-danger" data-dismiss="modal"><i class="  fas  fa-times"></i> Close</button>
         
       <%-- <button type="button" class="btn btn-primary">Understood</button>--%>
      </div>
    </div>
  </div>
</div>
    
   <div class="modal fade" id="staticBackdrop11" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel11" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header   backcolorblue ">
        <h5 class="modal-title fa-inverse" id="staticBackdropLabel11">Withdraw</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body mygrey">
        <div class="card ">
            <div class="card-body">
             
                   

                <div class="row">
                    <div class="col">
                        <p class="mb-2">
                   <small>ID:</small><br /> <asp:Label ID="Label7" runat="server" Text="Label" CssClass="badge badge-primary p-2"></asp:Label>
             </p>
                    </div>
                        <div class="col">
                            <p class="mb-2">
                   <small>Available:</small><br /> <asp:Label ID="Label8" runat="server" Text="Label" CssClass="badge  badge-warning p-2 "></asp:Label>
             </p>
                        </div>
                </div>
                <div class="form-group">
                            <label class="small">Enter Amount to Withdraw </label>
                            <asp:TextBox ID="TextBox9" runat="server" CssClass="form-control border-customblue"  onkeypress="return CheckNumeric()" onkeyup="FormatCurrency(this);calccharge();"  MaxLength="10" TextMode="Phone" Placeholder="Enter Amount" ></asp:TextBox>
                        </div>
                <div class="card  marginsetter   mb-3 shadow-sm">
                        <div class="card-body ">
                            <div class="row">
                                <div class="col text-center ">
                                    <h6 class=" mylinotte" id="payable" runat="server"  >0</h6>
                                    <small>Amt. Deductable(₦)</small>
                                </div>
                                 <div class="col border-left text-center border-customblue"> <h6 class="mylinotte" id="chargeholder" runat="server">0</h6>
                                     <small>Charge(1%)</small>
                                 </div>
                                  
                            </div>
                        </div>
                    </div>
                        
                 <asp:Button ID="Button4" runat="server"  CssClass="btn btn-primary btn-block" Text="Withdraw" />
           <button type="button" class="btn  btn-outline-danger btn-block" data-dismiss="modal"><i class="  fas  fa-times"></i> Close</button>
        <small id="banknameSmall" runat="server" class="invisible"></small><small id="acctNumsmall" runat="server" class="invisible"></small>
                <small id="AcctnameSmall" runat="server" class="invisible"></small>

                            
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
       <script type="text/javascript">
        
        
           function callme() {

               //$("#staticBackdrop").modal("show");
               document.getElementById('myclick').click();
           }
           function callme2() {

               //$("#staticBackdrop").modal("show");
               document.getElementById('myclick2').click();
           }
           function callme3() {

               //$("#staticBackdrop").modal("show");
               document.getElementById('myclick3').click();
           }
           function callme4() {

               //$("#staticBackdrop").modal("show");
               document.getElementById('myclick4').click();
           }
           function calccharge() {
               var valhold = document.getElementById('<%= TextBox9.ClientID %>').value;
                 var numonly = valhold.replace(/\D/g, '');
               var chargehold =  Math.round(0.010 * numonly);
               if (chargehold <= 100) {
                   chargehold = 100
               } else {
                   chargehold = chargehold;
               };
               document.getElementById('chargeholder').innerHTML = chargehold;
               document.getElementById('payable').innerHTML = parseInt(numonly) + parseInt(chargehold);
               var available = document.getElementById('Label8').innerHTML;
               var amtTobeDeducted = parseFloat(document.getElementById('payable').innerHTML);
               let availableNow = available.substr(1, available.length);
               document.getElementById('HiddenField1').value = parseInt(numonly) + parseInt(chargehold);
               var avaiNumOnly = parseInt(availableNow.replace(/\D/g, ''));
               document.getElementById('Button4').value = "Withdraw " + amtTobeDeducted.toLocaleString("en-US");
               if (avaiNumOnly < amtTobeDeducted) {
                   document.getElementById('Button4').disabled=true;
               } else {
                   document.getElementById('Button4').disabled = false;
               };
               //var future = new Date();
                 //var numberhold = valhold;
                 //future.setDate(future.getDate() + numberhold);
                 //document.getElementById('datehold').innerHTML = 'Expire Date:' + future + 'Today= ' + new Date();
                 //alert(valhold);
             }
       
       </script>
    <script>
           function ShowPopup() {

               document.getElementById('myclick').click();
           }
           function makePayment() {
               //alert('hello');
               document.getElementById('myclick').onclick();
           }
           function copyclip() {
               var copytext = document.getElementById("<%=Text1.ClientID%>");
               copytext.select();
               copytext.setSelectionRange(0, 99999);
               document.execCommand("copy");
               alert('Link has been copied.');

           }
    </script>
    <script>
           $(document).ready(function how() {
               $("#GridView1 tr").click(function () {
                   alert($(this).find("[id*='Text1']").val());
               });
           });
    </script>
    <script>
        function CheckNumeric() {
            return event.keyCode >= 48 && event.keyCode <= 57 || event.keyCode == 46;
        }

        function checkDate() {

            var today = new Date();
            var enterDate = document.getElementById('<%= TextBox4.ClientID %>').value;
            enterDate = new Date(enterDate)
            if (enterDate < today) {
                alert("You need to select a due date that is earlier than today !");
                   document.getElementById('<%= TextBox4.ClientID %>').value = new Date('2004-10-10');


            }
        }

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


        }
    </script>
    <script>
           function sharewhatsapp() {
             <%--  var copyfulllink = document.getElementById("<%=Text1.ClientID%>").value;
            
               var url = 'https://wa.me/?text=Hello,could%20you%20help%20share%20or%20donate%20to%20this%20collection.%20' + topic + '.%20To%20know%20more%20visit%20' + copyfulllink ;
               window.open(url);--%>
           }
    </script>
     <script>
         tinymce.init({
             selector: 'textarea#TextBox6',
             /* height: 500,*/
             plugins: [
                 'lists'
                 //'advlist', 'autolink', 'lists', 'link', 'image', 'charmap', 'preview',
                 //'anchor', 'searchreplace', 'visualblocks', 'code', 'fullscreen',
                 //'insertdatetime', 'media', 'table', 'help', 'wordcount'
             ],
             toolbar: 'undo redo | blocks | ' +
                 'bold italic backcolor | alignleft aligncenter ' +
                 'alignright alignjustify | bullist numlist outdent indent | ' +
                 'removeformat ',
             content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:16px }'
         });
     </script>
</asp:Content>
