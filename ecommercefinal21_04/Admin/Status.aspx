<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Status.aspx.cs" Inherits="Admin.Status" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <li> <asp:Button ID="Button1" runat="server" Text="PICK" OnClick="Button1_Click" /></li> <br /><br />
    <li><asp:Button ID="Button2" runat="server" Text="PACK" OnClick="Button2_Click" /></li> <br /><br />
    <li>    <asp:Button ID="Button3" runat="server" Text="INVOICE" OnClick="Button3_Click" /></li> <br /><br />
     <li>   <asp:Button ID="Button4" runat="server" Text="SHIP" OnClick="Button4_Click" /></li> <br /><br />
         <li>   <asp:Button ID="Button5" runat="server" Text="Cancel Orders" OnClick="Button5_Click" /></li> <br /><br />
         <li>   <asp:Button ID="Button6" runat="server" Text="Return Orders" OnClick="Button6_Click" /></li> <br /><br />

        <li><div class="control-group">
            <div class="controls">
              <asp:Button ID="adminhome" class="btn btn-large btn-success"  runat="server" Text="Go to Home page" OnClick="adminhome_Click" style="height: 26px"/>
            </div>
          </div>
        </li>
         
    </div>
    </form>
</body>
</html>
