<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="subscription_items_display.aspx.cs" Inherits="Customer.subscription_items_display" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
  <asp:GridView ID="gv1" runat="server" AutoGenerateColumns ="False" 
           
             onrowcommand="gv1_RowCommand"  DataKeyNames="Subscription_id" onrowdatabound="gv1_RowDataBound"
            BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px"
            CellPadding="3" GridLines="None" CellSpacing="1" >
        <Columns >
       <asp:TemplateField HeaderText="SNo" ItemStyle-Width="150" ItemStyle-Height="150">
        <ItemTemplate>
        <%# Eval("Subscription_id") %>
        </ItemTemplate>
        <EditItemTemplate >
            <asp:Label ID="Subscription_id" runat="server" Text='<%#Eval("Subscription_id") %>'></asp:Label>
            </EditItemTemplate>
             </asp:TemplateField>
     


              <asp:TemplateField HeaderText="Product_id" ItemStyle-Width="150" ItemStyle-Height="150">
        <ItemTemplate>
        <%# Eval("Product_id") %>
        </ItemTemplate>
        <EditItemTemplate >
            <asp:Label ID="Product_id" runat="server" Text='<%#Eval("Product_id") %>'></asp:Label>
            </EditItemTemplate>
             </asp:TemplateField>

            <asp:TemplateField HeaderText="Product_name" ItemStyle-Width="150" ItemStyle-Height="150">
        <ItemTemplate>
        <%# Eval("Product_name") %>
        </ItemTemplate>
        <EditItemTemplate >
            <asp:Label ID="Product_name" runat="server" Text='<%#Eval("Product_name") %>'></asp:Label>
            </EditItemTemplate>
             </asp:TemplateField>

             <asp:TemplateField HeaderText="Product_desc" ItemStyle-Width="150" ItemStyle-Height="150">
        <ItemTemplate>
        <%# Eval("Product_desc") %>
        </ItemTemplate>
        <EditItemTemplate >
            <asp:Label ID="Product_desc" runat="server" Text='<%#Eval("Product_desc") %>'></asp:Label>
            </EditItemTemplate>
             </asp:TemplateField>

            <asp:TemplateField HeaderText="How many Times to Deliver" ItemStyle-Width="150" ItemStyle-Height="150">
        <ItemTemplate>
        <%# Eval("Frequency") %>
        </ItemTemplate>
        <EditItemTemplate >
            <asp:Label ID="Frequency" runat="server" Text='<%#Eval("Frequency") %>'></asp:Label>
            </EditItemTemplate>
             </asp:TemplateField>

             <asp:TemplateField HeaderText="Upcoming Deliverydate" ItemStyle-Width="150" ItemStyle-Height="150">
        <ItemTemplate>
        <%# Eval("Expected_Deliverydate") %>
        </ItemTemplate>
        <EditItemTemplate >
            <asp:Label ID="Expected_Deliverydate" runat="server" Text='<%#Eval("Expected_Deliverydate") %>'></asp:Label>
            </EditItemTemplate>
             </asp:TemplateField>

           <asp:TemplateField HeaderText="Quantity" ItemStyle-Width="150" ItemStyle-Height="150">
        <ItemTemplate>
        <%# Eval("Quantity") %>
        </ItemTemplate>
        <EditItemTemplate >
            <asp:Label ID="Quantity" runat="server" Text='<%#Eval("Quantity") %>'></asp:Label>
            </EditItemTemplate>
             </asp:TemplateField>
            <asp:TemplateField >
            <ItemTemplate>
                <asp:Button ID="Button1" runat="server"  CommandName="Cancel_Initiate"  Text="Cancel"  />
            </ItemTemplate>
        </asp:TemplateField>

            </Columns>

            
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#33276A" />

        </asp:GridView>
    </div>
    </form>
</body>
</html>
