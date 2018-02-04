<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addCategory.aspx.cs" Inherits="Customer.tempaddproduct" %>

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
                <h1>Add Category</h1>
		
			</div>
    <form id="form" runat="server">
 
    <div class="submit">
         <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Admin home page" />
    </div>
        
        <asp:DropDownList ID="DropDownList1" runat="server" onchange="showDiv(this)" >
        </asp:DropDownList>
        
         
        <li>
        <asp:TextBox ID="newCategory" AutoPostBack="True" runat="server" placeholder="New category:" required="required" OnTextChanged="UserName_TextChanged"></asp:TextBox>
              
              <asp:Label ID="Label3" runat="server" Text="* Category already exists"></asp:Label>
        </li>
        <div class="submit">
              <asp:Button ID="addcategory" runat="server" Text="Add category" OnClick="insert" />    		
		</div>
            
    </form>
</body>
</html>
