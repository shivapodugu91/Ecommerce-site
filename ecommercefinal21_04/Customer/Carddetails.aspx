<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Carddetails.aspx.cs" Inherits="ecomNew.Carddetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

        <link href="Style.css" rel="stylesheet" />
   <meta charset="utf-8"/>
    <title>Bootshop online Shopping cart</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <link id="callCss" rel="stylesheet" href="../themes/bootshop/bootstrap.min.css" media="screen"/>
    <link href="../themes/css/base.css" rel="stylesheet" media="screen"/>
<!-- Bootstrap style responsive -->	
	<link href="../themes/css/bootstrap-responsive.min.css" rel="stylesheet"/>
	<link href="../themes/css/font-awesome.css" rel="stylesheet" type="text/css"/>
<!-- Google-code-prettify -->	
	<link href="../themes/js/google-code-prettify/prettify.css" rel="stylesheet"/>
<!-- fav and touch icons -->
    <link rel="shortcut icon" href="../themes/images/ico/favicon.ico"/>
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../themes/images/ico/apple-touch-icon-144-precomposed.png"/>
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../themes/images/ico/apple-touch-icon-114-precomposed.png"/>
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../themes/images/ico/apple-touch-icon-72-precomposed.png"/>
    <link rel="apple-touch-icon-precomposed" href="../themes/images/ico/apple-touch-icon-57-precomposed.png"/>
	<style type="text/css" id="enject"></style>
</head>
<body>
    <%--<form id="form1" runat="server">
    <div>
    <h4>Hi guy</h4>
    </div>
    </form>--%>

    
    <div class="container">
	<div class="row-fluid">
      <form class="form-horizontal" id="form1" runat="server">
        <fieldset>
          <div id="legend">
            <legend class="">Payment</legend>
          </div>
     
          <!-- Name -->
          <div class="control-group">
            <label class="control-label"  for="username">Card Holder's Name</label>
            <div class="controls">
              
			  <asp:TextBox id="holdername" runat="server" placeholder="Card's holder name"/> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="holdername" ErrorMessage="Card holder name Required"  CssClass="text-danger" Display="Dynamic">*Card holder name Required</asp:RequiredFieldValidator>
			
            </div>
          </div>
     
          <!-- Card Number -->
          <div class="control-group">
            <label class="control-label" for="cardnumber">Card Number</label>
            <div class="controls">
			  <asp:TextBox id="cardnumber" runat="server" placeholder=""/> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="cardnumber" ErrorMessage="Card number Required"  CssClass="text-danger" Display="Dynamic">*Card Number Required</asp:RequiredFieldValidator>
			 <asp:RegularExpressionValidator runat="server" ControlToValidate="cardnumber" ValidationExpression="^\d{16}$" ErrorMessage="Card Number must be a 9-digit number" CssClass="text-danger">*Card Number must be a 16-digit number</asp:RegularExpressionValidator>
 
            </div>
          </div>
     
          <!-- Expiry-->
          <div class="control-group">
            <label class="control-label" for="password">Card Expiry Date</label>
            <div class="controls">
                <asp:DropDownList
                              ID="monthdrop" runat="server">
                              <asp:ListItem Value="0">Month</asp:ListItem>
                              <asp:ListItem Value="01">January</asp:ListItem>
                              <asp:ListItem Value="02">February</asp:ListItem>
                              <asp:ListItem Value="03">March</asp:ListItem>
                              <asp:ListItem Value="04">April</asp:ListItem>
                              <asp:ListItem Value="05">May</asp:ListItem>
                              <asp:ListItem Value="06">June</asp:ListItem>
                              <asp:ListItem Value="07">July</asp:ListItem>
                              <asp:ListItem Value="08">August</asp:ListItem>
                              <asp:ListItem Value="09">September</asp:ListItem>
                              <asp:ListItem Value="10">October</asp:ListItem>
                              <asp:ListItem Value="11">November</asp:ListItem>
                              <asp:ListItem Value="12">December</asp:ListItem>
                </asp:DropDownList>
                 <asp:RequiredFieldValidator ID="ddlmonth" InitialValue="Month" runat="server" ControlToValidate="monthdrop" ErrorMessage="Month Required"  CssClass="text-danger" Display="Dynamic">*Month Required</asp:RequiredFieldValidator> 

              <asp:DropDownList
                              ID="year" runat="server">
                              <asp:ListItem Value="13">YEAR</asp:ListItem>
                              <asp:ListItem Value="14">2013</asp:ListItem>
                              <asp:ListItem Value="15">2014</asp:ListItem>
                              <asp:ListItem Value="16">2015</asp:ListItem>
                              <asp:ListItem Value="17">2016</asp:ListItem>
                              <asp:ListItem Value="18">2017</asp:ListItem>
                              <asp:ListItem Value="19">2018</asp:ListItem>
                              <asp:ListItem Value="20">2019</asp:ListItem>
                              <asp:ListItem Value="21">2020</asp:ListItem>
                              <asp:ListItem Value="22">2021</asp:ListItem>
                              <asp:ListItem Value="23">2022</asp:ListItem>
                              <asp:ListItem Value="24">2023</asp:ListItem>
                              <asp:ListItem Value="25">2024</asp:ListItem>
            </asp:DropDownList>
                <asp:RequiredFieldValidator ID="ddlyear" InitialValue="YEAR" runat="server" ControlToValidate="year" ErrorMessage="Year Required"  CssClass="text-danger" Display="Dynamic">*Year Required</asp:RequiredFieldValidator> 

            </div>
          </div>
     
          <!-- CVV -->
          <div class="control-group">
            <label class="control-label"  for="password_confirm">Card CVV</label>
            <div c
            <div class="controls">
              <asp:TextBox type="password" runat="server" id="cvv" placeholder="Password"/>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="cvv" Display="Dynamic" ErrorMessage="CVV Required" CssClass="text-danger" >* CVV required</asp:RequiredFieldValidator>
             <asp:RegularExpressionValidator runat="server" ControlToValidate="cvv" ValidationExpression="^\d{3}$" ErrorMessage="Card cvv must be a 3-digit number" CssClass="text-danger">*Card Number must be a 3-digit number</asp:RegularExpressionValidator>
 
            </div>
          </div>
               
			<div class="control-group">
			<asp:Label class="control-label" runat="server" for="postcode">Zip / Postal Code<sup>*</sup></asp:Label>
			<div class="controls">
			  <asp:TextBox id="postcode" runat="server" placeholder="Zip / Postal Code"/> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="postcode" ErrorMessage="Postalcode Required"  CssClass="text-danger" Display="Dynamic">*Postcode Required</asp:RequiredFieldValidator> 
			<asp:RegularExpressionValidator runat="server" ControlToValidate="postcode" ValidationExpression="^\d{5}$" ErrorMessage="Pin Code must be a 5-digit number" CssClass="text-danger">*Pin Code must be a 5-digit number</asp:RegularExpressionValidator>
            </div>
     </div>
          <%--<!-- Save card -->
          <div class="control-group">
            <div class="controls">
              <label class="checkbox" for="save_card">
                <input type="checkbox" id="save_card" value="option1">
                Save card on file?
              </label>
            </div>
          </div>--%>
     
          <!-- Submit -->
          <div class="control-group">
            <div class="controls">
              <asp:Button ID="registerbtn" class="btn btn-large btn-success"  runat="server" Text="UPDATE" OnClick="registerbtn_Click" />
            </div>
          </div>
     
        </fieldset>
      </form>
    </div>
</div>
</body>
</html>
