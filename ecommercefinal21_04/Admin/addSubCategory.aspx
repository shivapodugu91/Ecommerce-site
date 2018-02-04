<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addSubCategory.aspx.cs" Inherits="Customer.addSubCategory" %>

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
                <h1>Add Sub Category</h1>
                 
					
					
			</div>
    <form id="form" runat="server">
    <div>
        <div class="submit">
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Admin home page" />
            </div>
        <br />
        <br />
    
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack = "true"  OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" >
        </asp:DropDownList>
        <br />
        <br />
        <asp:DropDownList ID="DropDownList2" runat="server"  OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" >
        </asp:DropDownList>
        
        <br />

        <asp:TextBox ID="newSubCategory" AutoPostBack="True" runat="server" placeholder="subcategory :"  OnTextChanged="UserName_TextChanged" ></asp:TextBox>
              
              <asp:Label ID="Label3" runat="server" Text="*Already exists"></asp:Label>

   <!--  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="newSubCategory" ErrorMessage="new sub category Required"  CssClass="text-danger" Display="Dynamic">*new sub category Required</asp:RequiredFieldValidator> -->
        <br />
        <div class="submit">
              <asp:Button ID="addcategory" runat="server" Text="Add Sub category" OnClick="insert" />    		
		</div>
        </div>
    </form>
</body>
</html>
