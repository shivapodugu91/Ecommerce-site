<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LineItemsDisplay.aspx.cs" Inherits="Customer.LineItemsDisplay1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:GridView ID="gv1" runat="server" AutoGenerateColumns ="False" onrowdatabound="gv1_RowDataBound"
            onrowcommand="gv1_RowCommand" DataKeyNames="LineItems_id" 
             
            BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px"
            CellPadding="3" GridLines="None" CellSpacing="1" >
        <Columns >
       


              <asp:TemplateField HeaderText="LineItems_id" ItemStyle-Width="150" ItemStyle-Height="150">
        <ItemTemplate>
        <%# Eval("LineItems_id") %>
        </ItemTemplate>
        <EditItemTemplate >
            <asp:Label ID="LineItems_id" runat="server" Text='<%#Eval("LineItems_id") %>'></asp:Label>
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

            <asp:TemplateField HeaderText="Shipment_status" ItemStyle-Width="150" ItemStyle-Height="150">
        <ItemTemplate>
        <%# Eval("Shipment_status") %>
        </ItemTemplate>
        <EditItemTemplate >
            <asp:Label ID="Shipment_status" runat="server" Text='<%#Eval("Shipment_status") %>'></asp:Label>
            </EditItemTemplate>
             </asp:TemplateField>

             <asp:TemplateField HeaderText="Product_price" ItemStyle-Width="150" ItemStyle-Height="150">
        <ItemTemplate>
        <%# Eval("Product_price") %>
        </ItemTemplate>
        <EditItemTemplate >
            <asp:Label ID="Product_price" runat="server" Text='<%#Eval("Product_price") %>'></asp:Label>
            </EditItemTemplate>
             </asp:TemplateField>

           
           
           
      
        <asp:TemplateField ShowHeader="False">
            <ItemTemplate>
                <asp:Button ID="Button1" runat="server" CausesValidation="false" CommandName="ReturnInitiate" CommandArgument ='<%#Eval("LineItems_id") %>'

    Text="Return Initiate"  />
            </ItemTemplate>
        </asp:TemplateField>

             <asp:TemplateField ShowHeader="False">
            <ItemTemplate>
                <asp:Button ID="Button2" runat="server" CausesValidation="false" CommandName="CancelInitiate" CommandArgument ='<%#Eval("LineItems_id") %>'

    Text="Cancel Item"  />
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
