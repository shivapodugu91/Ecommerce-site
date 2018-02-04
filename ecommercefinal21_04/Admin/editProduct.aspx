<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="editProduct.aspx.cs" Inherits="Customer.editProduct" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Admin home page" />

        <asp:GridView ID="gv1" runat="server" AutoGenerateColumns ="False"
            onrowdatabound="gv1_RowDataBound" onrowdeleting="gv1_RowDeleting"
            onrowediting="gv1_RowEditing" DataKeyNames="Product_id" ShowFooter="True"
             onrowupdating="gv1_RowUpdating"
            BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px"
            CellPadding="3" CellSpacing="2"
            onrowcancelingedit="gv1_RowCancelingEdit" OnSelectedIndexChanged="gv1_SelectedIndexChanged" >
        <Columns >
        <asp:TemplateField HeaderText="Product_id">

        <ItemTemplate>
        <%# Eval("Product_id") %>
        </ItemTemplate>
        <EditItemTemplate >
            <asp:Label ID="lbleid" runat="server" Text='<%#Eval("Product_id") %>'></asp:Label>
            </EditItemTemplate>
            
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Product_sku">

        <ItemTemplate>
        <%# Eval("Product_sku") %>
        </ItemTemplate>
        <EditItemTemplate >
            <asp:Label ID="Product_sku" runat="server" Text='<%#Eval("Product_sku") %>'></asp:Label>
            </EditItemTemplate>
            
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Product_name">
            <ItemTemplate>
            <%#Eval("Product_name") %>
            </ItemTemplate>
            <EditItemTemplate >
                <asp:TextBox ID="Product_name" runat="server" Text='<%#Eval("Product_name") %>'></asp:TextBox>
            </EditItemTemplate>
            
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Product_desc">
            <ItemTemplate>
            <%#Eval("Product_desc") %>
            </ItemTemplate>
            <EditItemTemplate >
                <asp:TextBox ID="Product_desc" runat="server" Text='<%#Eval("Product_desc") %>'></asp:TextBox>
            </EditItemTemplate>
                 </asp:TemplateField>
             <asp:TemplateField HeaderText="Product_price">
            <ItemTemplate>
            <%#Eval("Product_price") %>
            </ItemTemplate>
            <EditItemTemplate >
                <asp:TextBox ID="Product_price" runat="server" Text='<%#Eval("Product_price") %>'></asp:TextBox>
            </EditItemTemplate>
            
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Product_quantity">
            <ItemTemplate>
            <%#Eval("Product_quantity") %>
            </ItemTemplate>
            <EditItemTemplate >
                <asp:TextBox ID="Product_quantity" runat="server" Text='<%#Eval("Product_quantity") %>'></asp:TextBox>
            </EditItemTemplate>
            </asp:TemplateField>

             <asp:TemplateField headertext="Category">
            <HeaderStyle HorizontalAlign="Left" Width="150px" />
            <ItemStyle HorizontalAlign="Left" />
            <ItemTemplate> <%#Eval("category_name")%></ItemTemplate>
            <EditItemTemplate>  
                <asp:DropDownList ID="ddlCategories" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCategories_SelectedIndexChanged">                           
                </asp:DropDownList>                
            </EditItemTemplate>                   
        </asp:TemplateField>   

            <asp:TemplateField headertext="SubCategory">
            <HeaderStyle HorizontalAlign="Left" Width="100px" />
            <ItemStyle HorizontalAlign="Left" />
            <ItemTemplate> <%#Eval("subCategory_name")%></ItemTemplate>
            <EditItemTemplate>
             <asp:DropDownList ID="ddlSubCategories" runat="server"></asp:DropDownList>                                      
            </EditItemTemplate>                   
        </asp:TemplateField>
       
            <asp:TemplateField HeaderText="Upload">
                   
                <EditItemTemplate>
                    <asp:FileUpload ID="FileUpload1" runat="server"  />
                    </EditItemTemplate>
                </asp:TemplateField>

            

            <asp:CommandField ShowEditButton ="true" ControlStyle-ForeColor ="Blue " >
<ControlStyle ForeColor="Blue"></ControlStyle>
            </asp:CommandField>
            <asp:TemplateField>
            <ItemTemplate>
            <asp:LinkButton CommandName ="Delete" CommandArgument ='<%#Eval("Product_id") %>' runat="server" ID ="lnkdelete" Text="Delete" ></asp:LinkButton>
            </ItemTemplate>
            </asp:TemplateField>
            </Columns>

            
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />

            
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
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
