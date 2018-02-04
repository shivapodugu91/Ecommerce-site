<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addProduct.aspx.cs" Inherits="Customer.addProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <link href="../Content/StyleSheet.css" rel="stylesheet" />
    <link href="../css/StyleSheet1.css" rel="stylesheet" />
</head>
<body>
     <script src="scripts/jquery-1.9.1.min.js"></script>
    <script src="scripts/bootstrap.min.js"></script>
    <div class="login-01">
		<div class="one-login  hvr-float-shadow">
			<div class="one-login-head">
                <img src="../Images/newproduct2.jpg" alt=""/>
                <h1>Add Product</h1>
                 
					
					
			</div>
    <form runat="server" id="form">
    <div>
        <div class="submit">
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Admin home page" />
            </div>
        <br />
        <br />
    <li>  
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack = "true"  OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" >
        </asp:DropDownList>
     </li>  
        <li>
       <asp:DropDownList ID="DropDownList2" runat="server"  OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" >
        </asp:DropDownList>
        </li>
         <li>
        <asp:TextBox ID="Product_sku" AutoPostBack="True" runat="server" placeholder="New sku:"  OnTextChanged="Product_sku_TextChanged" ></asp:TextBox>
              
              <asp:Label ID="Label3" runat="server" Text="*sku already exists"></asp:Label>
 </li>
   <!--  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Product_sku" ErrorMessage="new Product_sku Required"  CssClass="text-danger" Display="Dynamic">*new Product_sku Required</asp:RequiredFieldValidator> -->
        <li>
        <asp:TextBox ID="Product_name" runat="server" CssClass="text"  PlaceHolder="Name"></asp:TextBox>
        <asp:Label ID="Label8" runat="server" Text=""></asp:Label>
        </li>
             <li>
        <asp:TextBox ID="Product_desc" runat="server" CssClass="text" PlaceHolder="Desc"></asp:TextBox>
        <asp:Label ID="Label10" runat="server" Text=""></asp:Label>
         </li>
        <li>
        <asp:TextBox ID="Product_price" runat="server" CssClass="text" PlaceHolder="Price"></asp:TextBox>
        <asp:Label ID="Label12" runat="server" Text=""></asp:Label>
         </li>
         <li>
        <asp:TextBox ID="Product_quantity" runat="server" CssClass="text" PlaceHolder="Quantity" ></asp:TextBox>
        <asp:Label ID="Label16" runat="server" Text=""></asp:Label>
         </li>

         <li>
        <asp:FileUpload ID="FileUpload1" runat="server" PlaceHolder="Upload Picture"/>
    </li>
        
         <li>
         <div class="submit">
              <asp:Button ID="add_Product_btn" runat="server" Text="Add new product" OnClick="insert" />    		
		</div>
              </li>
        <br />
        <br />
       
        </div>
    </form>
</body>
</html>

