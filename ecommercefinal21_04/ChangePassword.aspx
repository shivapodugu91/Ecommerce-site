<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="Customer.ChangePassword" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <link href="../Content/StyleSheet.css" rel="stylesheet" />
    <link href="../css/style.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <div class="login-01">
		<div class="one-login  hvr-float-shadow">
			<div class="one-login-head">
                <img src="../Images/top-lock.png" alt=""/>
              <h1>ChangePassword</h1>
                <span></span>
			</div>
    <form id="form" runat="server">
  
   
    
    <table style="width:100%;" class="table" border="1">
        <tr class="active">
<td class="active">Old Password</td><td class="active"><asp:TextBox ID="OldPassword" runat="server"  type="password" CssClass="form-control" height="30px" width="205px"></asp:TextBox></td>
</tr>
        
           <tr class="active">
<td class="active">New Password</td><td class="active"><asp:TextBox ID="NewPassword" runat="server"  type="password" CssClass="form-control" height="30px" width="205px"></asp:TextBox></td>
</tr>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="NewPassword" Display="Dynamic" ErrorMessage="Password Required" CssClass="text-danger" >* Password required</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="NewPassword" Display="Dynamic" ErrorMessage="RegularExpressionValidator"  CssClass="text-danger" SetFocusOnError="True" ValidationExpression="^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!*@#$%^&amp;+=]).*$" ValidationGroup="all"> * At least one lower case letter,
            At least one upper case letter,At least special character,At least one number,At least 8 characters length</asp:RegularExpressionValidator>
      
       <tr class="active">
<td class="active">ConfirmPassword</td><td class="active"><asp:TextBox ID="ConfirmNewPassword" runat="server"  type="password" CssClass="form-control" height="30px" width="205px"></asp:TextBox></td>
</tr>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="ConfirmNewPassword" Display="Dynamic" ErrorMessage="Username required"  CssClass="text-danger">* Confirm password required</asp:RequiredFieldValidator>        
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" Display="Dynamic" ErrorMessage="CompareValidator"  CssClass="text-danger">* Password doesn't match</asp:CompareValidator>  
            
        
         </table>
        <div class="submit">
                    <asp:Button ID="ChangePassword_" runat="server" Text="ChangePassword" OnClick="ChangePassword__Click" />						
				</div>
        
   
    </form>
            	</div>
	</div>
    </body>
</html>