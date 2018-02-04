<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubscriptionEngine.aspx.cs" Inherits="Customer.SubscriptionEngine" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <div>
    <div id="thetimedate" runat="server" />
    <p>Subscription Engine started....</p>
    <asp:ScriptManager ID="FieldScriptManager" runat="server">
    </asp:ScriptManager>
   
     <asp:Timer ID="FieldTimer" OnTick="Timer1_Tick" runat="server" Interval="6000" />
       <asp:UpdatePanel ID="FieldUpdatePanel" UpdateMode="Conditional" runat="server">
   
    <Triggers>
    <asp:AsyncPostBackTrigger ControlID="FieldTimer" />
    </Triggers>
        
 <ContentTemplate>
    <p>Subscription flow: <span id="timedate2" runat="server" /></p>
 </ContentTemplate>
              </asp:UpdatePanel>
    </div>

    </div>
    </form>
</body>
</html>
