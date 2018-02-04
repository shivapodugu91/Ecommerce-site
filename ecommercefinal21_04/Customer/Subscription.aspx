<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Subscription.aspx.cs" Inherits="WebApplication1.Subscription" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
</head>
<body>
    <form id="form1" runat="server">
    <div>

   <asp:GridView ID="gv1" runat="server" AutoGenerateColumns ="False"
          
            
            BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px"
            CellPadding="3" GridLines="None" CellSpacing="1"
             >
        <Columns >
             <asp:TemplateField>
            <ItemTemplate>
                <asp:CheckBox ID="chkRow" runat="server" ItemStyle-Width="150" ItemStyle-Height="150"  AutoPostBack="true" OnCheckedChanged="OnCheckedChanged" />
            </ItemTemplate>
        </asp:TemplateField>

            <asp:TemplateField HeaderText="Product">
				
				<ItemTemplate>
					<asp:Label ID="Product_id" runat="server" Text='<%# Bind("Product_id")  %>' ></asp:Label>
				</ItemTemplate>
				<HeaderStyle Width="100px" />
			</asp:TemplateField>
          <asp:TemplateField HeaderText="Preview Image">
                    <ItemTemplate>
                        <%--<asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("filepath") %>'></asp:TextBox>--%>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("filepath") %>' />
                    
                    </ItemTemplate>
                   
                    <ControlStyle Height="100px" Width="100px" />
             </asp:TemplateField>



            <asp:TemplateField HeaderText="Description" ItemStyle-Width="150" ItemStyle-Height="150">
        <ItemTemplate>
        <%# Eval("Product_desc") %>
        </ItemTemplate>
        <EditItemTemplate >
            <asp:Label ID="Product_desc" runat="server" Text='<%#Eval("Product_desc") %>'></asp:Label>
            </EditItemTemplate>
             </asp:TemplateField>

       <asp:TemplateField HeaderText="Quantity" ItemStyle-Width="150" ItemStyle-Height="150">
            <ItemTemplate>
                <asp:Label ID="Quantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                <asp:TextBox ID="Quantity_tb" runat="server" Text='<%# Bind("Quantity") %>' visible="false" ></asp:TextBox>
            </ItemTemplate>
        </asp:TemplateField>

<asp:TemplateField HeaderText="Price per piece">
				
				<ItemTemplate>
					<asp:Label ID="Product_price" runat="server" Text='<%# Bind("Product_price")  %>' ></asp:Label>
				</ItemTemplate>
				<HeaderStyle Width="100px" />
			</asp:TemplateField>
      
            <asp:TemplateField HeaderText="Deliver Every:">
            <ItemTemplate>
            
            
            
                
                <asp:DropDownList ID="Frequency"  runat="server" Enabled="false">
                    
                    <asp:ListItem>1 month</asp:ListItem>
                    <asp:ListItem>2 months</asp:ListItem>
                    <asp:ListItem>3 months</asp:ListItem>
                    <asp:ListItem>4 months</asp:ListItem>
                    <asp:ListItem>5 months</asp:ListItem>
                    <asp:ListItem>6 months</asp:ListItem>
                </asp:DropDownList>
            </ItemTemplate>
            
            </asp:TemplateField>
            <asp:TemplateField HeaderText="How many times to Deliver">
				<ItemTemplate>
				 <asp:DropDownList ID="TimeSpan"  runat="server" Enabled="false">
                    
                    <asp:ListItem>1 time</asp:ListItem>
                    <asp:ListItem>2 times</asp:ListItem>
                    <asp:ListItem>3 times</asp:ListItem>
                    <asp:ListItem>4 times</asp:ListItem>
                    <asp:ListItem>5 times</asp:ListItem>
                    <asp:ListItem>6 times</asp:ListItem>
                </asp:DropDownList>
                </ItemTemplate>
				<HeaderStyle Width="100px" />
			</asp:TemplateField>
     

            

            
         
      
       
           
            </Columns>
  
            
           
        <EmptyDataTemplate>No Products in your cart</EmptyDataTemplate> 
            
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
       
       
        <br/>
        <asp:Button ID="btnGetSelected" runat="server" Text="Subscribe" OnClick="GetSelectedRecords" />

        </div>
    </form>
</body>
</html>
