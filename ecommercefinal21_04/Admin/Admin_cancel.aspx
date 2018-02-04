<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_cancel.aspx.cs" Inherits="Admin.Admin_cancel" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
 
    <form id="form1" runat="server">
     
        <div>
<asp:GridView ID="gv1" runat="server" AutoGenerateColumns ="False"
           
            onrowediting="gv1_RowEditing" DataKeyNames="LineItems_id" ShowFooter="True"
             onrowupdating="gv1_RowUpdating"
            BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px"
            CellPadding="3" GridLines="None" CellSpacing="1"
            onrowcancelingedit="gv1_RowCancelingEdit"  >
        <Columns >
       <asp:TemplateField HeaderText="Order_id">
        <ItemTemplate>
        <%# Eval("Order_id") %>
        </ItemTemplate>
        <EditItemTemplate >
            <asp:Label ID="Order_id" runat="server" Text='<%#Eval("Order_id") %>'></asp:Label>
            </EditItemTemplate>
             </asp:TemplateField>
       


              <asp:TemplateField HeaderText="LineItems_id">
        <ItemTemplate>
        <%# Eval("LineItems_id") %>
        </ItemTemplate>
        <EditItemTemplate >
            <asp:Label ID="LineItems_id" runat="server" Text='<%#Eval("LineItems_id") %>'></asp:Label>
            </EditItemTemplate>
             </asp:TemplateField>

            <asp:TemplateField HeaderText="Product_name">
        <ItemTemplate>
        <%# Eval("Product_name") %>
        </ItemTemplate>
        <EditItemTemplate >
            <asp:Label ID="Product_name" runat="server" Text='<%#Eval("Product_name") %>'></asp:Label>
            </EditItemTemplate>
             </asp:TemplateField>

             <asp:TemplateField HeaderText="Product_desc">
        <ItemTemplate>
        <%# Eval("Product_desc") %>
        </ItemTemplate>
        <EditItemTemplate >
            <asp:Label ID="Product_desc" runat="server" Text='<%#Eval("Product_desc") %>'></asp:Label>
            </EditItemTemplate>
             </asp:TemplateField>

           
       <asp:TemplateField HeaderText="Shipment_status">
            <ItemTemplate>
            <%#Eval("Shipment_status") %>
            </ItemTemplate>
            <EditItemTemplate >
                
                <asp:DropDownList ID="Shipment_status" runat="server">
                    <asp:ListItem>CANCEL INITIATED</asp:ListItem>
                    <asp:ListItem>CANCEL RECEIVED</asp:ListItem>
                </asp:DropDownList>
            </EditItemTemplate>
            
            </asp:TemplateField>

             <asp:TemplateField HeaderText="Product_price">
        <ItemTemplate>
        <%# Eval("Product_price") %>
        </ItemTemplate>
        <EditItemTemplate >
            <asp:Label ID="Product_price" runat="server" Text='<%#Eval("Product_price") %>'></asp:Label>
            </EditItemTemplate>
             </asp:TemplateField>

            

            
           
           
      
       
  
            <asp:CommandField ShowEditButton ="true" ControlStyle-ForeColor ="Blue " >
<ControlStyle ForeColor="Blue"></ControlStyle>
            </asp:CommandField>
            
            </Columns>
       
        <EmptyDataTemplate>Empty Records matching your Criteria </EmptyDataTemplate>
            
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#33276A" />

        </asp:GridView>

                     <div class="control-group">
            <div class="controls">
              <asp:Button ID="adminhome" class="btn btn-large btn-success"  runat="server" Text="Go to Status" OnClick="adminhome_Click" style="height: 26px"/>
            </div>
          </div>
   
    </div>
    </form>
</body>
</html>
   
