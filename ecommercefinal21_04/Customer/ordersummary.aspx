<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ordersummary.aspx.cs" Inherits="Customer.ordersummary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server"  CssClass="table table-striped table-hover"  AutoGenerateColumns="False"  BorderColor="White" BackColor="White" BorderStyle="None" BorderWidth="1px"  CellSpacing="2" Width="819px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                   <asp:TemplateField HeaderText="Preview Image">
                    <ItemTemplate>
                        <%--<asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("filepath") %>'></asp:TextBox>--%>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("filepath") %>' />
                    
                    </ItemTemplate>
                   
                    <ControlStyle Height="100px" Width="100px" />
             </asp:TemplateField>
                <asp:BoundField  DataField="Product_desc" HeaderText="Product Description" />
                <asp:BoundField  DataField="Quantity" HeaderText="Item Quantity" />
                <asp:BoundField  DataField="Product_price" HeaderText="Product Price" />
            </Columns>    
            </asp:GridView>
        </div>
    <div>
        <asp:Label runat="server" ID="tp">Total Price:</asp:Label>
    <asp:Label runat="server" ID="total123">

    </asp:Label>
    </div>

        <div>
            <asp:Button runat="server" ID="order" Text="Create Order" OnClick="proceed_Click" />
            <asp:Button runat="server" ID="sub"  Text="create subscription" OnClick="sub_Click"/>
        </div>

        <div>
        </div>


    </form>
</body>
</html>
