<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Admin.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link href="../Content/bootstrap.css" rel="stylesheet" />
    <link href="../Content/StyleSheet.css" rel="stylesheet" />
    <link href="../css/style.css" rel="stylesheet" />
    
</head>
<body>
    <div class="login-01">
		<div class="one-login  hvr-float-shadow">
			<div class="one-login-head">
					<img src="../Images/top-lock.png" alt=""/>
					<h1>Admin Home Page</h1>
					<span></span>
			</div>
    <form id="form" runat="server">
    <div class="submit">
       
   <li> <asp:Button ID="Button1" runat="server" Text="Add category" OnClick="Button1_Click" /></li>
    <li><asp:Button ID="Button2" runat="server" Text="Add sub category" OnClick="Button2_Click" /></li>
    <li>    <asp:Button ID="Button3" runat="server" Text="Add product" OnClick="Button3_Click" /></li>
     <li>   <asp:Button ID="Button4" runat="server" Text="View products" OnClick="Button4_Click" /></li>
      <li>  <asp:Button ID="Button5" runat="server" Text="Edit product" OnClick="Button5_Click" /></li>
          <%--<li>  <asp:Button ID="Button6" runat="server" Text="Check Cancel Items" OnClick="Button6_Click" /></li>
         <li>  <asp:Button ID="Button7" runat="server" Text="Check Return Items" OnClick="Button7_Click" /></li>--%>
      
       
        <li>  <asp:Button ID="Button10" runat="server" Text="Status" OnClick="Button10_Click" /></li>
        <li>  <asp:Button ID="Button11" runat="server" Text="admin retrieve order" OnClick="Button11_Click" /></li>
          <li> <asp:Button ID="Signoff" runat="server"  Text="Sign off" ValidateRequestMode="Enabled" ValidationGroup="all" OnClick="Signoff_Click"/></li>
    </div>
        
    </form>
            </div>
        </div>
</body>
</html>
