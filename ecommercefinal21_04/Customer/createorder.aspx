<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="createorder.aspx.cs" Inherits="Customer.createorder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h1>Thank you for placing the order.</h1>
    <h2>Your order is in PICK state.</h2>
    <form id="form1" runat="server">
    <div>
    <asp:Button ID="Proceed" class="btn btn-large btn-success"  runat="server" Text="Go to Home Page" OnClick="Proceed_Click" />
    </div>
    </form>
</body>
</html>
