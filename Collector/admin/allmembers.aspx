<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/admin/Site2.Master" CodeBehind="allmembers.aspx.vb" Inherits="Collector.allmembers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">
            <div class="row  ">
                <div class="col-md-7">
                    
                    <div class="card mt-4">
                        <div class="card-body">
                             <h5 class="text-primary mylinottefamily my-2 borderwidth border-bottom border-primary ">All Members</h5>

                            <div class="table-responsive">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table" GridLines="None" DataKeyNames="userID" DataSourceID="SqlDataSource1"  HeaderStyle-CssClass="bg-primary fa-inverse" AllowPaging="true" PageSize="10">
                                <Columns>
  <%--                                  <asp:BoundField DataField="userID" HeaderText="userID" ReadOnly="True" SortExpression="userID"></asp:BoundField>
                                    <asp:BoundField DataField="Firstname" HeaderText="Firstname" SortExpression="Firstname"></asp:BoundField>
                                    <asp:BoundField DataField="Lastname" HeaderText="Lastname" SortExpression="Lastname"></asp:BoundField>
                                    <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password"></asp:BoundField>
                                    <asp:BoundField DataField="CreatedDate" HeaderText="CreatedDate" SortExpression="CreatedDate"></asp:BoundField>
                                    <asp:BoundField DataField="EmailAdd" HeaderText="EmailAdd" SortExpression="EmailAdd"></asp:BoundField>
                                    <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber"></asp:BoundField>
                                    <asp:BoundField DataField="Profile_Pic_Link" HeaderText="Profile_Pic_Link" SortExpression="Profile_Pic_Link"></asp:BoundField>--%>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                User Details
                                            </HeaderTemplate>
                                            <HeaderStyle CssClass="" />
                                            <ItemTemplate>
                                                 <b id="collectionname" runat="server" class="  "> <%# Eval("Firstname").ToString & " " & Eval("Lastname").ToString %></b>
                                        
                                              <span class="input-group input-group-sm blockquote-footer">
                                                    <input type="text" class=" form-control" id="Text1" value="<%# Eval("PhoneNumber").ToString %>" />
                                                  <span class="input-group-append">
                                                    <i class=" input-group-text  fa fa-copy" onclick="SelectTextandCopyToClipboard(this);" ></i>
                                                  </span>
                                              </span>

                                                <small class="  fa-inverse" id="phonehold" runat="server"><%# Eval("PhoneNumber").ToString %></small>
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
                                            <HeaderTemplate >
                                                Collections
                                            </HeaderTemplate>
                                            <HeaderStyle  CssClass="text-center "/>
                                            <ItemTemplate >
                                                 <b class="" id="duedatenew" runat="server"><%# CountCollections(Eval("userID").ToString) %></b>
                                            </ItemTemplate>
                                            <ItemStyle CssClass="text-center" />
                                        </asp:TemplateField>
                                       <asp:TemplateField>
                                            <HeaderTemplate >
                                                Details
                                            </HeaderTemplate>
                                            <HeaderStyle  CssClass="text-center "/>
                                            <ItemTemplate >
                                                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-outline-primary" CommandName="details"><i class="fa fa-user-edit"></i> Details</asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle CssClass="text-center" />
                                        </asp:TemplateField>
                                    </Columns>
                            </asp:GridView>
                            </div>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:kpolomDUMMYConnectionString %>' SelectCommand="SELECT * FROM [myLOGINCollector] ORDER BY [CreatedDate] DESC"></asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
           </div>
     <script type="text/javascript">
         //function getrow(ink){
         //    var row = ink.parentNode.parentNode;
         //    var rowIndex = row.rowIndex - 1;
         //    return rowIndex;
         //    alert(rowIndex);
         //}
         function copyclip() {
            
           
             var copytext = document.getElementById("Text1");
            copytext.select();
            copytext.setSelectionRange(0, 99999);
            document.execCommand("copy");
            alert('Link has been copied.');

        }
    </script>
     <script type="text/javascript"> 
         //<![CDATA[

         function SelectTextandCopyToClipboard(currentTextBox) {

             var txtNameUrl;

             //Find the GridView Row using the TextBox reference.
             var row = currentTextBox.parentNode.parentNode;

             //Fetch all controls in GridView Row.
             var controls = row.getElementsByTagName("*");

             //Loop through the fetched controls.
             for (var i = 0; i < controls.length; i++) {

                 //Find the TextBox control.
                 if (controls[i].id.indexOf("Text1") != -1) {
                     txtNameUrl = controls[i];
                 }
             }

             // Select text
             txtNameUrl.select();
             // Copy to clipboard
             document.execCommand('copy');
             alert('Link has been copied.');
         }
         //]]>
     </script> 
</asp:Content>
