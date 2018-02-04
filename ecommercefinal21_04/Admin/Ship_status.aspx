<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ship_status.aspx.cs" Inherits="Admin.Ship" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:GridView ID="gv1" runat="server" AutoGenerateColumns ="False"
           
            DataKeyNames="LineItems_id" 
             
            BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px"
            CellPadding="3" GridLines="None" CellSpacing="1"
             >
        <Columns >
             <asp:TemplateField>
            <ItemTemplate>
                <asp:CheckBox ID="chkRow" runat="server" ItemStyle-Width="150" ItemStyle-Height="150"  AutoPostBack="true"  />
            </ItemTemplate>
        </asp:TemplateField>

       <asp:TemplateField HeaderText="Order_id">
        <ItemTemplate>
        <%# Eval("Order_id") %>
        </ItemTemplate>
        <EditItemTemplate >
            <asp:Label ID="Order_id" runat="server" Text='<%#Eval("Order_id") %>'></asp:Label>
            </EditItemTemplate>
             </asp:TemplateField>
       
             <asp:TemplateField HeaderText="LineItems_id" ItemStyle-Width="150" ItemStyle-Height="150">
            <ItemTemplate>
                <asp:Label ID="LineItems_id" runat="server" Text='<%# Eval("LineItems_id") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

             
            

     

            
             <asp:TemplateField HeaderText="Shipment_status">
        <ItemTemplate>
        <%# Eval("Shipment_status") %>
        </ItemTemplate>
        <EditItemTemplate >
            <asp:Label ID="Shipment_status" runat="server" Text='<%#Eval("Shipment_status") %>'></asp:Label>
            </EditItemTemplate>
             </asp:TemplateField>
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
         <asp:Button ID="btnGetSelected" runat="server" Text="Deliver" OnClick="GetSelectedRecords" />

              <asp:Button ID="adminhome" class="btn btn-large btn-success"  runat="server" Text="Go to status" OnClick="adminhome_Click" style="height: 26px"/>

        <div class="control-group">
            <div class="controls">
            </div>
          </div>
        
    </div>
    </form>
</body>
</html>
