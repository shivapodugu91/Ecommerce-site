<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customer_orders.aspx.cs" Inherits="Customer.Customer_orders1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <asp:GridView ID="gv1" runat="server" AutoGenerateColumns ="False" 
            onrowcommand="gv1_RowCommand" DataKeyNames="Order_id" 
             
            BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px"
            CellPadding="3" GridLines="None" CellSpacing="1" >
        <Columns >
       


              <asp:TemplateField HeaderText="Order_id" ItemStyle-Width="150" ItemStyle-Height="150">
        <ItemTemplate>
        <%# Eval("Order_id") %>
        </ItemTemplate>
        <EditItemTemplate >
            <asp:Label ID="Order_id" runat="server" Text='<%#Eval("Order_id") %>'></asp:Label>
            </EditItemTemplate>
             </asp:TemplateField>

            <asp:TemplateField HeaderText="TotalPrice" ItemStyle-Width="150" ItemStyle-Height="150">
        <ItemTemplate>
        <%# Eval("TotalPrice") %>
        </ItemTemplate>
        <EditItemTemplate >
            <asp:Label ID="TotalPrice" runat="server" Text='<%#Eval("TotalPrice") %>'></asp:Label>
            </EditItemTemplate>
             </asp:TemplateField>

              <asp:TemplateField ShowHeader="False">
            <ItemTemplate>
                <asp:Button ID="Button1" runat="server" CausesValidation="false" CommandName="Orders" CommandArgument ='<%#Eval("Order_id") %>'

    Text="Check Items"  />
            </ItemTemplate>
        </asp:TemplateField>
           
                
          
    
    
            
            </Columns>

                    <EmptyDataTemplate>No orders Placed till now </EmptyDataTemplate>
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#33276A" />

        
           
            </asp:GridView>
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" CausesValidation="false" onClick="subscriptionOrders"

    Text="View Subscription Items"  />
    </div>
    </form>
</body>
</html>
