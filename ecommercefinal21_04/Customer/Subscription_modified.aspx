<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Subscription_modified.aspx.cs" Inherits="WebApplication1.Subscription_modified" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns ="False" 
           
            BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px"
            CellPadding="3" GridLines="None" CellSpacing="1" Caption='<table bgcolor="blue"><tr><font color="black" size=4>Regular
                 Orders</font></tr></table>'
CaptionAlign="Top"
            >
        <Columns >
         

            <asp:TemplateField HeaderText="Product" ItemStyle-Width="150" ItemStyle-Height="70">
				
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




            <asp:TemplateField HeaderText="Description" ItemStyle-Width="150" ItemStyle-Height="70">
        <ItemTemplate>
        <%# Eval("Product_desc") %>
        </ItemTemplate>
        <EditItemTemplate >
            <asp:Label ID="Product_desc" runat="server" Text='<%#Eval("Product_desc") %>'></asp:Label>
            </EditItemTemplate>
             </asp:TemplateField>

        <asp:TemplateField HeaderText="Quantity" ItemStyle-Width="150" ItemStyle-Height="70">
           
           <ItemTemplate>
					<asp:Label ID="Quantity" runat="server" Text='<%# Bind("Quantity")  %>' ></asp:Label>
				</ItemTemplate>
            </asp:TemplateField>

<asp:TemplateField HeaderText="Price per piece" ItemStyle-Width="150" ItemStyle-Height="70">
				
				<ItemTemplate>
					<asp:Label ID="Product_price" runat="server" Text='<%# Bind("Product_price")  %>' ></asp:Label>
				</ItemTemplate>
				<HeaderStyle Width="100px" />
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
            <br />
            <asp:Label Text="Total Order Price:" runat="server"></asp:Label>
        <asp:Label ID="Label1" runat="server"></asp:Label>
        </div>
    <div>
    
  <asp:GridView ID="gv1" runat="server" AutoGenerateColumns ="False" 
           
            BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px"
            CellPadding="3" GridLines="None" CellSpacing="1"
       Caption='<table bgcolor="blue"><tr><font color="black" size=4> Subscription orders</font></tr></table>'
CaptionAlign="Top"
            >
        <Columns >
         

            <asp:TemplateField HeaderText="Product" ItemStyle-Width="150" ItemStyle-Height="70">
				
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




            <asp:TemplateField HeaderText="Description" ItemStyle-Width="150" ItemStyle-Height="70" >
        <ItemTemplate>
        <%# Eval("Product_desc") %>
        </ItemTemplate>
        <EditItemTemplate >
            <asp:Label ID="Product_desc" runat="server" Text='<%#Eval("Product_desc") %>'></asp:Label>
            </EditItemTemplate>
             </asp:TemplateField>

        <asp:TemplateField HeaderText="Quantity" ItemStyle-Width="150" ItemStyle-Height="70">
           
           <ItemTemplate>
					<asp:Label ID="Quantity" runat="server" Text='<%# Bind("Quantity")  %>' ></asp:Label>
				</ItemTemplate>
            </asp:TemplateField>

<asp:TemplateField HeaderText="Price per piece" ItemStyle-Width="150" ItemStyle-Height="70">
				
				<ItemTemplate>
					<asp:Label ID="Product_price" runat="server" Text='<%# Bind("Product_price")  %>' ></asp:Label>
				</ItemTemplate>
				<HeaderStyle Width="100px" />
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
        <br />
        <br />
        <asp:Label Text="Total Subscription Order Price:" runat="server"></asp:Label>
        <asp:Label ID="subscription_price" runat="server"></asp:Label>
        <br/>
         <br />
    </div>


        <div>
            <asp:Button runat="server" ID="Proceed" Text="Proceed to Payment" OnClick="Proceed_Click"/>
        </div>
       
    </form>
</body>
</html>


