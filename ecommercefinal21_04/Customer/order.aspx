<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="order.aspx.cs" Inherits="ecomNew.order" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"   CssClass="table table-striped table-hover"   BorderColor="White" BackColor="White" OnRowCreated="GridView1_RowCreated" BorderStyle="None" BorderWidth="1px"  CellSpacing="2" Width="819px">
            <Columns>
               

                    <%--    <asp:ButtonField ButtonType="Button"  runat="server"    CommandName="Select"   Text="Add to cart" />--%>
                 
                    

           
                
                <asp:TemplateField HeaderText="Preview Image">
                    <ItemTemplate>
                        <%--<asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("filepath") %>'></asp:TextBox>--%>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("filepath") %>' />
                    
                    </ItemTemplate>
                   
                    <ControlStyle Height="100px" Width="100px" />
             </asp:TemplateField>
                 <asp:BoundField DataField="Product_sku" HeaderText="Product sku" />
                  <asp:TemplateField HeaderText="Product description">
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("Product_desc") %>'></asp:Label>
                    </ItemTemplate>
                       <EditItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Product_desc") %>'></asp:Label>
                    </EditItemTemplate>
                       </asp:TemplateField>
                 
                 
                <%--<asp:BoundField DataField="Product_sku" HeaderText="Product_sku" SortExpression="Product_sku" />
                <asp:BoundField DataField="Product_desc" HeaderText="Product_desc" SortExpression="Product_desc" />--%>
   <asp:TemplateField HeaderText="Item Quantity">
       <ItemTemplate>
           <asp:Label ID="Label4" runat="server" Text='<%# Bind("Product_quantity") %>'></asp:Label>
       </ItemTemplate>             
       
        <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Product_quantity") %>'></asp:TextBox>
               
             </EditItemTemplate>

                    </asp:TemplateField>

                <asp:TemplateField HeaderText="Product price">
                     <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("Product_price") %>'></asp:Label>
  <asp:Label ID="Labelpricw" runat="server" Text="$"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="Label12" runat="server" Text='<%# Bind("Product_price") %>'></asp:Label>
                    </EditItemTemplate>
                    </asp:TemplateField> 

                      

                    

                      

            </Columns> 
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="Black" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
     </asp:GridView>
    </div>
    </form>
</body>
</html>
